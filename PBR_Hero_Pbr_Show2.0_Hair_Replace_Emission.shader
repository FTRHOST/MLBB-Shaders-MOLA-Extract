//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PBR/Hero_Pbr_Show2.0_Hair_Replace_Emission" {
Properties {

_Intensity ("整体强度", Float) = 1.0

_Shadow_Color ("接收投影颜色", Color) = (0,0,0,1)

_DirectionalLight_Color ("平行光颜色", Color) = (1,1,1,1)

_Ambient_Color ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("法线贴图", 2D) = "bump" { }

_Specular ("高光整体强度", Range(0, 5)) = 1.0

_SpecularColor ("高光1颜色", Color) = (1,1,1,1)

_SpecularColor2 ("高光2颜色", Color) = (0.5,0.5,0.5,1)

_SpecularMultiplier ("高光1范围", Float) = 100.0

_SpecularMultiplier2 ("高光2范围", Float) = 100.0

_Light_Offset ("高光光源方向偏移", Vector) = (0,0,0,0)

_PrimaryShift ("高光1偏移", Float) = 0.0

_SecondaryShift ("高光2偏移", Float) = 0.699999988079071

_HairMap ("HairMap", 2D) = "white" { }

_MaskTex ("R:高光遮罩 G:高光偏移", 2D) = "white" { }

_FG_Color ("FG_Color", Color) = (0.5,0.5,0.5,1)

_FG_Intensity ("FG_Intensity", Float) = 1.0

_AO_Em_Sanshe ("R:AO G:补光 B:接受投影", 2D) = "white" { }

_AO_Intensity ("AO强度", Float) = 1.0

[Toggle(_EMISSION_ON)] _EMISSION_ON ("自发光开关", Float) = 0.0

_EmissionTex ("自发光贴图(RGB)", 2D) = "black" { }

_Em_Intensity ("自发光强度", Float) = 1.0

_Em_Speed ("自发光呼吸速度", Float) = 0.0

_Metal_Rough_Skin ("R:金属度 G:粗糙度 B:溶解替换纹理", 2D) = "white" { }

_Metal_Intensity ("金属度强度", Float) = 1.0

_Rough_Intensity ("粗糙度强度", Float) = 1.0

[Space(10)] [Header(CubeMap)] _Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Cube_Intensity ("Cube强度", Float) = 1.0

[Space(10)] [Header(Sanshe)] [Toggle(_Directional_Sanshe)] _Directional_Sanshe ("补光类型(关闭:边缘光;打开:平行光)", Float) = 0.0

_Sanshe_color ("补光颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("补光范围", Range(0, 10)) = 1.0

_Sanshe_Power ("补光强度", Float) = 0.0

_Sanshe_X ("补光X轴偏移", Range(-1, 1)) = 0.0

_Sanshe_Y ("补光Y轴偏移", Range(-1, 1)) = 0.0

[Space(8)] [Toggle(_SANSHE2)] _SANSHE2 ("补光2开关", Float) = 0.0

_Sanshe2_color ("补光2颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe2_Fw ("补光2范围", Range(0, 10)) = 1.0

_Sanshe2_Power ("补光2强度", Float) = 0.0

_Sanshe2_X ("补光2X轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_Y ("补光2Y轴偏移", Range(-1, 1)) = 0.0

[Space(10)] [Header(Replace)] _ReplaceTex ("替换MainTex", 2D) = "white" { }

[Enum(LeftRight,0,DownUp,1)] _Replace_Dir ("溶解替换UV方向", Float) = 0.0

_Replace_Use2U ("使用2U", Float) = 1.0

_Replace_Tiling_Offset ("XY:溶解替换TilingOffset", Vector) = (1,1,0,0)

_Replace_Fanwei ("边缘压缩", Float) = 4.0

_Replace_Color ("拖尾颜色", Color) = (1,1,1,1)

_Replace_Color_Fanwei ("拖尾范围", Float) = 1.0

_Replace_Color_Power ("拖尾强度", Float) = 1.0

_ReplaceAmount ("替换进度", Range(-2, 1)) = -2.0

[Space(10)] [Header(LiuGuang)] [Toggle] _Use_2U ("使用2U", Float) = 0.0

_LG_Mask ("流光遮罩(RGB色)", 2D) = "white" { }

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 1.0

_U_LG ("U向流动速度", Float) = 0.0

_V_LG ("V向流动速度", Float) = 0.0

_LG_Fresnel ("流光菲涅尔遮罩范围", Range(0.01, 10)) = 0.009999999776482582

[Space(10)] [Header(Shadow)] _Delta_ShadowCenter ("Delta_ShadowCenter", Vector) = (0,0,0,0)

[PowerSlider(2.0)] _ShadowIntensity ("接收投影强度", Range(0, 3)) = 1.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 49042
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
vec2 u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_30.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat16_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xy = min(max(u_xlat30.xy, 0.0), 1.0);
#else
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(u_xlat45>=1.0);
#else
        u_xlatb32 = u_xlat45>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(0.0>=u_xlat45);
#else
        u_xlatb46 = 0.0>=u_xlat45;
#endif
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<_UsePCF);
#else
            u_xlatb46 = 0.0<_UsePCF;
#endif
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat16_47 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat16_47) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb47 = !!(u_xlat45<u_xlat47);
#else
                        u_xlatb47 = u_xlat45<u_xlat47;
#endif
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat16_4 = textureLod(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb45 = !!(u_xlat45<u_xlat4.x);
#else
                u_xlatb45 = u_xlat45<u_xlat4.x;
#endif
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat32 = 1.0;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_31 = texture(_Metal_Rough_Skin, u_xlat31.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat16_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31.x>=0.5);
#else
    u_xlatb31 = u_xlat31.x>=0.5;
#endif
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_16.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_9.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat16_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat16_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat16.xy);
    u_xlat16_16.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat16_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat16_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz;
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
vec2 u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_30.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat16_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xy = min(max(u_xlat30.xy, 0.0), 1.0);
#else
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(u_xlat45>=1.0);
#else
        u_xlatb32 = u_xlat45>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(0.0>=u_xlat45);
#else
        u_xlatb46 = 0.0>=u_xlat45;
#endif
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<_UsePCF);
#else
            u_xlatb46 = 0.0<_UsePCF;
#endif
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat16_47 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat16_47) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb47 = !!(u_xlat45<u_xlat47);
#else
                        u_xlatb47 = u_xlat45<u_xlat47;
#endif
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat16_4 = textureLod(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb45 = !!(u_xlat45<u_xlat4.x);
#else
                u_xlatb45 = u_xlat45<u_xlat4.x;
#endif
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat32 = 1.0;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_31 = texture(_Metal_Rough_Skin, u_xlat31.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat16_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31.x>=0.5);
#else
    u_xlatb31 = u_xlat31.x>=0.5;
#endif
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_16.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_9.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat16_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat16_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat16.xy);
    u_xlat16_16.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat16_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat16_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
vec2 u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
lowp float u_xlat10_47;
bool u_xlatb47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_30.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat10_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
        u_xlatb32 = u_xlat45>=1.0;
        u_xlatb46 = 0.0>=u_xlat45;
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
            u_xlatb46 = 0.0<_UsePCF;
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat10_47 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat10_47) + 1.0;
                        u_xlatb47 = u_xlat45<u_xlat47;
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat10_4 = texture2DLodEXT(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat10_4) + 1.0;
                u_xlatb45 = u_xlat45<u_xlat4.x;
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat32 = 1.0;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_5.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_31 = texture2D(_Metal_Rough_Skin, u_xlat31.xy).z;
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat10_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlatb31 = u_xlat31.x>=0.5;
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat10_7.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat10_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_16.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_9.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat10_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat10_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat16.xy);
    u_xlat10_16.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat10_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat10_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat10_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
vec2 u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
lowp float u_xlat10_47;
bool u_xlatb47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_30.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat10_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
        u_xlatb32 = u_xlat45>=1.0;
        u_xlatb46 = 0.0>=u_xlat45;
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
            u_xlatb46 = 0.0<_UsePCF;
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat10_47 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat10_47) + 1.0;
                        u_xlatb47 = u_xlat45<u_xlat47;
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat10_4 = texture2DLodEXT(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat10_4) + 1.0;
                u_xlatb45 = u_xlat45<u_xlat4.x;
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat32 = 1.0;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_5.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_31 = texture2D(_Metal_Rough_Skin, u_xlat31.xy).z;
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat10_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlatb31 = u_xlat31.x>=0.5;
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat10_7.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat10_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_16.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_9.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat10_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat10_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat16.xy);
    u_xlat10_16.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat10_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat10_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat10_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(11) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(12) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(13) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
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
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
vec2 u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_30.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat16_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xy = min(max(u_xlat30.xy, 0.0), 1.0);
#else
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(u_xlat45>=1.0);
#else
        u_xlatb32 = u_xlat45>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(0.0>=u_xlat45);
#else
        u_xlatb46 = 0.0>=u_xlat45;
#endif
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<_UsePCF);
#else
            u_xlatb46 = 0.0<_UsePCF;
#endif
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat16_47 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat16_47) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb47 = !!(u_xlat45<u_xlat47);
#else
                        u_xlatb47 = u_xlat45<u_xlat47;
#endif
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat16_4 = textureLod(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb45 = !!(u_xlat45<u_xlat4.x);
#else
                u_xlatb45 = u_xlat45<u_xlat4.x;
#endif
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat4.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xyw = u_xlat4.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.w);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat45 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat4.x = (-_LightShadowData.x) + 1.0;
        u_xlat32 = u_xlat45 * u_xlat4.x + _LightShadowData.x;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_31 = texture(_Metal_Rough_Skin, u_xlat31.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat16_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31.x>=0.5);
#else
    u_xlatb31 = u_xlat31.x>=0.5;
#endif
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_16.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_9.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat16_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat16_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat16.xy);
    u_xlat16_16.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat16_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat16_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat16_11.xyz = texture(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = u_xlat16_11.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.xyz * u_xlat12.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat11.xyz = (-u_xlat11.xyz) * abs(vec3(u_xlat42)) + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat11.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(11) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(12) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(13) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
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
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
vec2 u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_30.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat16_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xy = min(max(u_xlat30.xy, 0.0), 1.0);
#else
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(u_xlat45>=1.0);
#else
        u_xlatb32 = u_xlat45>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(0.0>=u_xlat45);
#else
        u_xlatb46 = 0.0>=u_xlat45;
#endif
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<_UsePCF);
#else
            u_xlatb46 = 0.0<_UsePCF;
#endif
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat16_47 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat16_47) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb47 = !!(u_xlat45<u_xlat47);
#else
                        u_xlatb47 = u_xlat45<u_xlat47;
#endif
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat16_4 = textureLod(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb45 = !!(u_xlat45<u_xlat4.x);
#else
                u_xlatb45 = u_xlat45<u_xlat4.x;
#endif
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat4.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xyw = u_xlat4.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.w);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat45 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat4.x = (-_LightShadowData.x) + 1.0;
        u_xlat32 = u_xlat45 * u_xlat4.x + _LightShadowData.x;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_31 = texture(_Metal_Rough_Skin, u_xlat31.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat16_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31.x>=0.5);
#else
    u_xlatb31 = u_xlat31.x>=0.5;
#endif
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_16.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_9.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat16_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat16_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat16.xy);
    u_xlat16_16.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat16_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat16_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat16_11.xyz = texture(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = u_xlat16_11.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.xyz * u_xlat12.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat11.xyz = (-u_xlat11.xyz) * abs(vec3(u_xlat42)) + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat11.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
lowp vec3 u_xlat10_11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
vec2 u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
lowp float u_xlat10_47;
bool u_xlatb47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_30.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat10_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
        u_xlatb32 = u_xlat45>=1.0;
        u_xlatb46 = 0.0>=u_xlat45;
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
            u_xlatb46 = 0.0<_UsePCF;
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat10_47 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat10_47) + 1.0;
                        u_xlatb47 = u_xlat45<u_xlat47;
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat10_4 = texture2DLodEXT(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat10_4) + 1.0;
                u_xlatb45 = u_xlat45<u_xlat4.x;
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat4.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xyw = u_xlat4.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.w);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat45 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat4.x = (-_LightShadowData.x) + 1.0;
        u_xlat32 = u_xlat45 * u_xlat4.x + _LightShadowData.x;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_5.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_31 = texture2D(_Metal_Rough_Skin, u_xlat31.xy).z;
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat10_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlatb31 = u_xlat31.x>=0.5;
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat10_7.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat10_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_16.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_9.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat10_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat10_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat16.xy);
    u_xlat10_16.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat10_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat10_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat10_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat10_11.xyz = texture2D(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12.xyz = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = u_xlat10_11.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_11.xyz * u_xlat12.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat11.xyz = (-u_xlat11.xyz) * abs(vec3(u_xlat42)) + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat11.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
lowp vec3 u_xlat10_11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
vec2 u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
lowp float u_xlat10_47;
bool u_xlatb47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_30.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat10_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
        u_xlatb32 = u_xlat45>=1.0;
        u_xlatb46 = 0.0>=u_xlat45;
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
            u_xlatb46 = 0.0<_UsePCF;
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat10_47 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat10_47) + 1.0;
                        u_xlatb47 = u_xlat45<u_xlat47;
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat10_4 = texture2DLodEXT(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat10_4) + 1.0;
                u_xlatb45 = u_xlat45<u_xlat4.x;
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat4.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xyw = u_xlat4.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.w);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat45 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat4.x = (-_LightShadowData.x) + 1.0;
        u_xlat32 = u_xlat45 * u_xlat4.x + _LightShadowData.x;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_5.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_31 = texture2D(_Metal_Rough_Skin, u_xlat31.xy).z;
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat10_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlatb31 = u_xlat31.x>=0.5;
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat10_7.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat10_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_16.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_9.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat10_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat10_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat16.xy);
    u_xlat10_16.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat10_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat10_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat10_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat10_11.xyz = texture2D(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12.xyz = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = u_xlat10_11.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_11.xyz * u_xlat12.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat11.xyz = (-u_xlat11.xyz) * abs(vec3(u_xlat42)) + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat11.xyz;
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
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
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
vec2 u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_30.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat16_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xy = min(max(u_xlat30.xy, 0.0), 1.0);
#else
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(u_xlat45>=1.0);
#else
        u_xlatb32 = u_xlat45>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(0.0>=u_xlat45);
#else
        u_xlatb46 = 0.0>=u_xlat45;
#endif
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<_UsePCF);
#else
            u_xlatb46 = 0.0<_UsePCF;
#endif
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat16_47 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat16_47) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb47 = !!(u_xlat45<u_xlat47);
#else
                        u_xlatb47 = u_xlat45<u_xlat47;
#endif
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat16_4 = textureLod(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb45 = !!(u_xlat45<u_xlat4.x);
#else
                u_xlatb45 = u_xlat45<u_xlat4.x;
#endif
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat4.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xyw = u_xlat4.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.w);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat45 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat4.x = (-_LightShadowData.x) + 1.0;
        u_xlat32 = u_xlat45 * u_xlat4.x + _LightShadowData.x;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_31 = texture(_Metal_Rough_Skin, u_xlat31.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat16_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31.x>=0.5);
#else
    u_xlatb31 = u_xlat31.x>=0.5;
#endif
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_16.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_9.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat16_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat16_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat16.xy);
    u_xlat16_16.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat16_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat16_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz;
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
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
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
vec2 u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_30.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat16_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xy = min(max(u_xlat30.xy, 0.0), 1.0);
#else
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(u_xlat45>=1.0);
#else
        u_xlatb32 = u_xlat45>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(0.0>=u_xlat45);
#else
        u_xlatb46 = 0.0>=u_xlat45;
#endif
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<_UsePCF);
#else
            u_xlatb46 = 0.0<_UsePCF;
#endif
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat16_47 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat16_47) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb47 = !!(u_xlat45<u_xlat47);
#else
                        u_xlatb47 = u_xlat45<u_xlat47;
#endif
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat16_4 = textureLod(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb45 = !!(u_xlat45<u_xlat4.x);
#else
                u_xlatb45 = u_xlat45<u_xlat4.x;
#endif
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat4.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xyw = u_xlat4.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.w);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat45 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat4.x = (-_LightShadowData.x) + 1.0;
        u_xlat32 = u_xlat45 * u_xlat4.x + _LightShadowData.x;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_31 = texture(_Metal_Rough_Skin, u_xlat31.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat16_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31.x>=0.5);
#else
    u_xlatb31 = u_xlat31.x>=0.5;
#endif
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_16.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_9.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat16_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat16_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat16.xy);
    u_xlat16_16.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat16_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat16_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
vec2 u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
lowp float u_xlat10_47;
bool u_xlatb47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_30.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat10_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
        u_xlatb32 = u_xlat45>=1.0;
        u_xlatb46 = 0.0>=u_xlat45;
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
            u_xlatb46 = 0.0<_UsePCF;
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat10_47 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat10_47) + 1.0;
                        u_xlatb47 = u_xlat45<u_xlat47;
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat10_4 = texture2DLodEXT(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat10_4) + 1.0;
                u_xlatb45 = u_xlat45<u_xlat4.x;
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat4.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xyw = u_xlat4.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.w);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat45 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat4.x = (-_LightShadowData.x) + 1.0;
        u_xlat32 = u_xlat45 * u_xlat4.x + _LightShadowData.x;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_5.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_31 = texture2D(_Metal_Rough_Skin, u_xlat31.xy).z;
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat10_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlatb31 = u_xlat31.x>=0.5;
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat10_7.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat10_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_16.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_9.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat10_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat10_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat16.xy);
    u_xlat10_16.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat10_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat10_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat10_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
vec2 u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
lowp float u_xlat10_47;
bool u_xlatb47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_30.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat10_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
        u_xlatb32 = u_xlat45>=1.0;
        u_xlatb46 = 0.0>=u_xlat45;
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
            u_xlatb46 = 0.0<_UsePCF;
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat10_47 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat10_47) + 1.0;
                        u_xlatb47 = u_xlat45<u_xlat47;
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat10_4 = texture2DLodEXT(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat10_4) + 1.0;
                u_xlatb45 = u_xlat45<u_xlat4.x;
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat4.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat5.xyz = u_xlat4.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xyw = u_xlat4.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.w);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat45 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat4.x = (-_LightShadowData.x) + 1.0;
        u_xlat32 = u_xlat45 * u_xlat4.x + _LightShadowData.x;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_5.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_31 = texture2D(_Metal_Rough_Skin, u_xlat31.xy).z;
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat10_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlatb31 = u_xlat31.x>=0.5;
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat10_7.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat10_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_16.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_9.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat10_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat10_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat16.xy);
    u_xlat10_16.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat10_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat10_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat10_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_EMISSION_ON" }
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(11) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
vec2 u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_30.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat16_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xy = min(max(u_xlat30.xy, 0.0), 1.0);
#else
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(u_xlat45>=1.0);
#else
        u_xlatb32 = u_xlat45>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(0.0>=u_xlat45);
#else
        u_xlatb46 = 0.0>=u_xlat45;
#endif
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<_UsePCF);
#else
            u_xlatb46 = 0.0<_UsePCF;
#endif
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat16_47 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat16_47) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb47 = !!(u_xlat45<u_xlat47);
#else
                        u_xlatb47 = u_xlat45<u_xlat47;
#endif
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat16_4 = textureLod(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb45 = !!(u_xlat45<u_xlat4.x);
#else
                u_xlatb45 = u_xlat45<u_xlat4.x;
#endif
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat32 = 1.0;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_31 = texture(_Metal_Rough_Skin, u_xlat31.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat16_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31.x>=0.5);
#else
    u_xlatb31 = u_xlat31.x>=0.5;
#endif
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_16.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_9.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat16_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat16_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat16.xy);
    u_xlat16_16.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat16_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat16_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat16_11.xyz = texture(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = u_xlat16_11.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.xyz * u_xlat12.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat11.xyz = (-u_xlat11.xyz) * abs(vec3(u_xlat42)) + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat11.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_EMISSION_ON" }
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(6) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(7) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(11) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
vec2 u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_30.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat16_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat30.xy = min(max(u_xlat30.xy, 0.0), 1.0);
#else
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb32 = !!(u_xlat45>=1.0);
#else
        u_xlatb32 = u_xlat45>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb46 = !!(0.0>=u_xlat45);
#else
        u_xlatb46 = 0.0>=u_xlat45;
#endif
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb46 = !!(0.0<_UsePCF);
#else
            u_xlatb46 = 0.0<_UsePCF;
#endif
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat16_47 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat16_47) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb47 = !!(u_xlat45<u_xlat47);
#else
                        u_xlatb47 = u_xlat45<u_xlat47;
#endif
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat16_4 = textureLod(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat16_4) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb45 = !!(u_xlat45<u_xlat4.x);
#else
                u_xlatb45 = u_xlat45<u_xlat4.x;
#endif
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat32 = 1.0;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_31 = texture(_Metal_Rough_Skin, u_xlat31.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb45 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat16_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat45 = min(max(u_xlat45, 0.0), 1.0);
#else
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31.x>=0.5);
#else
    u_xlatb31 = u_xlat31.x>=0.5;
#endif
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat16_7.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat16_5.xyz) + u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat16_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_16.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_9.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat16_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat16_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat16_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat16.xy);
    u_xlat16_16.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat16_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat16_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat16_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat16_11.xyz = texture(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = u_xlat16_11.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_11.xyz * u_xlat12.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat11.xyz = (-u_xlat11.xyz) * abs(vec3(u_xlat42)) + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat11.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
lowp vec3 u_xlat10_11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
vec2 u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
lowp float u_xlat10_47;
bool u_xlatb47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_30.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat10_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
        u_xlatb32 = u_xlat45>=1.0;
        u_xlatb46 = 0.0>=u_xlat45;
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
            u_xlatb46 = 0.0<_UsePCF;
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat10_47 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat10_47) + 1.0;
                        u_xlatb47 = u_xlat45<u_xlat47;
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat10_4 = texture2DLodEXT(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat10_4) + 1.0;
                u_xlatb45 = u_xlat45<u_xlat4.x;
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat32 = 1.0;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_5.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_31 = texture2D(_Metal_Rough_Skin, u_xlat31.xy).z;
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat10_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlatb31 = u_xlat31.x>=0.5;
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat10_7.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat10_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_16.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_9.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat10_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat10_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat16.xy);
    u_xlat10_16.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat10_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat10_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat10_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat10_11.xyz = texture2D(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12.xyz = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = u_xlat10_11.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_11.xyz * u_xlat12.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat11.xyz = (-u_xlat11.xyz) * abs(vec3(u_xlat42)) + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat11.xyz;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
int u_xlati5;
bvec3 u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
lowp vec3 u_xlat10_11;
vec3 u_xlat12;
mediump float u_xlat16_13;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
float u_xlat18;
float u_xlat19;
bool u_xlatb19;
vec2 u_xlat20;
mediump vec3 u_xlat16_24;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
vec2 u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
bool u_xlatb32;
int u_xlati33;
mediump float u_xlat16_38;
float u_xlat42;
float u_xlat45;
bool u_xlatb45;
float u_xlat46;
bool u_xlatb46;
float u_xlat47;
lowp float u_xlat10_47;
bool u_xlatb47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_30.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat30.xy = u_xlat10_30.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat30.xy = clamp(u_xlat30.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb45 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb45){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat4.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat45 = (-u_xlat4.z) + 1.0;
        u_xlatb32 = u_xlat45>=1.0;
        u_xlatb46 = 0.0>=u_xlat45;
        u_xlatb32 = u_xlatb46 || u_xlatb32;
        u_xlatb5.xy = lessThan(u_xlat4.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb5.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat4.xxyx).xz;
        u_xlatb32 = u_xlatb32 || u_xlatb5.x;
        u_xlatb32 = u_xlatb5.y || u_xlatb32;
        u_xlatb32 = u_xlatb5.z || u_xlatb32;
        if(u_xlatb32){
            u_xlat32 = 1.0;
        } else {
            u_xlatb46 = 0.0<_UsePCF;
            if(u_xlatb46){
                u_xlat46 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat19 = u_xlat46;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat4.xy;
                        u_xlat10_47 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat47 = (-u_xlat10_47) + 1.0;
                        u_xlatb47 = u_xlat45<u_xlat47;
                        u_xlat47 = (u_xlatb47) ? _CustomShadowStrength : 1.0;
                        u_xlat19 = u_xlat47 + u_xlat19;
                    }
                    u_xlat46 = u_xlat19;
                }
                u_xlat32 = u_xlat46 * 0.111111112;
            } else {
                u_xlat10_4 = texture2DLodEXT(_CustomShadowTex, u_xlat4.xy, 0.0).x;
                u_xlat4.x = (-u_xlat10_4) + 1.0;
                u_xlatb45 = u_xlat45<u_xlat4.x;
                u_xlat32 = (u_xlatb45) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat32 = 1.0;
    }
    u_xlat4.xyw = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat4.xyw = (-u_xlat4.xyw) + vs_TEXCOORD2.xyz;
    u_xlat45 = dot(u_xlat4.xyw, u_xlat4.xyw);
    u_xlat45 = sqrt(u_xlat45);
    u_xlat4.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = u_xlat45 * u_xlat45;
    u_xlat4.x = u_xlat45 * u_xlat45;
    u_xlat45 = u_xlat45 * u_xlat4.x;
    u_xlat45 = min(u_xlat45, 1.0);
    u_xlat4.x = (-u_xlat32) + 1.0;
    u_xlat4.x = (-u_xlat4.x) * _ShadowIntensity + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat18 = (-u_xlat45) + 1.0;
    u_xlat45 = u_xlat4.x * u_xlat18 + u_xlat45;
    u_xlat4.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat45) * u_xlat4.xyz + _Shadow_Color.xyz;
    u_xlat4.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = (-u_xlat4.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_5.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat31.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_31 = texture2D(_Metal_Rough_Skin, u_xlat31.xy).z;
    u_xlatb45 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat45 = (u_xlatb45) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat45 = u_xlat45 + _ReplaceAmount;
    u_xlat45 = dot(vec2(u_xlat45), vec2(_Replace_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Fanwei);
    u_xlat31.x = u_xlat10_31 + u_xlat45;
    u_xlat45 = dot(u_xlat31.xx, vec2(_Replace_Color_Fanwei));
    u_xlat45 = u_xlat45 + (-_Replace_Color_Fanwei);
    u_xlat45 = clamp(u_xlat45, 0.0, 1.0);
    u_xlatb31 = u_xlat31.x>=0.5;
    u_xlat31.x = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat6.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat45 = (-u_xlat45) + 1.0;
    u_xlat6.xyz = vec3(u_xlat45) * u_xlat6.xyz;
    u_xlat10_7.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat7.xyz = (-u_xlat10_5.xyz) + u_xlat10_7.xyz;
    u_xlat5.xyz = u_xlat31.xxx * u_xlat7.xyz + u_xlat10_5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat5.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat45 = (-u_xlat30.x) + 1.0;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat45);
    u_xlat46 = max(_FG_Intensity, 0.0);
    u_xlat8.xyz = vec3(u_xlat46) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat9.xyz = u_xlat8.xyz * u_xlat2.xxx + u_xlat16.xxx;
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat8.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat8.xyz = u_xlat9.xyz / u_xlat2.xxx;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat16.xxx * vec3(0.5, 0.5, 0.5) + u_xlat8.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_16.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_9.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_10.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat9.xy = u_xlat9.xy * u_xlat16_10.xy;
    u_xlat9.xzw = u_xlat9.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat9.xzw, u_xlat9.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat9.xzw = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat11.xyz = u_xlat9.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat2.xxx * u_xlat11.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat12.xyz = u_xlat16_10.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat12.xyz = u_xlat2.xxx * u_xlat12.xyz;
    u_xlat16_10.x = dot(u_xlat9.xzw, u_xlat12.xyz);
    u_xlat16_24.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_38;
    u_xlat16_38 = dot(u_xlat11.xyz, u_xlat12.xyz);
    u_xlat16_24.z = (-u_xlat16_38) * u_xlat16_38 + 1.0;
    u_xlat16_24.xz = sqrt(u_xlat16_24.xz);
    u_xlat16_38 = u_xlat16_38 + 1.0;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_13 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_13;
    u_xlat16_24.x = log2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_10.x = u_xlat16_24.x * u_xlat16_10.x;
    u_xlat16_24.x = log2(u_xlat16_24.z);
    u_xlat16_24.x = u_xlat16_24.x * _SpecularMultiplier2;
    u_xlat16_24.x = exp2(u_xlat16_24.x);
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_38;
    u_xlat16_24.xyz = u_xlat16_24.xxx * _SpecularColor2.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * _SpecularColor.xyz + u_xlat16_24.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_10.xyz = u_xlat10_16.xxx * u_xlat16_10.xyz;
    u_xlat9.xyz = vec3(u_xlat45) * _Ambient_Color.xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat9.xyz;
    u_xlat5.xyz = vec3(u_xlat3) * u_xlat5.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat9.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat9.xyz);
    u_xlat9.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat10_1.xyz * u_xlat9.xzw;
    u_xlat9.xzw = u_xlat10_1.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat3) * u_xlat9.xzw;
    u_xlat2.x = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xzw;
    u_xlat2.x = (-u_xlat30.y) + u_xlat30.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat16.x = (-u_xlat42) + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat16.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat16.xy = u_xlat16.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat16.xy);
    u_xlat10_16.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat42 = log2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Fresnel;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = u_xlat42 * _LG_Intensity;
    u_xlat42 = u_xlat10_1.w * u_xlat42;
    u_xlat16.xyz = u_xlat10_16.xyz * vec3(u_xlat42);
    u_xlat16.xyz = u_xlat10_1.xyz * u_xlat16.xyz;
    u_xlat11.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat11.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat11.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat10_11.xyz = texture2D(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat12.xyz = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat12.xyz = u_xlat10_11.xyz * u_xlat12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_11.xyz * u_xlat12.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat11.xyz = (-u_xlat11.xyz) * abs(vec3(u_xlat42)) + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat16_10.xyz;
    u_xlat5.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat5.xyz = u_xlat7.xyz * vec3(_Cube_Intensity) + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat31.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz + u_xlat11.xyz;
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(7) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
vec2 u_xlat15;
mediump vec2 u_xlat16_15;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat23;
float u_xlat24;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + _Light_Offset.xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_22 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_0.xy = vec2(u_xlat16_22) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat16_2.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat16_0.xy * u_xlat2.xy;
    u_xlat16_3.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat22 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat9.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_7 = (-u_xlat16_0.x) * u_xlat16_0.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_7 = sqrt(u_xlat16_7);
    u_xlat16_7 = log2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _SpecularMultiplier2;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_14 = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_14;
    u_xlat16_0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat16_0.xyz = u_xlat16_0.xxx * _SpecularColor2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = u_xlat16_21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpecularMultiplier;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_12 = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_12;
    u_xlat16_21 = u_xlat16_5.x * u_xlat16_21;
    u_xlat16_0.xyz = vec3(u_xlat16_21) * _SpecularColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_1 = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat1.x = (u_xlatb1) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat1.x = u_xlat1.x + _ReplaceAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Fanwei);
    u_xlat8.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_8 = texture(_Metal_Rough_Skin, u_xlat8.xy).z;
    u_xlat1.x = u_xlat16_8 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=0.5);
#else
    u_xlatb8 = u_xlat1.x>=0.5;
#endif
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Color_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16_2.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat16_15.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat15.xy = u_xlat16_15.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat23 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = (-u_xlat15.y) + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 1.0;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat22 = max(_FG_Intensity, 0.0);
    u_xlat6.xyz = vec3(u_xlat22) * _FG_Color.xyz;
    u_xlat22 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * 3.1400001;
    u_xlat23 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat24 = (-u_xlat23) + 1.0;
    u_xlat23 = u_xlat23 * 0.5 + 0.5;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat24) + vec3(u_xlat23);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat22);
    u_xlat6.xyz = u_xlat6.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat23) * vec3(0.5, 0.5, 0.5) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz + u_xlat16_0.xyz;
    u_xlat16_6.xy = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xy;
    u_xlat22 = (-u_xlat16_6.x) + 1.0;
    u_xlat22 = u_xlat22 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat23 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = texture(_Cubemap, u_xlat4.xyz);
    u_xlat23 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat23 = (-u_xlat22) + 1.0;
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Fresnel;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Intensity;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat15.x = u_xlat15.x * u_xlat23;
    u_xlat4.xyz = u_xlat15.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(_Cube_Intensity) + u_xlat2.xyz;
    u_xlat4.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat4.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat15.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Fw;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Power;
    u_xlat3.xyz = u_xlat15.xxx * _Sanshe_color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_6.yyy + u_xlat2.xyz;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat15.x = u_xlat16_0.w * u_xlat22;
    u_xlat16_3.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat1.xzw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(7) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
vec2 u_xlat15;
mediump vec2 u_xlat16_15;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat23;
float u_xlat24;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + _Light_Offset.xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_22 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_0.xy = vec2(u_xlat16_22) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat16_2.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat16_0.xy * u_xlat2.xy;
    u_xlat16_3.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat22 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat9.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_7 = (-u_xlat16_0.x) * u_xlat16_0.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_7 = sqrt(u_xlat16_7);
    u_xlat16_7 = log2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _SpecularMultiplier2;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_14 = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_14;
    u_xlat16_0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat16_0.xyz = u_xlat16_0.xxx * _SpecularColor2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = u_xlat16_21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpecularMultiplier;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_12 = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_12;
    u_xlat16_21 = u_xlat16_5.x * u_xlat16_21;
    u_xlat16_0.xyz = vec3(u_xlat16_21) * _SpecularColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_1 = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat1.x = (u_xlatb1) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat1.x = u_xlat1.x + _ReplaceAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Fanwei);
    u_xlat8.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_8 = texture(_Metal_Rough_Skin, u_xlat8.xy).z;
    u_xlat1.x = u_xlat16_8 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=0.5);
#else
    u_xlatb8 = u_xlat1.x>=0.5;
#endif
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Color_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16_2.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat16_15.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat15.xy = u_xlat16_15.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat23 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = (-u_xlat15.y) + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 1.0;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat22 = max(_FG_Intensity, 0.0);
    u_xlat6.xyz = vec3(u_xlat22) * _FG_Color.xyz;
    u_xlat22 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * 3.1400001;
    u_xlat23 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat24 = (-u_xlat23) + 1.0;
    u_xlat23 = u_xlat23 * 0.5 + 0.5;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat24) + vec3(u_xlat23);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat22);
    u_xlat6.xyz = u_xlat6.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat23) * vec3(0.5, 0.5, 0.5) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz + u_xlat16_0.xyz;
    u_xlat16_6.xy = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xy;
    u_xlat22 = (-u_xlat16_6.x) + 1.0;
    u_xlat22 = u_xlat22 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat23 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = texture(_Cubemap, u_xlat4.xyz);
    u_xlat23 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat23 = (-u_xlat22) + 1.0;
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Fresnel;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Intensity;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat15.x = u_xlat15.x * u_xlat23;
    u_xlat4.xyz = u_xlat15.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(_Cube_Intensity) + u_xlat2.xyz;
    u_xlat4.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat4.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat15.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Fw;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Power;
    u_xlat3.xyz = u_xlat15.xxx * _Sanshe_color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_6.yyy + u_xlat2.xyz;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat15.x = u_xlat16_0.w * u_xlat22;
    u_xlat16_3.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat1.xzw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec2 u_xlat10_6;
mediump float u_xlat16_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
vec2 u_xlat15;
lowp vec2 u_xlat10_15;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
float u_xlat23;
float u_xlat24;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + _Light_Offset.xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_22 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat16_0.xy = vec2(u_xlat10_22) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat10_2.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat16_0.xy * u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat22 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat9.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_7 = (-u_xlat16_0.x) * u_xlat16_0.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_7 = sqrt(u_xlat16_7);
    u_xlat16_7 = log2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _SpecularMultiplier2;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_14 = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_14;
    u_xlat16_0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat16_0.xyz = u_xlat16_0.xxx * _SpecularColor2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = u_xlat16_21 + 1.0;
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpecularMultiplier;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_12 = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_12;
    u_xlat16_21 = u_xlat16_5.x * u_xlat16_21;
    u_xlat16_0.xyz = vec3(u_xlat16_21) * _SpecularColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat10_1 = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat10_1);
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat1.x = (u_xlatb1) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat1.x = u_xlat1.x + _ReplaceAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Fanwei);
    u_xlat8.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_8 = texture2D(_Metal_Rough_Skin, u_xlat8.xy).z;
    u_xlat1.x = u_xlat10_8 + u_xlat1.x;
    u_xlatb8 = u_xlat1.x>=0.5;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Color_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Color_Fanwei);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat10_2.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + (-u_xlat10_4.xyz);
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_4.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat10_15.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat15.xy = u_xlat10_15.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat23 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = (-u_xlat15.y) + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 1.0;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat22 = max(_FG_Intensity, 0.0);
    u_xlat6.xyz = vec3(u_xlat22) * _FG_Color.xyz;
    u_xlat22 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * 3.1400001;
    u_xlat23 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat24 = (-u_xlat23) + 1.0;
    u_xlat23 = u_xlat23 * 0.5 + 0.5;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat24) + vec3(u_xlat23);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat22);
    u_xlat6.xyz = u_xlat6.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat23) * vec3(0.5, 0.5, 0.5) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz + u_xlat16_0.xyz;
    u_xlat10_6.xy = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xy;
    u_xlat22 = (-u_xlat10_6.x) + 1.0;
    u_xlat22 = u_xlat22 * _AO_Intensity;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat23 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCube(_Cubemap, u_xlat4.xyz);
    u_xlat23 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat23 = (-u_xlat22) + 1.0;
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Fresnel;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Intensity;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat15.x = u_xlat15.x * u_xlat23;
    u_xlat4.xyz = u_xlat15.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(_Cube_Intensity) + u_xlat2.xyz;
    u_xlat4.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat4.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat15.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Fw;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Power;
    u_xlat3.xyz = u_xlat15.xxx * _Sanshe_color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat10_6.yyy + u_xlat2.xyz;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat15.x = u_xlat10_0.w * u_xlat22;
    u_xlat10_3.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat10_3.xyz;
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat1.xzw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec2 u_xlat10_6;
mediump float u_xlat16_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
vec2 u_xlat15;
lowp vec2 u_xlat10_15;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
float u_xlat23;
float u_xlat24;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + _Light_Offset.xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_22 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat16_0.xy = vec2(u_xlat10_22) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat10_2.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat16_0.xy * u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat22 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat9.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_7 = (-u_xlat16_0.x) * u_xlat16_0.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_7 = sqrt(u_xlat16_7);
    u_xlat16_7 = log2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _SpecularMultiplier2;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_14 = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_14;
    u_xlat16_0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat16_0.xyz = u_xlat16_0.xxx * _SpecularColor2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = u_xlat16_21 + 1.0;
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpecularMultiplier;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_12 = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_12;
    u_xlat16_21 = u_xlat16_5.x * u_xlat16_21;
    u_xlat16_0.xyz = vec3(u_xlat16_21) * _SpecularColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat10_1 = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat10_1);
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat1.x = (u_xlatb1) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat1.x = u_xlat1.x + _ReplaceAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Fanwei);
    u_xlat8.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_8 = texture2D(_Metal_Rough_Skin, u_xlat8.xy).z;
    u_xlat1.x = u_xlat10_8 + u_xlat1.x;
    u_xlatb8 = u_xlat1.x>=0.5;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Color_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Color_Fanwei);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat10_2.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + (-u_xlat10_4.xyz);
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_4.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat10_15.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat15.xy = u_xlat10_15.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat23 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = (-u_xlat15.y) + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 1.0;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat22 = max(_FG_Intensity, 0.0);
    u_xlat6.xyz = vec3(u_xlat22) * _FG_Color.xyz;
    u_xlat22 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * 3.1400001;
    u_xlat23 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat24 = (-u_xlat23) + 1.0;
    u_xlat23 = u_xlat23 * 0.5 + 0.5;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat24) + vec3(u_xlat23);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat22);
    u_xlat6.xyz = u_xlat6.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat23) * vec3(0.5, 0.5, 0.5) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz + u_xlat16_0.xyz;
    u_xlat10_6.xy = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xy;
    u_xlat22 = (-u_xlat10_6.x) + 1.0;
    u_xlat22 = u_xlat22 * _AO_Intensity;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat23 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCube(_Cubemap, u_xlat4.xyz);
    u_xlat23 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat23 = (-u_xlat22) + 1.0;
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Fresnel;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Intensity;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat15.x = u_xlat15.x * u_xlat23;
    u_xlat4.xyz = u_xlat15.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(_Cube_Intensity) + u_xlat2.xyz;
    u_xlat4.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat4.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat15.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Fw;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Power;
    u_xlat3.xyz = u_xlat15.xxx * _Sanshe_color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat10_6.yyy + u_xlat2.xyz;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat15.x = u_xlat10_0.w * u_xlat22;
    u_xlat10_3.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat10_3.xyz;
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat1.xzw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(7) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump float u_xlat10_14;
mediump vec2 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump float u_xlat10_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
vec4 u_xlat23;
mediump vec2 u_xlat16_23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_34;
float u_xlat44;
vec2 u_xlat54;
mediump vec2 u_xlat16_54;
vec2 u_xlat55;
mediump float u_xlat16_55;
bool u_xlatb55;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat78;
float u_xlat81;
mediump float u_xlat10_81;
bool u_xlatb81;
mediump float u_xlat16_86;
float u_xlat96;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_54.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat54.xy = u_xlat16_54.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat54.xy = min(max(u_xlat54.xy, 0.0), 1.0);
#else
    u_xlat54.xy = clamp(u_xlat54.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb81 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-vs_TEXCOORD3.xyz) * u_xlat4.xxx + vs_TEXCOORD2.xyz;
    u_xlat4.xyz = (bool(u_xlatb81)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat4.yyyy * u_xlat5;
    u_xlat1 = u_xlat1 * u_xlat4.xxxx + u_xlat5;
    u_xlat1 = u_xlat6 * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat7 + u_xlat1;
    u_xlat81 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat1.z + (-u_xlat81);
    u_xlat4.x = max((-u_xlat1.w), u_xlat81);
    u_xlat4.x = (-u_xlat81) + u_xlat4.x;
    u_xlat1.z = _ShadowBias.y * u_xlat4.x + u_xlat81;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_softShadowQuality==1.0);
#else
    u_xlatb81 = _softShadowQuality==1.0;
#endif
    if(u_xlatb81){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_34.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb81 = !!(_softShadowQuality==2.0);
#else
        u_xlatb81 = _softShadowQuality==2.0;
#endif
        if(u_xlatb81){
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_61.xy = u_xlat16_5.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_10.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_62.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_11.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_62.xy;
            u_xlat16_9.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_4.yw;
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_5.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_4.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_5.z = u_xlat16_7.x;
            u_xlat16_5.w = u_xlat16_9.x;
            u_xlat16_6.z = u_xlat16_10.x;
            u_xlat16_6.w = u_xlat16_61.x;
            u_xlat16_4 = u_xlat16_5.zwxz + u_xlat16_6.zwxz;
            u_xlat16_7.z = u_xlat16_5.y;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_10.z = u_xlat16_6.y;
            u_xlat16_10.w = u_xlat16_61.y;
            u_xlat16_9.xyz = u_xlat16_7.zyw + u_xlat16_10.zyw;
            u_xlat16_11.xyz = u_xlat16_6.xzw / u_xlat16_4.zwy;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_10.xyz = u_xlat16_10.zyw / u_xlat16_9.xyz;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_5.xyz = u_xlat16_11.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_6.xyz = u_xlat16_10.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_5.w = u_xlat16_6.x;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.ywxw;
            u_xlat16_10.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.zw;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_5.yw = u_xlat16_6.yz;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_6 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.wywz;
            u_xlat16_5 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xwzw;
            u_xlat16_12 = u_xlat16_4.zwyz * u_xlat16_9.xxxy;
            u_xlat16_13 = u_xlat16_4 * u_xlat16_9.yyzz;
            u_xlat16_60.x = u_xlat16_4.y * u_xlat16_9.z;
            vec3 txVec4 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_14 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_86 = u_xlat16_12.y * u_xlat10_14;
            u_xlat16_86 = u_xlat16_12.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec6 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_86 = u_xlat16_12.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec7 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_86 = u_xlat16_12.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec8 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_86 = u_xlat16_13.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec9 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_86 = u_xlat16_13.y * u_xlat10_81 + u_xlat16_86;
            vec3 txVec10 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_86 = u_xlat16_13.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec11 = vec3(u_xlat16_5.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_86 = u_xlat16_13.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec12 = vec3(u_xlat16_5.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_34.x = u_xlat16_60.x * u_xlat10_81 + u_xlat16_86;
        } else {
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_6.yw = u_xlat16_5.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_10.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_10.xy;
            u_xlat16_62.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_4.yw;
            u_xlat16_10 = u_xlat16_10 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_4.z = u_xlat16_10.z * 0.0816320032;
            u_xlat16_5.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_10.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_5.z = u_xlat16_10.w * 0.0816320032;
            u_xlat16_4.x = u_xlat16_5.y;
            u_xlat16_4.yw = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_61.x;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_7;
            u_xlat16_5.yw = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_61.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 / u_xlat16_4;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6 / u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_6 = u_xlat16_6.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_9.xzw = u_xlat16_7.yzw;
            u_xlat16_9.y = u_xlat16_6.x;
            u_xlat16_10 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_11.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.y = u_xlat16_9.y;
            u_xlat16_9.y = u_xlat16_6.z;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.z = u_xlat16_9.y;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyxz;
            u_xlat16_9.y = u_xlat16_6.w;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_15.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xw;
            u_xlat16_6.xzw = u_xlat16_9.xzw;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_16.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_6.x = u_xlat16_7.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xy;
            u_xlat16_6 = u_xlat16_4 * u_xlat16_5.xxxx;
            u_xlat16_7 = u_xlat16_4 * u_xlat16_5.yyyy;
            u_xlat16_17 = u_xlat16_4 * u_xlat16_5.zzzz;
            u_xlat16_4 = u_xlat16_4 * u_xlat16_5.wwww;
            vec3 txVec13 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_10.x = u_xlat16_6.y * u_xlat10_18;
            u_xlat16_10.x = u_xlat16_6.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec15 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_10.x = u_xlat16_6.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec16 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_10.x = u_xlat16_6.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec17 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_10.x = u_xlat16_7.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec18 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_10.x = u_xlat16_7.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_10.x = u_xlat16_7.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec20 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_10.x = u_xlat16_7.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec21 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_10.x = u_xlat16_17.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec22 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_10.x = u_xlat16_17.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec23 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_10.x = u_xlat16_17.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_10.x = u_xlat16_17.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec25 = vec3(u_xlat16_9.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_9.x = u_xlat16_4.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec26 = vec3(u_xlat16_9.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_9.x = u_xlat16_4.y * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec27 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_9.x = u_xlat16_4.z * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_34.x = u_xlat16_4.w * u_xlat10_81 + u_xlat16_9.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_60.x + u_xlat16_8.x;
    u_xlat18.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vs_TEXCOORD2.xyz;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat18.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat18.x = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = min(u_xlat81, 1.0);
    u_xlat18.x = (-u_xlat16_8.x) + 1.0;
    u_xlat18.x = (-u_xlat18.x) * _ShadowIntensity + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat44 = (-u_xlat81) + 1.0;
    u_xlat81 = u_xlat18.x * u_xlat44 + u_xlat81;
    u_xlat18.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz + _Shadow_Color.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = (-u_xlat18.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat55.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_55 = texture(_Metal_Rough_Skin, u_xlat55.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb81 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat81 = (u_xlatb81) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat81 = u_xlat81 + _ReplaceAmount;
    u_xlat81 = dot(vec2(u_xlat81), vec2(_Replace_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Fanwei);
    u_xlat55.x = u_xlat16_55 + u_xlat81;
    u_xlat81 = dot(u_xlat55.xx, vec2(_Replace_Color_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(u_xlat55.x>=0.5);
#else
    u_xlatb55 = u_xlat55.x>=0.5;
#endif
    u_xlat55.x = u_xlatb55 ? 1.0 : float(0.0);
    u_xlat20.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat16_21.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat21.xyz = (-u_xlat16_19.xyz) + u_xlat16_21.xyz;
    u_xlat19.xyz = u_xlat55.xxx * u_xlat21.xyz + u_xlat16_19.xyz;
    u_xlat21.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat19.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat21.xyz;
    u_xlat81 = (-u_xlat54.x) + 1.0;
    u_xlat21.xyz = u_xlat19.xyz * vec3(u_xlat81);
    u_xlat96 = max(_FG_Intensity, 0.0);
    u_xlat22.xyz = vec3(u_xlat96) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat23.xyz = u_xlat22.xyz * u_xlat2.xxx + u_xlat28.xxx;
    u_xlat23.xyz = max(u_xlat23.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat22.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat22.xyz = u_xlat23.xyz / u_xlat2.xxx;
    u_xlat22.xyz = u_xlat22.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat28.xxx * vec3(0.5, 0.5, 0.5) + u_xlat22.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_28.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_23.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat23.xy = u_xlat16_23.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat23.xy = u_xlat23.xy * u_xlat16_8.xy;
    u_xlat23.xzw = u_xlat23.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat23.xzw, u_xlat23.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat23.xzw = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat24.xyz = u_xlat23.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat24.xyz = u_xlat2.xxx * u_xlat24.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat25.xyz = u_xlat16_8.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat2.xxx * u_xlat25.xyz;
    u_xlat16_8.x = dot(u_xlat23.xzw, u_xlat25.xyz);
    u_xlat16_34.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = u_xlat16_8.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_60.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_60.x;
    u_xlat16_60.x = dot(u_xlat24.xyz, u_xlat25.xyz);
    u_xlat16_34.z = (-u_xlat16_60.x) * u_xlat16_60.x + 1.0;
    u_xlat16_34.xz = sqrt(u_xlat16_34.xz);
    u_xlat16_60.x = u_xlat16_60.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60.x = min(max(u_xlat16_60.x, 0.0), 1.0);
#else
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_60.x * -2.0 + 3.0;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_9.x;
    u_xlat16_34.x = log2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_8.x;
    u_xlat16_34.x = log2(u_xlat16_34.z);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier2;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_60.x;
    u_xlat16_34.xyz = u_xlat16_34.xxx * _SpecularColor2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _SpecularColor.xyz + u_xlat16_34.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_8.xyz = u_xlat16_28.xxx * u_xlat16_8.xyz;
    u_xlat23.xyz = vec3(u_xlat81) * _Ambient_Color.xyz;
    u_xlat19.xyz = u_xlat19.xyz * u_xlat23.xyz;
    u_xlat19.xyz = vec3(u_xlat3) * u_xlat19.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat23.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat23.xyz);
    u_xlat23.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat23.xzw = u_xlat16_1.xyz * u_xlat23.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat23.xzw = u_xlat16_1.xyz * u_xlat23.xzw;
    u_xlat23.xzw = u_xlat16_1.www * u_xlat23.xzw;
    u_xlat23.xzw = vec3(u_xlat3) * u_xlat23.xzw;
    u_xlat2.x = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat2.x = (-u_xlat54.y) + u_xlat54.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat28.x = (-u_xlat78) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat2.x = u_xlat2.x * u_xlat28.x;
    u_xlat28.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat28.xy = u_xlat28.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat28.xy);
    u_xlat16_28.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Fresnel;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Intensity;
    u_xlat78 = u_xlat16_1.w * u_xlat78;
    u_xlat28.xyz = u_xlat16_28.xyz * vec3(u_xlat78);
    u_xlat28.xyz = u_xlat16_1.xyz * u_xlat28.xyz;
    u_xlat24.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat24.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat24.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat24.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat16_24.xyz = texture(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat25.xyz = u_xlat16_24.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat25.xyz = u_xlat16_24.xyz * u_xlat25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat16_24.xyz * u_xlat25.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat22.xyz + u_xlat16_8.xyz;
    u_xlat19.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz + u_xlat19.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat19.xyz = u_xlat21.xyz * vec3(_Cube_Intensity) + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat28.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat20.xyz * u_xlat55.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat18.xyz + u_xlat24.xyz;
    u_xlat16_8.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
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
Local Keywords { "_EMISSION_ON" }
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(7) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump float u_xlat10_14;
mediump vec2 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump float u_xlat10_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
vec4 u_xlat23;
mediump vec2 u_xlat16_23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_34;
float u_xlat44;
vec2 u_xlat54;
mediump vec2 u_xlat16_54;
vec2 u_xlat55;
mediump float u_xlat16_55;
bool u_xlatb55;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat78;
float u_xlat81;
mediump float u_xlat10_81;
bool u_xlatb81;
mediump float u_xlat16_86;
float u_xlat96;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_54.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat54.xy = u_xlat16_54.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat54.xy = min(max(u_xlat54.xy, 0.0), 1.0);
#else
    u_xlat54.xy = clamp(u_xlat54.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb81 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-vs_TEXCOORD3.xyz) * u_xlat4.xxx + vs_TEXCOORD2.xyz;
    u_xlat4.xyz = (bool(u_xlatb81)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat4.yyyy * u_xlat5;
    u_xlat1 = u_xlat1 * u_xlat4.xxxx + u_xlat5;
    u_xlat1 = u_xlat6 * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat7 + u_xlat1;
    u_xlat81 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat1.z + (-u_xlat81);
    u_xlat4.x = max((-u_xlat1.w), u_xlat81);
    u_xlat4.x = (-u_xlat81) + u_xlat4.x;
    u_xlat1.z = _ShadowBias.y * u_xlat4.x + u_xlat81;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_softShadowQuality==1.0);
#else
    u_xlatb81 = _softShadowQuality==1.0;
#endif
    if(u_xlatb81){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_34.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb81 = !!(_softShadowQuality==2.0);
#else
        u_xlatb81 = _softShadowQuality==2.0;
#endif
        if(u_xlatb81){
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_61.xy = u_xlat16_5.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_10.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_62.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_11.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_62.xy;
            u_xlat16_9.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_4.yw;
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_5.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_4.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_5.z = u_xlat16_7.x;
            u_xlat16_5.w = u_xlat16_9.x;
            u_xlat16_6.z = u_xlat16_10.x;
            u_xlat16_6.w = u_xlat16_61.x;
            u_xlat16_4 = u_xlat16_5.zwxz + u_xlat16_6.zwxz;
            u_xlat16_7.z = u_xlat16_5.y;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_10.z = u_xlat16_6.y;
            u_xlat16_10.w = u_xlat16_61.y;
            u_xlat16_9.xyz = u_xlat16_7.zyw + u_xlat16_10.zyw;
            u_xlat16_11.xyz = u_xlat16_6.xzw / u_xlat16_4.zwy;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_10.xyz = u_xlat16_10.zyw / u_xlat16_9.xyz;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_5.xyz = u_xlat16_11.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_6.xyz = u_xlat16_10.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_5.w = u_xlat16_6.x;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.ywxw;
            u_xlat16_10.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.zw;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_5.yw = u_xlat16_6.yz;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_6 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.wywz;
            u_xlat16_5 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xwzw;
            u_xlat16_12 = u_xlat16_4.zwyz * u_xlat16_9.xxxy;
            u_xlat16_13 = u_xlat16_4 * u_xlat16_9.yyzz;
            u_xlat16_60.x = u_xlat16_4.y * u_xlat16_9.z;
            vec3 txVec4 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_14 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_86 = u_xlat16_12.y * u_xlat10_14;
            u_xlat16_86 = u_xlat16_12.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec6 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_86 = u_xlat16_12.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec7 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_86 = u_xlat16_12.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec8 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_86 = u_xlat16_13.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec9 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_86 = u_xlat16_13.y * u_xlat10_81 + u_xlat16_86;
            vec3 txVec10 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_86 = u_xlat16_13.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec11 = vec3(u_xlat16_5.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_86 = u_xlat16_13.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec12 = vec3(u_xlat16_5.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_34.x = u_xlat16_60.x * u_xlat10_81 + u_xlat16_86;
        } else {
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_6.yw = u_xlat16_5.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_10.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_10.xy;
            u_xlat16_62.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_4.yw;
            u_xlat16_10 = u_xlat16_10 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_4.z = u_xlat16_10.z * 0.0816320032;
            u_xlat16_5.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_10.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_5.z = u_xlat16_10.w * 0.0816320032;
            u_xlat16_4.x = u_xlat16_5.y;
            u_xlat16_4.yw = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_61.x;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_7;
            u_xlat16_5.yw = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_61.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 / u_xlat16_4;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6 / u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_6 = u_xlat16_6.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_9.xzw = u_xlat16_7.yzw;
            u_xlat16_9.y = u_xlat16_6.x;
            u_xlat16_10 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_11.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.y = u_xlat16_9.y;
            u_xlat16_9.y = u_xlat16_6.z;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.z = u_xlat16_9.y;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyxz;
            u_xlat16_9.y = u_xlat16_6.w;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_15.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xw;
            u_xlat16_6.xzw = u_xlat16_9.xzw;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_16.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_6.x = u_xlat16_7.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xy;
            u_xlat16_6 = u_xlat16_4 * u_xlat16_5.xxxx;
            u_xlat16_7 = u_xlat16_4 * u_xlat16_5.yyyy;
            u_xlat16_17 = u_xlat16_4 * u_xlat16_5.zzzz;
            u_xlat16_4 = u_xlat16_4 * u_xlat16_5.wwww;
            vec3 txVec13 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_10.x = u_xlat16_6.y * u_xlat10_18;
            u_xlat16_10.x = u_xlat16_6.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec15 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_10.x = u_xlat16_6.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec16 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_10.x = u_xlat16_6.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec17 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_10.x = u_xlat16_7.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec18 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_10.x = u_xlat16_7.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_10.x = u_xlat16_7.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec20 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_10.x = u_xlat16_7.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec21 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_10.x = u_xlat16_17.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec22 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_10.x = u_xlat16_17.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec23 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_10.x = u_xlat16_17.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_10.x = u_xlat16_17.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec25 = vec3(u_xlat16_9.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_9.x = u_xlat16_4.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec26 = vec3(u_xlat16_9.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_9.x = u_xlat16_4.y * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec27 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_9.x = u_xlat16_4.z * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_34.x = u_xlat16_4.w * u_xlat10_81 + u_xlat16_9.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_60.x + u_xlat16_8.x;
    u_xlat18.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vs_TEXCOORD2.xyz;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat18.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat18.x = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = min(u_xlat81, 1.0);
    u_xlat18.x = (-u_xlat16_8.x) + 1.0;
    u_xlat18.x = (-u_xlat18.x) * _ShadowIntensity + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat44 = (-u_xlat81) + 1.0;
    u_xlat81 = u_xlat18.x * u_xlat44 + u_xlat81;
    u_xlat18.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz + _Shadow_Color.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = (-u_xlat18.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat55.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_55 = texture(_Metal_Rough_Skin, u_xlat55.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb81 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat81 = (u_xlatb81) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat81 = u_xlat81 + _ReplaceAmount;
    u_xlat81 = dot(vec2(u_xlat81), vec2(_Replace_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Fanwei);
    u_xlat55.x = u_xlat16_55 + u_xlat81;
    u_xlat81 = dot(u_xlat55.xx, vec2(_Replace_Color_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(u_xlat55.x>=0.5);
#else
    u_xlatb55 = u_xlat55.x>=0.5;
#endif
    u_xlat55.x = u_xlatb55 ? 1.0 : float(0.0);
    u_xlat20.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat16_21.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat21.xyz = (-u_xlat16_19.xyz) + u_xlat16_21.xyz;
    u_xlat19.xyz = u_xlat55.xxx * u_xlat21.xyz + u_xlat16_19.xyz;
    u_xlat21.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat19.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat21.xyz;
    u_xlat81 = (-u_xlat54.x) + 1.0;
    u_xlat21.xyz = u_xlat19.xyz * vec3(u_xlat81);
    u_xlat96 = max(_FG_Intensity, 0.0);
    u_xlat22.xyz = vec3(u_xlat96) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat23.xyz = u_xlat22.xyz * u_xlat2.xxx + u_xlat28.xxx;
    u_xlat23.xyz = max(u_xlat23.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat22.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat22.xyz = u_xlat23.xyz / u_xlat2.xxx;
    u_xlat22.xyz = u_xlat22.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat28.xxx * vec3(0.5, 0.5, 0.5) + u_xlat22.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_28.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_23.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat23.xy = u_xlat16_23.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat23.xy = u_xlat23.xy * u_xlat16_8.xy;
    u_xlat23.xzw = u_xlat23.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat23.xzw, u_xlat23.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat23.xzw = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat24.xyz = u_xlat23.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat24.xyz = u_xlat2.xxx * u_xlat24.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat25.xyz = u_xlat16_8.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat2.xxx * u_xlat25.xyz;
    u_xlat16_8.x = dot(u_xlat23.xzw, u_xlat25.xyz);
    u_xlat16_34.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = u_xlat16_8.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_60.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_60.x;
    u_xlat16_60.x = dot(u_xlat24.xyz, u_xlat25.xyz);
    u_xlat16_34.z = (-u_xlat16_60.x) * u_xlat16_60.x + 1.0;
    u_xlat16_34.xz = sqrt(u_xlat16_34.xz);
    u_xlat16_60.x = u_xlat16_60.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60.x = min(max(u_xlat16_60.x, 0.0), 1.0);
#else
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_60.x * -2.0 + 3.0;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_9.x;
    u_xlat16_34.x = log2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_8.x;
    u_xlat16_34.x = log2(u_xlat16_34.z);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier2;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_60.x;
    u_xlat16_34.xyz = u_xlat16_34.xxx * _SpecularColor2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _SpecularColor.xyz + u_xlat16_34.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_8.xyz = u_xlat16_28.xxx * u_xlat16_8.xyz;
    u_xlat23.xyz = vec3(u_xlat81) * _Ambient_Color.xyz;
    u_xlat19.xyz = u_xlat19.xyz * u_xlat23.xyz;
    u_xlat19.xyz = vec3(u_xlat3) * u_xlat19.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat23.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat23.xyz);
    u_xlat23.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat23.xzw = u_xlat16_1.xyz * u_xlat23.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat23.xzw = u_xlat16_1.xyz * u_xlat23.xzw;
    u_xlat23.xzw = u_xlat16_1.www * u_xlat23.xzw;
    u_xlat23.xzw = vec3(u_xlat3) * u_xlat23.xzw;
    u_xlat2.x = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat2.x = (-u_xlat54.y) + u_xlat54.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat28.x = (-u_xlat78) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat2.x = u_xlat2.x * u_xlat28.x;
    u_xlat28.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat28.xy = u_xlat28.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat28.xy);
    u_xlat16_28.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Fresnel;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Intensity;
    u_xlat78 = u_xlat16_1.w * u_xlat78;
    u_xlat28.xyz = u_xlat16_28.xyz * vec3(u_xlat78);
    u_xlat28.xyz = u_xlat16_1.xyz * u_xlat28.xyz;
    u_xlat24.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat24.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat24.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat24.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat16_24.xyz = texture(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat25.xyz = u_xlat16_24.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat25.xyz = u_xlat16_24.xyz * u_xlat25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat16_24.xyz * u_xlat25.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat22.xyz + u_xlat16_8.xyz;
    u_xlat19.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz + u_xlat19.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat19.xyz = u_xlat21.xyz * vec3(_Cube_Intensity) + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat28.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat20.xyz * u_xlat55.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat18.xyz + u_xlat24.xyz;
    u_xlat16_8.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
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
Local Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
lowp float u_xlat10_14;
mediump vec2 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
lowp float u_xlat10_18;
vec3 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
vec4 u_xlat23;
lowp vec2 u_xlat10_23;
vec3 u_xlat24;
lowp vec3 u_xlat10_24;
vec3 u_xlat25;
vec3 u_xlat28;
lowp vec3 u_xlat10_28;
mediump vec3 u_xlat16_34;
float u_xlat44;
vec2 u_xlat54;
lowp vec2 u_xlat10_54;
vec2 u_xlat55;
lowp float u_xlat10_55;
bool u_xlatb55;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat78;
float u_xlat81;
lowp float u_xlat10_81;
bool u_xlatb81;
mediump float u_xlat16_86;
float u_xlat96;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_54.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat54.xy = u_xlat10_54.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat54.xy = clamp(u_xlat54.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb81 = _ShadowBias.z!=0.0;
    u_xlat4.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-vs_TEXCOORD3.xyz) * u_xlat4.xxx + vs_TEXCOORD2.xyz;
    u_xlat4.xyz = (bool(u_xlatb81)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat4.yyyy * u_xlat5;
    u_xlat1 = u_xlat1 * u_xlat4.xxxx + u_xlat5;
    u_xlat1 = u_xlat6 * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat7 + u_xlat1;
    u_xlat81 = _ShadowBias.x / u_xlat1.w;
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlat81 = u_xlat1.z + (-u_xlat81);
    u_xlat4.x = max((-u_xlat1.w), u_xlat81);
    u_xlat4.x = (-u_xlat81) + u_xlat4.x;
    u_xlat1.z = _ShadowBias.y * u_xlat4.x + u_xlat81;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlatb81 = _softShadowQuality==1.0;
    if(u_xlatb81){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat4.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_34.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb81 = _softShadowQuality==2.0;
        if(u_xlatb81){
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_61.xy = u_xlat16_5.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_10.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_62.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_11.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_62.xy;
            u_xlat16_9.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_4.yw;
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_5.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_4.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_5.z = u_xlat16_7.x;
            u_xlat16_5.w = u_xlat16_9.x;
            u_xlat16_6.z = u_xlat16_10.x;
            u_xlat16_6.w = u_xlat16_61.x;
            u_xlat16_4 = u_xlat16_5.zwxz + u_xlat16_6.zwxz;
            u_xlat16_7.z = u_xlat16_5.y;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_10.z = u_xlat16_6.y;
            u_xlat16_10.w = u_xlat16_61.y;
            u_xlat16_9.xyz = u_xlat16_7.zyw + u_xlat16_10.zyw;
            u_xlat16_11.xyz = u_xlat16_6.xzw / u_xlat16_4.zwy;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_10.xyz = u_xlat16_10.zyw / u_xlat16_9.xyz;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_5.xyz = u_xlat16_11.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_6.xyz = u_xlat16_10.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_5.w = u_xlat16_6.x;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.ywxw;
            u_xlat16_10.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.zw;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_5.yw = u_xlat16_6.yz;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_6 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.wywz;
            u_xlat16_5 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xwzw;
            u_xlat16_12 = u_xlat16_4.zwyz * u_xlat16_9.xxxy;
            u_xlat16_13 = u_xlat16_4 * u_xlat16_9.yyzz;
            u_xlat16_60.x = u_xlat16_4.y * u_xlat16_9.z;
            vec3 txVec4 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_14 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_86 = u_xlat16_12.y * u_xlat10_14;
            u_xlat16_86 = u_xlat16_12.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec6 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_86 = u_xlat16_12.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec7 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_86 = u_xlat16_12.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec8 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_86 = u_xlat16_13.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec9 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_86 = u_xlat16_13.y * u_xlat10_81 + u_xlat16_86;
            vec3 txVec10 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_86 = u_xlat16_13.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec11 = vec3(u_xlat16_5.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_86 = u_xlat16_13.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec12 = vec3(u_xlat16_5.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_34.x = u_xlat16_60.x * u_xlat10_81 + u_xlat16_86;
        } else {
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_6.yw = u_xlat16_5.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_10.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_10.xy;
            u_xlat16_62.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_4.yw;
            u_xlat16_10 = u_xlat16_10 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_4.z = u_xlat16_10.z * 0.0816320032;
            u_xlat16_5.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_10.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_5.z = u_xlat16_10.w * 0.0816320032;
            u_xlat16_4.x = u_xlat16_5.y;
            u_xlat16_4.yw = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_61.x;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_7;
            u_xlat16_5.yw = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_61.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 / u_xlat16_4;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6 / u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_6 = u_xlat16_6.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_9.xzw = u_xlat16_7.yzw;
            u_xlat16_9.y = u_xlat16_6.x;
            u_xlat16_10 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_11.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.y = u_xlat16_9.y;
            u_xlat16_9.y = u_xlat16_6.z;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.z = u_xlat16_9.y;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyxz;
            u_xlat16_9.y = u_xlat16_6.w;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_15.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xw;
            u_xlat16_6.xzw = u_xlat16_9.xzw;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_16.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_6.x = u_xlat16_7.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xy;
            u_xlat16_6 = u_xlat16_4 * u_xlat16_5.xxxx;
            u_xlat16_7 = u_xlat16_4 * u_xlat16_5.yyyy;
            u_xlat16_17 = u_xlat16_4 * u_xlat16_5.zzzz;
            u_xlat16_4 = u_xlat16_4 * u_xlat16_5.wwww;
            vec3 txVec13 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_18 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_10.x = u_xlat16_6.y * u_xlat10_18;
            u_xlat16_10.x = u_xlat16_6.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec15 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_10.x = u_xlat16_6.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec16 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_10.x = u_xlat16_6.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec17 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_10.x = u_xlat16_7.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec18 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_10.x = u_xlat16_7.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_10.x = u_xlat16_7.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec20 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_10.x = u_xlat16_7.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec21 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_10.x = u_xlat16_17.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec22 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_10.x = u_xlat16_17.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec23 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_10.x = u_xlat16_17.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_10.x = u_xlat16_17.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec25 = vec3(u_xlat16_9.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_9.x = u_xlat16_4.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec26 = vec3(u_xlat16_9.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_9.x = u_xlat16_4.y * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec27 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_9.x = u_xlat16_4.z * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_34.x = u_xlat16_4.w * u_xlat10_81 + u_xlat16_9.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_60.x + u_xlat16_8.x;
    u_xlat18.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vs_TEXCOORD2.xyz;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat18.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat18.x = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = min(u_xlat81, 1.0);
    u_xlat18.x = (-u_xlat16_8.x) + 1.0;
    u_xlat18.x = (-u_xlat18.x) * _ShadowIntensity + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat44 = (-u_xlat81) + 1.0;
    u_xlat81 = u_xlat18.x * u_xlat44 + u_xlat81;
    u_xlat18.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz + _Shadow_Color.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = (-u_xlat18.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_19.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat55.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_55 = texture2D(_Metal_Rough_Skin, u_xlat55.xy).z;
    u_xlatb81 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat81 = (u_xlatb81) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat81 = u_xlat81 + _ReplaceAmount;
    u_xlat81 = dot(vec2(u_xlat81), vec2(_Replace_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Fanwei);
    u_xlat55.x = u_xlat10_55 + u_xlat81;
    u_xlat81 = dot(u_xlat55.xx, vec2(_Replace_Color_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Color_Fanwei);
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlatb55 = u_xlat55.x>=0.5;
    u_xlat55.x = u_xlatb55 ? 1.0 : float(0.0);
    u_xlat20.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat10_21.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat21.xyz = (-u_xlat10_19.xyz) + u_xlat10_21.xyz;
    u_xlat19.xyz = u_xlat55.xxx * u_xlat21.xyz + u_xlat10_19.xyz;
    u_xlat21.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat19.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat21.xyz;
    u_xlat81 = (-u_xlat54.x) + 1.0;
    u_xlat21.xyz = u_xlat19.xyz * vec3(u_xlat81);
    u_xlat96 = max(_FG_Intensity, 0.0);
    u_xlat22.xyz = vec3(u_xlat96) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat23.xyz = u_xlat22.xyz * u_xlat2.xxx + u_xlat28.xxx;
    u_xlat23.xyz = max(u_xlat23.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat22.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat22.xyz = u_xlat23.xyz / u_xlat2.xxx;
    u_xlat22.xyz = u_xlat22.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat28.xxx * vec3(0.5, 0.5, 0.5) + u_xlat22.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_28.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_23.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat23.xy = u_xlat10_23.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat23.xy = u_xlat23.xy * u_xlat16_8.xy;
    u_xlat23.xzw = u_xlat23.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat23.xzw, u_xlat23.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat23.xzw = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat24.xyz = u_xlat23.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat24.xyz = u_xlat2.xxx * u_xlat24.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat25.xyz = u_xlat16_8.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat2.xxx * u_xlat25.xyz;
    u_xlat16_8.x = dot(u_xlat23.xzw, u_xlat25.xyz);
    u_xlat16_34.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = u_xlat16_8.x + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_60.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_60.x;
    u_xlat16_60.x = dot(u_xlat24.xyz, u_xlat25.xyz);
    u_xlat16_34.z = (-u_xlat16_60.x) * u_xlat16_60.x + 1.0;
    u_xlat16_34.xz = sqrt(u_xlat16_34.xz);
    u_xlat16_60.x = u_xlat16_60.x + 1.0;
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_60.x * -2.0 + 3.0;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_9.x;
    u_xlat16_34.x = log2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_8.x;
    u_xlat16_34.x = log2(u_xlat16_34.z);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier2;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_60.x;
    u_xlat16_34.xyz = u_xlat16_34.xxx * _SpecularColor2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _SpecularColor.xyz + u_xlat16_34.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_8.xyz = u_xlat10_28.xxx * u_xlat16_8.xyz;
    u_xlat23.xyz = vec3(u_xlat81) * _Ambient_Color.xyz;
    u_xlat19.xyz = u_xlat19.xyz * u_xlat23.xyz;
    u_xlat19.xyz = vec3(u_xlat3) * u_xlat19.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat23.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat23.xyz);
    u_xlat23.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat23.xzw = u_xlat10_1.xyz * u_xlat23.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat23.xzw = u_xlat10_1.xyz * u_xlat23.xzw;
    u_xlat23.xzw = u_xlat10_1.www * u_xlat23.xzw;
    u_xlat23.xzw = vec3(u_xlat3) * u_xlat23.xzw;
    u_xlat2.x = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat2.x = (-u_xlat54.y) + u_xlat54.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat28.x = (-u_xlat78) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat2.x = u_xlat2.x * u_xlat28.x;
    u_xlat28.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat28.xy = u_xlat28.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat28.xy);
    u_xlat10_28.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Fresnel;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Intensity;
    u_xlat78 = u_xlat10_1.w * u_xlat78;
    u_xlat28.xyz = u_xlat10_28.xyz * vec3(u_xlat78);
    u_xlat28.xyz = u_xlat10_1.xyz * u_xlat28.xyz;
    u_xlat24.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat24.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat24.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat24.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat10_24.xyz = texture2D(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat25.xyz = u_xlat10_24.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat25.xyz = u_xlat10_24.xyz * u_xlat25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat10_24.xyz * u_xlat25.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat22.xyz + u_xlat16_8.xyz;
    u_xlat19.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz + u_xlat19.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat19.xyz = u_xlat21.xyz * vec3(_Cube_Intensity) + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat28.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat20.xyz * u_xlat55.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat18.xyz + u_xlat24.xyz;
    u_xlat16_8.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
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
Local Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
lowp float u_xlat10_14;
mediump vec2 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
lowp float u_xlat10_18;
vec3 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
vec4 u_xlat23;
lowp vec2 u_xlat10_23;
vec3 u_xlat24;
lowp vec3 u_xlat10_24;
vec3 u_xlat25;
vec3 u_xlat28;
lowp vec3 u_xlat10_28;
mediump vec3 u_xlat16_34;
float u_xlat44;
vec2 u_xlat54;
lowp vec2 u_xlat10_54;
vec2 u_xlat55;
lowp float u_xlat10_55;
bool u_xlatb55;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat78;
float u_xlat81;
lowp float u_xlat10_81;
bool u_xlatb81;
mediump float u_xlat16_86;
float u_xlat96;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_54.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat54.xy = u_xlat10_54.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat54.xy = clamp(u_xlat54.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb81 = _ShadowBias.z!=0.0;
    u_xlat4.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-vs_TEXCOORD3.xyz) * u_xlat4.xxx + vs_TEXCOORD2.xyz;
    u_xlat4.xyz = (bool(u_xlatb81)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat4.yyyy * u_xlat5;
    u_xlat1 = u_xlat1 * u_xlat4.xxxx + u_xlat5;
    u_xlat1 = u_xlat6 * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat7 + u_xlat1;
    u_xlat81 = _ShadowBias.x / u_xlat1.w;
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlat81 = u_xlat1.z + (-u_xlat81);
    u_xlat4.x = max((-u_xlat1.w), u_xlat81);
    u_xlat4.x = (-u_xlat81) + u_xlat4.x;
    u_xlat1.z = _ShadowBias.y * u_xlat4.x + u_xlat81;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlatb81 = _softShadowQuality==1.0;
    if(u_xlatb81){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat4.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_34.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb81 = _softShadowQuality==2.0;
        if(u_xlatb81){
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_61.xy = u_xlat16_5.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_10.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_62.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_11.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_62.xy;
            u_xlat16_9.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_4.yw;
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_5.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_4.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_5.z = u_xlat16_7.x;
            u_xlat16_5.w = u_xlat16_9.x;
            u_xlat16_6.z = u_xlat16_10.x;
            u_xlat16_6.w = u_xlat16_61.x;
            u_xlat16_4 = u_xlat16_5.zwxz + u_xlat16_6.zwxz;
            u_xlat16_7.z = u_xlat16_5.y;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_10.z = u_xlat16_6.y;
            u_xlat16_10.w = u_xlat16_61.y;
            u_xlat16_9.xyz = u_xlat16_7.zyw + u_xlat16_10.zyw;
            u_xlat16_11.xyz = u_xlat16_6.xzw / u_xlat16_4.zwy;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_10.xyz = u_xlat16_10.zyw / u_xlat16_9.xyz;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_5.xyz = u_xlat16_11.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_6.xyz = u_xlat16_10.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_5.w = u_xlat16_6.x;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.ywxw;
            u_xlat16_10.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.zw;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_5.yw = u_xlat16_6.yz;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_6 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.wywz;
            u_xlat16_5 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xwzw;
            u_xlat16_12 = u_xlat16_4.zwyz * u_xlat16_9.xxxy;
            u_xlat16_13 = u_xlat16_4 * u_xlat16_9.yyzz;
            u_xlat16_60.x = u_xlat16_4.y * u_xlat16_9.z;
            vec3 txVec4 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_14 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_86 = u_xlat16_12.y * u_xlat10_14;
            u_xlat16_86 = u_xlat16_12.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec6 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_86 = u_xlat16_12.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec7 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_86 = u_xlat16_12.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec8 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_86 = u_xlat16_13.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec9 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_86 = u_xlat16_13.y * u_xlat10_81 + u_xlat16_86;
            vec3 txVec10 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_86 = u_xlat16_13.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec11 = vec3(u_xlat16_5.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_86 = u_xlat16_13.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec12 = vec3(u_xlat16_5.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_34.x = u_xlat16_60.x * u_xlat10_81 + u_xlat16_86;
        } else {
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_6.yw = u_xlat16_5.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_10.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_10.xy;
            u_xlat16_62.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_4.yw;
            u_xlat16_10 = u_xlat16_10 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_4.z = u_xlat16_10.z * 0.0816320032;
            u_xlat16_5.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_10.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_5.z = u_xlat16_10.w * 0.0816320032;
            u_xlat16_4.x = u_xlat16_5.y;
            u_xlat16_4.yw = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_61.x;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_7;
            u_xlat16_5.yw = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_61.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 / u_xlat16_4;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6 / u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_6 = u_xlat16_6.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_9.xzw = u_xlat16_7.yzw;
            u_xlat16_9.y = u_xlat16_6.x;
            u_xlat16_10 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_11.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.y = u_xlat16_9.y;
            u_xlat16_9.y = u_xlat16_6.z;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.z = u_xlat16_9.y;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyxz;
            u_xlat16_9.y = u_xlat16_6.w;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_15.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xw;
            u_xlat16_6.xzw = u_xlat16_9.xzw;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_16.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_6.x = u_xlat16_7.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xy;
            u_xlat16_6 = u_xlat16_4 * u_xlat16_5.xxxx;
            u_xlat16_7 = u_xlat16_4 * u_xlat16_5.yyyy;
            u_xlat16_17 = u_xlat16_4 * u_xlat16_5.zzzz;
            u_xlat16_4 = u_xlat16_4 * u_xlat16_5.wwww;
            vec3 txVec13 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_18 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_10.x = u_xlat16_6.y * u_xlat10_18;
            u_xlat16_10.x = u_xlat16_6.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec15 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_10.x = u_xlat16_6.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec16 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_10.x = u_xlat16_6.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec17 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_10.x = u_xlat16_7.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec18 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_10.x = u_xlat16_7.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_10.x = u_xlat16_7.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec20 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_10.x = u_xlat16_7.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec21 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_10.x = u_xlat16_17.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec22 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_10.x = u_xlat16_17.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec23 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_10.x = u_xlat16_17.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_10.x = u_xlat16_17.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec25 = vec3(u_xlat16_9.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_9.x = u_xlat16_4.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec26 = vec3(u_xlat16_9.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_9.x = u_xlat16_4.y * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec27 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_9.x = u_xlat16_4.z * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_34.x = u_xlat16_4.w * u_xlat10_81 + u_xlat16_9.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_60.x + u_xlat16_8.x;
    u_xlat18.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vs_TEXCOORD2.xyz;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat18.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat18.x = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = min(u_xlat81, 1.0);
    u_xlat18.x = (-u_xlat16_8.x) + 1.0;
    u_xlat18.x = (-u_xlat18.x) * _ShadowIntensity + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat44 = (-u_xlat81) + 1.0;
    u_xlat81 = u_xlat18.x * u_xlat44 + u_xlat81;
    u_xlat18.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz + _Shadow_Color.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = (-u_xlat18.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_19.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat55.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_55 = texture2D(_Metal_Rough_Skin, u_xlat55.xy).z;
    u_xlatb81 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat81 = (u_xlatb81) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat81 = u_xlat81 + _ReplaceAmount;
    u_xlat81 = dot(vec2(u_xlat81), vec2(_Replace_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Fanwei);
    u_xlat55.x = u_xlat10_55 + u_xlat81;
    u_xlat81 = dot(u_xlat55.xx, vec2(_Replace_Color_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Color_Fanwei);
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlatb55 = u_xlat55.x>=0.5;
    u_xlat55.x = u_xlatb55 ? 1.0 : float(0.0);
    u_xlat20.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat10_21.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat21.xyz = (-u_xlat10_19.xyz) + u_xlat10_21.xyz;
    u_xlat19.xyz = u_xlat55.xxx * u_xlat21.xyz + u_xlat10_19.xyz;
    u_xlat21.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat19.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat21.xyz;
    u_xlat81 = (-u_xlat54.x) + 1.0;
    u_xlat21.xyz = u_xlat19.xyz * vec3(u_xlat81);
    u_xlat96 = max(_FG_Intensity, 0.0);
    u_xlat22.xyz = vec3(u_xlat96) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat23.xyz = u_xlat22.xyz * u_xlat2.xxx + u_xlat28.xxx;
    u_xlat23.xyz = max(u_xlat23.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat22.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat22.xyz = u_xlat23.xyz / u_xlat2.xxx;
    u_xlat22.xyz = u_xlat22.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat28.xxx * vec3(0.5, 0.5, 0.5) + u_xlat22.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_28.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_23.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat23.xy = u_xlat10_23.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat23.xy = u_xlat23.xy * u_xlat16_8.xy;
    u_xlat23.xzw = u_xlat23.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat23.xzw, u_xlat23.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat23.xzw = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat24.xyz = u_xlat23.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat24.xyz = u_xlat2.xxx * u_xlat24.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat25.xyz = u_xlat16_8.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat2.xxx * u_xlat25.xyz;
    u_xlat16_8.x = dot(u_xlat23.xzw, u_xlat25.xyz);
    u_xlat16_34.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = u_xlat16_8.x + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_60.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_60.x;
    u_xlat16_60.x = dot(u_xlat24.xyz, u_xlat25.xyz);
    u_xlat16_34.z = (-u_xlat16_60.x) * u_xlat16_60.x + 1.0;
    u_xlat16_34.xz = sqrt(u_xlat16_34.xz);
    u_xlat16_60.x = u_xlat16_60.x + 1.0;
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_60.x * -2.0 + 3.0;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_9.x;
    u_xlat16_34.x = log2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_8.x;
    u_xlat16_34.x = log2(u_xlat16_34.z);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier2;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_60.x;
    u_xlat16_34.xyz = u_xlat16_34.xxx * _SpecularColor2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _SpecularColor.xyz + u_xlat16_34.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_8.xyz = u_xlat10_28.xxx * u_xlat16_8.xyz;
    u_xlat23.xyz = vec3(u_xlat81) * _Ambient_Color.xyz;
    u_xlat19.xyz = u_xlat19.xyz * u_xlat23.xyz;
    u_xlat19.xyz = vec3(u_xlat3) * u_xlat19.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat23.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat23.xyz);
    u_xlat23.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat23.xzw = u_xlat10_1.xyz * u_xlat23.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat23.xzw = u_xlat10_1.xyz * u_xlat23.xzw;
    u_xlat23.xzw = u_xlat10_1.www * u_xlat23.xzw;
    u_xlat23.xzw = vec3(u_xlat3) * u_xlat23.xzw;
    u_xlat2.x = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat2.x = (-u_xlat54.y) + u_xlat54.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat28.x = (-u_xlat78) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat2.x = u_xlat2.x * u_xlat28.x;
    u_xlat28.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat28.xy = u_xlat28.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat28.xy);
    u_xlat10_28.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Fresnel;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Intensity;
    u_xlat78 = u_xlat10_1.w * u_xlat78;
    u_xlat28.xyz = u_xlat10_28.xyz * vec3(u_xlat78);
    u_xlat28.xyz = u_xlat10_1.xyz * u_xlat28.xyz;
    u_xlat24.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat24.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat24.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat24.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat10_24.xyz = texture2D(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat25.xyz = u_xlat10_24.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat25.xyz = u_xlat10_24.xyz * u_xlat25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat10_24.xyz * u_xlat25.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat22.xyz + u_xlat16_8.xyz;
    u_xlat19.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz + u_xlat19.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat19.xyz = u_xlat21.xyz * vec3(_Cube_Intensity) + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat28.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat20.xyz * u_xlat55.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat18.xyz + u_xlat24.xyz;
    u_xlat16_8.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(7) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump float u_xlat10_14;
mediump vec2 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump float u_xlat10_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
vec4 u_xlat23;
mediump vec2 u_xlat16_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_34;
float u_xlat44;
vec2 u_xlat54;
mediump vec2 u_xlat16_54;
vec2 u_xlat55;
mediump float u_xlat16_55;
bool u_xlatb55;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat78;
float u_xlat81;
mediump float u_xlat10_81;
bool u_xlatb81;
mediump float u_xlat16_86;
float u_xlat96;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_54.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat54.xy = u_xlat16_54.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat54.xy = min(max(u_xlat54.xy, 0.0), 1.0);
#else
    u_xlat54.xy = clamp(u_xlat54.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb81 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-vs_TEXCOORD3.xyz) * u_xlat4.xxx + vs_TEXCOORD2.xyz;
    u_xlat4.xyz = (bool(u_xlatb81)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat4.yyyy * u_xlat5;
    u_xlat1 = u_xlat1 * u_xlat4.xxxx + u_xlat5;
    u_xlat1 = u_xlat6 * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat7 + u_xlat1;
    u_xlat81 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat1.z + (-u_xlat81);
    u_xlat4.x = max((-u_xlat1.w), u_xlat81);
    u_xlat4.x = (-u_xlat81) + u_xlat4.x;
    u_xlat1.z = _ShadowBias.y * u_xlat4.x + u_xlat81;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_softShadowQuality==1.0);
#else
    u_xlatb81 = _softShadowQuality==1.0;
#endif
    if(u_xlatb81){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_34.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb81 = !!(_softShadowQuality==2.0);
#else
        u_xlatb81 = _softShadowQuality==2.0;
#endif
        if(u_xlatb81){
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_61.xy = u_xlat16_5.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_10.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_62.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_11.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_62.xy;
            u_xlat16_9.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_4.yw;
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_5.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_4.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_5.z = u_xlat16_7.x;
            u_xlat16_5.w = u_xlat16_9.x;
            u_xlat16_6.z = u_xlat16_10.x;
            u_xlat16_6.w = u_xlat16_61.x;
            u_xlat16_4 = u_xlat16_5.zwxz + u_xlat16_6.zwxz;
            u_xlat16_7.z = u_xlat16_5.y;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_10.z = u_xlat16_6.y;
            u_xlat16_10.w = u_xlat16_61.y;
            u_xlat16_9.xyz = u_xlat16_7.zyw + u_xlat16_10.zyw;
            u_xlat16_11.xyz = u_xlat16_6.xzw / u_xlat16_4.zwy;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_10.xyz = u_xlat16_10.zyw / u_xlat16_9.xyz;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_5.xyz = u_xlat16_11.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_6.xyz = u_xlat16_10.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_5.w = u_xlat16_6.x;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.ywxw;
            u_xlat16_10.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.zw;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_5.yw = u_xlat16_6.yz;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_6 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.wywz;
            u_xlat16_5 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xwzw;
            u_xlat16_12 = u_xlat16_4.zwyz * u_xlat16_9.xxxy;
            u_xlat16_13 = u_xlat16_4 * u_xlat16_9.yyzz;
            u_xlat16_60.x = u_xlat16_4.y * u_xlat16_9.z;
            vec3 txVec4 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_14 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_86 = u_xlat16_12.y * u_xlat10_14;
            u_xlat16_86 = u_xlat16_12.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec6 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_86 = u_xlat16_12.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec7 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_86 = u_xlat16_12.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec8 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_86 = u_xlat16_13.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec9 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_86 = u_xlat16_13.y * u_xlat10_81 + u_xlat16_86;
            vec3 txVec10 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_86 = u_xlat16_13.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec11 = vec3(u_xlat16_5.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_86 = u_xlat16_13.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec12 = vec3(u_xlat16_5.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_34.x = u_xlat16_60.x * u_xlat10_81 + u_xlat16_86;
        } else {
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_6.yw = u_xlat16_5.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_10.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_10.xy;
            u_xlat16_62.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_4.yw;
            u_xlat16_10 = u_xlat16_10 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_4.z = u_xlat16_10.z * 0.0816320032;
            u_xlat16_5.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_10.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_5.z = u_xlat16_10.w * 0.0816320032;
            u_xlat16_4.x = u_xlat16_5.y;
            u_xlat16_4.yw = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_61.x;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_7;
            u_xlat16_5.yw = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_61.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 / u_xlat16_4;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6 / u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_6 = u_xlat16_6.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_9.xzw = u_xlat16_7.yzw;
            u_xlat16_9.y = u_xlat16_6.x;
            u_xlat16_10 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_11.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.y = u_xlat16_9.y;
            u_xlat16_9.y = u_xlat16_6.z;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.z = u_xlat16_9.y;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyxz;
            u_xlat16_9.y = u_xlat16_6.w;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_15.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xw;
            u_xlat16_6.xzw = u_xlat16_9.xzw;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_16.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_6.x = u_xlat16_7.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xy;
            u_xlat16_6 = u_xlat16_4 * u_xlat16_5.xxxx;
            u_xlat16_7 = u_xlat16_4 * u_xlat16_5.yyyy;
            u_xlat16_17 = u_xlat16_4 * u_xlat16_5.zzzz;
            u_xlat16_4 = u_xlat16_4 * u_xlat16_5.wwww;
            vec3 txVec13 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_10.x = u_xlat16_6.y * u_xlat10_18;
            u_xlat16_10.x = u_xlat16_6.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec15 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_10.x = u_xlat16_6.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec16 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_10.x = u_xlat16_6.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec17 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_10.x = u_xlat16_7.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec18 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_10.x = u_xlat16_7.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_10.x = u_xlat16_7.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec20 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_10.x = u_xlat16_7.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec21 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_10.x = u_xlat16_17.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec22 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_10.x = u_xlat16_17.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec23 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_10.x = u_xlat16_17.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_10.x = u_xlat16_17.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec25 = vec3(u_xlat16_9.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_9.x = u_xlat16_4.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec26 = vec3(u_xlat16_9.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_9.x = u_xlat16_4.y * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec27 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_9.x = u_xlat16_4.z * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_34.x = u_xlat16_4.w * u_xlat10_81 + u_xlat16_9.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_60.x + u_xlat16_8.x;
    u_xlat18.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vs_TEXCOORD2.xyz;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat18.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat18.x = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = min(u_xlat81, 1.0);
    u_xlat18.x = (-u_xlat16_8.x) + 1.0;
    u_xlat18.x = (-u_xlat18.x) * _ShadowIntensity + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat44 = (-u_xlat81) + 1.0;
    u_xlat81 = u_xlat18.x * u_xlat44 + u_xlat81;
    u_xlat18.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz + _Shadow_Color.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = (-u_xlat18.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat55.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_55 = texture(_Metal_Rough_Skin, u_xlat55.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb81 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat81 = (u_xlatb81) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat81 = u_xlat81 + _ReplaceAmount;
    u_xlat81 = dot(vec2(u_xlat81), vec2(_Replace_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Fanwei);
    u_xlat55.x = u_xlat16_55 + u_xlat81;
    u_xlat81 = dot(u_xlat55.xx, vec2(_Replace_Color_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(u_xlat55.x>=0.5);
#else
    u_xlatb55 = u_xlat55.x>=0.5;
#endif
    u_xlat55.x = u_xlatb55 ? 1.0 : float(0.0);
    u_xlat20.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat16_21.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat21.xyz = (-u_xlat16_19.xyz) + u_xlat16_21.xyz;
    u_xlat19.xyz = u_xlat55.xxx * u_xlat21.xyz + u_xlat16_19.xyz;
    u_xlat21.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat19.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat21.xyz;
    u_xlat81 = (-u_xlat54.x) + 1.0;
    u_xlat21.xyz = u_xlat19.xyz * vec3(u_xlat81);
    u_xlat96 = max(_FG_Intensity, 0.0);
    u_xlat22.xyz = vec3(u_xlat96) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat23.xyz = u_xlat22.xyz * u_xlat2.xxx + u_xlat28.xxx;
    u_xlat23.xyz = max(u_xlat23.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat22.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat22.xyz = u_xlat23.xyz / u_xlat2.xxx;
    u_xlat22.xyz = u_xlat22.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat28.xxx * vec3(0.5, 0.5, 0.5) + u_xlat22.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_28.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_23.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat23.xy = u_xlat16_23.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat23.xy = u_xlat23.xy * u_xlat16_8.xy;
    u_xlat23.xzw = u_xlat23.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat23.xzw, u_xlat23.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat23.xzw = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat24.xyz = u_xlat23.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat24.xyz = u_xlat2.xxx * u_xlat24.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat25.xyz = u_xlat16_8.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat2.xxx * u_xlat25.xyz;
    u_xlat16_8.x = dot(u_xlat23.xzw, u_xlat25.xyz);
    u_xlat16_34.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = u_xlat16_8.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_60.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_60.x;
    u_xlat16_60.x = dot(u_xlat24.xyz, u_xlat25.xyz);
    u_xlat16_34.z = (-u_xlat16_60.x) * u_xlat16_60.x + 1.0;
    u_xlat16_34.xz = sqrt(u_xlat16_34.xz);
    u_xlat16_60.x = u_xlat16_60.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60.x = min(max(u_xlat16_60.x, 0.0), 1.0);
#else
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_60.x * -2.0 + 3.0;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_9.x;
    u_xlat16_34.x = log2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_8.x;
    u_xlat16_34.x = log2(u_xlat16_34.z);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier2;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_60.x;
    u_xlat16_34.xyz = u_xlat16_34.xxx * _SpecularColor2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _SpecularColor.xyz + u_xlat16_34.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_8.xyz = u_xlat16_28.xxx * u_xlat16_8.xyz;
    u_xlat23.xyz = vec3(u_xlat81) * _Ambient_Color.xyz;
    u_xlat19.xyz = u_xlat19.xyz * u_xlat23.xyz;
    u_xlat19.xyz = vec3(u_xlat3) * u_xlat19.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat23.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat23.xyz);
    u_xlat23.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat23.xzw = u_xlat16_1.xyz * u_xlat23.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat23.xzw = u_xlat16_1.xyz * u_xlat23.xzw;
    u_xlat23.xzw = u_xlat16_1.www * u_xlat23.xzw;
    u_xlat23.xzw = vec3(u_xlat3) * u_xlat23.xzw;
    u_xlat2.x = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat2.x = (-u_xlat54.y) + u_xlat54.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat28.x = (-u_xlat78) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat2.x = u_xlat2.x * u_xlat28.x;
    u_xlat28.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat28.xy = u_xlat28.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat28.xy);
    u_xlat16_28.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Fresnel;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Intensity;
    u_xlat78 = u_xlat16_1.w * u_xlat78;
    u_xlat28.xyz = u_xlat16_28.xyz * vec3(u_xlat78);
    u_xlat28.xyz = u_xlat16_1.xyz * u_xlat28.xyz;
    u_xlat24.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat24.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat24.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat24.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat22.xyz + u_xlat16_8.xyz;
    u_xlat19.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz + u_xlat19.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat19.xyz = u_xlat21.xyz * vec3(_Cube_Intensity) + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat28.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat20.xyz * u_xlat55.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(7) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump float u_xlat10_14;
mediump vec2 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
mediump float u_xlat10_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
vec4 u_xlat23;
mediump vec2 u_xlat16_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_34;
float u_xlat44;
vec2 u_xlat54;
mediump vec2 u_xlat16_54;
vec2 u_xlat55;
mediump float u_xlat16_55;
bool u_xlatb55;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat78;
float u_xlat81;
mediump float u_xlat10_81;
bool u_xlatb81;
mediump float u_xlat16_86;
float u_xlat96;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat16_54.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat54.xy = u_xlat16_54.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat54.xy = min(max(u_xlat54.xy, 0.0), 1.0);
#else
    u_xlat54.xy = clamp(u_xlat54.xy, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat16_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat3 = (-u_xlat3) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb81 = _ShadowBias.z!=0.0;
#endif
    u_xlat4.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-vs_TEXCOORD3.xyz) * u_xlat4.xxx + vs_TEXCOORD2.xyz;
    u_xlat4.xyz = (bool(u_xlatb81)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat4.yyyy * u_xlat5;
    u_xlat1 = u_xlat1 * u_xlat4.xxxx + u_xlat5;
    u_xlat1 = u_xlat6 * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat7 + u_xlat1;
    u_xlat81 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat81 = u_xlat1.z + (-u_xlat81);
    u_xlat4.x = max((-u_xlat1.w), u_xlat81);
    u_xlat4.x = (-u_xlat81) + u_xlat4.x;
    u_xlat1.z = _ShadowBias.y * u_xlat4.x + u_xlat81;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(_softShadowQuality==1.0);
#else
    u_xlatb81 = _softShadowQuality==1.0;
#endif
    if(u_xlatb81){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_34.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb81 = !!(_softShadowQuality==2.0);
#else
        u_xlatb81 = _softShadowQuality==2.0;
#endif
        if(u_xlatb81){
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_61.xy = u_xlat16_5.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_10.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_62.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_11.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_62.xy;
            u_xlat16_9.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_4.yw;
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_5.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_4.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_5.z = u_xlat16_7.x;
            u_xlat16_5.w = u_xlat16_9.x;
            u_xlat16_6.z = u_xlat16_10.x;
            u_xlat16_6.w = u_xlat16_61.x;
            u_xlat16_4 = u_xlat16_5.zwxz + u_xlat16_6.zwxz;
            u_xlat16_7.z = u_xlat16_5.y;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_10.z = u_xlat16_6.y;
            u_xlat16_10.w = u_xlat16_61.y;
            u_xlat16_9.xyz = u_xlat16_7.zyw + u_xlat16_10.zyw;
            u_xlat16_11.xyz = u_xlat16_6.xzw / u_xlat16_4.zwy;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_10.xyz = u_xlat16_10.zyw / u_xlat16_9.xyz;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_5.xyz = u_xlat16_11.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_6.xyz = u_xlat16_10.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_5.w = u_xlat16_6.x;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.ywxw;
            u_xlat16_10.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.zw;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_5.yw = u_xlat16_6.yz;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_6 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.wywz;
            u_xlat16_5 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xwzw;
            u_xlat16_12 = u_xlat16_4.zwyz * u_xlat16_9.xxxy;
            u_xlat16_13 = u_xlat16_4 * u_xlat16_9.yyzz;
            u_xlat16_60.x = u_xlat16_4.y * u_xlat16_9.z;
            vec3 txVec4 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_14 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_86 = u_xlat16_12.y * u_xlat10_14;
            u_xlat16_86 = u_xlat16_12.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec6 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_86 = u_xlat16_12.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec7 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_86 = u_xlat16_12.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec8 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_86 = u_xlat16_13.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec9 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_86 = u_xlat16_13.y * u_xlat10_81 + u_xlat16_86;
            vec3 txVec10 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_86 = u_xlat16_13.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec11 = vec3(u_xlat16_5.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_86 = u_xlat16_13.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec12 = vec3(u_xlat16_5.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_34.x = u_xlat16_60.x * u_xlat10_81 + u_xlat16_86;
        } else {
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_6.yw = u_xlat16_5.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_10.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_10.xy;
            u_xlat16_62.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_4.yw;
            u_xlat16_10 = u_xlat16_10 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_4.z = u_xlat16_10.z * 0.0816320032;
            u_xlat16_5.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_10.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_5.z = u_xlat16_10.w * 0.0816320032;
            u_xlat16_4.x = u_xlat16_5.y;
            u_xlat16_4.yw = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_61.x;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_7;
            u_xlat16_5.yw = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_61.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 / u_xlat16_4;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6 / u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_6 = u_xlat16_6.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_9.xzw = u_xlat16_7.yzw;
            u_xlat16_9.y = u_xlat16_6.x;
            u_xlat16_10 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_11.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.y = u_xlat16_9.y;
            u_xlat16_9.y = u_xlat16_6.z;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.z = u_xlat16_9.y;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyxz;
            u_xlat16_9.y = u_xlat16_6.w;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_15.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xw;
            u_xlat16_6.xzw = u_xlat16_9.xzw;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_16.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_6.x = u_xlat16_7.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xy;
            u_xlat16_6 = u_xlat16_4 * u_xlat16_5.xxxx;
            u_xlat16_7 = u_xlat16_4 * u_xlat16_5.yyyy;
            u_xlat16_17 = u_xlat16_4 * u_xlat16_5.zzzz;
            u_xlat16_4 = u_xlat16_4 * u_xlat16_5.wwww;
            vec3 txVec13 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_10.x = u_xlat16_6.y * u_xlat10_18;
            u_xlat16_10.x = u_xlat16_6.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec15 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_10.x = u_xlat16_6.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec16 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_10.x = u_xlat16_6.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec17 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_10.x = u_xlat16_7.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec18 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_10.x = u_xlat16_7.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_10.x = u_xlat16_7.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec20 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_10.x = u_xlat16_7.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec21 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_10.x = u_xlat16_17.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec22 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_10.x = u_xlat16_17.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec23 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_10.x = u_xlat16_17.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_10.x = u_xlat16_17.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec25 = vec3(u_xlat16_9.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_9.x = u_xlat16_4.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec26 = vec3(u_xlat16_9.zw,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_9.x = u_xlat16_4.y * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec27 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_9.x = u_xlat16_4.z * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat1.w);
            u_xlat10_81 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_34.x = u_xlat16_4.w * u_xlat10_81 + u_xlat16_9.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_60.x + u_xlat16_8.x;
    u_xlat18.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vs_TEXCOORD2.xyz;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat18.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat18.x = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = min(u_xlat81, 1.0);
    u_xlat18.x = (-u_xlat16_8.x) + 1.0;
    u_xlat18.x = (-u_xlat18.x) * _ShadowIntensity + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat44 = (-u_xlat81) + 1.0;
    u_xlat81 = u_xlat18.x * u_xlat44 + u_xlat81;
    u_xlat18.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz + _Shadow_Color.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = (-u_xlat18.xyz) * u_xlat16_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_19.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat55.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_55 = texture(_Metal_Rough_Skin, u_xlat55.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb81 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat81 = (u_xlatb81) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat81 = u_xlat81 + _ReplaceAmount;
    u_xlat81 = dot(vec2(u_xlat81), vec2(_Replace_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Fanwei);
    u_xlat55.x = u_xlat16_55 + u_xlat81;
    u_xlat81 = dot(u_xlat55.xx, vec2(_Replace_Color_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(u_xlat55.x>=0.5);
#else
    u_xlatb55 = u_xlat55.x>=0.5;
#endif
    u_xlat55.x = u_xlatb55 ? 1.0 : float(0.0);
    u_xlat20.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat16_21.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat21.xyz = (-u_xlat16_19.xyz) + u_xlat16_21.xyz;
    u_xlat19.xyz = u_xlat55.xxx * u_xlat21.xyz + u_xlat16_19.xyz;
    u_xlat21.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat19.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat21.xyz;
    u_xlat81 = (-u_xlat54.x) + 1.0;
    u_xlat21.xyz = u_xlat19.xyz * vec3(u_xlat81);
    u_xlat96 = max(_FG_Intensity, 0.0);
    u_xlat22.xyz = vec3(u_xlat96) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat23.xyz = u_xlat22.xyz * u_xlat2.xxx + u_xlat28.xxx;
    u_xlat23.xyz = max(u_xlat23.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat22.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat22.xyz = u_xlat23.xyz / u_xlat2.xxx;
    u_xlat22.xyz = u_xlat22.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat28.xxx * vec3(0.5, 0.5, 0.5) + u_xlat22.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_2 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_28.x = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_23.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat23.xy = u_xlat16_23.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.xy = vec2(u_xlat16_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat23.xy = u_xlat23.xy * u_xlat16_8.xy;
    u_xlat23.xzw = u_xlat23.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat23.xzw, u_xlat23.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat23.xzw = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat24.xyz = u_xlat23.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat24.xyz = u_xlat2.xxx * u_xlat24.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat25.xyz = u_xlat16_8.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat2.xxx * u_xlat25.xyz;
    u_xlat16_8.x = dot(u_xlat23.xzw, u_xlat25.xyz);
    u_xlat16_34.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = u_xlat16_8.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_60.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_60.x;
    u_xlat16_60.x = dot(u_xlat24.xyz, u_xlat25.xyz);
    u_xlat16_34.z = (-u_xlat16_60.x) * u_xlat16_60.x + 1.0;
    u_xlat16_34.xz = sqrt(u_xlat16_34.xz);
    u_xlat16_60.x = u_xlat16_60.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60.x = min(max(u_xlat16_60.x, 0.0), 1.0);
#else
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_60.x * -2.0 + 3.0;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_9.x;
    u_xlat16_34.x = log2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_8.x;
    u_xlat16_34.x = log2(u_xlat16_34.z);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier2;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_60.x;
    u_xlat16_34.xyz = u_xlat16_34.xxx * _SpecularColor2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _SpecularColor.xyz + u_xlat16_34.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_8.xyz = u_xlat16_28.xxx * u_xlat16_8.xyz;
    u_xlat23.xyz = vec3(u_xlat81) * _Ambient_Color.xyz;
    u_xlat19.xyz = u_xlat19.xyz * u_xlat23.xyz;
    u_xlat19.xyz = vec3(u_xlat3) * u_xlat19.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat23.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat23.xyz);
    u_xlat23.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat23.xzw = u_xlat16_1.xyz * u_xlat23.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat23.xzw = u_xlat16_1.xyz * u_xlat23.xzw;
    u_xlat23.xzw = u_xlat16_1.www * u_xlat23.xzw;
    u_xlat23.xzw = vec3(u_xlat3) * u_xlat23.xzw;
    u_xlat2.x = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat2.x = (-u_xlat54.y) + u_xlat54.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat28.x = (-u_xlat78) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat2.x = u_xlat2.x * u_xlat28.x;
    u_xlat28.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat28.xy = u_xlat28.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat28.xy);
    u_xlat16_28.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Fresnel;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Intensity;
    u_xlat78 = u_xlat16_1.w * u_xlat78;
    u_xlat28.xyz = u_xlat16_28.xyz * vec3(u_xlat78);
    u_xlat28.xyz = u_xlat16_1.xyz * u_xlat28.xyz;
    u_xlat24.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat24.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat24.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat24.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat22.xyz + u_xlat16_8.xyz;
    u_xlat19.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz + u_xlat19.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat19.xyz = u_xlat21.xyz * vec3(_Cube_Intensity) + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.yyy + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat28.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat20.xyz * u_xlat55.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
lowp float u_xlat10_14;
mediump vec2 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
lowp float u_xlat10_18;
vec3 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
vec4 u_xlat23;
lowp vec2 u_xlat10_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
lowp vec3 u_xlat10_28;
mediump vec3 u_xlat16_34;
float u_xlat44;
vec2 u_xlat54;
lowp vec2 u_xlat10_54;
vec2 u_xlat55;
lowp float u_xlat10_55;
bool u_xlatb55;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat78;
float u_xlat81;
lowp float u_xlat10_81;
bool u_xlatb81;
mediump float u_xlat16_86;
float u_xlat96;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_54.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat54.xy = u_xlat10_54.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat54.xy = clamp(u_xlat54.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb81 = _ShadowBias.z!=0.0;
    u_xlat4.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-vs_TEXCOORD3.xyz) * u_xlat4.xxx + vs_TEXCOORD2.xyz;
    u_xlat4.xyz = (bool(u_xlatb81)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat4.yyyy * u_xlat5;
    u_xlat1 = u_xlat1 * u_xlat4.xxxx + u_xlat5;
    u_xlat1 = u_xlat6 * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat7 + u_xlat1;
    u_xlat81 = _ShadowBias.x / u_xlat1.w;
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlat81 = u_xlat1.z + (-u_xlat81);
    u_xlat4.x = max((-u_xlat1.w), u_xlat81);
    u_xlat4.x = (-u_xlat81) + u_xlat4.x;
    u_xlat1.z = _ShadowBias.y * u_xlat4.x + u_xlat81;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlatb81 = _softShadowQuality==1.0;
    if(u_xlatb81){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat4.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_34.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb81 = _softShadowQuality==2.0;
        if(u_xlatb81){
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_61.xy = u_xlat16_5.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_10.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_62.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_11.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_62.xy;
            u_xlat16_9.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_4.yw;
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_5.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_4.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_5.z = u_xlat16_7.x;
            u_xlat16_5.w = u_xlat16_9.x;
            u_xlat16_6.z = u_xlat16_10.x;
            u_xlat16_6.w = u_xlat16_61.x;
            u_xlat16_4 = u_xlat16_5.zwxz + u_xlat16_6.zwxz;
            u_xlat16_7.z = u_xlat16_5.y;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_10.z = u_xlat16_6.y;
            u_xlat16_10.w = u_xlat16_61.y;
            u_xlat16_9.xyz = u_xlat16_7.zyw + u_xlat16_10.zyw;
            u_xlat16_11.xyz = u_xlat16_6.xzw / u_xlat16_4.zwy;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_10.xyz = u_xlat16_10.zyw / u_xlat16_9.xyz;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_5.xyz = u_xlat16_11.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_6.xyz = u_xlat16_10.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_5.w = u_xlat16_6.x;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.ywxw;
            u_xlat16_10.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.zw;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_5.yw = u_xlat16_6.yz;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_6 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.wywz;
            u_xlat16_5 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xwzw;
            u_xlat16_12 = u_xlat16_4.zwyz * u_xlat16_9.xxxy;
            u_xlat16_13 = u_xlat16_4 * u_xlat16_9.yyzz;
            u_xlat16_60.x = u_xlat16_4.y * u_xlat16_9.z;
            vec3 txVec4 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_14 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_86 = u_xlat16_12.y * u_xlat10_14;
            u_xlat16_86 = u_xlat16_12.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec6 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_86 = u_xlat16_12.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec7 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_86 = u_xlat16_12.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec8 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_86 = u_xlat16_13.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec9 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_86 = u_xlat16_13.y * u_xlat10_81 + u_xlat16_86;
            vec3 txVec10 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_86 = u_xlat16_13.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec11 = vec3(u_xlat16_5.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_86 = u_xlat16_13.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec12 = vec3(u_xlat16_5.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_34.x = u_xlat16_60.x * u_xlat10_81 + u_xlat16_86;
        } else {
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_6.yw = u_xlat16_5.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_10.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_10.xy;
            u_xlat16_62.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_4.yw;
            u_xlat16_10 = u_xlat16_10 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_4.z = u_xlat16_10.z * 0.0816320032;
            u_xlat16_5.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_10.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_5.z = u_xlat16_10.w * 0.0816320032;
            u_xlat16_4.x = u_xlat16_5.y;
            u_xlat16_4.yw = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_61.x;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_7;
            u_xlat16_5.yw = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_61.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 / u_xlat16_4;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6 / u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_6 = u_xlat16_6.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_9.xzw = u_xlat16_7.yzw;
            u_xlat16_9.y = u_xlat16_6.x;
            u_xlat16_10 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_11.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.y = u_xlat16_9.y;
            u_xlat16_9.y = u_xlat16_6.z;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.z = u_xlat16_9.y;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyxz;
            u_xlat16_9.y = u_xlat16_6.w;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_15.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xw;
            u_xlat16_6.xzw = u_xlat16_9.xzw;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_16.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_6.x = u_xlat16_7.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xy;
            u_xlat16_6 = u_xlat16_4 * u_xlat16_5.xxxx;
            u_xlat16_7 = u_xlat16_4 * u_xlat16_5.yyyy;
            u_xlat16_17 = u_xlat16_4 * u_xlat16_5.zzzz;
            u_xlat16_4 = u_xlat16_4 * u_xlat16_5.wwww;
            vec3 txVec13 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_18 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_10.x = u_xlat16_6.y * u_xlat10_18;
            u_xlat16_10.x = u_xlat16_6.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec15 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_10.x = u_xlat16_6.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec16 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_10.x = u_xlat16_6.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec17 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_10.x = u_xlat16_7.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec18 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_10.x = u_xlat16_7.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_10.x = u_xlat16_7.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec20 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_10.x = u_xlat16_7.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec21 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_10.x = u_xlat16_17.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec22 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_10.x = u_xlat16_17.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec23 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_10.x = u_xlat16_17.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_10.x = u_xlat16_17.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec25 = vec3(u_xlat16_9.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_9.x = u_xlat16_4.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec26 = vec3(u_xlat16_9.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_9.x = u_xlat16_4.y * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec27 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_9.x = u_xlat16_4.z * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_34.x = u_xlat16_4.w * u_xlat10_81 + u_xlat16_9.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_60.x + u_xlat16_8.x;
    u_xlat18.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vs_TEXCOORD2.xyz;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat18.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat18.x = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = min(u_xlat81, 1.0);
    u_xlat18.x = (-u_xlat16_8.x) + 1.0;
    u_xlat18.x = (-u_xlat18.x) * _ShadowIntensity + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat44 = (-u_xlat81) + 1.0;
    u_xlat81 = u_xlat18.x * u_xlat44 + u_xlat81;
    u_xlat18.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz + _Shadow_Color.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = (-u_xlat18.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_19.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat55.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_55 = texture2D(_Metal_Rough_Skin, u_xlat55.xy).z;
    u_xlatb81 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat81 = (u_xlatb81) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat81 = u_xlat81 + _ReplaceAmount;
    u_xlat81 = dot(vec2(u_xlat81), vec2(_Replace_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Fanwei);
    u_xlat55.x = u_xlat10_55 + u_xlat81;
    u_xlat81 = dot(u_xlat55.xx, vec2(_Replace_Color_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Color_Fanwei);
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlatb55 = u_xlat55.x>=0.5;
    u_xlat55.x = u_xlatb55 ? 1.0 : float(0.0);
    u_xlat20.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat10_21.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat21.xyz = (-u_xlat10_19.xyz) + u_xlat10_21.xyz;
    u_xlat19.xyz = u_xlat55.xxx * u_xlat21.xyz + u_xlat10_19.xyz;
    u_xlat21.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat19.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat21.xyz;
    u_xlat81 = (-u_xlat54.x) + 1.0;
    u_xlat21.xyz = u_xlat19.xyz * vec3(u_xlat81);
    u_xlat96 = max(_FG_Intensity, 0.0);
    u_xlat22.xyz = vec3(u_xlat96) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat23.xyz = u_xlat22.xyz * u_xlat2.xxx + u_xlat28.xxx;
    u_xlat23.xyz = max(u_xlat23.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat22.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat22.xyz = u_xlat23.xyz / u_xlat2.xxx;
    u_xlat22.xyz = u_xlat22.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat28.xxx * vec3(0.5, 0.5, 0.5) + u_xlat22.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_28.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_23.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat23.xy = u_xlat10_23.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat23.xy = u_xlat23.xy * u_xlat16_8.xy;
    u_xlat23.xzw = u_xlat23.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat23.xzw, u_xlat23.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat23.xzw = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat24.xyz = u_xlat23.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat24.xyz = u_xlat2.xxx * u_xlat24.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat25.xyz = u_xlat16_8.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat2.xxx * u_xlat25.xyz;
    u_xlat16_8.x = dot(u_xlat23.xzw, u_xlat25.xyz);
    u_xlat16_34.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = u_xlat16_8.x + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_60.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_60.x;
    u_xlat16_60.x = dot(u_xlat24.xyz, u_xlat25.xyz);
    u_xlat16_34.z = (-u_xlat16_60.x) * u_xlat16_60.x + 1.0;
    u_xlat16_34.xz = sqrt(u_xlat16_34.xz);
    u_xlat16_60.x = u_xlat16_60.x + 1.0;
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_60.x * -2.0 + 3.0;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_9.x;
    u_xlat16_34.x = log2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_8.x;
    u_xlat16_34.x = log2(u_xlat16_34.z);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier2;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_60.x;
    u_xlat16_34.xyz = u_xlat16_34.xxx * _SpecularColor2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _SpecularColor.xyz + u_xlat16_34.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_8.xyz = u_xlat10_28.xxx * u_xlat16_8.xyz;
    u_xlat23.xyz = vec3(u_xlat81) * _Ambient_Color.xyz;
    u_xlat19.xyz = u_xlat19.xyz * u_xlat23.xyz;
    u_xlat19.xyz = vec3(u_xlat3) * u_xlat19.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat23.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat23.xyz);
    u_xlat23.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat23.xzw = u_xlat10_1.xyz * u_xlat23.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat23.xzw = u_xlat10_1.xyz * u_xlat23.xzw;
    u_xlat23.xzw = u_xlat10_1.www * u_xlat23.xzw;
    u_xlat23.xzw = vec3(u_xlat3) * u_xlat23.xzw;
    u_xlat2.x = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat2.x = (-u_xlat54.y) + u_xlat54.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat28.x = (-u_xlat78) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat2.x = u_xlat2.x * u_xlat28.x;
    u_xlat28.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat28.xy = u_xlat28.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat28.xy);
    u_xlat10_28.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Fresnel;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Intensity;
    u_xlat78 = u_xlat10_1.w * u_xlat78;
    u_xlat28.xyz = u_xlat10_28.xyz * vec3(u_xlat78);
    u_xlat28.xyz = u_xlat10_1.xyz * u_xlat28.xyz;
    u_xlat24.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat24.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat24.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat24.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat22.xyz + u_xlat16_8.xyz;
    u_xlat19.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz + u_xlat19.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat19.xyz = u_xlat21.xyz * vec3(_Cube_Intensity) + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat28.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat20.xyz * u_xlat55.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
float u_xlat3;
lowp vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
lowp float u_xlat10_14;
mediump vec2 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
vec3 u_xlat18;
lowp float u_xlat10_18;
vec3 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
vec4 u_xlat23;
lowp vec2 u_xlat10_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
lowp vec3 u_xlat10_28;
mediump vec3 u_xlat16_34;
float u_xlat44;
vec2 u_xlat54;
lowp vec2 u_xlat10_54;
vec2 u_xlat55;
lowp float u_xlat10_55;
bool u_xlatb55;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_67;
float u_xlat78;
float u_xlat81;
lowp float u_xlat10_81;
bool u_xlatb81;
mediump float u_xlat16_86;
float u_xlat96;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.x = u_xlat2.x * 0.5 + 0.5;
    u_xlat10_54.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat54.xy = u_xlat10_54.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat54.xy = clamp(u_xlat54.xy, 0.0, 1.0);
    u_xlat10_3.xyz = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xyz;
    u_xlat3 = (-u_xlat10_3.x) + 1.0;
    u_xlat3 = u_xlat3 * _AO_Intensity;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat3 = (-u_xlat3) + 1.0;
    u_xlatb81 = _ShadowBias.z!=0.0;
    u_xlat4.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat4.xyz);
    u_xlat4.x = (-u_xlat4.x) * u_xlat4.x + 1.0;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ShadowBias.z;
    u_xlat4.xyz = (-vs_TEXCOORD3.xyz) * u_xlat4.xxx + vs_TEXCOORD2.xyz;
    u_xlat4.xyz = (bool(u_xlatb81)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat4.yyyy * u_xlat5;
    u_xlat1 = u_xlat1 * u_xlat4.xxxx + u_xlat5;
    u_xlat1 = u_xlat6 * u_xlat4.zzzz + u_xlat1;
    u_xlat1 = u_xlat7 + u_xlat1;
    u_xlat81 = _ShadowBias.x / u_xlat1.w;
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlat81 = u_xlat1.z + (-u_xlat81);
    u_xlat4.x = max((-u_xlat1.w), u_xlat81);
    u_xlat4.x = (-u_xlat81) + u_xlat4.x;
    u_xlat1.z = _ShadowBias.y * u_xlat4.x + u_xlat81;
    u_xlat4.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat4.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_8.x = (-_ShadowBias.w) + 1.0;
    u_xlatb81 = _softShadowQuality==1.0;
    if(u_xlatb81){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat1.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat4.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat4.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_34.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb81 = _softShadowQuality==2.0;
        if(u_xlatb81){
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_61.xy = u_xlat16_5.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_10.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_62.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_11.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_11.xy) * u_xlat16_11.xy + u_xlat16_62.xy;
            u_xlat16_9.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_4.yw;
            u_xlat16_11.xy = u_xlat16_11.xy + vec2(1.0, 1.0);
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_5.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_62.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_4.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_5.z = u_xlat16_7.x;
            u_xlat16_5.w = u_xlat16_9.x;
            u_xlat16_6.z = u_xlat16_10.x;
            u_xlat16_6.w = u_xlat16_61.x;
            u_xlat16_4 = u_xlat16_5.zwxz + u_xlat16_6.zwxz;
            u_xlat16_7.z = u_xlat16_5.y;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_10.z = u_xlat16_6.y;
            u_xlat16_10.w = u_xlat16_61.y;
            u_xlat16_9.xyz = u_xlat16_7.zyw + u_xlat16_10.zyw;
            u_xlat16_11.xyz = u_xlat16_6.xzw / u_xlat16_4.zwy;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_10.xyz = u_xlat16_10.zyw / u_xlat16_9.xyz;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_5.xyz = u_xlat16_11.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_6.xyz = u_xlat16_10.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_5.w = u_xlat16_6.x;
            u_xlat16_7 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.ywxw;
            u_xlat16_10.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.zw;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_5.yw = u_xlat16_6.yz;
            u_xlat16_11 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_6 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.wywz;
            u_xlat16_5 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xwzw;
            u_xlat16_12 = u_xlat16_4.zwyz * u_xlat16_9.xxxy;
            u_xlat16_13 = u_xlat16_4 * u_xlat16_9.yyzz;
            u_xlat16_60.x = u_xlat16_4.y * u_xlat16_9.z;
            vec3 txVec4 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_14 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_86 = u_xlat16_12.y * u_xlat10_14;
            u_xlat16_86 = u_xlat16_12.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec6 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_86 = u_xlat16_12.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec7 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_86 = u_xlat16_12.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec8 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_86 = u_xlat16_13.x * u_xlat10_81 + u_xlat16_86;
            vec3 txVec9 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_86 = u_xlat16_13.y * u_xlat10_81 + u_xlat16_86;
            vec3 txVec10 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_86 = u_xlat16_13.z * u_xlat10_81 + u_xlat16_86;
            vec3 txVec11 = vec3(u_xlat16_5.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_86 = u_xlat16_13.w * u_xlat10_81 + u_xlat16_86;
            vec3 txVec12 = vec3(u_xlat16_5.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_34.x = u_xlat16_60.x * u_xlat10_81 + u_xlat16_86;
        } else {
            u_xlat16_60.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_60.xy = floor(u_xlat16_60.xy);
            u_xlat16_9.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_60.xy);
            u_xlat16_4 = u_xlat16_9.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_5 = u_xlat16_4.xxzz * u_xlat16_4.xxzz;
            u_xlat16_6.yw = u_xlat16_5.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_61.xy = u_xlat16_5.xz * vec2(0.5, 0.5) + (-u_xlat16_9.xy);
            u_xlat16_10.xy = (-u_xlat16_9.xy) + vec2(1.0, 1.0);
            u_xlat16_62.xy = min(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_10.xy;
            u_xlat16_62.xy = max(u_xlat16_9.xy, vec2(0.0, 0.0));
            u_xlat16_10.zw = (-u_xlat16_62.xy) * u_xlat16_62.xy + u_xlat16_4.yw;
            u_xlat16_10 = u_xlat16_10 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_4.z = u_xlat16_10.z * 0.0816320032;
            u_xlat16_5.xy = u_xlat16_61.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_61.xy = u_xlat16_10.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_5.z = u_xlat16_10.w * 0.0816320032;
            u_xlat16_4.x = u_xlat16_5.y;
            u_xlat16_4.yw = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_9.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_61.x;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_7;
            u_xlat16_5.yw = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_9.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_61.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 / u_xlat16_4;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6 / u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_6 = u_xlat16_6.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_9.xzw = u_xlat16_7.yzw;
            u_xlat16_9.y = u_xlat16_6.x;
            u_xlat16_10 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_11.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.y = u_xlat16_9.y;
            u_xlat16_9.y = u_xlat16_6.z;
            u_xlat16_12 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_63.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.z = u_xlat16_9.y;
            u_xlat16_13 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyxz;
            u_xlat16_9.y = u_xlat16_6.w;
            u_xlat16_14 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_9.xyzy;
            u_xlat16_15.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_9.wy;
            u_xlat16_7.w = u_xlat16_9.y;
            u_xlat16_67.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xw;
            u_xlat16_6.xzw = u_xlat16_9.xzw;
            u_xlat16_9 = u_xlat16_60.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_16.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.wy;
            u_xlat16_6.x = u_xlat16_7.x;
            u_xlat16_60.xy = u_xlat16_60.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xy;
            u_xlat16_6 = u_xlat16_4 * u_xlat16_5.xxxx;
            u_xlat16_7 = u_xlat16_4 * u_xlat16_5.yyyy;
            u_xlat16_17 = u_xlat16_4 * u_xlat16_5.zzzz;
            u_xlat16_4 = u_xlat16_4 * u_xlat16_5.wwww;
            vec3 txVec13 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_18 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_10.x = u_xlat16_6.y * u_xlat10_18;
            u_xlat16_10.x = u_xlat16_6.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec15 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_10.x = u_xlat16_6.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec16 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_10.x = u_xlat16_6.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec17 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_10.x = u_xlat16_7.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec18 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_10.x = u_xlat16_7.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec19 = vec3(u_xlat16_63.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_10.x = u_xlat16_7.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec20 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_10.x = u_xlat16_7.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec21 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_10.x = u_xlat16_17.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec22 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_10.x = u_xlat16_17.y * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec23 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_10.x = u_xlat16_17.z * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec24 = vec3(u_xlat16_67.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_10.x = u_xlat16_17.w * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec25 = vec3(u_xlat16_9.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_9.x = u_xlat16_4.x * u_xlat10_81 + u_xlat16_10.x;
            vec3 txVec26 = vec3(u_xlat16_9.zw,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_9.x = u_xlat16_4.y * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec27 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_9.x = u_xlat16_4.z * u_xlat10_81 + u_xlat16_9.x;
            vec3 txVec28 = vec3(u_xlat16_60.xy,u_xlat1.w);
            u_xlat10_81 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_34.x = u_xlat16_4.w * u_xlat10_81 + u_xlat16_9.x;
        }
    }
    u_xlat16_60.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_60.x + u_xlat16_8.x;
    u_xlat18.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vs_TEXCOORD2.xyz;
    u_xlat81 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat81 = sqrt(u_xlat81);
    u_xlat18.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat18.x = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat18.x;
    u_xlat81 = min(u_xlat81, 1.0);
    u_xlat18.x = (-u_xlat16_8.x) + 1.0;
    u_xlat18.x = (-u_xlat18.x) * _ShadowIntensity + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
    u_xlat44 = (-u_xlat81) + 1.0;
    u_xlat81 = u_xlat18.x * u_xlat44 + u_xlat81;
    u_xlat18.xyz = (-_Shadow_Color.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = vec3(u_xlat81) * u_xlat18.xyz + _Shadow_Color.xyz;
    u_xlat18.xyz = (-u_xlat18.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat18.xyz = (-u_xlat18.xyz) * u_xlat10_3.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_19.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat55.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_55 = texture2D(_Metal_Rough_Skin, u_xlat55.xy).z;
    u_xlatb81 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat81 = (u_xlatb81) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat81 = u_xlat81 + _ReplaceAmount;
    u_xlat81 = dot(vec2(u_xlat81), vec2(_Replace_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Fanwei);
    u_xlat55.x = u_xlat10_55 + u_xlat81;
    u_xlat81 = dot(u_xlat55.xx, vec2(_Replace_Color_Fanwei));
    u_xlat81 = u_xlat81 + (-_Replace_Color_Fanwei);
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
    u_xlatb55 = u_xlat55.x>=0.5;
    u_xlat55.x = u_xlatb55 ? 1.0 : float(0.0);
    u_xlat20.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat81 = (-u_xlat81) + 1.0;
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat10_21.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat21.xyz = (-u_xlat10_19.xyz) + u_xlat10_21.xyz;
    u_xlat19.xyz = u_xlat55.xxx * u_xlat21.xyz + u_xlat10_19.xyz;
    u_xlat21.xyz = u_xlat19.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat19.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat19.xyz = u_xlat19.xyz * u_xlat21.xyz;
    u_xlat81 = (-u_xlat54.x) + 1.0;
    u_xlat21.xyz = u_xlat19.xyz * vec3(u_xlat81);
    u_xlat96 = max(_FG_Intensity, 0.0);
    u_xlat22.xyz = vec3(u_xlat96) * _FG_Color.xyz;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat23.xyz = u_xlat22.xyz * u_xlat2.xxx + u_xlat28.xxx;
    u_xlat23.xyz = max(u_xlat23.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.x = dot(u_xlat22.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = u_xlat2.x * 3.1400001;
    u_xlat22.xyz = u_xlat23.xyz / u_xlat2.xxx;
    u_xlat22.xyz = u_xlat22.xyz + u_xlat22.xyz;
    u_xlat22.xyz = u_xlat28.xxx * vec3(0.5, 0.5, 0.5) + u_xlat22.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_2 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat10_28.x = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat10_23.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat23.xy = u_xlat10_23.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.xy = vec2(u_xlat10_2) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat23.xy = u_xlat23.xy * u_xlat16_8.xy;
    u_xlat23.xzw = u_xlat23.xxx * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat23.xzw, u_xlat23.xzw);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat23.xzw = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat24.xyz = u_xlat23.yyy * u_xlat0.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat24.xyz = u_xlat2.xxx * u_xlat24.xyz;
    u_xlat16_8.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat25.xyz = u_xlat16_8.xyz + _Light_Offset.xyz;
    u_xlat2.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat25.xyz = u_xlat2.xxx * u_xlat25.xyz;
    u_xlat16_8.x = dot(u_xlat23.xzw, u_xlat25.xyz);
    u_xlat16_34.x = (-u_xlat16_8.x) * u_xlat16_8.x + 1.0;
    u_xlat16_8.x = u_xlat16_8.x + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_60.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_60.x;
    u_xlat16_60.x = dot(u_xlat24.xyz, u_xlat25.xyz);
    u_xlat16_34.z = (-u_xlat16_60.x) * u_xlat16_60.x + 1.0;
    u_xlat16_34.xz = sqrt(u_xlat16_34.xz);
    u_xlat16_60.x = u_xlat16_60.x + 1.0;
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_60.x * -2.0 + 3.0;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_60.x * u_xlat16_9.x;
    u_xlat16_34.x = log2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_8.x = u_xlat16_34.x * u_xlat16_8.x;
    u_xlat16_34.x = log2(u_xlat16_34.z);
    u_xlat16_34.x = u_xlat16_34.x * _SpecularMultiplier2;
    u_xlat16_34.x = exp2(u_xlat16_34.x);
    u_xlat16_34.x = u_xlat16_34.x * u_xlat16_60.x;
    u_xlat16_34.xyz = u_xlat16_34.xxx * _SpecularColor2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xxx * _SpecularColor.xyz + u_xlat16_34.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_8.xyz = u_xlat10_28.xxx * u_xlat16_8.xyz;
    u_xlat23.xyz = vec3(u_xlat81) * _Ambient_Color.xyz;
    u_xlat19.xyz = u_xlat19.xyz * u_xlat23.xyz;
    u_xlat19.xyz = vec3(u_xlat3) * u_xlat19.xyz;
    u_xlat2.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat23.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat23.xyz);
    u_xlat23.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat23.xzw = u_xlat10_1.xyz * u_xlat23.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat23.xzw = u_xlat10_1.xyz * u_xlat23.xzw;
    u_xlat23.xzw = u_xlat10_1.www * u_xlat23.xzw;
    u_xlat23.xzw = vec3(u_xlat3) * u_xlat23.xzw;
    u_xlat2.x = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat23.xyz = u_xlat2.xxx * u_xlat23.xzw;
    u_xlat2.x = (-u_xlat54.y) + u_xlat54.x;
    u_xlat2.x = u_xlat2.x + 1.0;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat28.x = (-u_xlat78) + 1.0;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat28.x = u_xlat28.x * u_xlat28.x;
    u_xlat2.x = u_xlat2.x * u_xlat28.x;
    u_xlat28.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat28.xy = u_xlat28.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat28.xy);
    u_xlat10_28.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat78 = log2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Fresnel;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = u_xlat78 * _LG_Intensity;
    u_xlat78 = u_xlat10_1.w * u_xlat78;
    u_xlat28.xyz = u_xlat10_28.xyz * vec3(u_xlat78);
    u_xlat28.xyz = u_xlat10_1.xyz * u_xlat28.xyz;
    u_xlat24.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat24.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat24.z = vs_TEXCOORD7.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat24.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Fw;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sanshe_Power;
    u_xlat0.xyz = u_xlat0.xxx * _Sanshe_color.xyz;
    u_xlat21.xyz = u_xlat21.xyz * u_xlat22.xyz + u_xlat16_8.xyz;
    u_xlat19.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz + u_xlat19.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat23.xyz;
    u_xlat19.xyz = u_xlat21.xyz * vec3(_Cube_Intensity) + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_3.yyy + u_xlat19.xyz;
    u_xlat0.xyz = u_xlat28.xyz * _LG_Color.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat20.xyz * u_xlat55.xxx + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xyz;
    u_xlat16_8.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_8.xyz);
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
Local Keywords { "_EMISSION_ON" }
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(7) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
vec2 u_xlat15;
mediump vec2 u_xlat16_15;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat23;
float u_xlat24;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + _Light_Offset.xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_22 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_0.xy = vec2(u_xlat16_22) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat16_2.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat16_0.xy * u_xlat2.xy;
    u_xlat16_3.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat22 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat9.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_7 = (-u_xlat16_0.x) * u_xlat16_0.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_7 = sqrt(u_xlat16_7);
    u_xlat16_7 = log2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _SpecularMultiplier2;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_14 = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_14;
    u_xlat16_0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat16_0.xyz = u_xlat16_0.xxx * _SpecularColor2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = u_xlat16_21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpecularMultiplier;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_12 = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_12;
    u_xlat16_21 = u_xlat16_5.x * u_xlat16_21;
    u_xlat16_0.xyz = vec3(u_xlat16_21) * _SpecularColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_1 = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat1.x = (u_xlatb1) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat1.x = u_xlat1.x + _ReplaceAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Fanwei);
    u_xlat8.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_8 = texture(_Metal_Rough_Skin, u_xlat8.xy).z;
    u_xlat1.x = u_xlat16_8 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=0.5);
#else
    u_xlatb8 = u_xlat1.x>=0.5;
#endif
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Color_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16_2.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat16_15.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat15.xy = u_xlat16_15.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat23 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = (-u_xlat15.y) + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 1.0;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat22 = max(_FG_Intensity, 0.0);
    u_xlat6.xyz = vec3(u_xlat22) * _FG_Color.xyz;
    u_xlat22 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * 3.1400001;
    u_xlat23 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat24 = (-u_xlat23) + 1.0;
    u_xlat23 = u_xlat23 * 0.5 + 0.5;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat24) + vec3(u_xlat23);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat22);
    u_xlat6.xyz = u_xlat6.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat23) * vec3(0.5, 0.5, 0.5) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz + u_xlat16_0.xyz;
    u_xlat16_6.xy = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xy;
    u_xlat22 = (-u_xlat16_6.x) + 1.0;
    u_xlat22 = u_xlat22 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat23 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = texture(_Cubemap, u_xlat4.xyz);
    u_xlat23 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat23 = (-u_xlat22) + 1.0;
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Fresnel;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Intensity;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat15.x = u_xlat15.x * u_xlat23;
    u_xlat4.xyz = u_xlat15.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(_Cube_Intensity) + u_xlat2.xyz;
    u_xlat4.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat4.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat15.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Fw;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Power;
    u_xlat3.xyz = u_xlat15.xxx * _Sanshe_color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_6.yyy + u_xlat2.xyz;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat15.x = u_xlat16_0.w * u_xlat22;
    u_xlat16_3.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat1.xzw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat22)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_EMISSION_ON" }
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
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
#endif
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ReplaceTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairMap;
UNITY_LOCATION(7) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform mediump sampler2D _EmissionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
vec2 u_xlat15;
mediump vec2 u_xlat16_15;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat23;
float u_xlat24;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + _Light_Offset.xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_22 = texture(_MaskTex, u_xlat2.xy).y;
    u_xlat16_0.xy = vec2(u_xlat16_22) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat16_2.xy = texture(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat16_0.xy * u_xlat2.xy;
    u_xlat16_3.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat22 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat9.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_7 = (-u_xlat16_0.x) * u_xlat16_0.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_7 = sqrt(u_xlat16_7);
    u_xlat16_7 = log2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _SpecularMultiplier2;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_14 = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_14;
    u_xlat16_0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat16_0.xyz = u_xlat16_0.xxx * _SpecularColor2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = u_xlat16_21 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpecularMultiplier;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_12 = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_12;
    u_xlat16_21 = u_xlat16_5.x * u_xlat16_21;
    u_xlat16_0.xyz = vec3(u_xlat16_21) * _SpecularColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat16_1 = texture(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_1);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
#endif
    u_xlat1.x = (u_xlatb1) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat1.x = u_xlat1.x + _ReplaceAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Fanwei);
    u_xlat8.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat16_8 = texture(_Metal_Rough_Skin, u_xlat8.xy).z;
    u_xlat1.x = u_xlat16_8 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=0.5);
#else
    u_xlatb8 = u_xlat1.x>=0.5;
#endif
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Color_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16_2.xyz = texture(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_4.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat16_15.xy = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat15.xy = u_xlat16_15.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
    u_xlat23 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = (-u_xlat15.y) + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 1.0;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat22 = max(_FG_Intensity, 0.0);
    u_xlat6.xyz = vec3(u_xlat22) * _FG_Color.xyz;
    u_xlat22 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * 3.1400001;
    u_xlat23 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat24 = (-u_xlat23) + 1.0;
    u_xlat23 = u_xlat23 * 0.5 + 0.5;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat24) + vec3(u_xlat23);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat22);
    u_xlat6.xyz = u_xlat6.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat23) * vec3(0.5, 0.5, 0.5) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz + u_xlat16_0.xyz;
    u_xlat16_6.xy = texture(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xy;
    u_xlat22 = (-u_xlat16_6.x) + 1.0;
    u_xlat22 = u_xlat22 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat23 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = texture(_Cubemap, u_xlat4.xyz);
    u_xlat23 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat16_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat23 = (-u_xlat22) + 1.0;
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Fresnel;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Intensity;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat15.x = u_xlat15.x * u_xlat23;
    u_xlat4.xyz = u_xlat15.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(_Cube_Intensity) + u_xlat2.xyz;
    u_xlat4.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat4.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat15.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Fw;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Power;
    u_xlat3.xyz = u_xlat15.xxx * _Sanshe_color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat16_6.yyy + u_xlat2.xyz;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy);
    u_xlat15.x = u_xlat16_0.w * u_xlat22;
    u_xlat16_3.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat1.xzw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat16_2.xyz = texture(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat22)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec2 u_xlat10_6;
mediump float u_xlat16_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
vec2 u_xlat15;
lowp vec2 u_xlat10_15;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
float u_xlat23;
float u_xlat24;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + _Light_Offset.xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_22 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat16_0.xy = vec2(u_xlat10_22) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat10_2.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat16_0.xy * u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat22 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat9.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_7 = (-u_xlat16_0.x) * u_xlat16_0.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_7 = sqrt(u_xlat16_7);
    u_xlat16_7 = log2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _SpecularMultiplier2;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_14 = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_14;
    u_xlat16_0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat16_0.xyz = u_xlat16_0.xxx * _SpecularColor2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = u_xlat16_21 + 1.0;
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpecularMultiplier;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_12 = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_12;
    u_xlat16_21 = u_xlat16_5.x * u_xlat16_21;
    u_xlat16_0.xyz = vec3(u_xlat16_21) * _SpecularColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat10_1 = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat10_1);
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat1.x = (u_xlatb1) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat1.x = u_xlat1.x + _ReplaceAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Fanwei);
    u_xlat8.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_8 = texture2D(_Metal_Rough_Skin, u_xlat8.xy).z;
    u_xlat1.x = u_xlat10_8 + u_xlat1.x;
    u_xlatb8 = u_xlat1.x>=0.5;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Color_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Color_Fanwei);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat10_2.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + (-u_xlat10_4.xyz);
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_4.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat10_15.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat15.xy = u_xlat10_15.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat23 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = (-u_xlat15.y) + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 1.0;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat22 = max(_FG_Intensity, 0.0);
    u_xlat6.xyz = vec3(u_xlat22) * _FG_Color.xyz;
    u_xlat22 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * 3.1400001;
    u_xlat23 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat24 = (-u_xlat23) + 1.0;
    u_xlat23 = u_xlat23 * 0.5 + 0.5;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat24) + vec3(u_xlat23);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat22);
    u_xlat6.xyz = u_xlat6.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat23) * vec3(0.5, 0.5, 0.5) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz + u_xlat16_0.xyz;
    u_xlat10_6.xy = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xy;
    u_xlat22 = (-u_xlat10_6.x) + 1.0;
    u_xlat22 = u_xlat22 * _AO_Intensity;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat23 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCube(_Cubemap, u_xlat4.xyz);
    u_xlat23 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat23 = (-u_xlat22) + 1.0;
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Fresnel;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Intensity;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat15.x = u_xlat15.x * u_xlat23;
    u_xlat4.xyz = u_xlat15.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(_Cube_Intensity) + u_xlat2.xyz;
    u_xlat4.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat4.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat15.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Fw;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Power;
    u_xlat3.xyz = u_xlat15.xxx * _Sanshe_color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat10_6.yyy + u_xlat2.xyz;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat15.x = u_xlat10_0.w * u_xlat22;
    u_xlat10_3.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat10_3.xyz;
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat1.xzw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat22)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_EMISSION_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
uniform 	float _Replace_Use2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
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
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Use_2U);
    vs_TEXCOORD1.xy = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Use2U);
    vs_TEXCOORD1.zw = (bool(u_xlatb1)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	mediump float _SpecularMultiplier;
uniform 	mediump float _PrimaryShift;
uniform 	mediump float _Specular;
uniform 	mediump float _SecondaryShift;
uniform 	mediump float _SpecularMultiplier2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump vec4 _SpecularColor2;
uniform 	vec4 _MaskTex_ST;
uniform 	vec4 _FG_Color;
uniform 	float _FG_Intensity;
uniform 	vec4 _Light_Offset;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	float _LG_Fresnel;
uniform 	float _Replace_Dir;
uniform 	vec4 _Replace_Tiling_Offset;
uniform 	float _Replace_Fanwei;
uniform 	vec4 _Replace_Color;
uniform 	float _Replace_Color_Fanwei;
uniform 	float _Replace_Color_Power;
uniform 	float _ReplaceAmount;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ReplaceTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _HairMap;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec2 u_xlat10_6;
mediump float u_xlat16_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_12;
mediump float u_xlat16_14;
vec2 u_xlat15;
lowp vec2 u_xlat10_15;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
float u_xlat23;
float u_xlat24;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + _Light_Offset.xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_22 = texture2D(_MaskTex, u_xlat2.xy).y;
    u_xlat16_0.xy = vec2(u_xlat10_22) + vec2(_PrimaryShift, _SecondaryShift);
    u_xlat10_2.xy = texture2D(_HairMap, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat16_0.xy * u_xlat2.xy;
    u_xlat10_3.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_0.yyy * vs_TEXCOORD5.xyz;
    u_xlat3.xyz = u_xlat16_0.xxx * vs_TEXCOORD4.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_0.zzz * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat22 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.yyy * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat4.xyz = u_xlat2.xxx * u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat22 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat9.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_7 = (-u_xlat16_0.x) * u_xlat16_0.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_7 = sqrt(u_xlat16_7);
    u_xlat16_7 = log2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _SpecularMultiplier2;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_14 = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_14;
    u_xlat16_0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat16_0.xyz = u_xlat16_0.xxx * _SpecularColor2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = u_xlat16_21 + 1.0;
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpecularMultiplier;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_12 = u_xlat16_21 * -2.0 + 3.0;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_12;
    u_xlat16_21 = u_xlat16_5.x * u_xlat16_21;
    u_xlat16_0.xyz = vec3(u_xlat16_21) * _SpecularColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat10_1 = texture2D(_MaskTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat10_1);
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Replace_Dir);
    u_xlat1.x = (u_xlatb1) ? vs_TEXCOORD1.z : vs_TEXCOORD1.w;
    u_xlat1.x = u_xlat1.x + _ReplaceAmount;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Fanwei);
    u_xlat8.xy = vs_TEXCOORD1.zw * _Replace_Tiling_Offset.xy + _Replace_Tiling_Offset.zw;
    u_xlat10_8 = texture2D(_Metal_Rough_Skin, u_xlat8.xy).z;
    u_xlat1.x = u_xlat10_8 + u_xlat1.x;
    u_xlatb8 = u_xlat1.x>=0.5;
    u_xlat1.x = dot(u_xlat1.xx, vec2(_Replace_Color_Fanwei));
    u_xlat1.x = u_xlat1.x + (-_Replace_Color_Fanwei);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat10_2.xyz = texture2D(_ReplaceTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_4.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz + (-u_xlat10_4.xyz);
    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat10_4.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat2.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat4.xyz;
    u_xlat10_15.xy = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xy;
    u_xlat15.xy = u_xlat10_15.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlat23 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = (-u_xlat15.y) + u_xlat15.x;
    u_xlat15.x = u_xlat15.x + 1.0;
    u_xlat15.x = min(u_xlat15.x, 1.0);
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat23);
    u_xlat6.xyz = vec3(u_xlat23) * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat6.xyz;
    u_xlat22 = max(_FG_Intensity, 0.0);
    u_xlat6.xyz = vec3(u_xlat22) * _FG_Color.xyz;
    u_xlat22 = dot(u_xlat6.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = u_xlat22 * 3.1400001;
    u_xlat23 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat24 = (-u_xlat23) + 1.0;
    u_xlat23 = u_xlat23 * 0.5 + 0.5;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat24) + vec3(u_xlat23);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = u_xlat6.xyz / vec3(u_xlat22);
    u_xlat6.xyz = u_xlat6.xyz + u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat23) * vec3(0.5, 0.5, 0.5) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat6.xyz + u_xlat16_0.xyz;
    u_xlat10_6.xy = texture2D(_AO_Em_Sanshe, vs_TEXCOORD0.xy).xy;
    u_xlat22 = (-u_xlat10_6.x) + 1.0;
    u_xlat22 = u_xlat22 * _AO_Intensity;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = (-u_xlat22) + 1.0;
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz + u_xlat2.xyz;
    u_xlat23 = dot((-vs_TEXCOORD7.xyz), u_xlat3.xyz);
    u_xlat23 = u_xlat23 + u_xlat23;
    u_xlat4.xyz = u_xlat3.xyz * (-vec3(u_xlat23)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCube(_Cubemap, u_xlat4.xyz);
    u_xlat23 = u_xlat4.y * 0.200000003 + 0.800000012;
    u_xlat4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat10_0.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_0.www * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat3.xyz, vs_TEXCOORD7.xyz);
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat23 = (-u_xlat22) + 1.0;
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Fresnel;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * _LG_Intensity;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat23 = u_xlat23 * u_xlat23;
    u_xlat15.x = u_xlat15.x * u_xlat23;
    u_xlat4.xyz = u_xlat15.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat4.xyz * vec3(_Cube_Intensity) + u_xlat2.xyz;
    u_xlat4.x = vs_TEXCOORD7.x + _Sanshe_X;
    u_xlat4.y = vs_TEXCOORD7.y + _Sanshe_Y;
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat15.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = (-u_xlat15.x) + 1.0;
    u_xlat15.x = max(u_xlat15.x, 0.0);
    u_xlat15.x = log2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Fw;
    u_xlat15.x = exp2(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _Sanshe_Power;
    u_xlat3.xyz = u_xlat15.xxx * _Sanshe_color.xyz;
    u_xlat2.xyz = u_xlat3.xyz * u_xlat10_6.yyy + u_xlat2.xyz;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD1.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy);
    u_xlat15.x = u_xlat10_0.w * u_xlat22;
    u_xlat10_3.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat10_3.xyz;
    u_xlat3.xyz = u_xlat10_0.xyz * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat3.xyz * _LG_Color.xyz + u_xlat2.xyz;
    u_xlat3.xyz = _Replace_Color.www * _Replace_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Replace_Color_Power, _Replace_Color_Power, _Replace_Color_Power));
    u_xlat1.xzw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat10_2.xyz = texture2D(_EmissionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat10_2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat3.xyz;
    u_xlat22 = max(_Em_Intensity, 0.0);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat22);
    u_xlat22 = _Time.y * _Em_Speed;
    u_xlat22 = sin(u_xlat22);
    u_xlat2.xyz = (-u_xlat2.xyz) * abs(vec3(u_xlat22)) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
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
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
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
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
Local Keywords { "_EMISSION_ON" }
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
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
Local Keywords { "_EMISSION_ON" }
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
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_EMISSION_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
Local Keywords { "_EMISSION_ON" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 127834
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