//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PBR/Hero_Pbr_Show2.0_Vertex&Dissolve" {
Properties {

_Intensity ("整体强度", Float) = 1.0

_Shadow_Color ("接收投影颜色", Color) = (0,0,0,1)

_DirectionalLight_Color ("平行光颜色", Color) = (1,1,1,1)

_Ambient_Color ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("法线贴图", 2D) = "bump" { }

_AO_Em_Sanshe ("R:AO G:补光 B:接受投影", 2D) = "white" { }

_AO_Intensity ("AO强度", Float) = 1.0

_Metal_Rough_Skin ("R:金属度 G:粗糙度 B:3S", 2D) = "white" { }

_Metal_Intensity ("金属度强度", Float) = 1.0

_Rough_Intensity ("粗糙度强度", Float) = 1.0

_Skin_Intensity ("3S强度", Float) = 1.0

_LutTex ("LutTex", 2D) = "white" { }

_Anti3S_Color ("3S补光颜色", Color) = (0,0,0,1)

_Anti3S_Power ("3S补光范围", Float) = 1.0

_Anti3S_Intensity ("3S补光强度", Float) = 1.0

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

[Space(10)] [Header(Mask)] _LG_EM_DS_Mask ("[遮罩] R:流光 G:自发光 B:溶解", 2D) = "black" { }

_SPLG_Mask ("特殊流光遮罩(RGB色)", 2D) = "white" { }

[Header(LiuGuang)] [Toggle] _LG_Use_2U ("流光/特殊流光使用2U", Float) = 1.0

_LG_Tex ("R:流光纹理 G:特殊流光纹理 B:特殊流光扫光", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 0.0

_LG_Tiling_Speed ("XY:流光Tiling ZW:流光流速", Vector) = (1,1,0,0)

_SPLG_Color ("特殊流光颜色", Color) = (1,1,1,1)

_SPLG_Intensity ("特殊流光强度", Float) = 0.0

_SPLG_Tiling_Speed ("XY:特殊流光Tiling ZW:特殊流光流速", Vector) = (1,1,0,0)

_SPLG_Sweep_Tiling_Speed ("XY:扫光Tiling ZW:扫光流速", Vector) = (1,1,0,0)

_SPLG_Fresnel ("特殊流光菲涅尔遮罩范围", Range(0.001, 10)) = 0.0010000000474974513

[Header(Emission)] _Em_Intensity ("自发光强度", Float) = 1.0

_Em_Color ("自发光颜色", Color) = (1,1,1,1)

_Em_Speed ("自发光呼吸速度", Float) = 0.0

[Header(RongJie)] [Toggle] _Use_2U ("溶解/包裹使用2U", Float) = 1.0

[Enum(LeftRight,0,DownUp,1)] _Dissolve_Dir ("溶解/包裹UV方向", Float) = 0.0

_Rongjie_saoguang_liangbian ("R:溶解边缘纹理 G:扰动纹理 B:溶解拖尾", 2D) = "white" { }

_Rongjie_Tiling_Speed ("XY:溶解Tiling ZW:溶解流速", Vector) = (1,1,0,0)

_Noise_Tiling_Speed ("XY:扰动Tiling ZW:扰动流速", Vector) = (1,1,0,0)

_DissolveNoise_Intensity ("溶解扰动强度", Float) = 0.0

_DissolveColor ("拖尾颜色", Color) = (1,1,1,1)

_Rongjie_Fanwei ("边缘压缩", Float) = 4.0

_Rongjie_Color_Fanwei ("拖尾范围", Float) = 1.0

_DissolveColor_Power ("拖尾强度", Float) = 1.0

_ClipAmount ("溶解进度", Range(-2, 1)) = 1.0

_Vertex_Offset ("顶点偏移距离", Float) = 0.0

_Vertex_Fanwei ("顶点偏移边缘压缩", Float) = 4.0

[Space(10)] [Header(Shadow)] _Delta_ShadowCenter ("接收投影中心坐标偏移（默认模型中心点,w=-1取消遮罩）", Vector) = (0,0,0,0)

_ShadowIntensity ("接收投影强度", Range(0, 2)) = 1.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 13446
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
float u_xlat32;
mediump float u_xlat16_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_20.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat16_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat20) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(u_xlat37>=1.0);
#else
        u_xlatb53 = u_xlat37>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat37);
#else
        u_xlatb6.x = 0.0>=u_xlat37;
#endif
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat37<u_xlat23.x);
#else
                        u_xlatb23 = u_xlat37<u_xlat23.x;
#endif
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat37<u_xlat5.x);
#else
                u_xlatb5 = u_xlat37<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb16 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb51 = _Skin_Intensity==0.0;
#endif
    u_xlat49 = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat16_32 = texture(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat16_32 * u_xlat16_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_49 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_51 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat16_49 + u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(u_xlat49>=1.04999995);
#else
    u_xlatb49 = u_xlat49>=1.04999995;
#endif
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat16_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
float u_xlat32;
mediump float u_xlat16_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_20.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat16_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat20) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(u_xlat37>=1.0);
#else
        u_xlatb53 = u_xlat37>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat37);
#else
        u_xlatb6.x = 0.0>=u_xlat37;
#endif
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat37<u_xlat23.x);
#else
                        u_xlatb23 = u_xlat37<u_xlat23.x;
#endif
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat37<u_xlat5.x);
#else
                u_xlatb5 = u_xlat37<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb16 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb51 = _Skin_Intensity==0.0;
#endif
    u_xlat49 = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat16_32 = texture(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat16_32 * u_xlat16_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_49 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_51 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat16_49 + u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(u_xlat49>=1.04999995);
#else
    u_xlatb49 = u_xlat49>=1.04999995;
#endif
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat16_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
float u_xlat32;
lowp float u_xlat10_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
lowp float u_xlat10_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
lowp float u_xlat10_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_20.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_20.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat10_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
        u_xlatb53 = u_xlat37>=1.0;
        u_xlatb6.x = 0.0>=u_xlat37;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat37<u_xlat23.x;
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat37<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat9.x = (-u_xlat16) + 1.0;
    u_xlatb16 = u_xlat10_7.z>=0.100000001;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb51 = _Skin_Intensity==0.0;
    u_xlat49 = u_xlat49;
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat10_32 = texture2D(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat10_32 * u_xlat10_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_49 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_51 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat10_49 + u_xlat10_51;
    u_xlatb49 = u_xlat49>=1.04999995;
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat10_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
float u_xlat32;
lowp float u_xlat10_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
lowp float u_xlat10_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
lowp float u_xlat10_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_20.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_20.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat10_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
        u_xlatb53 = u_xlat37>=1.0;
        u_xlatb6.x = 0.0>=u_xlat37;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat37<u_xlat23.x;
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat37<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat9.x = (-u_xlat16) + 1.0;
    u_xlatb16 = u_xlat10_7.z>=0.100000001;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb51 = _Skin_Intensity==0.0;
    u_xlat49 = u_xlat49;
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat10_32 = texture2D(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat10_32 * u_xlat10_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_49 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_51 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat10_49 + u_xlat10_51;
    u_xlatb49 = u_xlat49>=1.04999995;
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat10_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
float u_xlat32;
mediump float u_xlat16_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_20.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat16_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat20) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(u_xlat37>=1.0);
#else
        u_xlatb53 = u_xlat37>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat37);
#else
        u_xlatb6.x = 0.0>=u_xlat37;
#endif
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat37<u_xlat23.x);
#else
                        u_xlatb23 = u_xlat37<u_xlat23.x;
#endif
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat37<u_xlat5.x);
#else
                u_xlatb5 = u_xlat37<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat21.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat21.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb16 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb51 = _Skin_Intensity==0.0;
#endif
    u_xlat49 = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat16_32 = texture(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat16_32 * u_xlat16_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_49 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_51 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat16_49 + u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(u_xlat49>=1.04999995);
#else
    u_xlatb49 = u_xlat49>=1.04999995;
#endif
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat16_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
float u_xlat32;
mediump float u_xlat16_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_20.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat16_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat20) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(u_xlat37>=1.0);
#else
        u_xlatb53 = u_xlat37>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat37);
#else
        u_xlatb6.x = 0.0>=u_xlat37;
#endif
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat37<u_xlat23.x);
#else
                        u_xlatb23 = u_xlat37<u_xlat23.x;
#endif
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat37<u_xlat5.x);
#else
                u_xlatb5 = u_xlat37<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat21.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat21.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb16 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb51 = _Skin_Intensity==0.0;
#endif
    u_xlat49 = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat16_32 = texture(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat16_32 * u_xlat16_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_49 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_51 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat16_49 + u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(u_xlat49>=1.04999995);
#else
    u_xlatb49 = u_xlat49>=1.04999995;
#endif
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat16_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
float u_xlat32;
lowp float u_xlat10_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
lowp float u_xlat10_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
lowp float u_xlat10_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_20.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_20.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat10_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
        u_xlatb53 = u_xlat37>=1.0;
        u_xlatb6.x = 0.0>=u_xlat37;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat37<u_xlat23.x;
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat37<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat21.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat21.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat9.x = (-u_xlat16) + 1.0;
    u_xlatb16 = u_xlat10_7.z>=0.100000001;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb51 = _Skin_Intensity==0.0;
    u_xlat49 = u_xlat49;
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat10_32 = texture2D(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat10_32 * u_xlat10_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_49 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_51 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat10_49 + u_xlat10_51;
    u_xlatb49 = u_xlat49>=1.04999995;
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat10_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
float u_xlat32;
lowp float u_xlat10_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
lowp float u_xlat10_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
lowp float u_xlat10_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_20.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_20.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat10_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
        u_xlatb53 = u_xlat37>=1.0;
        u_xlatb6.x = 0.0>=u_xlat37;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat37<u_xlat23.x;
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat37<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat21.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat21.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat9.x = (-u_xlat16) + 1.0;
    u_xlatb16 = u_xlat10_7.z>=0.100000001;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb51 = _Skin_Intensity==0.0;
    u_xlat49 = u_xlat49;
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat10_32 = texture2D(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat10_32 * u_xlat10_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_49 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_51 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat10_49 + u_xlat10_51;
    u_xlatb49 = u_xlat49>=1.04999995;
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat10_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "_SANSHE2" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
float u_xlat32;
mediump float u_xlat16_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_20.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat16_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat20) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(u_xlat37>=1.0);
#else
        u_xlatb53 = u_xlat37>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat37);
#else
        u_xlatb6.x = 0.0>=u_xlat37;
#endif
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat37<u_xlat23.x);
#else
                        u_xlatb23 = u_xlat37<u_xlat23.x;
#endif
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat37<u_xlat5.x);
#else
                u_xlatb5 = u_xlat37<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb16 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb51 = _Skin_Intensity==0.0;
#endif
    u_xlat49 = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat16_32 = texture(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat16_32 * u_xlat16_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_49 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_51 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat16_49 + u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(u_xlat49>=1.04999995);
#else
    u_xlatb49 = u_xlat49>=1.04999995;
#endif
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Fw;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat49) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat16_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "_SANSHE2" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
float u_xlat32;
mediump float u_xlat16_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_20.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat16_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat20) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(u_xlat37>=1.0);
#else
        u_xlatb53 = u_xlat37>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat37);
#else
        u_xlatb6.x = 0.0>=u_xlat37;
#endif
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat37<u_xlat23.x);
#else
                        u_xlatb23 = u_xlat37<u_xlat23.x;
#endif
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat37<u_xlat5.x);
#else
                u_xlatb5 = u_xlat37<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb16 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb51 = _Skin_Intensity==0.0;
#endif
    u_xlat49 = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat16_32 = texture(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat16_32 * u_xlat16_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_49 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_51 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat16_49 + u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(u_xlat49>=1.04999995);
#else
    u_xlatb49 = u_xlat49>=1.04999995;
#endif
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Fw;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat49) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat16_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
float u_xlat32;
lowp float u_xlat10_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
lowp float u_xlat10_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
lowp float u_xlat10_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_20.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_20.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat10_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
        u_xlatb53 = u_xlat37>=1.0;
        u_xlatb6.x = 0.0>=u_xlat37;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat37<u_xlat23.x;
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat37<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat9.x = (-u_xlat16) + 1.0;
    u_xlatb16 = u_xlat10_7.z>=0.100000001;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb51 = _Skin_Intensity==0.0;
    u_xlat49 = u_xlat49;
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat10_32 = texture2D(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat10_32 * u_xlat10_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_49 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_51 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat10_49 + u_xlat10_51;
    u_xlatb49 = u_xlat49>=1.04999995;
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Fw;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat49) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat10_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
float u_xlat32;
lowp float u_xlat10_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
lowp float u_xlat10_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
lowp float u_xlat10_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_20.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_20.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat10_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
        u_xlatb53 = u_xlat37>=1.0;
        u_xlatb6.x = 0.0>=u_xlat37;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat37<u_xlat23.x;
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat37<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat9.x = (-u_xlat16) + 1.0;
    u_xlatb16 = u_xlat10_7.z>=0.100000001;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb51 = _Skin_Intensity==0.0;
    u_xlat49 = u_xlat49;
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat10_32 = texture2D(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat10_32 * u_xlat10_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_49 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_51 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat10_49 + u_xlat10_51;
    u_xlatb49 = u_xlat49>=1.04999995;
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Fw;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat49) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat10_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_SANSHE2" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
float u_xlat32;
mediump float u_xlat16_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_20.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat16_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat20) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(u_xlat37>=1.0);
#else
        u_xlatb53 = u_xlat37>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat37);
#else
        u_xlatb6.x = 0.0>=u_xlat37;
#endif
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat37<u_xlat23.x);
#else
                        u_xlatb23 = u_xlat37<u_xlat23.x;
#endif
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat37<u_xlat5.x);
#else
                u_xlatb5 = u_xlat37<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat21.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat21.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb16 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb51 = _Skin_Intensity==0.0;
#endif
    u_xlat49 = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat16_32 = texture(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat16_32 * u_xlat16_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_49 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_51 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat16_49 + u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(u_xlat49>=1.04999995);
#else
    u_xlatb49 = u_xlat49>=1.04999995;
#endif
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Fw;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat49) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat16_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_SANSHE2" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
float u_xlat32;
mediump float u_xlat16_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_20.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_20.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat16_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat20) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb53 = !!(u_xlat37>=1.0);
#else
        u_xlatb53 = u_xlat37>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat37);
#else
        u_xlatb6.x = 0.0>=u_xlat37;
#endif
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat37<u_xlat23.x);
#else
                        u_xlatb23 = u_xlat37<u_xlat23.x;
#endif
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat37<u_xlat5.x);
#else
                u_xlatb5 = u_xlat37<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat21.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat21.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat16) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb16 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb51 = _Skin_Intensity==0.0;
#endif
    u_xlat49 = u_xlat49;
#ifdef UNITY_ADRENO_ES3
    u_xlat49 = min(max(u_xlat49, 0.0), 1.0);
#else
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat16_32 = texture(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat16_32 * u_xlat16_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_49 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_51 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat16_49 + u_xlat16_51;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(u_xlat49>=1.04999995);
#else
    u_xlatb49 = u_xlat49>=1.04999995;
#endif
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Fw;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat49) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat16_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
float u_xlat32;
lowp float u_xlat10_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
lowp float u_xlat10_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
lowp float u_xlat10_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_20.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_20.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat10_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
        u_xlatb53 = u_xlat37>=1.0;
        u_xlatb6.x = 0.0>=u_xlat37;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat37<u_xlat23.x;
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat37<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat21.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat21.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat9.x = (-u_xlat16) + 1.0;
    u_xlatb16 = u_xlat10_7.z>=0.100000001;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb51 = _Skin_Intensity==0.0;
    u_xlat49 = u_xlat49;
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat10_32 = texture2D(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat10_32 * u_xlat10_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_49 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_51 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat10_49 + u_xlat10_51;
    u_xlatb49 = u_xlat49>=1.04999995;
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Fw;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat49) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat10_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
mediump vec3 u_xlat16_15;
float u_xlat16;
bool u_xlatb16;
float u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
int u_xlati22;
vec2 u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
float u_xlat32;
lowp float u_xlat10_32;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
vec2 u_xlat39;
bool u_xlatb39;
float u_xlat48;
float u_xlat49;
lowp float u_xlat10_49;
bool u_xlatb49;
mediump float u_xlat16_50;
float u_xlat51;
lowp float u_xlat10_51;
bool u_xlatb51;
float u_xlat52;
float u_xlat53;
bool u_xlatb53;
int u_xlati54;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat32 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat3.xyz = vec3(u_xlat32) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat48 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat49 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_20.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_20.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_20.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat20 = (-u_xlat10_20.x) + 1.0;
    u_xlat20 = u_xlat20 * _AO_Intensity;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat37 = (-u_xlat5.z) + 1.0;
        u_xlatb53 = u_xlat37>=1.0;
        u_xlatb6.x = 0.0>=u_xlat37;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb53 = u_xlatb53 || u_xlatb6.x;
        u_xlatb53 = u_xlatb6.y || u_xlatb53;
        u_xlatb53 = u_xlatb6.z || u_xlatb53;
        if(u_xlatb53){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat38 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat23.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat23.xy, 0.0).x;
                        u_xlat23.x = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat37<u_xlat23.x;
                        u_xlat23.x = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat38 = u_xlat38 + u_xlat23.x;
                    }
                    u_xlat6.x = u_xlat38;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat37<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat21.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat21.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat21.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat21.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat21.x = (-u_xlat21.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat21.x * u_xlat21.y + u_xlat5.x;
    u_xlat21.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat21.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_20.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat16 = (u_xlatb16) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat16 = u_xlat16 + _ClipAmount;
    u_xlat16 = dot(vec2(u_xlat16), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16 = u_xlat16 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat16;
    u_xlat16 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat16 = u_xlat16 + (-_Rongjie_Color_Fanwei);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat9.x = (-u_xlat16) + 1.0;
    u_xlatb16 = u_xlat10_7.z>=0.100000001;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat16 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = max(u_xlat51, 0.100000001);
    u_xlat52 = u_xlat2.y * u_xlat2.y;
    u_xlat53 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat51 = u_xlat51 * u_xlat53;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat52 = u_xlat2.y * u_xlat52;
    u_xlat4.x = u_xlat4.x * u_xlat52 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat51 = u_xlat51 * u_xlat4.x;
    u_xlat51 = u_xlat52 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.25 + -9.99999975e-06;
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = min(u_xlat51, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat20) * u_xlat12.xyz;
    u_xlat51 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat51)) + (-vs_TEXCOORD6.xyz);
    u_xlat51 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat51);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat20) * u_xlat13.xzw;
    u_xlat51 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat51) * u_xlat4.xyw;
    u_xlat51 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat51 = u_xlat51 + 1.0;
    u_xlat51 = min(u_xlat51, 1.0);
    u_xlat53 = (-u_xlat48) + 1.0;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat53 = u_xlat53 * u_xlat53;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat51);
    u_xlat51 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat53) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat49 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb51 = _Skin_Intensity==0.0;
    u_xlat49 = u_xlat49;
    u_xlat49 = clamp(u_xlat49, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb51)) ? vec3(u_xlat49) : u_xlat13.xyz;
    u_xlat49 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat51 = max(u_xlat2.z, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Anti3S_Power;
    u_xlat51 = exp2(u_xlat51);
    u_xlat49 = u_xlat49 * u_xlat51;
    u_xlat14.xyz = vec3(u_xlat49) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat32) + vs_TEXCOORD6.xyz;
    u_xlat32 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat32 = max(u_xlat32, 0.0);
    u_xlat1.xyz = vec3(u_xlat32) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat39.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat39.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat39.xy;
    u_xlat10_32 = texture2D(_LG_Tex, u_xlat39.xy).x;
    u_xlat32 = u_xlat10_32 * u_xlat10_7.x;
    u_xlat32 = u_xlat32 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_49 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_51 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat49 = u_xlat10_49 + u_xlat10_51;
    u_xlatb49 = u_xlat49>=1.04999995;
    u_xlat49 = u_xlatb49 ? 1.0 : float(0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _SPLG_Fresnel;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * u_xlat49;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat48);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat48 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = (-u_xlat48) + 1.0;
    u_xlat48 = max(u_xlat48, 0.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Fw;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * _Sanshe_Power;
    u_xlat8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = log2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Fw;
    u_xlat49 = exp2(u_xlat49);
    u_xlat49 = u_xlat49 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat49) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat48) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat48 = max(_Em_Intensity, 0.0);
    u_xlat48 = u_xlat10_7.y * u_xlat48;
    u_xlat8.xyz = vec3(u_xlat48) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat48 = _Time.y * _Em_Speed;
    u_xlat48 = sin(u_xlat48);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat48)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_20.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat32) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat16) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_15.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_15.xyz);
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
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_21.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat16_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(u_xlat39>=1.0);
#else
        u_xlatb56 = u_xlat39>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat39);
#else
        u_xlatb6.x = 0.0>=u_xlat39;
#endif
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_24 = textureLod(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat16_24) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb24 = !!(u_xlat39<u_xlat24.x);
#else
                        u_xlatb24 = u_xlat39<u_xlat24.x;
#endif
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat39<u_xlat5.x);
#else
                u_xlatb5 = u_xlat39<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat17) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb17 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb54 = _Skin_Intensity==0.0;
#endif
    u_xlat52 = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat16_34 = texture(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_52 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_54 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat16_52 + u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat52>=1.04999995);
#else
    u_xlatb52 = u_xlat52>=1.04999995;
#endif
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat51 = (-_Sanshe_X) + 1.0;
    u_xlat52 = (-_Sanshe_Y) + 1.0;
    u_xlat51 = u_xlat51 * 3.1400001;
    u_xlat8.x = sin(u_xlat51);
    u_xlat13.x = cos(u_xlat51);
    u_xlat51 = u_xlat52 * 3.1400001;
    u_xlat14.x = sin(u_xlat51);
    u_xlat15 = cos(u_xlat51);
    u_xlat51 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat51 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat16_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_21.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat16_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(u_xlat39>=1.0);
#else
        u_xlatb56 = u_xlat39>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat39);
#else
        u_xlatb6.x = 0.0>=u_xlat39;
#endif
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_24 = textureLod(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat16_24) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb24 = !!(u_xlat39<u_xlat24.x);
#else
                        u_xlatb24 = u_xlat39<u_xlat24.x;
#endif
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat39<u_xlat5.x);
#else
                u_xlatb5 = u_xlat39<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat17) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb17 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb54 = _Skin_Intensity==0.0;
#endif
    u_xlat52 = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat16_34 = texture(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_52 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_54 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat16_52 + u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat52>=1.04999995);
#else
    u_xlatb52 = u_xlat52>=1.04999995;
#endif
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat51 = (-_Sanshe_X) + 1.0;
    u_xlat52 = (-_Sanshe_Y) + 1.0;
    u_xlat51 = u_xlat51 * 3.1400001;
    u_xlat8.x = sin(u_xlat51);
    u_xlat13.x = cos(u_xlat51);
    u_xlat51 = u_xlat52 * 3.1400001;
    u_xlat14.x = sin(u_xlat51);
    u_xlat15 = cos(u_xlat51);
    u_xlat51 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat51 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat16_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat34;
lowp float u_xlat10_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_21.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_21.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat10_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
        u_xlatb56 = u_xlat39>=1.0;
        u_xlatb6.x = 0.0>=u_xlat39;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_24 = texture2DLodEXT(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat10_24) + 1.0;
                        u_xlatb24 = u_xlat39<u_xlat24.x;
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat39<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat9.x = (-u_xlat17) + 1.0;
    u_xlatb17 = u_xlat10_7.z>=0.100000001;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb54 = _Skin_Intensity==0.0;
    u_xlat52 = u_xlat52;
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat10_34 = texture2D(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat10_34 * u_xlat10_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_54 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat10_52 + u_xlat10_54;
    u_xlatb52 = u_xlat52>=1.04999995;
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat51 = (-_Sanshe_X) + 1.0;
    u_xlat52 = (-_Sanshe_Y) + 1.0;
    u_xlat51 = u_xlat51 * 3.1400001;
    u_xlat8.x = sin(u_xlat51);
    u_xlat13.x = cos(u_xlat51);
    u_xlat51 = u_xlat52 * 3.1400001;
    u_xlat14.x = sin(u_xlat51);
    u_xlat15 = cos(u_xlat51);
    u_xlat51 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat51 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat10_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat34;
lowp float u_xlat10_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_21.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_21.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat10_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
        u_xlatb56 = u_xlat39>=1.0;
        u_xlatb6.x = 0.0>=u_xlat39;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_24 = texture2DLodEXT(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat10_24) + 1.0;
                        u_xlatb24 = u_xlat39<u_xlat24.x;
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat39<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat9.x = (-u_xlat17) + 1.0;
    u_xlatb17 = u_xlat10_7.z>=0.100000001;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb54 = _Skin_Intensity==0.0;
    u_xlat52 = u_xlat52;
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat10_34 = texture2D(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat10_34 * u_xlat10_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_54 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat10_52 + u_xlat10_54;
    u_xlatb52 = u_xlat52>=1.04999995;
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat51 = (-_Sanshe_X) + 1.0;
    u_xlat52 = (-_Sanshe_Y) + 1.0;
    u_xlat51 = u_xlat51 * 3.1400001;
    u_xlat8.x = sin(u_xlat51);
    u_xlat13.x = cos(u_xlat51);
    u_xlat51 = u_xlat52 * 3.1400001;
    u_xlat14.x = sin(u_xlat51);
    u_xlat15 = cos(u_xlat51);
    u_xlat51 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat51 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat10_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_21.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat16_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(u_xlat39>=1.0);
#else
        u_xlatb56 = u_xlat39>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat39);
#else
        u_xlatb6.x = 0.0>=u_xlat39;
#endif
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_24 = textureLod(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat16_24) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb24 = !!(u_xlat39<u_xlat24.x);
#else
                        u_xlatb24 = u_xlat39<u_xlat24.x;
#endif
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat39<u_xlat5.x);
#else
                u_xlatb5 = u_xlat39<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat22.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat22.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat17) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb17 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb54 = _Skin_Intensity==0.0;
#endif
    u_xlat52 = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat16_34 = texture(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_52 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_54 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat16_52 + u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat52>=1.04999995);
#else
    u_xlatb52 = u_xlat52>=1.04999995;
#endif
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat51 = (-_Sanshe_X) + 1.0;
    u_xlat52 = (-_Sanshe_Y) + 1.0;
    u_xlat51 = u_xlat51 * 3.1400001;
    u_xlat8.x = sin(u_xlat51);
    u_xlat13.x = cos(u_xlat51);
    u_xlat51 = u_xlat52 * 3.1400001;
    u_xlat14.x = sin(u_xlat51);
    u_xlat15 = cos(u_xlat51);
    u_xlat51 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat51 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat16_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_21.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat16_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(u_xlat39>=1.0);
#else
        u_xlatb56 = u_xlat39>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat39);
#else
        u_xlatb6.x = 0.0>=u_xlat39;
#endif
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_24 = textureLod(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat16_24) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb24 = !!(u_xlat39<u_xlat24.x);
#else
                        u_xlatb24 = u_xlat39<u_xlat24.x;
#endif
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat39<u_xlat5.x);
#else
                u_xlatb5 = u_xlat39<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat22.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat22.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat17) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb17 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb54 = _Skin_Intensity==0.0;
#endif
    u_xlat52 = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat16_34 = texture(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_52 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_54 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat16_52 + u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat52>=1.04999995);
#else
    u_xlatb52 = u_xlat52>=1.04999995;
#endif
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat51 = (-_Sanshe_X) + 1.0;
    u_xlat52 = (-_Sanshe_Y) + 1.0;
    u_xlat51 = u_xlat51 * 3.1400001;
    u_xlat8.x = sin(u_xlat51);
    u_xlat13.x = cos(u_xlat51);
    u_xlat51 = u_xlat52 * 3.1400001;
    u_xlat14.x = sin(u_xlat51);
    u_xlat15 = cos(u_xlat51);
    u_xlat51 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat51 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat16_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat34;
lowp float u_xlat10_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_21.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_21.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat10_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
        u_xlatb56 = u_xlat39>=1.0;
        u_xlatb6.x = 0.0>=u_xlat39;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_24 = texture2DLodEXT(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat10_24) + 1.0;
                        u_xlatb24 = u_xlat39<u_xlat24.x;
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat39<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat22.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat22.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat9.x = (-u_xlat17) + 1.0;
    u_xlatb17 = u_xlat10_7.z>=0.100000001;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb54 = _Skin_Intensity==0.0;
    u_xlat52 = u_xlat52;
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat10_34 = texture2D(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat10_34 * u_xlat10_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_54 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat10_52 + u_xlat10_54;
    u_xlatb52 = u_xlat52>=1.04999995;
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat51 = (-_Sanshe_X) + 1.0;
    u_xlat52 = (-_Sanshe_Y) + 1.0;
    u_xlat51 = u_xlat51 * 3.1400001;
    u_xlat8.x = sin(u_xlat51);
    u_xlat13.x = cos(u_xlat51);
    u_xlat51 = u_xlat52 * 3.1400001;
    u_xlat14.x = sin(u_xlat51);
    u_xlat15 = cos(u_xlat51);
    u_xlat51 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat51 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat10_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat34;
lowp float u_xlat10_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_21.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_21.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat10_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
        u_xlatb56 = u_xlat39>=1.0;
        u_xlatb6.x = 0.0>=u_xlat39;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_24 = texture2DLodEXT(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat10_24) + 1.0;
                        u_xlatb24 = u_xlat39<u_xlat24.x;
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat39<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat22.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat22.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat9.x = (-u_xlat17) + 1.0;
    u_xlatb17 = u_xlat10_7.z>=0.100000001;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb54 = _Skin_Intensity==0.0;
    u_xlat52 = u_xlat52;
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat10_34 = texture2D(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat10_34 * u_xlat10_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_54 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat10_52 + u_xlat10_54;
    u_xlatb52 = u_xlat52>=1.04999995;
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat51 = (-_Sanshe_X) + 1.0;
    u_xlat52 = (-_Sanshe_Y) + 1.0;
    u_xlat51 = u_xlat51 * 3.1400001;
    u_xlat8.x = sin(u_xlat51);
    u_xlat13.x = cos(u_xlat51);
    u_xlat51 = u_xlat52 * 3.1400001;
    u_xlat14.x = sin(u_xlat51);
    u_xlat15 = cos(u_xlat51);
    u_xlat51 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat51 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat10_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "_Directional_Sanshe" "_SANSHE2" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec4 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_21.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat16_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(u_xlat39>=1.0);
#else
        u_xlatb56 = u_xlat39>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat39);
#else
        u_xlatb6.x = 0.0>=u_xlat39;
#endif
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_24 = textureLod(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat16_24) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb24 = !!(u_xlat39<u_xlat24.x);
#else
                        u_xlatb24 = u_xlat39<u_xlat24.x;
#endif
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat39<u_xlat5.x);
#else
                u_xlatb5 = u_xlat39<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat17) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb17 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb54 = _Skin_Intensity==0.0;
#endif
    u_xlat52 = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat16_34 = texture(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_52 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_54 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat16_52 + u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat52>=1.04999995);
#else
    u_xlatb52 = u_xlat52>=1.04999995;
#endif
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat8.zw = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat8 = u_xlat8 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat13.x = sin(u_xlat8.x);
    u_xlat8.x = cos(u_xlat8.x);
    u_xlat14.x = sin(u_xlat8.z);
    u_xlat15 = cos(u_xlat8.z);
    u_xlat51 = u_xlat8.x + u_xlat15;
    u_xlat13.z = u_xlat51 * 0.5;
    u_xlat13.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat13.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat13.x = cos(u_xlat8.y);
    u_xlat8.x = sin(u_xlat8.y);
    u_xlat14.x = sin(u_xlat8.w);
    u_xlat15 = cos(u_xlat8.w);
    u_xlat52 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat52 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat52 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Fw;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat52) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat16_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "_Directional_Sanshe" "_SANSHE2" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec4 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_21.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat16_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(u_xlat39>=1.0);
#else
        u_xlatb56 = u_xlat39>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat39);
#else
        u_xlatb6.x = 0.0>=u_xlat39;
#endif
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_24 = textureLod(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat16_24) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb24 = !!(u_xlat39<u_xlat24.x);
#else
                        u_xlatb24 = u_xlat39<u_xlat24.x;
#endif
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat39<u_xlat5.x);
#else
                u_xlatb5 = u_xlat39<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat17) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb17 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb54 = _Skin_Intensity==0.0;
#endif
    u_xlat52 = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat16_34 = texture(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_52 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_54 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat16_52 + u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat52>=1.04999995);
#else
    u_xlatb52 = u_xlat52>=1.04999995;
#endif
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat8.zw = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat8 = u_xlat8 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat13.x = sin(u_xlat8.x);
    u_xlat8.x = cos(u_xlat8.x);
    u_xlat14.x = sin(u_xlat8.z);
    u_xlat15 = cos(u_xlat8.z);
    u_xlat51 = u_xlat8.x + u_xlat15;
    u_xlat13.z = u_xlat51 * 0.5;
    u_xlat13.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat13.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat13.x = cos(u_xlat8.y);
    u_xlat8.x = sin(u_xlat8.y);
    u_xlat14.x = sin(u_xlat8.w);
    u_xlat15 = cos(u_xlat8.w);
    u_xlat52 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat52 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat52 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Fw;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat52) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat16_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "_Directional_Sanshe" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec4 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat34;
lowp float u_xlat10_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_21.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_21.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat10_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
        u_xlatb56 = u_xlat39>=1.0;
        u_xlatb6.x = 0.0>=u_xlat39;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_24 = texture2DLodEXT(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat10_24) + 1.0;
                        u_xlatb24 = u_xlat39<u_xlat24.x;
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat39<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat9.x = (-u_xlat17) + 1.0;
    u_xlatb17 = u_xlat10_7.z>=0.100000001;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb54 = _Skin_Intensity==0.0;
    u_xlat52 = u_xlat52;
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat10_34 = texture2D(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat10_34 * u_xlat10_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_54 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat10_52 + u_xlat10_54;
    u_xlatb52 = u_xlat52>=1.04999995;
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat8.zw = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat8 = u_xlat8 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat13.x = sin(u_xlat8.x);
    u_xlat8.x = cos(u_xlat8.x);
    u_xlat14.x = sin(u_xlat8.z);
    u_xlat15 = cos(u_xlat8.z);
    u_xlat51 = u_xlat8.x + u_xlat15;
    u_xlat13.z = u_xlat51 * 0.5;
    u_xlat13.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat13.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat13.x = cos(u_xlat8.y);
    u_xlat8.x = sin(u_xlat8.y);
    u_xlat14.x = sin(u_xlat8.w);
    u_xlat15 = cos(u_xlat8.w);
    u_xlat52 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat52 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat52 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Fw;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat52) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat10_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "_Directional_Sanshe" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD6.xyz = u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec4 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat34;
lowp float u_xlat10_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_21.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_21.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat10_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
        u_xlatb56 = u_xlat39>=1.0;
        u_xlatb6.x = 0.0>=u_xlat39;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_24 = texture2DLodEXT(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat10_24) + 1.0;
                        u_xlatb24 = u_xlat39<u_xlat24.x;
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat39<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.w = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat9.x = (-u_xlat17) + 1.0;
    u_xlatb17 = u_xlat10_7.z>=0.100000001;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb54 = _Skin_Intensity==0.0;
    u_xlat52 = u_xlat52;
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat10_34 = texture2D(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat10_34 * u_xlat10_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_54 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat10_52 + u_xlat10_54;
    u_xlatb52 = u_xlat52>=1.04999995;
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat8.zw = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat8 = u_xlat8 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat13.x = sin(u_xlat8.x);
    u_xlat8.x = cos(u_xlat8.x);
    u_xlat14.x = sin(u_xlat8.z);
    u_xlat15 = cos(u_xlat8.z);
    u_xlat51 = u_xlat8.x + u_xlat15;
    u_xlat13.z = u_xlat51 * 0.5;
    u_xlat13.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat13.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat13.x = cos(u_xlat8.y);
    u_xlat8.x = sin(u_xlat8.y);
    u_xlat14.x = sin(u_xlat8.w);
    u_xlat15 = cos(u_xlat8.w);
    u_xlat52 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat52 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat52 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Fw;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat52) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat10_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" "_SANSHE2" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec4 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_21.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat16_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(u_xlat39>=1.0);
#else
        u_xlatb56 = u_xlat39>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat39);
#else
        u_xlatb6.x = 0.0>=u_xlat39;
#endif
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_24 = textureLod(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat16_24) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb24 = !!(u_xlat39<u_xlat24.x);
#else
                        u_xlatb24 = u_xlat39<u_xlat24.x;
#endif
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat39<u_xlat5.x);
#else
                u_xlatb5 = u_xlat39<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat22.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat22.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat17) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb17 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb54 = _Skin_Intensity==0.0;
#endif
    u_xlat52 = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat16_34 = texture(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_52 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_54 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat16_52 + u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat52>=1.04999995);
#else
    u_xlatb52 = u_xlat52>=1.04999995;
#endif
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat8.zw = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat8 = u_xlat8 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat13.x = sin(u_xlat8.x);
    u_xlat8.x = cos(u_xlat8.x);
    u_xlat14.x = sin(u_xlat8.z);
    u_xlat15 = cos(u_xlat8.z);
    u_xlat51 = u_xlat8.x + u_xlat15;
    u_xlat13.z = u_xlat51 * 0.5;
    u_xlat13.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat13.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat13.x = cos(u_xlat8.y);
    u_xlat8.x = sin(u_xlat8.y);
    u_xlat14.x = sin(u_xlat8.w);
    u_xlat15 = cos(u_xlat8.w);
    u_xlat52 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat52 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat52 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Fw;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat52) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat16_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" "_SANSHE2" }
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
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_EM_DS_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _SPLG_Mask;
UNITY_LOCATION(7) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(8) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(9) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec4 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat34;
mediump float u_xlat16_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
mediump float u_xlat16_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_21.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat16_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_21.xyz = texture(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat16_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(u_xlat39>=1.0);
#else
        u_xlatb56 = u_xlat39>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(0.0>=u_xlat39);
#else
        u_xlatb6.x = 0.0>=u_xlat39;
#endif
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb6.x = !!(0.0<_UsePCF);
#else
            u_xlatb6.x = 0.0<_UsePCF;
#endif
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_24 = textureLod(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat16_24) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb24 = !!(u_xlat39<u_xlat24.x);
#else
                        u_xlatb24 = u_xlat39<u_xlat24.x;
#endif
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat16_5 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat16_5) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb5 = !!(u_xlat39<u_xlat5.x);
#else
                u_xlatb5 = u_xlat39<u_xlat5.x;
#endif
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat22.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat22.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = texture(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = texture(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat9.x = (-u_xlat17) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_7.z>=0.100000001);
#else
    u_xlatb17 = u_xlat16_7.z>=0.100000001;
#endif
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat16_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat16_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat16_14 = textureLod(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat16_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat16_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat16_14.xyz;
    u_xlat13.xzw = u_xlat16_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture(_LutTex, u_xlat2.zw).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb54 = _Skin_Intensity==0.0;
#endif
    u_xlat52 = u_xlat52;
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat16_34 = texture(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat16_34 * u_xlat16_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_52 = texture(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat16_54 = texture(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat16_52 + u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(u_xlat52>=1.04999995);
#else
    u_xlatb52 = u_xlat52>=1.04999995;
#endif
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat8.zw = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat8 = u_xlat8 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat13.x = sin(u_xlat8.x);
    u_xlat8.x = cos(u_xlat8.x);
    u_xlat14.x = sin(u_xlat8.z);
    u_xlat15 = cos(u_xlat8.z);
    u_xlat51 = u_xlat8.x + u_xlat15;
    u_xlat13.z = u_xlat51 * 0.5;
    u_xlat13.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat13.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat13.x = cos(u_xlat8.y);
    u_xlat8.x = sin(u_xlat8.y);
    u_xlat14.x = sin(u_xlat8.w);
    u_xlat15 = cos(u_xlat8.w);
    u_xlat52 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat52 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat52 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Fw;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat52) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat16_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat16_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec4 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat34;
lowp float u_xlat10_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_21.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_21.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat10_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
        u_xlatb56 = u_xlat39>=1.0;
        u_xlatb6.x = 0.0>=u_xlat39;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_24 = texture2DLodEXT(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat10_24) + 1.0;
                        u_xlatb24 = u_xlat39<u_xlat24.x;
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat39<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat22.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat22.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat9.x = (-u_xlat17) + 1.0;
    u_xlatb17 = u_xlat10_7.z>=0.100000001;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb54 = _Skin_Intensity==0.0;
    u_xlat52 = u_xlat52;
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat10_34 = texture2D(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat10_34 * u_xlat10_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_54 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat10_52 + u_xlat10_54;
    u_xlatb52 = u_xlat52>=1.04999995;
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat8.zw = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat8 = u_xlat8 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat13.x = sin(u_xlat8.x);
    u_xlat8.x = cos(u_xlat8.x);
    u_xlat14.x = sin(u_xlat8.z);
    u_xlat15 = cos(u_xlat8.z);
    u_xlat51 = u_xlat8.x + u_xlat15;
    u_xlat13.z = u_xlat51 * 0.5;
    u_xlat13.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat13.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat13.x = cos(u_xlat8.y);
    u_xlat8.x = sin(u_xlat8.y);
    u_xlat14.x = sin(u_xlat8.w);
    u_xlat15 = cos(u_xlat8.w);
    u_xlat52 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat52 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat52 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Fw;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat52) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat10_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" "_SANSHE2" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LG_Use_2U;
uniform 	float _Use_2U;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Vertex_Offset;
uniform 	float _Vertex_Fanwei;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (-in_TEXCOORD0.xyxy) + in_TEXCOORD1.xyxy;
    u_xlat4.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat1.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = vec2(vec2(_LG_Use_2U, _LG_Use_2U)) * u_xlat1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = (u_xlatb0) ? u_xlat4.y : u_xlat4.x;
    vs_TEXCOORD7.xy = u_xlat4.xy;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = u_xlat0.x + 0.100000001;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Vertex_Fanwei, _Vertex_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Vertex_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4.xyz = in_NORMAL0.xyz * vec3(vec3(_Vertex_Offset, _Vertex_Offset, _Vertex_Offset));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Em_Intensity;
uniform 	vec3 _Em_Color;
uniform 	float _Em_Speed;
uniform 	vec4 _Shadow_Color;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Skin_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe2_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Sanshe2_color;
uniform 	vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	float _Anti3S_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe2_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe2_X;
uniform 	float _Sanshe_Y;
uniform 	float _Sanshe2_Y;
uniform 	float _Dissolve_Dir;
uniform 	vec4 _LG_Tiling_Speed;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	vec4 _SPLG_Color;
uniform 	float _SPLG_Intensity;
uniform 	vec4 _SPLG_Tiling_Speed;
uniform 	vec4 _SPLG_Sweep_Tiling_Speed;
uniform 	float _SPLG_Fresnel;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LG_EM_DS_Mask;
uniform lowp sampler2D _SPLG_Mask;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _LG_Tex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec3 u_xlatb6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec4 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec4 u_xlat13;
vec3 u_xlat14;
lowp vec4 u_xlat10_14;
float u_xlat15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
int u_xlati23;
vec2 u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat34;
lowp float u_xlat10_34;
float u_xlat39;
float u_xlat40;
bool u_xlatb40;
vec2 u_xlat41;
bool u_xlatb41;
float u_xlat51;
float u_xlat52;
lowp float u_xlat10_52;
bool u_xlatb52;
mediump float u_xlat16_53;
float u_xlat54;
lowp float u_xlat10_54;
bool u_xlatb54;
float u_xlat55;
float u_xlat56;
bool u_xlatb56;
int u_xlati57;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat34 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD5.xyz + vs_TEXCOORD6.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat51 = dot(u_xlat3.xyz, vs_TEXCOORD6.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat52 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = dot(u_xlat16_2.xyz, vs_TEXCOORD5.xyz);
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat10_21.xyz = texture2D(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat2.xyw = u_xlat10_21.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_21.xyz = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xyz;
    u_xlat21 = (-u_xlat10_21.x) + 1.0;
    u_xlat21 = u_xlat21 * _AO_Intensity;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlatb5 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb5){
        u_xlat5 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat5;
        u_xlat5 = u_xlat5 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat39 = (-u_xlat5.z) + 1.0;
        u_xlatb56 = u_xlat39>=1.0;
        u_xlatb6.x = 0.0>=u_xlat39;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xy = lessThan(u_xlat5.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb6.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat5.xxyx).xz;
        u_xlatb56 = u_xlatb56 || u_xlatb6.x;
        u_xlatb56 = u_xlatb6.y || u_xlatb56;
        u_xlatb56 = u_xlatb6.z || u_xlatb56;
        if(u_xlatb56){
            u_xlat5.w = 1.0;
        } else {
            u_xlatb6.x = 0.0<_UsePCF;
            if(u_xlatb6.x){
                u_xlat6.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat7.x = float(u_xlati_loop_1);
                    u_xlat40 = u_xlat6.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat7.y = float(u_xlati_loop_2);
                        u_xlat24.xy = u_xlat7.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_24 = texture2DLodEXT(_CustomShadowTex, u_xlat24.xy, 0.0).x;
                        u_xlat24.x = (-u_xlat10_24) + 1.0;
                        u_xlatb24 = u_xlat39<u_xlat24.x;
                        u_xlat24.x = (u_xlatb24) ? _CustomShadowStrength : 1.0;
                        u_xlat40 = u_xlat40 + u_xlat24.x;
                    }
                    u_xlat6.x = u_xlat40;
                }
                u_xlat5.w = u_xlat6.x * 0.111111112;
            } else {
                u_xlat10_5 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat5.x = (-u_xlat10_5) + 1.0;
                u_xlatb5 = u_xlat39<u_xlat5.x;
                u_xlat5.w = (u_xlatb5) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat6.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat7.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat7.xy,u_xlat7.z);
        u_xlat6.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat6.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat5.x = dot(u_xlat6, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat22.x = (-_LightShadowData.x) + 1.0;
        u_xlat5.w = u_xlat5.x * u_xlat22.x + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD1.xyz;
    u_xlat5.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat22.x = _Delta_ShadowCenter.w + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat22.xy = (-u_xlat5.wx) + vec2(1.0, 1.0);
    u_xlat22.x = (-u_xlat22.x) * _ShadowIntensity + 1.0;
    u_xlat5.x = u_xlat22.x * u_xlat22.y + u_xlat5.x;
    u_xlat22.xyz = u_xlat2.www * _Shadow_Color.xyz;
    u_xlat6.xyz = (-u_xlat2.www) * _Shadow_Color.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * u_xlat6.xyz + u_xlat22.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat10_21.zzz + vec3(1.0, 1.0, 1.0);
    u_xlat10_6.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_7.xyz = texture2D(_LG_EM_DS_Mask, u_xlat0.xy).xyz;
    u_xlat10_8.xyz = texture2D(_SPLG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD7.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat17 = (u_xlatb17) ? vs_TEXCOORD7.y : vs_TEXCOORD7.x;
    u_xlat17 = u_xlat17 + _ClipAmount;
    u_xlat17 = dot(vec2(u_xlat17), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat17 = u_xlat17 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat17;
    u_xlat17 = dot(u_xlat0.xx, vec2(_Rongjie_Color_Fanwei));
    u_xlat17 = u_xlat17 + (-_Rongjie_Color_Fanwei);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat9.x = (-u_xlat17) + 1.0;
    u_xlatb17 = u_xlat10_7.z>=0.100000001;
    u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = u_xlat17 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat10.xyz = u_xlat10.xyz * vec3(_DissolveColor_Power);
    u_xlat10.xyz = u_xlat9.xxx * u_xlat10.xyz;
    u_xlat9.y = 0.0;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat9.xy).z;
    u_xlat9.xyz = vec3(u_xlat10_0) * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat11.xyz = u_xlat10_6.xyz * u_xlat10.xyz;
    u_xlat0.x = (-u_xlat2.x) + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = max(u_xlat54, 0.100000001);
    u_xlat55 = u_xlat2.y * u_xlat2.y;
    u_xlat56 = u_xlat2.y * u_xlat2.y + 0.5;
    u_xlat54 = u_xlat54 * u_xlat56;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat55 = u_xlat2.y * u_xlat55;
    u_xlat4.x = u_xlat4.x * u_xlat55 + (-u_xlat4.x);
    u_xlat4.x = u_xlat4.x + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat54 = u_xlat54 * u_xlat4.x;
    u_xlat54 = u_xlat55 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.25 + -9.99999975e-06;
    u_xlat54 = max(u_xlat54, 0.0);
    u_xlat54 = min(u_xlat54, 20.0);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat10.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat12.xyz = u_xlat0.xxx * _Ambient_Color.xyz;
    u_xlat12.xyz = u_xlat11.xyz * u_xlat12.xyz;
    u_xlat12.xyz = vec3(u_xlat21) * u_xlat12.xyz;
    u_xlat54 = dot((-vs_TEXCOORD6.xyz), u_xlat3.xyz);
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat13.xyz = u_xlat3.xyz * (-vec3(u_xlat54)) + (-vs_TEXCOORD6.xyz);
    u_xlat54 = u_xlat2.y * 8.0;
    u_xlat10_14 = textureCubeLodEXT(_Cubemap, u_xlat13.xyz, u_xlat54);
    u_xlat13.xzw = u_xlat10_14.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat13.xzw = u_xlat10_14.xyz * u_xlat13.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat13.xzw = u_xlat13.xzw * u_xlat10_14.xyz;
    u_xlat13.xzw = u_xlat10_14.www * u_xlat13.xzw;
    u_xlat4.xyw = vec3(u_xlat21) * u_xlat13.xzw;
    u_xlat54 = u_xlat13.y * 0.200000003 + 0.800000012;
    u_xlat4.xyw = vec3(u_xlat54) * u_xlat4.xyw;
    u_xlat54 = (-u_xlat2.y) + u_xlat2.x;
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = min(u_xlat54, 1.0);
    u_xlat56 = (-u_xlat51) + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat13.xyz = (-u_xlat6.xyz) + vec3(u_xlat54);
    u_xlat54 = (-u_xlat2.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat54) * u_xlat6.xyz;
    u_xlat6.xyz = vec3(u_xlat56) * u_xlat13.xyz + u_xlat6.xyz;
    u_xlat2.z = u_xlat52 * 0.5 + 0.5;
    u_xlat13.xyz = texture2D(_LutTex, u_xlat2.zw).xyz;
    u_xlatb54 = _Skin_Intensity==0.0;
    u_xlat52 = u_xlat52;
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb54)) ? vec3(u_xlat52) : u_xlat13.xyz;
    u_xlat52 = u_xlat2.w * _Anti3S_Intensity;
    u_xlat54 = max(u_xlat2.z, 0.0);
    u_xlat54 = (-u_xlat54) + 1.0;
    u_xlat54 = log2(u_xlat54);
    u_xlat54 = u_xlat54 * _Anti3S_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat52 = u_xlat52 * u_xlat54;
    u_xlat14.xyz = vec3(u_xlat52) * _Anti3S_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat34) + vs_TEXCOORD6.xyz;
    u_xlat34 = dot(vs_TEXCOORD5.xyz, u_xlat1.xyz);
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat1.xyz = vec3(u_xlat34) * u_xlat14.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat41.xy = _Time.yy * _LG_Tiling_Speed.zw;
    u_xlat41.xy = vs_TEXCOORD8.xy * _LG_Tiling_Speed.xy + u_xlat41.xy;
    u_xlat10_34 = texture2D(_LG_Tex, u_xlat41.xy).x;
    u_xlat34 = u_xlat10_34 * u_xlat10_7.x;
    u_xlat34 = u_xlat34 * _LG_Intensity;
    u_xlat7.xz = _Time.yy * _SPLG_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_52 = texture2D(_LG_Tex, u_xlat7.xz).y;
    u_xlat7.xz = _Time.yy * _SPLG_Sweep_Tiling_Speed.zw;
    u_xlat7.xz = vs_TEXCOORD8.xy * _SPLG_Sweep_Tiling_Speed.xy + u_xlat7.xz;
    u_xlat10_54 = texture2D(_LG_Tex, u_xlat7.xz).z;
    u_xlat52 = u_xlat10_52 + u_xlat10_54;
    u_xlatb52 = u_xlat52>=1.04999995;
    u_xlat52 = u_xlatb52 ? 1.0 : float(0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SPLG_Fresnel;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * u_xlat52;
    u_xlat7.xzw = u_xlat10_8.xyz * vec3(u_xlat51);
    u_xlat7.xzw = u_xlat7.xzw * vec3(_SPLG_Intensity);
    u_xlat7.xzw = u_xlat7.xzw * _SPLG_Color.xyz;
    u_xlat8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat8.zw = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat8 = u_xlat8 * vec4(3.1400001, 3.1400001, 3.1400001, 3.1400001);
    u_xlat13.x = sin(u_xlat8.x);
    u_xlat8.x = cos(u_xlat8.x);
    u_xlat14.x = sin(u_xlat8.z);
    u_xlat15 = cos(u_xlat8.z);
    u_xlat51 = u_xlat8.x + u_xlat15;
    u_xlat13.z = u_xlat51 * 0.5;
    u_xlat13.y = u_xlat14.x;
    u_xlat51 = dot(u_xlat13.xyz, u_xlat3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Fw;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _Sanshe_Power;
    u_xlat13.x = cos(u_xlat8.y);
    u_xlat8.x = sin(u_xlat8.y);
    u_xlat14.x = sin(u_xlat8.w);
    u_xlat15 = cos(u_xlat8.w);
    u_xlat52 = u_xlat13.x + u_xlat15;
    u_xlat8.z = u_xlat52 * 0.5;
    u_xlat8.y = u_xlat14.x;
    u_xlat52 = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat52 = log2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Fw;
    u_xlat52 = exp2(u_xlat52);
    u_xlat52 = u_xlat52 * _Sanshe2_Power;
    u_xlat3.xyz = vec3(u_xlat52) * _Sanshe2_color.xyz;
    u_xlat3.xyz = vec3(u_xlat51) * _Sanshe_color.xyz + u_xlat3.xyz;
    u_xlat51 = max(_Em_Intensity, 0.0);
    u_xlat51 = u_xlat10_7.y * u_xlat51;
    u_xlat8.xyz = vec3(u_xlat51) * _Em_Color.xyz;
    u_xlat8.xyz = u_xlat11.xyz * u_xlat8.xyz;
    u_xlat51 = _Time.y * _Em_Speed;
    u_xlat51 = sin(u_xlat51);
    u_xlat8.xyz = (-u_xlat8.xyz) * abs(vec3(u_xlat51)) + u_xlat8.xyz;
    u_xlat10.xyz = u_xlat0.xxx * u_xlat11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _DirectionalLight_Color.xyz;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat1.xyz + u_xlat12.xyz;
    u_xlat4.xyw = u_xlat4.xyw * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat4.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat10_21.yyy + u_xlat1.xyz;
    u_xlat0.xzw = vec3(u_xlat34) * _LG_Color.xyz + u_xlat7.xzw;
    u_xlat0.xyz = u_xlat9.xyz * vec3(u_xlat17) + u_xlat0.xzw;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat8.xyz;
    u_xlat16_16.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_16.xyz);
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
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
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
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_Directional_Sanshe" "_SANSHE2" }
""
}
}
}
 Pass {
 Name "SHADOW_CASTER"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 94831
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    u_xlat0.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat0.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Noise_Tiling_Speed;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
UNITY_LOCATION(0) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(1) uniform mediump sampler2D _LG_EM_DS_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
float u_xlat1;
bool u_xlatb1;
void main()
{
    u_xlat0.xy = _Time.yy * _Noise_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Noise_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlat0.x = u_xlat16_0 * _DissolveNoise_Intensity;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xx;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (u_xlatb1) ? vs_TEXCOORD1.y : vs_TEXCOORD1.x;
    u_xlat1 = u_xlat1 + _ClipAmount;
    u_xlat1 = dot(vec2(u_xlat1), vec2(_Rongjie_Fanwei));
    u_xlat1 = u_xlat1 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat1;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1 = texture(_LG_EM_DS_Mask, vs_TEXCOORD0.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=0.100000001);
#else
    u_xlatb1 = u_xlat1>=0.100000001;
#endif
    u_xlat1 = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    u_xlat0.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat0.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Noise_Tiling_Speed;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
UNITY_LOCATION(0) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(1) uniform mediump sampler2D _LG_EM_DS_Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
float u_xlat1;
bool u_xlatb1;
void main()
{
    u_xlat0.xy = _Time.yy * _Noise_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Noise_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlat0.x = u_xlat16_0 * _DissolveNoise_Intensity;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xx;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
#endif
    u_xlat1 = (u_xlatb1) ? vs_TEXCOORD1.y : vs_TEXCOORD1.x;
    u_xlat1 = u_xlat1 + _ClipAmount;
    u_xlat1 = dot(vec2(u_xlat1), vec2(_Rongjie_Fanwei));
    u_xlat1 = u_xlat1 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat16_0 + u_xlat1;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1 = texture(_LG_EM_DS_Mask, vs_TEXCOORD0.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=0.100000001);
#else
    u_xlatb1 = u_xlat1>=0.100000001;
#endif
    u_xlat1 = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    u_xlat0.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat0.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Noise_Tiling_Speed;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _LG_EM_DS_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
float u_xlat1;
bool u_xlatb1;
void main()
{
    u_xlat0.xy = _Time.yy * _Noise_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Noise_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlat0.x = u_xlat10_0 * _DissolveNoise_Intensity;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xx;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (u_xlatb1) ? vs_TEXCOORD1.y : vs_TEXCOORD1.x;
    u_xlat1 = u_xlat1 + _ClipAmount;
    u_xlat1 = dot(vec2(u_xlat1), vec2(_Rongjie_Fanwei));
    u_xlat1 = u_xlat1 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat1;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1 = texture2D(_LG_EM_DS_Mask, vs_TEXCOORD0.xy).z;
    u_xlatb1 = u_xlat1>=0.100000001;
    u_xlat1 = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    u_xlat0.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = vec2(vec2(_Use_2U, _Use_2U)) * u_xlat0.xy + in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Noise_Tiling_Speed;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _Dissolve_Dir;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _LG_EM_DS_Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
float u_xlat1;
bool u_xlatb1;
void main()
{
    u_xlat0.xy = _Time.yy * _Noise_Tiling_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Noise_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).y;
    u_xlat0.x = u_xlat10_0 * _DissolveNoise_Intensity;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xx;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_Dir);
    u_xlat1 = (u_xlatb1) ? vs_TEXCOORD1.y : vs_TEXCOORD1.x;
    u_xlat1 = u_xlat1 + _ClipAmount;
    u_xlat1 = dot(vec2(u_xlat1), vec2(_Rongjie_Fanwei));
    u_xlat1 = u_xlat1 + (-_Rongjie_Fanwei);
    u_xlat0.x = u_xlat10_0 + u_xlat1;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat1 = texture2D(_LG_EM_DS_Mask, vs_TEXCOORD0.xy).z;
    u_xlatb1 = u_xlat1>=0.100000001;
    u_xlat1 = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat1 * u_xlat0.x + 0.5;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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