//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PBR/Hero_Pbr_IceV2_Show" {
Properties {

[Toggle] _ShowShadow ("暂时显示阴影", Float) = 0.0

_AlbedoMap ("AlbedoMap", 2D) = "white" { }

_NormalMap ("Normalmap", 2D) = "bump" { }

[Toggle] _UseSpecularMap ("使用高光贴图，不用别勾", Float) = 0.0

_SpecularMap ("Specularmap", 2D) = "white" { }

_RfCapTex ("反射matcap贴图", 2D) = "white" { }

_CapTex ("高光matcap遮罩", 2D) = "white" { }

[Toggle] _UseAlbedoReplaceAlbedo2 ("使用Albedo作为内部细节,勾上就不用贴贴图了", Float) = 0.0

[Toggle] _AlbedoUseUV3 ("使用UV3作为内部细节贴图", Float) = 0.0

_Albedo2Map ("内部细节", 2D) = "white" { }

_BaseColor ("BaseColor", Color) = (1.36263,1.26838,1.5,1)

_BaseColor2 ("BaseColor2", Color) = (1.16471,1.16471,1.16471,1)

_RfColor ("RfColor", Color) = (1,1,1,1)

_SpColor ("SpColor", Color) = (1.01912,1.21087,1.4,1)

_MaskTex ("MaskTex", 2D) = "white" { }

_FenierRange ("菲涅尔范围", Range(0, 2)) = 1.1100000143051147

_FenierPow ("菲涅尔对比度", Float) = 4.46999979019165

_MaskRange ("遮罩影响范围", Vector) = (0,0.1073,0,0)

_ShadowStrength ("阴影强度,1是无阴影", Range(0, 1)) = 0.7200000286102295

_SPShadowColor ("阴影暗部颜色", Color) = (0.772059,0.915111,1,1)

_g_EnvmapIntensity ("环境光强度", Color) = (1,1,1,1)

_rimCol ("边缘光颜色", Color) = (0,0,0,1)

_rimPow ("边缘光对比度", Range(0, 32)) = 1.0

_ExposureScale ("曝光默认是1,不要就不用动", Range(0, 3)) = 1.0

[Space(10)] [Header(Outline)] _Outline_Width ("Outline_Width", Float) = 0.019999999552965164

_Outline_Sampler ("Outline_Sampler", 2D) = "white" { }

_Outline_Color ("描边中心颜色", Color) = (0.5,0.5,0.5,1)

_Outline_Color_End ("描边边缘颜色", Color) = (0.5,0.5,0.5,1)

_Outline_GradientStart ("描边渐变中心扩散", Range(0, 1)) = 0.0

_Outline_GradientEnd ("描边渐变边缘收缩", Range(0, 1)) = 1.0

_Outline_Offset_X ("Outline_Offset_X", Float) = 0.0

_Outline_Offset_Y ("Outline_Offset_Y", Float) = 0.0

[Space(10)] [Header(Emission)] [Toggle] _EMISSION_ON ("自发光开关", Float) = 0.0

_EmissionTex ("自发光贴图(RGB)", 2D) = "black" { }

_Em_Intensity ("自发光强度", Float) = 1.0

_Em_Speed ("自发光呼吸速度", Float) = 0.0

_EmissionLowestValue ("自发光最低值", Float) = 0.0

[Space(10)] [Header(LiuGuang)] [Toggle(_LG_ON)] _LG_ON ("流光开关", Float) = 0.0

[Toggle] _Use_2U ("使用2U", Float) = 0.0

_LG_Mask ("流光遮罩(RGB色)", 2D) = "white" { }

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 1.0

_U_LG ("U向流动速度", Float) = 0.0

_V_LG ("V向流动速度", Float) = 0.0

[Space(10)] [Header(LiuGuang_Outline)] [Toggle(_LG_ON_OUTLINE)] _LG_ON_OUTLINE ("流光开关", Float) = 0.0

[Toggle] _Use_2U_Outline ("使用2U", Float) = 0.0

_LG_Mask_Outline ("流光遮罩(RGB色)", 2D) = "white" { }

_LG_Color_Outline ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity_Outline ("流光强度", Float) = 1.0

_U_LG_Outline ("U向流动速度", Float) = 0.0

_V_LG_Outline ("V向流动速度", Float) = 0.0

}
SubShader {
 LOD 100
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 4074
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(4) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat27>=1.0);
#else
            u_xlatb19 = u_xlat27>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb28 = !!(0.0>=u_xlat27);
#else
            u_xlatb28 = 0.0>=u_xlat27;
#endif
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
#ifdef UNITY_ADRENO_ES3
                u_xlatb28 = !!(0.0<_UsePCF);
#else
                u_xlatb28 = 0.0<_UsePCF;
#endif
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat16_30 = textureLod(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
                            u_xlatb30 = !!(u_xlat27<u_xlat30);
#else
                            u_xlatb30 = u_xlat27<u_xlat30;
#endif
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                    u_xlatb27 = !!(u_xlat27<u_xlat1.x);
#else
                    u_xlatb27 = u_xlat27<u_xlat1.x;
#endif
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat16_2.x = 1.0;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb0 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(4) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat27>=1.0);
#else
            u_xlatb19 = u_xlat27>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb28 = !!(0.0>=u_xlat27);
#else
            u_xlatb28 = 0.0>=u_xlat27;
#endif
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
#ifdef UNITY_ADRENO_ES3
                u_xlatb28 = !!(0.0<_UsePCF);
#else
                u_xlatb28 = 0.0<_UsePCF;
#endif
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat16_30 = textureLod(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
                            u_xlatb30 = !!(u_xlat27<u_xlat30);
#else
                            u_xlatb30 = u_xlat27<u_xlat30;
#endif
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                    u_xlatb27 = !!(u_xlat27<u_xlat1.x);
#else
                    u_xlatb27 = u_xlat27<u_xlat1.x;
#endif
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat16_2.x = 1.0;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb0 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
lowp float u_xlat10_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
            u_xlatb19 = u_xlat27>=1.0;
            u_xlatb28 = 0.0>=u_xlat27;
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
                u_xlatb28 = 0.0<_UsePCF;
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat10_30 = texture2DLodEXT(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat10_30) + 1.0;
                            u_xlatb30 = u_xlat27<u_xlat30;
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                    u_xlatb27 = u_xlat27<u_xlat1.x;
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat16_2.x = 1.0;
        }
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _EMISSION_ON==1.0;
    if(u_xlatb0){
        u_xlat10_0.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
lowp float u_xlat10_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
            u_xlatb19 = u_xlat27>=1.0;
            u_xlatb28 = 0.0>=u_xlat27;
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
                u_xlatb28 = 0.0<_UsePCF;
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat10_30 = texture2DLodEXT(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat10_30) + 1.0;
                            u_xlatb30 = u_xlat27<u_xlat30;
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                    u_xlatb27 = u_xlat27<u_xlat1.x;
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat16_2.x = 1.0;
        }
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _EMISSION_ON==1.0;
    if(u_xlatb0){
        u_xlat10_0.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(4) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat27>=1.0);
#else
            u_xlatb19 = u_xlat27>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb28 = !!(0.0>=u_xlat27);
#else
            u_xlatb28 = 0.0>=u_xlat27;
#endif
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
#ifdef UNITY_ADRENO_ES3
                u_xlatb28 = !!(0.0<_UsePCF);
#else
                u_xlatb28 = 0.0<_UsePCF;
#endif
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat16_30 = textureLod(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
                            u_xlatb30 = !!(u_xlat27<u_xlat30);
#else
                            u_xlatb30 = u_xlat27<u_xlat30;
#endif
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                    u_xlatb27 = !!(u_xlat27<u_xlat1.x);
#else
                    u_xlatb27 = u_xlat27<u_xlat1.x;
#endif
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
            u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
            vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
            vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
            u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
            vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
            u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
            u_xlat27 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
            u_xlat1.x = (-_LightShadowData.x) + 1.0;
            u_xlat2 = u_xlat27 * u_xlat1.x + _LightShadowData.x;
            u_xlat16_2.x = u_xlat2;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb0 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(4) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat27>=1.0);
#else
            u_xlatb19 = u_xlat27>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb28 = !!(0.0>=u_xlat27);
#else
            u_xlatb28 = 0.0>=u_xlat27;
#endif
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
#ifdef UNITY_ADRENO_ES3
                u_xlatb28 = !!(0.0<_UsePCF);
#else
                u_xlatb28 = 0.0<_UsePCF;
#endif
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat16_30 = textureLod(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
                            u_xlatb30 = !!(u_xlat27<u_xlat30);
#else
                            u_xlatb30 = u_xlat27<u_xlat30;
#endif
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                    u_xlatb27 = !!(u_xlat27<u_xlat1.x);
#else
                    u_xlatb27 = u_xlat27<u_xlat1.x;
#endif
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
            u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
            vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
            vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
            u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
            vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
            u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
            u_xlat27 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
            u_xlat1.x = (-_LightShadowData.x) + 1.0;
            u_xlat2 = u_xlat27 * u_xlat1.x + _LightShadowData.x;
            u_xlat16_2.x = u_xlat2;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb0 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
float u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
lowp float u_xlat10_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
            u_xlatb19 = u_xlat27>=1.0;
            u_xlatb28 = 0.0>=u_xlat27;
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
                u_xlatb28 = 0.0<_UsePCF;
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat10_30 = texture2DLodEXT(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat10_30) + 1.0;
                            u_xlatb30 = u_xlat27<u_xlat30;
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                    u_xlatb27 = u_xlat27<u_xlat1.x;
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
            u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
            vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
            vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
            u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
            vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
            u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
            u_xlat27 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
            u_xlat1.x = (-_LightShadowData.x) + 1.0;
            u_xlat2 = u_xlat27 * u_xlat1.x + _LightShadowData.x;
            u_xlat16_2.x = u_xlat2;
        }
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _EMISSION_ON==1.0;
    if(u_xlatb0){
        u_xlat10_0.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
float u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
lowp float u_xlat10_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
            u_xlatb19 = u_xlat27>=1.0;
            u_xlatb28 = 0.0>=u_xlat27;
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
                u_xlatb28 = 0.0<_UsePCF;
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat10_30 = texture2DLodEXT(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat10_30) + 1.0;
                            u_xlatb30 = u_xlat27<u_xlat30;
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                    u_xlatb27 = u_xlat27<u_xlat1.x;
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
            u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
            vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
            vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
            u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
            vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
            u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
            u_xlat27 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
            u_xlat1.x = (-_LightShadowData.x) + 1.0;
            u_xlat2 = u_xlat27 * u_xlat1.x + _LightShadowData.x;
            u_xlat16_2.x = u_xlat2;
        }
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _EMISSION_ON==1.0;
    if(u_xlatb0){
        u_xlat10_0.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(4) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
vec2 u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat27>=1.0);
#else
            u_xlatb19 = u_xlat27>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb28 = !!(0.0>=u_xlat27);
#else
            u_xlatb28 = 0.0>=u_xlat27;
#endif
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
#ifdef UNITY_ADRENO_ES3
                u_xlatb28 = !!(0.0<_UsePCF);
#else
                u_xlatb28 = 0.0<_UsePCF;
#endif
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat16_30 = textureLod(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
                            u_xlatb30 = !!(u_xlat27<u_xlat30);
#else
                            u_xlatb30 = u_xlat27<u_xlat30;
#endif
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                    u_xlatb27 = !!(u_xlat27<u_xlat1.x);
#else
                    u_xlatb27 = u_xlat27<u_xlat1.x;
#endif
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat16_2.x = 1.0;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U==1.0);
#else
    u_xlatb0 = _Use_2U==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat18.xy);
    u_xlat16_0.xyz = texture(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat16_1.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb27 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb27){
        u_xlat16_1.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(4) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
vec2 u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat27>=1.0);
#else
            u_xlatb19 = u_xlat27>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb28 = !!(0.0>=u_xlat27);
#else
            u_xlatb28 = 0.0>=u_xlat27;
#endif
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
#ifdef UNITY_ADRENO_ES3
                u_xlatb28 = !!(0.0<_UsePCF);
#else
                u_xlatb28 = 0.0<_UsePCF;
#endif
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat16_30 = textureLod(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
                            u_xlatb30 = !!(u_xlat27<u_xlat30);
#else
                            u_xlatb30 = u_xlat27<u_xlat30;
#endif
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                    u_xlatb27 = !!(u_xlat27<u_xlat1.x);
#else
                    u_xlatb27 = u_xlat27<u_xlat1.x;
#endif
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat16_2.x = 1.0;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U==1.0);
#else
    u_xlatb0 = _Use_2U==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat18.xy);
    u_xlat16_0.xyz = texture(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat16_1.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb27 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb27){
        u_xlat16_1.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
vec2 u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
lowp float u_xlat10_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
            u_xlatb19 = u_xlat27>=1.0;
            u_xlatb28 = 0.0>=u_xlat27;
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
                u_xlatb28 = 0.0<_UsePCF;
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat10_30 = texture2DLodEXT(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat10_30) + 1.0;
                            u_xlatb30 = u_xlat27<u_xlat30;
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                    u_xlatb27 = u_xlat27<u_xlat1.x;
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat16_2.x = 1.0;
        }
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _Use_2U==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat18.xy);
    u_xlat10_0.xyz = texture2D(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat10_1.www * u_xlat0.xyz;
    u_xlatb27 = _EMISSION_ON==1.0;
    if(u_xlatb27){
        u_xlat10_1.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
vec2 u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
lowp float u_xlat10_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
            u_xlatb19 = u_xlat27>=1.0;
            u_xlatb28 = 0.0>=u_xlat27;
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
                u_xlatb28 = 0.0<_UsePCF;
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat10_30 = texture2DLodEXT(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat10_30) + 1.0;
                            u_xlatb30 = u_xlat27<u_xlat30;
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                    u_xlatb27 = u_xlat27<u_xlat1.x;
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat16_2.x = 1.0;
        }
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _Use_2U==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat18.xy);
    u_xlat10_0.xyz = texture2D(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat10_1.www * u_xlat0.xyz;
    u_xlatb27 = _EMISSION_ON==1.0;
    if(u_xlatb27){
        u_xlat10_1.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(4) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
vec2 u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat27>=1.0);
#else
            u_xlatb19 = u_xlat27>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb28 = !!(0.0>=u_xlat27);
#else
            u_xlatb28 = 0.0>=u_xlat27;
#endif
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
#ifdef UNITY_ADRENO_ES3
                u_xlatb28 = !!(0.0<_UsePCF);
#else
                u_xlatb28 = 0.0<_UsePCF;
#endif
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat16_30 = textureLod(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
                            u_xlatb30 = !!(u_xlat27<u_xlat30);
#else
                            u_xlatb30 = u_xlat27<u_xlat30;
#endif
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                    u_xlatb27 = !!(u_xlat27<u_xlat1.x);
#else
                    u_xlatb27 = u_xlat27<u_xlat1.x;
#endif
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
            u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
            vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
            vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
            u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
            vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
            u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
            u_xlat27 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
            u_xlat1.x = (-_LightShadowData.x) + 1.0;
            u_xlat2 = u_xlat27 * u_xlat1.x + _LightShadowData.x;
            u_xlat16_2.x = u_xlat2;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U==1.0);
#else
    u_xlatb0 = _Use_2U==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat18.xy);
    u_xlat16_0.xyz = texture(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat16_1.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb27 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb27){
        u_xlat16_1.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(4) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(10) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
vec2 u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
            u_xlatb19 = !!(u_xlat27>=1.0);
#else
            u_xlatb19 = u_xlat27>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
            u_xlatb28 = !!(0.0>=u_xlat27);
#else
            u_xlatb28 = 0.0>=u_xlat27;
#endif
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
#ifdef UNITY_ADRENO_ES3
                u_xlatb28 = !!(0.0<_UsePCF);
#else
                u_xlatb28 = 0.0<_UsePCF;
#endif
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat16_30 = textureLod(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
                            u_xlatb30 = !!(u_xlat27<u_xlat30);
#else
                            u_xlatb30 = u_xlat27<u_xlat30;
#endif
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                    u_xlatb27 = !!(u_xlat27<u_xlat1.x);
#else
                    u_xlatb27 = u_xlat27<u_xlat1.x;
#endif
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
            u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
            vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
            vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
            u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
            vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
            u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
            u_xlat27 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
            u_xlat1.x = (-_LightShadowData.x) + 1.0;
            u_xlat2 = u_xlat27 * u_xlat1.x + _LightShadowData.x;
            u_xlat16_2.x = u_xlat2;
        }
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.x = min(max(u_xlat16_11.x, 0.0), 1.0);
#else
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
#endif
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U==1.0);
#else
    u_xlatb0 = _Use_2U==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat18.xy);
    u_xlat16_0.xyz = texture(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat16_1.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb27 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb27){
        u_xlat16_1.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
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
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
vec2 u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
lowp float u_xlat10_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
            u_xlatb19 = u_xlat27>=1.0;
            u_xlatb28 = 0.0>=u_xlat27;
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
                u_xlatb28 = 0.0<_UsePCF;
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat10_30 = texture2DLodEXT(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat10_30) + 1.0;
                            u_xlatb30 = u_xlat27<u_xlat30;
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                    u_xlatb27 = u_xlat27<u_xlat1.x;
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
            u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
            vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
            vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
            u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
            vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
            u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
            u_xlat27 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
            u_xlat1.x = (-_LightShadowData.x) + 1.0;
            u_xlat2 = u_xlat27 * u_xlat1.x + _LightShadowData.x;
            u_xlat16_2.x = u_xlat2;
        }
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _Use_2U==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat18.xy);
    u_xlat10_0.xyz = texture2D(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat10_1.www * u_xlat0.xyz;
    u_xlatb27 = _EMISSION_ON==1.0;
    if(u_xlatb27){
        u_xlat10_1.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
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
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
int u_xlati3;
bvec3 u_xlatb3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
vec3 u_xlat13;
vec2 u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
int u_xlati21;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
lowp float u_xlat10_30;
bool u_xlatb30;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = 0.0<_USE_CUSTOM_SHADOWMAP;
        if(u_xlatb27){
            u_xlat1 = vs_TEXCOORD1.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD1.xxxx + u_xlat1;
            u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD1.zzzz + u_xlat1;
            u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
            u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
            u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
            u_xlat27 = (-u_xlat1.z) + 1.0;
            u_xlatb19 = u_xlat27>=1.0;
            u_xlatb28 = 0.0>=u_xlat27;
            u_xlatb19 = u_xlatb28 || u_xlatb19;
            u_xlatb3.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb3.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
            u_xlatb19 = u_xlatb19 || u_xlatb3.x;
            u_xlatb19 = u_xlatb3.y || u_xlatb19;
            u_xlatb19 = u_xlatb3.z || u_xlatb19;
            if(u_xlatb19){
                u_xlat19 = 1.0;
            } else {
                u_xlatb28 = 0.0<_UsePCF;
                if(u_xlatb28){
                    u_xlat28 = 0.0;
                    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                    {
                        u_xlat4.x = float(u_xlati_loop_1);
                        u_xlat12 = u_xlat28;
                        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                        {
                            u_xlat4.y = float(u_xlati_loop_2);
                            u_xlat13.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                            u_xlat10_30 = texture2DLodEXT(_CustomShadowTex, u_xlat13.xy, 0.0).x;
                            u_xlat30 = (-u_xlat10_30) + 1.0;
                            u_xlatb30 = u_xlat27<u_xlat30;
                            u_xlat30 = (u_xlatb30) ? _CustomShadowStrength : 1.0;
                            u_xlat12 = u_xlat30 + u_xlat12;
                        }
                        u_xlat28 = u_xlat12;
                    }
                    u_xlat19 = u_xlat28 * 0.111111112;
                } else {
                    u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                    u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                    u_xlatb27 = u_xlat27<u_xlat1.x;
                    u_xlat19 = (u_xlatb27) ? _CustomShadowStrength : 1.0;
                }
            }
            u_xlat16_2.x = u_xlat19;
        } else {
            u_xlat1.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
            u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
            vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
            u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
            vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
            u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
            u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
            vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
            u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
            u_xlat27 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
            u_xlat1.x = (-_LightShadowData.x) + 1.0;
            u_xlat2 = u_xlat27 * u_xlat1.x + _LightShadowData.x;
            u_xlat16_2.x = u_xlat2;
        }
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = u_xlat16_2.xxxx;
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_11.x = u_xlat27 + _ShadowStrength;
        u_xlat16_11.x = clamp(u_xlat16_11.x, 0.0, 1.0);
        u_xlat16_2.x = u_xlat16_11.x * u_xlat16_2.x;
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _Use_2U==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat18.xy);
    u_xlat10_0.xyz = texture2D(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat10_1.www * u_xlat0.xyz;
    u_xlatb27 = _EMISSION_ON==1.0;
    if(u_xlatb27){
        u_xlat10_1.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_2.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
        u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb0 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_2.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
        u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb0 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_2.x = u_xlat27 + _ShadowStrength;
        u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _EMISSION_ON==1.0;
    if(u_xlatb0){
        u_xlat10_0.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_2.x = u_xlat27 + _ShadowStrength;
        u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18 = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18 + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _EMISSION_ON==1.0;
    if(u_xlatb0){
        u_xlat10_0.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat1.x = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat1.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat27) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(8) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(9) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec4 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_26;
vec3 u_xlat38;
float u_xlat40;
mediump float u_xlat16_40;
mediump float u_xlat10_41;
mediump vec2 u_xlat16_46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_53;
float u_xlat60;
mediump float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat20.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat20.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat60 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat1.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb60 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb60){
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(_ShadowBias.z!=0.0);
#else
        u_xlatb60 = _ShadowBias.z!=0.0;
#endif
        u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat1.x = inversesqrt(u_xlat1.x);
        u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
        u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
        u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * _ShadowBias.z;
        u_xlat1.xyz = (-vs_TEXCOORD4.xyz) * u_xlat1.xxx + vs_TEXCOORD1.xyz;
        u_xlat1.xyz = (bool(u_xlatb60)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
        u_xlat3 = u_xlat1.yyyy * u_xlat3;
        u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
        u_xlat1 = u_xlat5 + u_xlat1;
        u_xlat60 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
        u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
        u_xlat60 = (-u_xlat60) + u_xlat1.z;
        u_xlat3.x = max((-u_xlat1.w), u_xlat60);
        u_xlat3.x = (-u_xlat60) + u_xlat3.x;
        u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat60;
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(_softShadowQuality==1.0);
#else
        u_xlatb60 = _softShadowQuality==1.0;
#endif
        if(u_xlatb60){
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
            u_xlat16_26.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb60 = !!(_softShadowQuality==2.0);
#else
            u_xlatb60 = _softShadowQuality==2.0;
#endif
            if(u_xlatb60){
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_47.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_48.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_48.xy;
                u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
                u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
                u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
                u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_4.xy = u_xlat16_48.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
                u_xlat16_3.z = u_xlat16_5.x;
                u_xlat16_3.w = u_xlat16_7.x;
                u_xlat16_4.z = u_xlat16_8.x;
                u_xlat16_4.w = u_xlat16_47.x;
                u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
                u_xlat16_5.z = u_xlat16_3.y;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_8.z = u_xlat16_4.y;
                u_xlat16_8.w = u_xlat16_47.y;
                u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
                u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
                u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
                u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
                u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
                u_xlat16_3.w = u_xlat16_4.x;
                u_xlat16_5 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
                u_xlat16_8.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
                u_xlat16_4.w = u_xlat16_3.y;
                u_xlat16_3.yw = u_xlat16_4.yz;
                u_xlat16_9 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
                u_xlat16_4 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
                u_xlat16_3 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
                u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
                u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
                u_xlat16_46.x = u_xlat16_2.y * u_xlat16_7.z;
                vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat1.w);
                u_xlat10_41 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
                u_xlat16_66 = u_xlat10_41 * u_xlat16_10.y;
                u_xlat16_66 = u_xlat16_10.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
                u_xlat16_66 = u_xlat16_10.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
                u_xlat16_66 = u_xlat16_10.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
                u_xlat16_66 = u_xlat16_11.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
                u_xlat16_66 = u_xlat16_11.y * u_xlat10_60 + u_xlat16_66;
                vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
                u_xlat16_66 = u_xlat16_11.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
                u_xlat16_66 = u_xlat16_11.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
                u_xlat16_26.x = u_xlat16_46.x * u_xlat10_60 + u_xlat16_66;
            } else {
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat16_47.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_48.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.xy = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_8.xy;
                u_xlat16_48.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.zw = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_2.yw;
                u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
                u_xlat16_3.xy = u_xlat16_47.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat16_47.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
                u_xlat16_2.x = u_xlat16_3.y;
                u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_5.y = u_xlat16_47.x;
                u_xlat16_5.w = u_xlat16_4.y;
                u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
                u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_4.y = u_xlat16_47.y;
                u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
                u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
                u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
                u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
                u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
                u_xlat16_7.xzw = u_xlat16_5.yzw;
                u_xlat16_7.y = u_xlat16_4.x;
                u_xlat16_8 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_9.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.y = u_xlat16_7.y;
                u_xlat16_7.y = u_xlat16_4.z;
                u_xlat16_10 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_49.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.z = u_xlat16_7.y;
                u_xlat16_11 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
                u_xlat16_7.y = u_xlat16_4.w;
                u_xlat16_12 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_13.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_53.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
                u_xlat16_4.xzw = u_xlat16_7.xzw;
                u_xlat16_7 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
                u_xlat16_14.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
                u_xlat16_4.x = u_xlat16_5.x;
                u_xlat16_46.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
                u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
                u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
                u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
                u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
                vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat1.w);
                u_xlat10_1 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
                u_xlat16_8.x = u_xlat10_1 * u_xlat16_4.y;
                u_xlat16_8.x = u_xlat16_4.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
                u_xlat16_8.x = u_xlat16_4.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
                u_xlat16_8.x = u_xlat16_4.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
                u_xlat16_8.x = u_xlat16_5.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
                u_xlat16_8.x = u_xlat16_5.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec19 = vec3(u_xlat16_49.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
                u_xlat16_8.x = u_xlat16_5.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
                u_xlat16_8.x = u_xlat16_5.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
                u_xlat16_8.x = u_xlat16_15.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
                u_xlat16_8.x = u_xlat16_15.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
                u_xlat16_8.x = u_xlat16_15.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec24 = vec3(u_xlat16_53.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
                u_xlat16_8.x = u_xlat16_15.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
                u_xlat16_7.x = u_xlat16_2.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
                u_xlat16_7.x = u_xlat16_2.y * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
                u_xlat16_7.x = u_xlat16_2.z * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec28 = vec3(u_xlat16_46.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
                u_xlat16_26.x = u_xlat16_2.w * u_xlat10_60 + u_xlat16_7.x;
            }
        }
        u_xlat16_46.x = (-u_xlat16_6.x) + 1.0;
        u_xlat16_1 = u_xlat16_26.xxxx * u_xlat16_46.xxxx + u_xlat16_6.xxxx;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb60){
            SV_Target0 = u_xlat16_1;
            return;
        }
        u_xlat60 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_6.x = u_xlat60 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
        u_xlat16_6.x = u_xlat16_1.w * u_xlat16_6.x;
    } else {
        u_xlat16_6.x = 1.0;
    }
    u_xlat16.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat60 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat17.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb18.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat19.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat38.xz = (u_xlatb18.y) ? u_xlat19.xy : vs_TEXCOORD2.xy;
    u_xlat19.xyz = texture(_Albedo2Map, u_xlat38.xz).xyz;
    u_xlat18.xyw = (u_xlatb18.x) ? u_xlat17.xyz : u_xlat19.xyz;
    u_xlat16_26.xyz = u_xlat18.xyw * _BaseColor2.xyz;
    u_xlat18.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = (u_xlatb18.z) ? u_xlat18.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat18.xyz * _SpColor.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat16.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat16.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat18.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat18.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat19.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat19.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat19.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat18.x = dot(u_xlat19.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16.xxy, u_xlat16.xxy);
    u_xlat16_67 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = vec2(u_xlat16_67) * u_xlat16.xy;
    u_xlat16.xy = u_xlat18.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat18.zy + (-u_xlat16.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_40 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_67 = u_xlat16_40 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat16.xy = (-vec2(u_xlat16_67)) + vec2(1.0, 0.5);
    u_xlat16_67 = u_xlat60 + (-_FenierRange);
    u_xlat16_67 = u_xlat16_67 + u_xlat16.y;
    u_xlat16_67 = u_xlat16_67 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat16.x * vs_TEXCOORD0.w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat40 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_16.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_0.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat17.xyz * _BaseColor.xyz + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = vec3(u_xlat16_67) * u_xlat16_9.xyz + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xxx + _SPShadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_67 = (-u_xlat60) + 1.0;
    u_xlat16_67 = log2(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _rimPow;
    u_xlat16_67 = exp2(u_xlat16_67);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_26.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_67) * _rimCol.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb0 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat16.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat16.xyz = u_xlat16_0.xyz * u_xlat16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16.xyz;
        u_xlat60 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat60);
        u_xlat60 = _Time.y * _Em_Speed;
        u_xlat60 = sin(u_xlat60);
        u_xlat16.x = (-_EmissionLowestValue) + 1.0;
        u_xlat60 = abs(u_xlat60) * u_xlat16.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat60) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat0.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(8) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(9) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec4 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_26;
vec3 u_xlat38;
float u_xlat40;
mediump float u_xlat16_40;
mediump float u_xlat10_41;
mediump vec2 u_xlat16_46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_53;
float u_xlat60;
mediump float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat20.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat20.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat60 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat1.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb60 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb60){
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(_ShadowBias.z!=0.0);
#else
        u_xlatb60 = _ShadowBias.z!=0.0;
#endif
        u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat1.x = inversesqrt(u_xlat1.x);
        u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
        u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
        u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * _ShadowBias.z;
        u_xlat1.xyz = (-vs_TEXCOORD4.xyz) * u_xlat1.xxx + vs_TEXCOORD1.xyz;
        u_xlat1.xyz = (bool(u_xlatb60)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
        u_xlat3 = u_xlat1.yyyy * u_xlat3;
        u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
        u_xlat1 = u_xlat5 + u_xlat1;
        u_xlat60 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
        u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
        u_xlat60 = (-u_xlat60) + u_xlat1.z;
        u_xlat3.x = max((-u_xlat1.w), u_xlat60);
        u_xlat3.x = (-u_xlat60) + u_xlat3.x;
        u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat60;
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(_softShadowQuality==1.0);
#else
        u_xlatb60 = _softShadowQuality==1.0;
#endif
        if(u_xlatb60){
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
            u_xlat16_26.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb60 = !!(_softShadowQuality==2.0);
#else
            u_xlatb60 = _softShadowQuality==2.0;
#endif
            if(u_xlatb60){
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_47.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_48.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_48.xy;
                u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
                u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
                u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
                u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_4.xy = u_xlat16_48.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
                u_xlat16_3.z = u_xlat16_5.x;
                u_xlat16_3.w = u_xlat16_7.x;
                u_xlat16_4.z = u_xlat16_8.x;
                u_xlat16_4.w = u_xlat16_47.x;
                u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
                u_xlat16_5.z = u_xlat16_3.y;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_8.z = u_xlat16_4.y;
                u_xlat16_8.w = u_xlat16_47.y;
                u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
                u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
                u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
                u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
                u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
                u_xlat16_3.w = u_xlat16_4.x;
                u_xlat16_5 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
                u_xlat16_8.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
                u_xlat16_4.w = u_xlat16_3.y;
                u_xlat16_3.yw = u_xlat16_4.yz;
                u_xlat16_9 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
                u_xlat16_4 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
                u_xlat16_3 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
                u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
                u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
                u_xlat16_46.x = u_xlat16_2.y * u_xlat16_7.z;
                vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat1.w);
                u_xlat10_41 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
                u_xlat16_66 = u_xlat10_41 * u_xlat16_10.y;
                u_xlat16_66 = u_xlat16_10.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
                u_xlat16_66 = u_xlat16_10.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
                u_xlat16_66 = u_xlat16_10.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
                u_xlat16_66 = u_xlat16_11.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
                u_xlat16_66 = u_xlat16_11.y * u_xlat10_60 + u_xlat16_66;
                vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
                u_xlat16_66 = u_xlat16_11.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
                u_xlat16_66 = u_xlat16_11.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
                u_xlat16_26.x = u_xlat16_46.x * u_xlat10_60 + u_xlat16_66;
            } else {
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat16_47.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_48.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.xy = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_8.xy;
                u_xlat16_48.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.zw = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_2.yw;
                u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
                u_xlat16_3.xy = u_xlat16_47.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat16_47.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
                u_xlat16_2.x = u_xlat16_3.y;
                u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_5.y = u_xlat16_47.x;
                u_xlat16_5.w = u_xlat16_4.y;
                u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
                u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_4.y = u_xlat16_47.y;
                u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
                u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
                u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
                u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
                u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
                u_xlat16_7.xzw = u_xlat16_5.yzw;
                u_xlat16_7.y = u_xlat16_4.x;
                u_xlat16_8 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_9.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.y = u_xlat16_7.y;
                u_xlat16_7.y = u_xlat16_4.z;
                u_xlat16_10 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_49.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.z = u_xlat16_7.y;
                u_xlat16_11 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
                u_xlat16_7.y = u_xlat16_4.w;
                u_xlat16_12 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_13.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_53.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
                u_xlat16_4.xzw = u_xlat16_7.xzw;
                u_xlat16_7 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
                u_xlat16_14.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
                u_xlat16_4.x = u_xlat16_5.x;
                u_xlat16_46.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
                u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
                u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
                u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
                u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
                vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat1.w);
                u_xlat10_1 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
                u_xlat16_8.x = u_xlat10_1 * u_xlat16_4.y;
                u_xlat16_8.x = u_xlat16_4.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
                u_xlat16_8.x = u_xlat16_4.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
                u_xlat16_8.x = u_xlat16_4.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
                u_xlat16_8.x = u_xlat16_5.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
                u_xlat16_8.x = u_xlat16_5.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec19 = vec3(u_xlat16_49.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
                u_xlat16_8.x = u_xlat16_5.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
                u_xlat16_8.x = u_xlat16_5.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
                u_xlat16_8.x = u_xlat16_15.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
                u_xlat16_8.x = u_xlat16_15.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
                u_xlat16_8.x = u_xlat16_15.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec24 = vec3(u_xlat16_53.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
                u_xlat16_8.x = u_xlat16_15.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
                u_xlat16_7.x = u_xlat16_2.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
                u_xlat16_7.x = u_xlat16_2.y * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
                u_xlat16_7.x = u_xlat16_2.z * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec28 = vec3(u_xlat16_46.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
                u_xlat16_26.x = u_xlat16_2.w * u_xlat10_60 + u_xlat16_7.x;
            }
        }
        u_xlat16_46.x = (-u_xlat16_6.x) + 1.0;
        u_xlat16_1 = u_xlat16_26.xxxx * u_xlat16_46.xxxx + u_xlat16_6.xxxx;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb60){
            SV_Target0 = u_xlat16_1;
            return;
        }
        u_xlat60 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_6.x = u_xlat60 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
        u_xlat16_6.x = u_xlat16_1.w * u_xlat16_6.x;
    } else {
        u_xlat16_6.x = 1.0;
    }
    u_xlat16.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat60 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat17.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb18.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat19.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat38.xz = (u_xlatb18.y) ? u_xlat19.xy : vs_TEXCOORD2.xy;
    u_xlat19.xyz = texture(_Albedo2Map, u_xlat38.xz).xyz;
    u_xlat18.xyw = (u_xlatb18.x) ? u_xlat17.xyz : u_xlat19.xyz;
    u_xlat16_26.xyz = u_xlat18.xyw * _BaseColor2.xyz;
    u_xlat18.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = (u_xlatb18.z) ? u_xlat18.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat18.xyz * _SpColor.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat16.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat16.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat18.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat18.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat19.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat19.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat19.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat18.x = dot(u_xlat19.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16.xxy, u_xlat16.xxy);
    u_xlat16_67 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = vec2(u_xlat16_67) * u_xlat16.xy;
    u_xlat16.xy = u_xlat18.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat18.zy + (-u_xlat16.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_40 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_67 = u_xlat16_40 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat16.xy = (-vec2(u_xlat16_67)) + vec2(1.0, 0.5);
    u_xlat16_67 = u_xlat60 + (-_FenierRange);
    u_xlat16_67 = u_xlat16_67 + u_xlat16.y;
    u_xlat16_67 = u_xlat16_67 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat16.x * vs_TEXCOORD0.w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat40 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_16.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_0.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat17.xyz * _BaseColor.xyz + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = vec3(u_xlat16_67) * u_xlat16_9.xyz + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xxx + _SPShadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_67 = (-u_xlat60) + 1.0;
    u_xlat16_67 = log2(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _rimPow;
    u_xlat16_67 = exp2(u_xlat16_67);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_26.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_67) * _rimCol.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb0 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat16.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat16.xyz = u_xlat16_0.xyz * u_xlat16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16.xyz;
        u_xlat60 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat60);
        u_xlat60 = _Time.y * _Em_Speed;
        u_xlat60 = sin(u_xlat60);
        u_xlat16.x = (-_EmissionLowestValue) + 1.0;
        u_xlat60 = abs(u_xlat60) * u_xlat16.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat60) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat0.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
vec3 u_xlat17;
vec4 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_26;
vec3 u_xlat38;
float u_xlat40;
lowp float u_xlat10_40;
lowp float u_xlat10_41;
mediump vec2 u_xlat16_46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_53;
float u_xlat60;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat20.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat20.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat60 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat1.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlatb60 = _ShadowStrength!=1.0;
    if(u_xlatb60){
        u_xlatb60 = _ShadowBias.z!=0.0;
        u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat1.x = inversesqrt(u_xlat1.x);
        u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
        u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
        u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * _ShadowBias.z;
        u_xlat1.xyz = (-vs_TEXCOORD4.xyz) * u_xlat1.xxx + vs_TEXCOORD1.xyz;
        u_xlat1.xyz = (bool(u_xlatb60)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
        u_xlat3 = u_xlat1.yyyy * u_xlat3;
        u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
        u_xlat1 = u_xlat5 + u_xlat1;
        u_xlat60 = _ShadowBias.x / u_xlat1.w;
        u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
        u_xlat60 = (-u_xlat60) + u_xlat1.z;
        u_xlat3.x = max((-u_xlat1.w), u_xlat60);
        u_xlat3.x = (-u_xlat60) + u_xlat3.x;
        u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat60;
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlatb60 = _softShadowQuality==1.0;
        if(u_xlatb60){
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
            u_xlat16_26.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb60 = _softShadowQuality==2.0;
            if(u_xlatb60){
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_47.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_48.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_48.xy;
                u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
                u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
                u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
                u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_4.xy = u_xlat16_48.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
                u_xlat16_3.z = u_xlat16_5.x;
                u_xlat16_3.w = u_xlat16_7.x;
                u_xlat16_4.z = u_xlat16_8.x;
                u_xlat16_4.w = u_xlat16_47.x;
                u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
                u_xlat16_5.z = u_xlat16_3.y;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_8.z = u_xlat16_4.y;
                u_xlat16_8.w = u_xlat16_47.y;
                u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
                u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
                u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
                u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
                u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
                u_xlat16_3.w = u_xlat16_4.x;
                u_xlat16_5 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
                u_xlat16_8.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
                u_xlat16_4.w = u_xlat16_3.y;
                u_xlat16_3.yw = u_xlat16_4.yz;
                u_xlat16_9 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
                u_xlat16_4 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
                u_xlat16_3 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
                u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
                u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
                u_xlat16_46.x = u_xlat16_2.y * u_xlat16_7.z;
                vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
                vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat1.w);
                u_xlat10_41 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
                u_xlat16_66 = u_xlat10_41 * u_xlat16_10.y;
                u_xlat16_66 = u_xlat16_10.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
                u_xlat16_66 = u_xlat16_10.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
                u_xlat16_66 = u_xlat16_10.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
                u_xlat16_66 = u_xlat16_11.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
                u_xlat16_66 = u_xlat16_11.y * u_xlat10_60 + u_xlat16_66;
                vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
                u_xlat16_66 = u_xlat16_11.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
                u_xlat16_66 = u_xlat16_11.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
                u_xlat16_26.x = u_xlat16_46.x * u_xlat10_60 + u_xlat16_66;
            } else {
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat16_47.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_48.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.xy = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_8.xy;
                u_xlat16_48.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.zw = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_2.yw;
                u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
                u_xlat16_3.xy = u_xlat16_47.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat16_47.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
                u_xlat16_2.x = u_xlat16_3.y;
                u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_5.y = u_xlat16_47.x;
                u_xlat16_5.w = u_xlat16_4.y;
                u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
                u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_4.y = u_xlat16_47.y;
                u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
                u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
                u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
                u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
                u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
                u_xlat16_7.xzw = u_xlat16_5.yzw;
                u_xlat16_7.y = u_xlat16_4.x;
                u_xlat16_8 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_9.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.y = u_xlat16_7.y;
                u_xlat16_7.y = u_xlat16_4.z;
                u_xlat16_10 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_49.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.z = u_xlat16_7.y;
                u_xlat16_11 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
                u_xlat16_7.y = u_xlat16_4.w;
                u_xlat16_12 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_13.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_53.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
                u_xlat16_4.xzw = u_xlat16_7.xzw;
                u_xlat16_7 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
                u_xlat16_14.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
                u_xlat16_4.x = u_xlat16_5.x;
                u_xlat16_46.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
                u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
                u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
                u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
                u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
                vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
                vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat1.w);
                u_xlat10_1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
                u_xlat16_8.x = u_xlat10_1.x * u_xlat16_4.y;
                u_xlat16_8.x = u_xlat16_4.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
                u_xlat16_8.x = u_xlat16_4.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
                u_xlat16_8.x = u_xlat16_4.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
                u_xlat16_8.x = u_xlat16_5.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
                u_xlat16_8.x = u_xlat16_5.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec19 = vec3(u_xlat16_49.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
                u_xlat16_8.x = u_xlat16_5.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
                u_xlat16_8.x = u_xlat16_5.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
                u_xlat16_8.x = u_xlat16_15.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
                u_xlat16_8.x = u_xlat16_15.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
                u_xlat16_8.x = u_xlat16_15.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec24 = vec3(u_xlat16_53.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
                u_xlat16_8.x = u_xlat16_15.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
                u_xlat16_7.x = u_xlat16_2.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
                u_xlat16_7.x = u_xlat16_2.y * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
                u_xlat16_7.x = u_xlat16_2.z * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec28 = vec3(u_xlat16_46.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
                u_xlat16_26.x = u_xlat16_2.w * u_xlat10_60 + u_xlat16_7.x;
            }
        }
        u_xlat16_46.x = (-u_xlat16_6.x) + 1.0;
        u_xlat16_1 = u_xlat16_26.xxxx * u_xlat16_46.xxxx + u_xlat16_6.xxxx;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb60){
            SV_Target0 = u_xlat16_1;
            return;
        }
        u_xlat60 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_6.x = u_xlat60 + _ShadowStrength;
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
        u_xlat16_6.x = u_xlat16_1.w * u_xlat16_6.x;
    } else {
        u_xlat16_6.x = 1.0;
    }
    u_xlat16.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat60 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat17.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb18.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat19.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat38.xz = (u_xlatb18.y) ? u_xlat19.xy : vs_TEXCOORD2.xy;
    u_xlat19.xyz = texture2D(_Albedo2Map, u_xlat38.xz).xyz;
    u_xlat18.xyw = (u_xlatb18.x) ? u_xlat17.xyz : u_xlat19.xyz;
    u_xlat16_26.xyz = u_xlat18.xyw * _BaseColor2.xyz;
    u_xlat18.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = (u_xlatb18.z) ? u_xlat18.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat18.xyz * _SpColor.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat16.xyz);
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat16.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat16.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat18.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat18.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat19.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat19.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat19.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat18.x = dot(u_xlat19.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16.xxy, u_xlat16.xxy);
    u_xlat16_67 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = vec2(u_xlat16_67) * u_xlat16.xy;
    u_xlat16.xy = u_xlat18.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat18.zy + (-u_xlat16.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_40 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_67 = u_xlat10_40 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat16.xy = (-vec2(u_xlat16_67)) + vec2(1.0, 0.5);
    u_xlat16_67 = u_xlat60 + (-_FenierRange);
    u_xlat16_67 = u_xlat16_67 + u_xlat16.y;
    u_xlat16_67 = u_xlat16_67 * _FenierPow;
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
    u_xlat40 = u_xlat16.x * vs_TEXCOORD0.w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat40 + 1.0;
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
    u_xlat10_16.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_16.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat10_0.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat17.xyz * _BaseColor.xyz + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = vec3(u_xlat16_67) * u_xlat16_9.xyz + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xxx + _SPShadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_67 = (-u_xlat60) + 1.0;
    u_xlat16_67 = log2(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _rimPow;
    u_xlat16_67 = exp2(u_xlat16_67);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowStrength;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_26.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_67) * _rimCol.xyz + u_xlat16_6.xyz;
    u_xlatb0 = _EMISSION_ON==1.0;
    if(u_xlatb0){
        u_xlat10_0.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat16.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat16.xyz = u_xlat10_0.xyz * u_xlat16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat16.xyz;
        u_xlat60 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat60);
        u_xlat60 = _Time.y * _Em_Speed;
        u_xlat60 = sin(u_xlat60);
        u_xlat16.x = (-_EmissionLowestValue) + 1.0;
        u_xlat60 = abs(u_xlat60) * u_xlat16.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat60) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat0.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
vec3 u_xlat17;
vec4 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_26;
vec3 u_xlat38;
float u_xlat40;
lowp float u_xlat10_40;
lowp float u_xlat10_41;
mediump vec2 u_xlat16_46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_53;
float u_xlat60;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat20.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat20.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat60 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat1.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlatb60 = _ShadowStrength!=1.0;
    if(u_xlatb60){
        u_xlatb60 = _ShadowBias.z!=0.0;
        u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat1.x = inversesqrt(u_xlat1.x);
        u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
        u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
        u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * _ShadowBias.z;
        u_xlat1.xyz = (-vs_TEXCOORD4.xyz) * u_xlat1.xxx + vs_TEXCOORD1.xyz;
        u_xlat1.xyz = (bool(u_xlatb60)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
        u_xlat3 = u_xlat1.yyyy * u_xlat3;
        u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
        u_xlat1 = u_xlat5 + u_xlat1;
        u_xlat60 = _ShadowBias.x / u_xlat1.w;
        u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
        u_xlat60 = (-u_xlat60) + u_xlat1.z;
        u_xlat3.x = max((-u_xlat1.w), u_xlat60);
        u_xlat3.x = (-u_xlat60) + u_xlat3.x;
        u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat60;
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlatb60 = _softShadowQuality==1.0;
        if(u_xlatb60){
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
            u_xlat16_26.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb60 = _softShadowQuality==2.0;
            if(u_xlatb60){
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_47.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_48.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_48.xy;
                u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
                u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
                u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
                u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_4.xy = u_xlat16_48.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
                u_xlat16_3.z = u_xlat16_5.x;
                u_xlat16_3.w = u_xlat16_7.x;
                u_xlat16_4.z = u_xlat16_8.x;
                u_xlat16_4.w = u_xlat16_47.x;
                u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
                u_xlat16_5.z = u_xlat16_3.y;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_8.z = u_xlat16_4.y;
                u_xlat16_8.w = u_xlat16_47.y;
                u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
                u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
                u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
                u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
                u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
                u_xlat16_3.w = u_xlat16_4.x;
                u_xlat16_5 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
                u_xlat16_8.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
                u_xlat16_4.w = u_xlat16_3.y;
                u_xlat16_3.yw = u_xlat16_4.yz;
                u_xlat16_9 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
                u_xlat16_4 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
                u_xlat16_3 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
                u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
                u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
                u_xlat16_46.x = u_xlat16_2.y * u_xlat16_7.z;
                vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
                vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat1.w);
                u_xlat10_41 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
                u_xlat16_66 = u_xlat10_41 * u_xlat16_10.y;
                u_xlat16_66 = u_xlat16_10.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
                u_xlat16_66 = u_xlat16_10.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
                u_xlat16_66 = u_xlat16_10.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
                u_xlat16_66 = u_xlat16_11.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
                u_xlat16_66 = u_xlat16_11.y * u_xlat10_60 + u_xlat16_66;
                vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
                u_xlat16_66 = u_xlat16_11.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
                u_xlat16_66 = u_xlat16_11.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
                u_xlat16_26.x = u_xlat16_46.x * u_xlat10_60 + u_xlat16_66;
            } else {
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat16_47.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_48.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.xy = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_8.xy;
                u_xlat16_48.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.zw = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_2.yw;
                u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
                u_xlat16_3.xy = u_xlat16_47.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat16_47.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
                u_xlat16_2.x = u_xlat16_3.y;
                u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_5.y = u_xlat16_47.x;
                u_xlat16_5.w = u_xlat16_4.y;
                u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
                u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_4.y = u_xlat16_47.y;
                u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
                u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
                u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
                u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
                u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
                u_xlat16_7.xzw = u_xlat16_5.yzw;
                u_xlat16_7.y = u_xlat16_4.x;
                u_xlat16_8 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_9.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.y = u_xlat16_7.y;
                u_xlat16_7.y = u_xlat16_4.z;
                u_xlat16_10 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_49.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.z = u_xlat16_7.y;
                u_xlat16_11 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
                u_xlat16_7.y = u_xlat16_4.w;
                u_xlat16_12 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_13.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_53.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
                u_xlat16_4.xzw = u_xlat16_7.xzw;
                u_xlat16_7 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
                u_xlat16_14.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
                u_xlat16_4.x = u_xlat16_5.x;
                u_xlat16_46.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
                u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
                u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
                u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
                u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
                vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
                vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat1.w);
                u_xlat10_1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
                u_xlat16_8.x = u_xlat10_1.x * u_xlat16_4.y;
                u_xlat16_8.x = u_xlat16_4.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
                u_xlat16_8.x = u_xlat16_4.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
                u_xlat16_8.x = u_xlat16_4.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
                u_xlat16_8.x = u_xlat16_5.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
                u_xlat16_8.x = u_xlat16_5.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec19 = vec3(u_xlat16_49.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
                u_xlat16_8.x = u_xlat16_5.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
                u_xlat16_8.x = u_xlat16_5.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
                u_xlat16_8.x = u_xlat16_15.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
                u_xlat16_8.x = u_xlat16_15.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
                u_xlat16_8.x = u_xlat16_15.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec24 = vec3(u_xlat16_53.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
                u_xlat16_8.x = u_xlat16_15.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
                u_xlat16_7.x = u_xlat16_2.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
                u_xlat16_7.x = u_xlat16_2.y * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
                u_xlat16_7.x = u_xlat16_2.z * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec28 = vec3(u_xlat16_46.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
                u_xlat16_26.x = u_xlat16_2.w * u_xlat10_60 + u_xlat16_7.x;
            }
        }
        u_xlat16_46.x = (-u_xlat16_6.x) + 1.0;
        u_xlat16_1 = u_xlat16_26.xxxx * u_xlat16_46.xxxx + u_xlat16_6.xxxx;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb60){
            SV_Target0 = u_xlat16_1;
            return;
        }
        u_xlat60 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_6.x = u_xlat60 + _ShadowStrength;
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
        u_xlat16_6.x = u_xlat16_1.w * u_xlat16_6.x;
    } else {
        u_xlat16_6.x = 1.0;
    }
    u_xlat16.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat60 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat17.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb18.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat19.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat38.xz = (u_xlatb18.y) ? u_xlat19.xy : vs_TEXCOORD2.xy;
    u_xlat19.xyz = texture2D(_Albedo2Map, u_xlat38.xz).xyz;
    u_xlat18.xyw = (u_xlatb18.x) ? u_xlat17.xyz : u_xlat19.xyz;
    u_xlat16_26.xyz = u_xlat18.xyw * _BaseColor2.xyz;
    u_xlat18.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = (u_xlatb18.z) ? u_xlat18.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat18.xyz * _SpColor.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat16.xyz);
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat16.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat16.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat18.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat18.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat19.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat19.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat19.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat18.x = dot(u_xlat19.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16.xxy, u_xlat16.xxy);
    u_xlat16_67 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = vec2(u_xlat16_67) * u_xlat16.xy;
    u_xlat16.xy = u_xlat18.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat18.zy + (-u_xlat16.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_40 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_67 = u_xlat10_40 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat16.xy = (-vec2(u_xlat16_67)) + vec2(1.0, 0.5);
    u_xlat16_67 = u_xlat60 + (-_FenierRange);
    u_xlat16_67 = u_xlat16_67 + u_xlat16.y;
    u_xlat16_67 = u_xlat16_67 * _FenierPow;
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
    u_xlat40 = u_xlat16.x * vs_TEXCOORD0.w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat40 + 1.0;
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
    u_xlat10_16.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_16.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat10_0.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat17.xyz * _BaseColor.xyz + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = vec3(u_xlat16_67) * u_xlat16_9.xyz + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xxx + _SPShadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_67 = (-u_xlat60) + 1.0;
    u_xlat16_67 = log2(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _rimPow;
    u_xlat16_67 = exp2(u_xlat16_67);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowStrength;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_26.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_67) * _rimCol.xyz + u_xlat16_6.xyz;
    u_xlatb0 = _EMISSION_ON==1.0;
    if(u_xlatb0){
        u_xlat10_0.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat16.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat16.xyz = u_xlat10_0.xyz * u_xlat16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat16.xyz;
        u_xlat60 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat60);
        u_xlat60 = _Time.y * _Em_Speed;
        u_xlat60 = sin(u_xlat60);
        u_xlat16.x = (-_EmissionLowestValue) + 1.0;
        u_xlat60 = abs(u_xlat60) * u_xlat16.x + _EmissionLowestValue;
        u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat60) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat0.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec2 u_xlat18;
mediump float u_xlat16_18;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_2.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
        u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U==1.0);
#else
    u_xlatb0 = _Use_2U==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat18.xy);
    u_xlat16_0.xyz = texture(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat16_1.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb27 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb27){
        u_xlat16_1.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _CapTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec2 u_xlat18;
mediump float u_xlat16_18;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_33;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb27 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb27){
#ifdef UNITY_ADRENO_ES3
        u_xlatb27 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb27){
            SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_2.x = u_xlat27 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
        u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_18 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat16_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U==1.0);
#else
    u_xlatb0 = _Use_2U==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat18.xy);
    u_xlat16_0.xyz = texture(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat16_1.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb27 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb27){
        u_xlat16_1.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat16_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat16_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec2 u_xlat18;
lowp float u_xlat10_18;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_2.x = u_xlat27 + _ShadowStrength;
        u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _Use_2U==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat18.xy);
    u_xlat10_0.xyz = texture2D(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat10_1.www * u_xlat0.xyz;
    u_xlatb27 = _EMISSION_ON==1.0;
    if(u_xlatb27){
        u_xlat10_1.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec4 u_xlat4;
bvec3 u_xlatb4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec2 u_xlat18;
lowp float u_xlat10_18;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_33;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat9.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat9.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat9.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlatb27 = _ShadowStrength!=1.0;
    if(u_xlatb27){
        u_xlatb27 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb27){
            SV_Target0 = vec4(1.0, 1.0, 1.0, 1.0);
            return;
        }
        u_xlat27 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_2.x = u_xlat27 + _ShadowStrength;
        u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    } else {
        u_xlat16_2.x = 1.0;
    }
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat3.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb4.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat5.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat13.xz = (u_xlatb4.y) ? u_xlat5.xy : vs_TEXCOORD2.xy;
    u_xlat5.xyz = texture2D(_Albedo2Map, u_xlat13.xz).xyz;
    u_xlat4.xyw = (u_xlatb4.x) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat16_11.xyz = u_xlat4.xyw * _BaseColor2.xyz;
    u_xlat4.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat4.xyz = (u_xlatb4.z) ? u_xlat4.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat4.xyz * _SpColor.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat4.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat5.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat4.y = dot(u_xlat5, vs_TEXCOORD1);
    u_xlat5.y = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat5.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat4.xxy, u_xlat4.xxy);
    u_xlat16_33 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat4.xy * vec2(u_xlat16_33);
    u_xlat1.xy = u_xlat5.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat5.zy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_18 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_33 = u_xlat10_18 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat1.xy = (-vec2(u_xlat16_33)) + vec2(1.0, 0.5);
    u_xlat16_33 = u_xlat27 + (-_FenierRange);
    u_xlat16_33 = u_xlat1.y + u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * _FenierPow;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat18.x = u_xlat1.x * vs_TEXCOORD0.w;
    u_xlat16_33 = (-u_xlat16_33) * u_xlat18.x + 1.0;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat10_1.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_0.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat3.xyz * _BaseColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xxx + _SPShadowColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_33 = (-u_xlat27) + 1.0;
    u_xlat16_33 = log2(u_xlat16_33);
    u_xlat16_33 = u_xlat16_33 * _rimPow;
    u_xlat16_33 = exp2(u_xlat16_33);
    u_xlat16_2.x = u_xlat16_2.x + _ShadowStrength;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_33) * _rimCol.xyz + u_xlat16_2.xyz;
    u_xlatb0 = _Use_2U==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat18.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat18.xy = u_xlat18.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat18.xy);
    u_xlat10_0.xyz = texture2D(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat10_1.www * u_xlat0.xyz;
    u_xlatb27 = _EMISSION_ON==1.0;
    if(u_xlatb27){
        u_xlat10_1.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat3.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat3.xyz = u_xlat10_1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat1.xyz = u_xlat10_1.xyz * u_xlat3.xyz;
        u_xlat27 = max(_Em_Intensity, 0.0);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
        u_xlat27 = _Time.y * _Em_Speed;
        u_xlat27 = sin(u_xlat27);
        u_xlat28 = (-_EmissionLowestValue) + 1.0;
        u_xlat27 = abs(u_xlat27) * u_xlat28 + _EmissionLowestValue;
        u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat27) + u_xlat1.xyz;
    } else {
        u_xlat1.x = float(0.0);
        u_xlat1.y = float(0.0);
        u_xlat1.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _CapTex;
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
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec4 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_26;
vec3 u_xlat38;
vec2 u_xlat40;
mediump float u_xlat16_40;
mediump float u_xlat10_41;
mediump vec2 u_xlat16_46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_53;
float u_xlat60;
mediump float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
float u_xlat76;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat20.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat20.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat60 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat1.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb60 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb60){
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(_ShadowBias.z!=0.0);
#else
        u_xlatb60 = _ShadowBias.z!=0.0;
#endif
        u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat1.x = inversesqrt(u_xlat1.x);
        u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
        u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
        u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * _ShadowBias.z;
        u_xlat1.xyz = (-vs_TEXCOORD4.xyz) * u_xlat1.xxx + vs_TEXCOORD1.xyz;
        u_xlat1.xyz = (bool(u_xlatb60)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
        u_xlat3 = u_xlat1.yyyy * u_xlat3;
        u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
        u_xlat1 = u_xlat5 + u_xlat1;
        u_xlat60 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
        u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
        u_xlat60 = (-u_xlat60) + u_xlat1.z;
        u_xlat3.x = max((-u_xlat1.w), u_xlat60);
        u_xlat3.x = (-u_xlat60) + u_xlat3.x;
        u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat60;
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(_softShadowQuality==1.0);
#else
        u_xlatb60 = _softShadowQuality==1.0;
#endif
        if(u_xlatb60){
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
            u_xlat16_26.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb60 = !!(_softShadowQuality==2.0);
#else
            u_xlatb60 = _softShadowQuality==2.0;
#endif
            if(u_xlatb60){
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_47.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_48.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_48.xy;
                u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
                u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
                u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
                u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_4.xy = u_xlat16_48.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
                u_xlat16_3.z = u_xlat16_5.x;
                u_xlat16_3.w = u_xlat16_7.x;
                u_xlat16_4.z = u_xlat16_8.x;
                u_xlat16_4.w = u_xlat16_47.x;
                u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
                u_xlat16_5.z = u_xlat16_3.y;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_8.z = u_xlat16_4.y;
                u_xlat16_8.w = u_xlat16_47.y;
                u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
                u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
                u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
                u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
                u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
                u_xlat16_3.w = u_xlat16_4.x;
                u_xlat16_5 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
                u_xlat16_8.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
                u_xlat16_4.w = u_xlat16_3.y;
                u_xlat16_3.yw = u_xlat16_4.yz;
                u_xlat16_9 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
                u_xlat16_4 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
                u_xlat16_3 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
                u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
                u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
                u_xlat16_46.x = u_xlat16_2.y * u_xlat16_7.z;
                vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat1.w);
                u_xlat10_41 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
                u_xlat16_66 = u_xlat10_41 * u_xlat16_10.y;
                u_xlat16_66 = u_xlat16_10.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
                u_xlat16_66 = u_xlat16_10.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
                u_xlat16_66 = u_xlat16_10.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
                u_xlat16_66 = u_xlat16_11.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
                u_xlat16_66 = u_xlat16_11.y * u_xlat10_60 + u_xlat16_66;
                vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
                u_xlat16_66 = u_xlat16_11.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
                u_xlat16_66 = u_xlat16_11.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
                u_xlat16_26.x = u_xlat16_46.x * u_xlat10_60 + u_xlat16_66;
            } else {
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat16_47.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_48.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.xy = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_8.xy;
                u_xlat16_48.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.zw = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_2.yw;
                u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
                u_xlat16_3.xy = u_xlat16_47.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat16_47.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
                u_xlat16_2.x = u_xlat16_3.y;
                u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_5.y = u_xlat16_47.x;
                u_xlat16_5.w = u_xlat16_4.y;
                u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
                u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_4.y = u_xlat16_47.y;
                u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
                u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
                u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
                u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
                u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
                u_xlat16_7.xzw = u_xlat16_5.yzw;
                u_xlat16_7.y = u_xlat16_4.x;
                u_xlat16_8 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_9.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.y = u_xlat16_7.y;
                u_xlat16_7.y = u_xlat16_4.z;
                u_xlat16_10 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_49.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.z = u_xlat16_7.y;
                u_xlat16_11 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
                u_xlat16_7.y = u_xlat16_4.w;
                u_xlat16_12 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_13.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_53.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
                u_xlat16_4.xzw = u_xlat16_7.xzw;
                u_xlat16_7 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
                u_xlat16_14.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
                u_xlat16_4.x = u_xlat16_5.x;
                u_xlat16_46.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
                u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
                u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
                u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
                u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
                vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat1.w);
                u_xlat10_1 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
                u_xlat16_8.x = u_xlat10_1 * u_xlat16_4.y;
                u_xlat16_8.x = u_xlat16_4.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
                u_xlat16_8.x = u_xlat16_4.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
                u_xlat16_8.x = u_xlat16_4.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
                u_xlat16_8.x = u_xlat16_5.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
                u_xlat16_8.x = u_xlat16_5.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec19 = vec3(u_xlat16_49.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
                u_xlat16_8.x = u_xlat16_5.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
                u_xlat16_8.x = u_xlat16_5.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
                u_xlat16_8.x = u_xlat16_15.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
                u_xlat16_8.x = u_xlat16_15.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
                u_xlat16_8.x = u_xlat16_15.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec24 = vec3(u_xlat16_53.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
                u_xlat16_8.x = u_xlat16_15.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
                u_xlat16_7.x = u_xlat16_2.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
                u_xlat16_7.x = u_xlat16_2.y * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
                u_xlat16_7.x = u_xlat16_2.z * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec28 = vec3(u_xlat16_46.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
                u_xlat16_26.x = u_xlat16_2.w * u_xlat10_60 + u_xlat16_7.x;
            }
        }
        u_xlat16_46.x = (-u_xlat16_6.x) + 1.0;
        u_xlat16_1 = u_xlat16_26.xxxx * u_xlat16_46.xxxx + u_xlat16_6.xxxx;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb60){
            SV_Target0 = u_xlat16_1;
            return;
        }
        u_xlat60 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_6.x = u_xlat60 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
        u_xlat16_6.x = u_xlat16_1.w * u_xlat16_6.x;
    } else {
        u_xlat16_6.x = 1.0;
    }
    u_xlat16.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat60 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat17.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb18.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat19.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat38.xz = (u_xlatb18.y) ? u_xlat19.xy : vs_TEXCOORD2.xy;
    u_xlat19.xyz = texture(_Albedo2Map, u_xlat38.xz).xyz;
    u_xlat18.xyw = (u_xlatb18.x) ? u_xlat17.xyz : u_xlat19.xyz;
    u_xlat16_26.xyz = u_xlat18.xyw * _BaseColor2.xyz;
    u_xlat18.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = (u_xlatb18.z) ? u_xlat18.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat18.xyz * _SpColor.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat16.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat16.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat18.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat18.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat19.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat19.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat19.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat18.x = dot(u_xlat19.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16.xxy, u_xlat16.xxy);
    u_xlat16_67 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = vec2(u_xlat16_67) * u_xlat16.xy;
    u_xlat16.xy = u_xlat18.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat18.zy + (-u_xlat16.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_40 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_67 = u_xlat16_40 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat16.xy = (-vec2(u_xlat16_67)) + vec2(1.0, 0.5);
    u_xlat16_67 = u_xlat60 + (-_FenierRange);
    u_xlat16_67 = u_xlat16_67 + u_xlat16.y;
    u_xlat16_67 = u_xlat16_67 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat40.x = u_xlat16.x * vs_TEXCOORD0.w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat40.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_16.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_0.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat17.xyz * _BaseColor.xyz + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = vec3(u_xlat16_67) * u_xlat16_9.xyz + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xxx + _SPShadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_67 = (-u_xlat60) + 1.0;
    u_xlat16_67 = log2(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _rimPow;
    u_xlat16_67 = exp2(u_xlat16_67);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_26.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_67) * _rimCol.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U==1.0);
#else
    u_xlatb0 = _Use_2U==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat40.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat40.xy = u_xlat40.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat40.xy);
    u_xlat16_0.xyz = texture(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat16_1.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb60 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb60){
        u_xlat16_16.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat17.xyz = u_xlat16_16.xyz * u_xlat17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat16.xyz = u_xlat16_16.xyz * u_xlat17.xyz;
        u_xlat60 = max(_Em_Intensity, 0.0);
        u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
        u_xlat60 = _Time.y * _Em_Speed;
        u_xlat60 = sin(u_xlat60);
        u_xlat76 = (-_EmissionLowestValue) + 1.0;
        u_xlat60 = abs(u_xlat60) * u_xlat76 + _EmissionLowestValue;
        u_xlat16.xyz = (-u_xlat16.xyz) * vec3(u_xlat60) + u_xlat16.xyz;
    } else {
        u_xlat16.x = float(0.0);
        u_xlat16.y = float(0.0);
        u_xlat16.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat16.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat0.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _Albedo2Map;
UNITY_LOCATION(3) uniform mediump sampler2D _SpecularMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RfCapTex;
UNITY_LOCATION(6) uniform mediump sampler2D _CapTex;
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
in highp vec2 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
vec4 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_26;
vec3 u_xlat38;
vec2 u_xlat40;
mediump float u_xlat16_40;
mediump float u_xlat10_41;
mediump vec2 u_xlat16_46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_53;
float u_xlat60;
mediump float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
float u_xlat76;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat20.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat20.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat60 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat1.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_ShadowStrength!=1.0);
#else
    u_xlatb60 = _ShadowStrength!=1.0;
#endif
    if(u_xlatb60){
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(_ShadowBias.z!=0.0);
#else
        u_xlatb60 = _ShadowBias.z!=0.0;
#endif
        u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat1.x = inversesqrt(u_xlat1.x);
        u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
        u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
        u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * _ShadowBias.z;
        u_xlat1.xyz = (-vs_TEXCOORD4.xyz) * u_xlat1.xxx + vs_TEXCOORD1.xyz;
        u_xlat1.xyz = (bool(u_xlatb60)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
        u_xlat3 = u_xlat1.yyyy * u_xlat3;
        u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
        u_xlat1 = u_xlat5 + u_xlat1;
        u_xlat60 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
        u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
        u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
        u_xlat60 = (-u_xlat60) + u_xlat1.z;
        u_xlat3.x = max((-u_xlat1.w), u_xlat60);
        u_xlat3.x = (-u_xlat60) + u_xlat3.x;
        u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat60;
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(_softShadowQuality==1.0);
#else
        u_xlatb60 = _softShadowQuality==1.0;
#endif
        if(u_xlatb60){
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
            u_xlat16_26.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb60 = !!(_softShadowQuality==2.0);
#else
            u_xlatb60 = _softShadowQuality==2.0;
#endif
            if(u_xlatb60){
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_47.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_48.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_48.xy;
                u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
                u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
                u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
                u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_4.xy = u_xlat16_48.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
                u_xlat16_3.z = u_xlat16_5.x;
                u_xlat16_3.w = u_xlat16_7.x;
                u_xlat16_4.z = u_xlat16_8.x;
                u_xlat16_4.w = u_xlat16_47.x;
                u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
                u_xlat16_5.z = u_xlat16_3.y;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_8.z = u_xlat16_4.y;
                u_xlat16_8.w = u_xlat16_47.y;
                u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
                u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
                u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
                u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
                u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
                u_xlat16_3.w = u_xlat16_4.x;
                u_xlat16_5 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
                u_xlat16_8.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
                u_xlat16_4.w = u_xlat16_3.y;
                u_xlat16_3.yw = u_xlat16_4.yz;
                u_xlat16_9 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
                u_xlat16_4 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
                u_xlat16_3 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
                u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
                u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
                u_xlat16_46.x = u_xlat16_2.y * u_xlat16_7.z;
                vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
                vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat1.w);
                u_xlat10_41 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
                u_xlat16_66 = u_xlat10_41 * u_xlat16_10.y;
                u_xlat16_66 = u_xlat16_10.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
                u_xlat16_66 = u_xlat16_10.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
                u_xlat16_66 = u_xlat16_10.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
                u_xlat16_66 = u_xlat16_11.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
                u_xlat16_66 = u_xlat16_11.y * u_xlat10_60 + u_xlat16_66;
                vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
                u_xlat16_66 = u_xlat16_11.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
                u_xlat16_66 = u_xlat16_11.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
                u_xlat16_26.x = u_xlat16_46.x * u_xlat10_60 + u_xlat16_66;
            } else {
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat16_47.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_48.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.xy = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_8.xy;
                u_xlat16_48.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.zw = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_2.yw;
                u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
                u_xlat16_3.xy = u_xlat16_47.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat16_47.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
                u_xlat16_2.x = u_xlat16_3.y;
                u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_5.y = u_xlat16_47.x;
                u_xlat16_5.w = u_xlat16_4.y;
                u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
                u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_4.y = u_xlat16_47.y;
                u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
                u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
                u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
                u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
                u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
                u_xlat16_7.xzw = u_xlat16_5.yzw;
                u_xlat16_7.y = u_xlat16_4.x;
                u_xlat16_8 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_9.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.y = u_xlat16_7.y;
                u_xlat16_7.y = u_xlat16_4.z;
                u_xlat16_10 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_49.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.z = u_xlat16_7.y;
                u_xlat16_11 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
                u_xlat16_7.y = u_xlat16_4.w;
                u_xlat16_12 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_13.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_53.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
                u_xlat16_4.xzw = u_xlat16_7.xzw;
                u_xlat16_7 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
                u_xlat16_14.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
                u_xlat16_4.x = u_xlat16_5.x;
                u_xlat16_46.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
                u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
                u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
                u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
                u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
                vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
                vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat1.w);
                u_xlat10_1 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
                u_xlat16_8.x = u_xlat10_1 * u_xlat16_4.y;
                u_xlat16_8.x = u_xlat16_4.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
                u_xlat16_8.x = u_xlat16_4.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
                u_xlat16_8.x = u_xlat16_4.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
                u_xlat16_8.x = u_xlat16_5.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
                u_xlat16_8.x = u_xlat16_5.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec19 = vec3(u_xlat16_49.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
                u_xlat16_8.x = u_xlat16_5.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
                u_xlat16_8.x = u_xlat16_5.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
                u_xlat16_8.x = u_xlat16_15.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
                u_xlat16_8.x = u_xlat16_15.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
                u_xlat16_8.x = u_xlat16_15.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec24 = vec3(u_xlat16_53.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
                u_xlat16_8.x = u_xlat16_15.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
                u_xlat16_7.x = u_xlat16_2.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
                u_xlat16_7.x = u_xlat16_2.y * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
                u_xlat16_7.x = u_xlat16_2.z * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec28 = vec3(u_xlat16_46.xy,u_xlat1.w);
                u_xlat10_60 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
                u_xlat16_26.x = u_xlat16_2.w * u_xlat10_60 + u_xlat16_7.x;
            }
        }
        u_xlat16_46.x = (-u_xlat16_6.x) + 1.0;
        u_xlat16_1 = u_xlat16_26.xxxx * u_xlat16_46.xxxx + u_xlat16_6.xxxx;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
#endif
        if(u_xlatb60){
            SV_Target0 = u_xlat16_1;
            return;
        }
        u_xlat60 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_6.x = u_xlat60 + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
        u_xlat16_6.x = u_xlat16_1.w * u_xlat16_6.x;
    } else {
        u_xlat16_6.x = 1.0;
    }
    u_xlat16.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat60 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat17.xyz = texture(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb18.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat19.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat38.xz = (u_xlatb18.y) ? u_xlat19.xy : vs_TEXCOORD2.xy;
    u_xlat19.xyz = texture(_Albedo2Map, u_xlat38.xz).xyz;
    u_xlat18.xyw = (u_xlatb18.x) ? u_xlat17.xyz : u_xlat19.xyz;
    u_xlat16_26.xyz = u_xlat18.xyw * _BaseColor2.xyz;
    u_xlat18.xyw = texture(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = (u_xlatb18.z) ? u_xlat18.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat18.xyz * _SpColor.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat16.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat16.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat18.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat18.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat19.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat19.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat19.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat18.x = dot(u_xlat19.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16.xxy, u_xlat16.xxy);
    u_xlat16_67 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = vec2(u_xlat16_67) * u_xlat16.xy;
    u_xlat16.xy = u_xlat18.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat18.zy + (-u_xlat16.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat16_40 = texture(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_67 = u_xlat16_40 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat16.xy = (-vec2(u_xlat16_67)) + vec2(1.0, 0.5);
    u_xlat16_67 = u_xlat60 + (-_FenierRange);
    u_xlat16_67 = u_xlat16_67 + u_xlat16.y;
    u_xlat16_67 = u_xlat16_67 * _FenierPow;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat40.x = u_xlat16.x * vs_TEXCOORD0.w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat40.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = texture(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_16.xyz * _RfColor.xyz;
    u_xlat16_0.xyz = texture(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_0.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat17.xyz * _BaseColor.xyz + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = vec3(u_xlat16_67) * u_xlat16_9.xyz + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xxx + _SPShadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_67 = (-u_xlat60) + 1.0;
    u_xlat16_67 = log2(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _rimPow;
    u_xlat16_67 = exp2(u_xlat16_67);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_26.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_67) * _rimCol.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U==1.0);
#else
    u_xlatb0 = _Use_2U==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat40.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat40.xy = u_xlat40.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_1 = texture(_LG_Tex, u_xlat40.xy);
    u_xlat16_0.xyz = texture(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat16_1.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb60 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb60){
        u_xlat16_16.xyz = texture(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat17.xyz = u_xlat16_16.xyz * u_xlat17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat16.xyz = u_xlat16_16.xyz * u_xlat17.xyz;
        u_xlat60 = max(_Em_Intensity, 0.0);
        u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
        u_xlat60 = _Time.y * _Em_Speed;
        u_xlat60 = sin(u_xlat60);
        u_xlat76 = (-_EmissionLowestValue) + 1.0;
        u_xlat60 = abs(u_xlat60) * u_xlat76 + _EmissionLowestValue;
        u_xlat16.xyz = (-u_xlat16.xyz) * vec3(u_xlat60) + u_xlat16.xyz;
    } else {
        u_xlat16.x = float(0.0);
        u_xlat16.y = float(0.0);
        u_xlat16.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat16.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat0.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
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
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
vec3 u_xlat17;
vec4 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_26;
vec3 u_xlat38;
vec2 u_xlat40;
lowp float u_xlat10_40;
lowp float u_xlat10_41;
mediump vec2 u_xlat16_46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_53;
float u_xlat60;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
float u_xlat76;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat20.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat20.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat60 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat1.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlatb60 = _ShadowStrength!=1.0;
    if(u_xlatb60){
        u_xlatb60 = _ShadowBias.z!=0.0;
        u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat1.x = inversesqrt(u_xlat1.x);
        u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
        u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
        u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * _ShadowBias.z;
        u_xlat1.xyz = (-vs_TEXCOORD4.xyz) * u_xlat1.xxx + vs_TEXCOORD1.xyz;
        u_xlat1.xyz = (bool(u_xlatb60)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
        u_xlat3 = u_xlat1.yyyy * u_xlat3;
        u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
        u_xlat1 = u_xlat5 + u_xlat1;
        u_xlat60 = _ShadowBias.x / u_xlat1.w;
        u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
        u_xlat60 = (-u_xlat60) + u_xlat1.z;
        u_xlat3.x = max((-u_xlat1.w), u_xlat60);
        u_xlat3.x = (-u_xlat60) + u_xlat3.x;
        u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat60;
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlatb60 = _softShadowQuality==1.0;
        if(u_xlatb60){
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
            u_xlat16_26.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb60 = _softShadowQuality==2.0;
            if(u_xlatb60){
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_47.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_48.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_48.xy;
                u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
                u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
                u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
                u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_4.xy = u_xlat16_48.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
                u_xlat16_3.z = u_xlat16_5.x;
                u_xlat16_3.w = u_xlat16_7.x;
                u_xlat16_4.z = u_xlat16_8.x;
                u_xlat16_4.w = u_xlat16_47.x;
                u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
                u_xlat16_5.z = u_xlat16_3.y;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_8.z = u_xlat16_4.y;
                u_xlat16_8.w = u_xlat16_47.y;
                u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
                u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
                u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
                u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
                u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
                u_xlat16_3.w = u_xlat16_4.x;
                u_xlat16_5 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
                u_xlat16_8.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
                u_xlat16_4.w = u_xlat16_3.y;
                u_xlat16_3.yw = u_xlat16_4.yz;
                u_xlat16_9 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
                u_xlat16_4 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
                u_xlat16_3 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
                u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
                u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
                u_xlat16_46.x = u_xlat16_2.y * u_xlat16_7.z;
                vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
                vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat1.w);
                u_xlat10_41 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
                u_xlat16_66 = u_xlat10_41 * u_xlat16_10.y;
                u_xlat16_66 = u_xlat16_10.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
                u_xlat16_66 = u_xlat16_10.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
                u_xlat16_66 = u_xlat16_10.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
                u_xlat16_66 = u_xlat16_11.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
                u_xlat16_66 = u_xlat16_11.y * u_xlat10_60 + u_xlat16_66;
                vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
                u_xlat16_66 = u_xlat16_11.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
                u_xlat16_66 = u_xlat16_11.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
                u_xlat16_26.x = u_xlat16_46.x * u_xlat10_60 + u_xlat16_66;
            } else {
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat16_47.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_48.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.xy = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_8.xy;
                u_xlat16_48.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.zw = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_2.yw;
                u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
                u_xlat16_3.xy = u_xlat16_47.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat16_47.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
                u_xlat16_2.x = u_xlat16_3.y;
                u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_5.y = u_xlat16_47.x;
                u_xlat16_5.w = u_xlat16_4.y;
                u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
                u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_4.y = u_xlat16_47.y;
                u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
                u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
                u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
                u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
                u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
                u_xlat16_7.xzw = u_xlat16_5.yzw;
                u_xlat16_7.y = u_xlat16_4.x;
                u_xlat16_8 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_9.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.y = u_xlat16_7.y;
                u_xlat16_7.y = u_xlat16_4.z;
                u_xlat16_10 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_49.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.z = u_xlat16_7.y;
                u_xlat16_11 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
                u_xlat16_7.y = u_xlat16_4.w;
                u_xlat16_12 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_13.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_53.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
                u_xlat16_4.xzw = u_xlat16_7.xzw;
                u_xlat16_7 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
                u_xlat16_14.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
                u_xlat16_4.x = u_xlat16_5.x;
                u_xlat16_46.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
                u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
                u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
                u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
                u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
                vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
                vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat1.w);
                u_xlat10_1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
                u_xlat16_8.x = u_xlat10_1.x * u_xlat16_4.y;
                u_xlat16_8.x = u_xlat16_4.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
                u_xlat16_8.x = u_xlat16_4.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
                u_xlat16_8.x = u_xlat16_4.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
                u_xlat16_8.x = u_xlat16_5.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
                u_xlat16_8.x = u_xlat16_5.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec19 = vec3(u_xlat16_49.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
                u_xlat16_8.x = u_xlat16_5.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
                u_xlat16_8.x = u_xlat16_5.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
                u_xlat16_8.x = u_xlat16_15.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
                u_xlat16_8.x = u_xlat16_15.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
                u_xlat16_8.x = u_xlat16_15.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec24 = vec3(u_xlat16_53.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
                u_xlat16_8.x = u_xlat16_15.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
                u_xlat16_7.x = u_xlat16_2.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
                u_xlat16_7.x = u_xlat16_2.y * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
                u_xlat16_7.x = u_xlat16_2.z * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec28 = vec3(u_xlat16_46.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
                u_xlat16_26.x = u_xlat16_2.w * u_xlat10_60 + u_xlat16_7.x;
            }
        }
        u_xlat16_46.x = (-u_xlat16_6.x) + 1.0;
        u_xlat16_1 = u_xlat16_26.xxxx * u_xlat16_46.xxxx + u_xlat16_6.xxxx;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb60){
            SV_Target0 = u_xlat16_1;
            return;
        }
        u_xlat60 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_6.x = u_xlat60 + _ShadowStrength;
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
        u_xlat16_6.x = u_xlat16_1.w * u_xlat16_6.x;
    } else {
        u_xlat16_6.x = 1.0;
    }
    u_xlat16.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat60 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat17.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb18.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat19.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat38.xz = (u_xlatb18.y) ? u_xlat19.xy : vs_TEXCOORD2.xy;
    u_xlat19.xyz = texture2D(_Albedo2Map, u_xlat38.xz).xyz;
    u_xlat18.xyw = (u_xlatb18.x) ? u_xlat17.xyz : u_xlat19.xyz;
    u_xlat16_26.xyz = u_xlat18.xyw * _BaseColor2.xyz;
    u_xlat18.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = (u_xlatb18.z) ? u_xlat18.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat18.xyz * _SpColor.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat16.xyz);
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat16.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat16.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat18.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat18.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat19.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat19.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat19.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat18.x = dot(u_xlat19.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16.xxy, u_xlat16.xxy);
    u_xlat16_67 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = vec2(u_xlat16_67) * u_xlat16.xy;
    u_xlat16.xy = u_xlat18.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat18.zy + (-u_xlat16.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_40 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_67 = u_xlat10_40 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat16.xy = (-vec2(u_xlat16_67)) + vec2(1.0, 0.5);
    u_xlat16_67 = u_xlat60 + (-_FenierRange);
    u_xlat16_67 = u_xlat16_67 + u_xlat16.y;
    u_xlat16_67 = u_xlat16_67 * _FenierPow;
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
    u_xlat40.x = u_xlat16.x * vs_TEXCOORD0.w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat40.x + 1.0;
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
    u_xlat10_16.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_16.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat10_0.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat17.xyz * _BaseColor.xyz + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = vec3(u_xlat16_67) * u_xlat16_9.xyz + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xxx + _SPShadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_67 = (-u_xlat60) + 1.0;
    u_xlat16_67 = log2(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _rimPow;
    u_xlat16_67 = exp2(u_xlat16_67);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowStrength;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_26.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_67) * _rimCol.xyz + u_xlat16_6.xyz;
    u_xlatb0 = _Use_2U==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat40.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat40.xy = u_xlat40.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat40.xy);
    u_xlat10_0.xyz = texture2D(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat10_1.www * u_xlat0.xyz;
    u_xlatb60 = _EMISSION_ON==1.0;
    if(u_xlatb60){
        u_xlat10_16.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat17.xyz = u_xlat10_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat17.xyz = u_xlat10_16.xyz * u_xlat17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat16.xyz = u_xlat10_16.xyz * u_xlat17.xyz;
        u_xlat60 = max(_Em_Intensity, 0.0);
        u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
        u_xlat60 = _Time.y * _Em_Speed;
        u_xlat60 = sin(u_xlat60);
        u_xlat76 = (-_EmissionLowestValue) + 1.0;
        u_xlat60 = abs(u_xlat60) * u_xlat76 + _EmissionLowestValue;
        u_xlat16.xyz = (-u_xlat16.xyz) * vec3(u_xlat60) + u_xlat16.xyz;
    } else {
        u_xlat16.x = float(0.0);
        u_xlat16.y = float(0.0);
        u_xlat16.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat16.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat0.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
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
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _ShowShadow;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseColor2;
uniform 	mediump vec4 _RfColor;
uniform 	mediump vec4 _SpColor;
uniform 	mediump float _FenierRange;
uniform 	mediump float _FenierPow;
uniform 	mediump vec2 _MaskRange;
uniform 	mediump vec4 _g_EnvmapIntensity;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec3 _SPShadowColor;
uniform 	mediump vec3 _rimCol;
uniform 	mediump float _rimPow;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _Albedo2Map_ST;
uniform 	mediump float _ExposureScale;
uniform 	mediump float _UseAlbedoReplaceAlbedo2;
uniform 	mediump float _UseSpecularMap;
uniform 	mediump float _AlbedoUseUV3;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	mediump float _EmissionLowestValue;
uniform 	float _Use_2U;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump float _U_LG;
uniform 	mediump float _V_LG;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _AlbedoMap;
uniform lowp sampler2D _Albedo2Map;
uniform lowp sampler2D _SpecularMap;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _RfCapTex;
uniform lowp sampler2D _CapTex;
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
varying highp vec2 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
vec3 u_xlat17;
vec4 u_xlat18;
bvec3 u_xlatb18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_26;
vec3 u_xlat38;
vec2 u_xlat40;
lowp float u_xlat10_40;
lowp float u_xlat10_41;
mediump vec2 u_xlat16_46;
mediump vec2 u_xlat16_47;
mediump vec2 u_xlat16_48;
mediump vec2 u_xlat16_49;
mediump vec2 u_xlat16_53;
float u_xlat60;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
float u_xlat76;
void main()
{
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD3.w;
    u_xlat20.xyz = vs_TEXCOORD3.yzx * vs_TEXCOORD4.zxy;
    u_xlat20.xyz = vs_TEXCOORD4.yzx * vs_TEXCOORD3.zxy + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat20.xyz;
    u_xlat1.xy = vs_TEXCOORD2.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat60 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat1.xyz = vec3(u_xlat60) * u_xlat16_2.xyz;
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat0.xyz = u_xlat1.yyy * u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlatb60 = _ShadowStrength!=1.0;
    if(u_xlatb60){
        u_xlatb60 = _ShadowBias.z!=0.0;
        u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat1.x = inversesqrt(u_xlat1.x);
        u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
        u_xlat1.x = dot(vs_TEXCOORD4.xyz, u_xlat1.xyz);
        u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * _ShadowBias.z;
        u_xlat1.xyz = (-vs_TEXCOORD4.xyz) * u_xlat1.xxx + vs_TEXCOORD1.xyz;
        u_xlat1.xyz = (bool(u_xlatb60)) ? u_xlat1.xyz : vs_TEXCOORD1.xyz;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
        u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
        u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
        u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
        u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
        u_xlat3 = u_xlat1.yyyy * u_xlat3;
        u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
        u_xlat1 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
        u_xlat1 = u_xlat5 + u_xlat1;
        u_xlat60 = _ShadowBias.x / u_xlat1.w;
        u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
        u_xlat60 = (-u_xlat60) + u_xlat1.z;
        u_xlat3.x = max((-u_xlat1.w), u_xlat60);
        u_xlat3.x = (-u_xlat60) + u_xlat3.x;
        u_xlat1.z = _ShadowBias.y * u_xlat3.x + u_xlat60;
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
        u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
        u_xlatb60 = _softShadowQuality==1.0;
        if(u_xlatb60){
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
            u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
            u_xlat3.z = 0.0;
            u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
            vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
            u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
            u_xlat16_26.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        } else {
            u_xlatb60 = _softShadowQuality==2.0;
            if(u_xlatb60){
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_47.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
                u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_48.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_48.xy;
                u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
                u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
                u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
                u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_4.xy = u_xlat16_48.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
                u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
                u_xlat16_3.z = u_xlat16_5.x;
                u_xlat16_3.w = u_xlat16_7.x;
                u_xlat16_4.z = u_xlat16_8.x;
                u_xlat16_4.w = u_xlat16_47.x;
                u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
                u_xlat16_5.z = u_xlat16_3.y;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_8.z = u_xlat16_4.y;
                u_xlat16_8.w = u_xlat16_47.y;
                u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
                u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
                u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
                u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
                u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
                u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
                u_xlat16_3.w = u_xlat16_4.x;
                u_xlat16_5 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
                u_xlat16_8.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
                u_xlat16_4.w = u_xlat16_3.y;
                u_xlat16_3.yw = u_xlat16_4.yz;
                u_xlat16_9 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
                u_xlat16_4 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
                u_xlat16_3 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
                u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
                u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
                u_xlat16_46.x = u_xlat16_2.y * u_xlat16_7.z;
                vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
                vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat1.w);
                u_xlat10_41 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
                u_xlat16_66 = u_xlat10_41 * u_xlat16_10.y;
                u_xlat16_66 = u_xlat16_10.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
                u_xlat16_66 = u_xlat16_10.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
                u_xlat16_66 = u_xlat16_10.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
                u_xlat16_66 = u_xlat16_11.x * u_xlat10_60 + u_xlat16_66;
                vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
                u_xlat16_66 = u_xlat16_11.y * u_xlat10_60 + u_xlat16_66;
                vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
                u_xlat16_66 = u_xlat16_11.z * u_xlat10_60 + u_xlat16_66;
                vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
                u_xlat16_66 = u_xlat16_11.w * u_xlat10_60 + u_xlat16_66;
                vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
                u_xlat16_26.x = u_xlat16_46.x * u_xlat10_60 + u_xlat16_66;
            } else {
                u_xlat16_46.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
                u_xlat16_46.xy = floor(u_xlat16_46.xy);
                u_xlat16_7.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_46.xy);
                u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
                u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
                u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
                u_xlat16_47.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
                u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
                u_xlat16_48.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.xy = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_8.xy;
                u_xlat16_48.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
                u_xlat16_8.zw = (-u_xlat16_48.xy) * u_xlat16_48.xy + u_xlat16_2.yw;
                u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
                u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
                u_xlat16_3.xy = u_xlat16_47.yx * vec2(0.0816320032, 0.0816320032);
                u_xlat16_47.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
                u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
                u_xlat16_2.x = u_xlat16_3.y;
                u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_5.y = u_xlat16_47.x;
                u_xlat16_5.w = u_xlat16_4.y;
                u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
                u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
                u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
                u_xlat16_4.y = u_xlat16_47.y;
                u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
                u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
                u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
                u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
                u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
                u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
                u_xlat16_7.xzw = u_xlat16_5.yzw;
                u_xlat16_7.y = u_xlat16_4.x;
                u_xlat16_8 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_9.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.y = u_xlat16_7.y;
                u_xlat16_7.y = u_xlat16_4.z;
                u_xlat16_10 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_49.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.z = u_xlat16_7.y;
                u_xlat16_11 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
                u_xlat16_7.y = u_xlat16_4.w;
                u_xlat16_12 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
                u_xlat16_13.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
                u_xlat16_5.w = u_xlat16_7.y;
                u_xlat16_53.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
                u_xlat16_4.xzw = u_xlat16_7.xzw;
                u_xlat16_7 = u_xlat16_46.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
                u_xlat16_14.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
                u_xlat16_4.x = u_xlat16_5.x;
                u_xlat16_46.xy = u_xlat16_46.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
                u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
                u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
                u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
                u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
                vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
                vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat1.w);
                u_xlat10_1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
                u_xlat16_8.x = u_xlat10_1.x * u_xlat16_4.y;
                u_xlat16_8.x = u_xlat16_4.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
                u_xlat16_8.x = u_xlat16_4.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
                u_xlat16_8.x = u_xlat16_4.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
                u_xlat16_8.x = u_xlat16_5.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
                u_xlat16_8.x = u_xlat16_5.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec19 = vec3(u_xlat16_49.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
                u_xlat16_8.x = u_xlat16_5.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
                u_xlat16_8.x = u_xlat16_5.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
                u_xlat16_8.x = u_xlat16_15.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
                u_xlat16_8.x = u_xlat16_15.y * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
                u_xlat16_8.x = u_xlat16_15.z * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec24 = vec3(u_xlat16_53.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
                u_xlat16_8.x = u_xlat16_15.w * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
                u_xlat16_7.x = u_xlat16_2.x * u_xlat10_60 + u_xlat16_8.x;
                vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
                u_xlat16_7.x = u_xlat16_2.y * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
                u_xlat16_7.x = u_xlat16_2.z * u_xlat10_60 + u_xlat16_7.x;
                vec3 txVec28 = vec3(u_xlat16_46.xy,u_xlat1.w);
                u_xlat10_60 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
                u_xlat16_26.x = u_xlat16_2.w * u_xlat10_60 + u_xlat16_7.x;
            }
        }
        u_xlat16_46.x = (-u_xlat16_6.x) + 1.0;
        u_xlat16_1 = u_xlat16_26.xxxx * u_xlat16_46.xxxx + u_xlat16_6.xxxx;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowShadow);
        if(u_xlatb60){
            SV_Target0 = u_xlat16_1;
            return;
        }
        u_xlat60 = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat16_6.x = u_xlat60 + _ShadowStrength;
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
        u_xlat16_6.x = u_xlat16_1.w * u_xlat16_6.x;
    } else {
        u_xlat16_6.x = 1.0;
    }
    u_xlat16.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat60 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat16.xyz = vec3(u_xlat60) * u_xlat16.xyz;
    u_xlat17.xyz = texture2D(_AlbedoMap, vs_TEXCOORD2.xy).xyz;
    u_xlatb18.xyz = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseAlbedoReplaceAlbedo2, _AlbedoUseUV3, _UseSpecularMap, _UseAlbedoReplaceAlbedo2)).xyz;
    u_xlat19.xy = vs_TEXCOORD5.xy * _Albedo2Map_ST.xy + _Albedo2Map_ST.zw;
    u_xlat38.xz = (u_xlatb18.y) ? u_xlat19.xy : vs_TEXCOORD2.xy;
    u_xlat19.xyz = texture2D(_Albedo2Map, u_xlat38.xz).xyz;
    u_xlat18.xyw = (u_xlatb18.x) ? u_xlat17.xyz : u_xlat19.xyz;
    u_xlat16_26.xyz = u_xlat18.xyw * _BaseColor2.xyz;
    u_xlat18.xyw = texture2D(_SpecularMap, vs_TEXCOORD2.xy).xyz;
    u_xlat18.xyz = (u_xlatb18.z) ? u_xlat18.xyw : vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat18.xyz * _SpColor.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat16.xyz);
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat1.w = hlslcc_mtx4x4unity_MatrixV[3].x;
    u_xlat16.x = dot(u_xlat1, vs_TEXCOORD1);
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat2.w = hlslcc_mtx4x4unity_MatrixV[3].z;
    u_xlat16.y = dot(u_xlat2, vs_TEXCOORD1);
    u_xlat18.y = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat18.z = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat19.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat19.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat19.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat18.x = dot(u_xlat19.xyz, u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat16.xxy, u_xlat16.xxy);
    u_xlat16_67 = inversesqrt(u_xlat0.x);
    u_xlat0.xy = vec2(u_xlat16_67) * u_xlat16.xy;
    u_xlat16.xy = u_xlat18.yx * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.yx * u_xlat18.zy + (-u_xlat16.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat0.xy = (-u_xlat0.xy);
    u_xlat10_40 = texture2D(_MaskTex, vs_TEXCOORD2.xy).x;
    u_xlat16_67 = u_xlat10_40 * _MaskRange.xxxy.w + _MaskRange.xxxy.z;
    u_xlat16.xy = (-vec2(u_xlat16_67)) + vec2(1.0, 0.5);
    u_xlat16_67 = u_xlat60 + (-_FenierRange);
    u_xlat16_67 = u_xlat16_67 + u_xlat16.y;
    u_xlat16_67 = u_xlat16_67 * _FenierPow;
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
    u_xlat40.x = u_xlat16.x * vs_TEXCOORD0.w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat40.x + 1.0;
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
    u_xlat10_16.xyz = texture2D(_RfCapTex, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_16.xyz * _RfColor.xyz;
    u_xlat10_0.xyz = texture2D(_CapTex, u_xlat0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat10_0.xyz;
    u_xlat16_9.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_9.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat17.xyz * _BaseColor.xyz + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = vec3(u_xlat16_67) * u_xlat16_9.xyz + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_8.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _g_EnvmapIntensity.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xxx + _SPShadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_67 = (-u_xlat60) + 1.0;
    u_xlat16_67 = log2(u_xlat16_67);
    u_xlat16_67 = u_xlat16_67 * _rimPow;
    u_xlat16_67 = exp2(u_xlat16_67);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowStrength;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_26.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_67) * _rimCol.xyz + u_xlat16_6.xyz;
    u_xlatb0 = _Use_2U==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD2.zw : vs_TEXCOORD2.xy;
    u_xlat40.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat0.xy;
    u_xlat40.xy = u_xlat40.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_1 = texture2D(_LG_Tex, u_xlat40.xy);
    u_xlat10_0.xyz = texture2D(_LG_Mask, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity);
    u_xlat0.xyz = u_xlat10_1.www * u_xlat0.xyz;
    u_xlatb60 = _EMISSION_ON==1.0;
    if(u_xlatb60){
        u_xlat10_16.xyz = texture2D(_EmissionTex, vs_TEXCOORD2.xy).xyz;
        u_xlat17.xyz = u_xlat10_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat17.xyz = u_xlat10_16.xyz * u_xlat17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat16.xyz = u_xlat10_16.xyz * u_xlat17.xyz;
        u_xlat60 = max(_Em_Intensity, 0.0);
        u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat60);
        u_xlat60 = _Time.y * _Em_Speed;
        u_xlat60 = sin(u_xlat60);
        u_xlat76 = (-_EmissionLowestValue) + 1.0;
        u_xlat60 = abs(u_xlat60) * u_xlat76 + _EmissionLowestValue;
        u_xlat16.xyz = (-u_xlat16.xyz) * vec3(u_xlat60) + u_xlat16.xyz;
    } else {
        u_xlat16.x = float(0.0);
        u_xlat16.y = float(0.0);
        u_xlat16.z = float(0.0);
    }
    u_xlat0.xyz = u_xlat0.xyz * _LG_Color.xyz + u_xlat16.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_6.xyz = u_xlat0.xyz / u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_ExposureScale);
    SV_Target0.xyz = u_xlat16_6.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
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
 Name "Outline"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 ZWrite Off
 Cull Front
  GpuProgramID 122264
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat3.www + u_xlat3.xyz;
    u_xlat4.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat15 = textureLod(_Outline_Sampler, u_xlat4.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat3;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat0.xxx * u_xlat2.xyz;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	vec4 _Outline_Color_End;
uniform 	float _Outline_GradientStart;
uniform 	float _Outline_GradientEnd;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, (-vs_TEXCOORD2.xyz));
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_Outline_GradientStart);
    u_xlat2 = (-_Outline_GradientStart) + _Outline_GradientEnd;
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat0.x = u_xlat2 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat1 = (-_Outline_Color) + _Outline_Color_End;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _Outline_Color;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat16_1 = texture(_Outline_Sampler, u_xlat1.xy);
    SV_Target0 = u_xlat0 * u_xlat16_1;
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat3.www + u_xlat3.xyz;
    u_xlat4.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat15 = textureLod(_Outline_Sampler, u_xlat4.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat3;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat0.xxx * u_xlat2.xyz;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	vec4 _Outline_Color_End;
uniform 	float _Outline_GradientStart;
uniform 	float _Outline_GradientEnd;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, (-vs_TEXCOORD2.xyz));
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_Outline_GradientStart);
    u_xlat2 = (-_Outline_GradientStart) + _Outline_GradientEnd;
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat0.x = u_xlat2 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat1 = (-_Outline_Color) + _Outline_Color_End;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _Outline_Color;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat16_1 = texture(_Outline_Sampler, u_xlat1.xy);
    SV_Target0 = u_xlat0 * u_xlat16_1;
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
uniform lowp sampler2D _Outline_Sampler;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat3.www + u_xlat3.xyz;
    u_xlat4.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat15 = texture2DLod(_Outline_Sampler, u_xlat4.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat3;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat0.xxx * u_xlat2.xyz;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	vec4 _Outline_Color_End;
uniform 	float _Outline_GradientStart;
uniform 	float _Outline_GradientEnd;
uniform lowp sampler2D _Outline_Sampler;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat2;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, (-vs_TEXCOORD2.xyz));
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_Outline_GradientStart);
    u_xlat2 = (-_Outline_GradientStart) + _Outline_GradientEnd;
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat1 = (-_Outline_Color) + _Outline_Color_End;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _Outline_Color;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat10_1 = texture2D(_Outline_Sampler, u_xlat1.xy);
    SV_Target0 = u_xlat0 * u_xlat10_1;
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
uniform lowp sampler2D _Outline_Sampler;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat3.www + u_xlat3.xyz;
    u_xlat4.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat15 = texture2DLod(_Outline_Sampler, u_xlat4.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat3;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat0.xxx * u_xlat2.xyz;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	vec4 _Outline_Color_End;
uniform 	float _Outline_GradientStart;
uniform 	float _Outline_GradientEnd;
uniform lowp sampler2D _Outline_Sampler;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
float u_xlat2;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, (-vs_TEXCOORD2.xyz));
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_Outline_GradientStart);
    u_xlat2 = (-_Outline_GradientStart) + _Outline_GradientEnd;
    u_xlat2 = float(1.0) / u_xlat2;
    u_xlat0.x = u_xlat2 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat1 = (-_Outline_Color) + _Outline_Color_End;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _Outline_Color;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat10_1 = texture2D(_Outline_Sampler, u_xlat1.xy);
    SV_Target0 = u_xlat0 * u_xlat10_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LG_ON_OUTLINE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat3.www + u_xlat3.xyz;
    u_xlat4.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat15 = textureLod(_Outline_Sampler, u_xlat4.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat3;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat0.xxx * u_xlat2.xyz;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	vec4 _Outline_Color_End;
uniform 	float _Outline_GradientStart;
uniform 	float _Outline_GradientEnd;
uniform 	float _Use_2U_Outline;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color_Outline;
uniform 	mediump float _LG_Intensity_Outline;
uniform 	mediump float _U_LG_Outline;
uniform 	mediump float _V_LG_Outline;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
UNITY_LOCATION(1) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Mask_Outline;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U_Outline==1.0);
#else
    u_xlatb0 = _Use_2U_Outline==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat6.xy = _Time.yy * vec2(_U_LG_Outline, _V_LG_Outline) + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_LG_Mask_Outline, u_xlat0.xy).xyz;
    u_xlat0.xy = u_xlat6.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity_Outline);
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, (-vs_TEXCOORD2.xyz));
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 + (-_Outline_GradientStart);
    u_xlat1.x = (-_Outline_GradientStart) + _Outline_GradientEnd;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1 = (-_Outline_Color) + _Outline_Color_End;
    u_xlat1 = vec4(u_xlat9) * u_xlat1 + _Outline_Color;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat16_2 = texture(_Outline_Sampler, u_xlat2.xy);
    u_xlat1 = u_xlat1 * u_xlat16_2;
    SV_Target0.xyz = u_xlat0.xyz * _LG_Color_Outline.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LG_ON_OUTLINE" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat3.www + u_xlat3.xyz;
    u_xlat4.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat15 = textureLod(_Outline_Sampler, u_xlat4.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat3;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat0.xxx * u_xlat2.xyz;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	vec4 _Outline_Color_End;
uniform 	float _Outline_GradientStart;
uniform 	float _Outline_GradientEnd;
uniform 	float _Use_2U_Outline;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color_Outline;
uniform 	mediump float _LG_Intensity_Outline;
uniform 	mediump float _U_LG_Outline;
uniform 	mediump float _V_LG_Outline;
UNITY_LOCATION(0) uniform mediump sampler2D _Outline_Sampler;
UNITY_LOCATION(1) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _LG_Mask_Outline;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Use_2U_Outline==1.0);
#else
    u_xlatb0 = _Use_2U_Outline==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat6.xy = _Time.yy * vec2(_U_LG_Outline, _V_LG_Outline) + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_LG_Mask_Outline, u_xlat0.xy).xyz;
    u_xlat0.xy = u_xlat6.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0 = texture(_LG_Tex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity_Outline);
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, (-vs_TEXCOORD2.xyz));
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 + (-_Outline_GradientStart);
    u_xlat1.x = (-_Outline_GradientStart) + _Outline_GradientEnd;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1 = (-_Outline_Color) + _Outline_Color_End;
    u_xlat1 = vec4(u_xlat9) * u_xlat1 + _Outline_Color;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat16_2 = texture(_Outline_Sampler, u_xlat2.xy);
    u_xlat1 = u_xlat1 * u_xlat16_2;
    SV_Target0.xyz = u_xlat0.xyz * _LG_Color_Outline.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON_OUTLINE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
uniform lowp sampler2D _Outline_Sampler;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat3.www + u_xlat3.xyz;
    u_xlat4.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat15 = texture2DLod(_Outline_Sampler, u_xlat4.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat3;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat0.xxx * u_xlat2.xyz;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	vec4 _Outline_Color_End;
uniform 	float _Outline_GradientStart;
uniform 	float _Outline_GradientEnd;
uniform 	float _Use_2U_Outline;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color_Outline;
uniform 	mediump float _LG_Intensity_Outline;
uniform 	mediump float _U_LG_Outline;
uniform 	mediump float _V_LG_Outline;
uniform lowp sampler2D _Outline_Sampler;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask_Outline;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlatb0 = _Use_2U_Outline==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat6.xy = _Time.yy * vec2(_U_LG_Outline, _V_LG_Outline) + u_xlat0.xy;
    u_xlat10_1.xyz = texture2D(_LG_Mask_Outline, u_xlat0.xy).xyz;
    u_xlat0.xy = u_xlat6.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity_Outline);
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, (-vs_TEXCOORD2.xyz));
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 + (-_Outline_GradientStart);
    u_xlat1.x = (-_Outline_GradientStart) + _Outline_GradientEnd;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1 = (-_Outline_Color) + _Outline_Color_End;
    u_xlat1 = vec4(u_xlat9) * u_xlat1 + _Outline_Color;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat10_2 = texture2D(_Outline_Sampler, u_xlat2.xy);
    u_xlat1 = u_xlat1 * u_xlat10_2;
    SV_Target0.xyz = u_xlat0.xyz * _LG_Color_Outline.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON_OUTLINE" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	float _Outline_Width;
uniform 	vec4 _Outline_Sampler_ST;
uniform lowp sampler2D _Outline_Sampler;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat2;
    u_xlat3 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat4.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat3.www + u_xlat3.xyz;
    u_xlat4.xy = in_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat15 = texture2DLod(_Outline_Sampler, u_xlat4.xy, 0.0).w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat3;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.x = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(u_xlat1.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD1.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    vs_TEXCOORD2.xyz = u_xlat0.xxx * u_xlat2.xyz;
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
uniform 	vec4 _Outline_Sampler_ST;
uniform 	vec4 _Outline_Color;
uniform 	vec4 _Outline_Color_End;
uniform 	float _Outline_GradientStart;
uniform 	float _Outline_GradientEnd;
uniform 	float _Use_2U_Outline;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec4 _LG_Color_Outline;
uniform 	mediump float _LG_Intensity_Outline;
uniform 	mediump float _U_LG_Outline;
uniform 	mediump float _V_LG_Outline;
uniform lowp sampler2D _Outline_Sampler;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask_Outline;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
vec2 u_xlat6;
float u_xlat9;
void main()
{
    u_xlatb0 = _Use_2U_Outline==1.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlat6.xy = _Time.yy * vec2(_U_LG_Outline, _V_LG_Outline) + u_xlat0.xy;
    u_xlat10_1.xyz = texture2D(_LG_Mask_Outline, u_xlat0.xy).xyz;
    u_xlat0.xy = u_xlat6.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LG_Intensity_Outline);
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat9 = dot(vs_TEXCOORD1.xyz, (-vs_TEXCOORD2.xyz));
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 + (-_Outline_GradientStart);
    u_xlat1.x = (-_Outline_GradientStart) + _Outline_GradientEnd;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1 = (-_Outline_Color) + _Outline_Color_End;
    u_xlat1 = vec4(u_xlat9) * u_xlat1 + _Outline_Color;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Outline_Sampler_ST.xy + _Outline_Sampler_ST.zw;
    u_xlat10_2 = texture2D(_Outline_Sampler, u_xlat2.xy);
    u_xlat1 = u_xlat1 * u_xlat10_2;
    SV_Target0.xyz = u_xlat0.xyz * _LG_Color_Outline.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
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
Local Keywords { "_LG_ON_OUTLINE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LG_ON_OUTLINE" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON_OUTLINE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON_OUTLINE" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  LOD 100
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 146595
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