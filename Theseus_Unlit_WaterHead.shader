//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Unlit/WaterHead" {
Properties {

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_MainTex ("主贴图", 2D) = "white" { }

_MainColor ("主贴图颜色(HDR)", Color) = (1,1,1,1)

_NormalMap ("法线贴图", 2D) = "bump" { }

_MainNormalUVSpeed ("主贴图/法线UV流速（X/Y）", Vector) = (0,0,0,0)

_MainFresnelColor ("菲涅尔乘色(RGB)", Color) = (1,1,1,1)

_MainFresnelThreshold ("菲涅尔阈值", Range(0, 1)) = 0.5

_MainFresnelSoftness ("菲涅尔柔和度(越小越硬)", Range(0, 1)) = 0.10000000149011612

_AOTex ("AO贴图（R:双色混合 G:水纹遮罩）", 2D) = "white" { }

_AOContrast ("AO对比度（仅R）", Range(0.001, 8)) = 1.0

_AOColor1 ("AO暗部颜色（R=0）", Color) = (0,0,0,1)

_AOColor2 ("AO亮部颜色（R=1）", Color) = (1,1,1,1)

_EmissionTex ("自发光贴图(RGB)", 2D) = "black" { }

_EmisstionParams ("X:亮度最大值 Y:亮度最小值 Z:呼吸速度", Vector) = (1,1,0,0)

[Header(Foam ____________________________________________________________________________________________________________)] _FoamTex ("水纹贴图", 2D) = "white" { }

_FoamDistortStrength ("水纹扰动强度（主图/法线）", Range(0, 1)) = 0.0

[Toggle] _FoamUseUV2 ("水纹使用第二套UV", Float) = 0.0

_FoamCol ("水纹颜色", Color) = (1,1,1,0.2)

_foamDirection ("RG:水纹方向 B:水纹阈值 A:水纹柔和度", Vector) = (1,1,0.5,0.1)

[Toggle(_ISBODY)] _ISBODY ("身体模式", Float) = 0.0

_SpinSpeed ("环绕速度", Float) = 0.30000001192092896

_FlowSpeed ("沿身体长度流速", Float) = 1.0

_Twist ("螺旋倾斜（0不额外扭转）", Float) = 1.0

_AngularTiling ("环绕纹理密度", Float) = 4.0

_HeightTiling ("长度方向纹理密度", Float) = 2.0

[Header(Rim ____________________________________________________________________________________________________________)] _Rim_Tex ("边缘光 R:扰动纹理 G:扰动遮罩 B:Ramp梯度 A:强度遮罩", 2D) = "white" { }

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

[Header(Vertex Distortion By Mask ____________________________________________________________________________________________________________)] [Toggle] _VertexDistortEnable ("顶点扰动开关", Float) = 0.0

_VertexMaskTex ("顶点扰动范围遮罩 (R通道, 白=扰动 黑=不扰动)", 2D) = "white" { }

_maskPower ("扰动范围遮罩的幂次(越大越局部)", Range(0, 16)) = 1.0

_VertexDistortAmp ("扰动幅度", Float) = 0.05000000074505806

_VertexDistortFreq ("扰动频率(空间)", Float) = 4.0

_VertexDistortSpeed ("扰动速度(时间)", Float) = 1.0

[Enum(UnityEngine.Rendering.CullMode)] _ShellCull ("外壳剔除模式", Float) = 1.0

[Header(Outer Shell Foam)] [Space(10)] _ShellExtrude ("Shell Extrude (挤出距离)", Float) = 0.029999999329447746

_TwistTexture ("泡沫形状 Offset是移动的速度", 2D) = "white" { }

_ShellClip ("外壳透明阈值", Range(0, 1)) = 0.5

_ShellSoftness ("外壳羽化程度", Range(0.001, 1)) = 0.10000000149011612

_ShellColor ("外壳颜色（A:整体透明度）", Color) = (1,1,1,1)

_ShellMaskTex ("外壳颜色遮罩（R:白显示黑隐藏，第一套UV）", 2D) = "white" { }

_TwistNoiseTexture ("泡沫扰动贴图 Offset是移动的速度", 2D) = "white" { }

_effectByNoise ("基于noise的扰动强度", Float) = 0.03500000014901161

}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 32731
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	float _RimNoise_UV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(8) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0.x = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0.x){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat0.xz = (u_xlatb0.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = (u_xlatb0.y) ? in_TEXCOORD2.xy : u_xlat0.xz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat6, 9.99999994e-09);
    u_xlat1.x = inversesqrt(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = max(u_xlat6, 9.99999994e-09);
    u_xlat7 = inversesqrt(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat7) + vec3(-1.0, -0.0, -0.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 0.0, 0.0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump float _AOContrast;
uniform 	mediump vec4 _AOColor1;
uniform 	mediump vec4 _AOColor2;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump vec4 _MainFresnelColor;
uniform 	float _MainFresnelThreshold;
uniform 	float _MainFresnelSoftness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _FoamTex_ST;
uniform 	float _FoamDistortStrength;
uniform 	float _FoamUseUV2;
uniform 	mediump vec4 _FoamCol;
uniform 	vec4 _foamDirection;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AOTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
vec3 u_xlat11;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
float u_xlat26;
float u_xlat27;
float u_xlat29;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD2.w;
    u_xlat16_9.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_9.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_9.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
    u_xlat0.xy = _foamDirection.xy * (-_Time.yy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + _FoamTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_FoamUseUV2);
#else
    u_xlatb16 = 0.5<_FoamUseUV2;
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat16.xy * _FoamTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat0.xy).x;
    u_xlat16_25 = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat8.x = u_xlat16_25 * _FoamDistortStrength;
    u_xlat16.xy = vs_TEXCOORD3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_2.xy = texture(_AOTex, vs_TEXCOORD3.xy).xy;
    u_xlat16.xy = u_xlat8.xx * u_xlat16_2.yy + u_xlat16.xy;
    u_xlat8.x = u_xlat8.x * u_xlat16_2.y;
    u_xlat18.xy = vs_TEXCOORD3.xy * _MainTex_ST.xy + u_xlat8.xx;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat18.xy).xyz;
    u_xlat16_8.xyz = texture(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16.x = max(u_xlat8.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=9.99999994e-09);
#else
    u_xlatb8 = u_xlat8.x>=9.99999994e-09;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat16.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat8.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_1.xyz = u_xlat8.yyy * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat8.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyz;
    u_xlat8.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16.x = max(u_xlat8.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=9.99999994e-09);
#else
    u_xlatb8 = u_xlat8.x>=9.99999994e-09;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat16.xxx + (-vs_TEXCOORD1.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat5.xyz + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat26 = max(u_xlat18.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=9.99999994e-09);
#else
    u_xlatb18 = u_xlat18.x>=9.99999994e-09;
#endif
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat26) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat18.xxx * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat6.x) + hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat16_1.y = (-u_xlat6.y) + hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat16_1.z = (-u_xlat6.z) + hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.xyz = unity_OrthoParams.www * u_xlat16_1.xyz + u_xlat6.xyz;
    u_xlat26 = dot(u_xlat8.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat27 = max(_MainFresnelSoftness, 9.99999975e-05);
    u_xlat29 = (-u_xlat27) + _MainFresnelThreshold;
    u_xlat27 = u_xlat27 + _MainFresnelThreshold;
    u_xlat27 = (-u_xlat29) + u_xlat27;
    u_xlat26 = u_xlat26 + (-u_xlat29);
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat16_1.xyz = _MainFresnelColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = vec3(u_xlat26) * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat26 = max(_foamDirection.w, 9.99999975e-05);
    u_xlat27 = (-u_xlat26) + _foamDirection.z;
    u_xlat26 = u_xlat26 + _foamDirection.z;
    u_xlat26 = (-u_xlat27) + u_xlat26;
    u_xlat0.x = u_xlat16_0.x + (-u_xlat27);
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat0.x = u_xlat0.x * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat26;
    u_xlat16_4.xyz = u_xlat0.xxx * _FoamCol.zxy;
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz;
    u_xlat16_25 = log2(abs(u_xlat16_2.x));
    u_xlat16_25 = u_xlat16_25 * _AOContrast;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_7.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_3.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat3.w = 1.0;
    u_xlat2.yw = texture(_Rim_Tex, vs_TEXCOORD3.xy).zw;
    u_xlat24 = u_xlat2.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_Rim2_Threshold>=u_xlat24);
#else
    u_xlatb24 = _Rim2_Threshold>=u_xlat24;
#endif
    u_xlat3.xyz = (bool(u_xlatb24)) ? vec3(_Rim2_Intensity, _Rim2_X, _Rim2_Y) : vec3(_Rim_Intensity, _Rim_X, _Rim_Y);
    u_xlat6.xyz = (bool(u_xlatb24)) ? _Rim2_Color.zxy : _Rim_Color.zxy;
    u_xlat11.xyz = u_xlat18.xxx * u_xlat5.xyz + u_xlat3.yzw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = _Rim_Tex_ST.xy * _RimNoise_Speed.xy;
    u_xlat8.xy = u_xlat8.xy * _Time.yy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat11.xy = vs_TEXCOORD4.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + u_xlat11.xy;
    u_xlat16_8.x = texture(_Rim_Tex, u_xlat8.xy).x;
    u_xlat8.x = u_xlat16_8.x * _RimNoise_Speed.w;
    u_xlat16_16 = texture(_Rim_Tex, vs_TEXCOORD4.xy).y;
    u_xlat0.x = (-u_xlat8.x) * u_xlat16_16 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat2.x = min(u_xlat0.x, 1.0);
    u_xlat16_0.xyz = texture(_Rim_Ramp, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat3.xxx;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat2.www + u_xlat16_1.xyz;
    u_xlat0.x = _EmisstionParams.z * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat8.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + _EmisstionParams.x;
    u_xlat16_8.xyz = texture(_EmissionTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_8.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_8.zxy * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-_AOColor1.zxy) + _AOColor2.zxy;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _AOColor1.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_8.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_8.xyz;
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	float _RimNoise_UV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(8) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0.x = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0.x){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat0.xz = (u_xlatb0.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = (u_xlatb0.y) ? in_TEXCOORD2.xy : u_xlat0.xz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat6, 9.99999994e-09);
    u_xlat1.x = inversesqrt(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = max(u_xlat6, 9.99999994e-09);
    u_xlat7 = inversesqrt(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat7) + vec3(-1.0, -0.0, -0.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 0.0, 0.0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump float _AOContrast;
uniform 	mediump vec4 _AOColor1;
uniform 	mediump vec4 _AOColor2;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump vec4 _MainFresnelColor;
uniform 	float _MainFresnelThreshold;
uniform 	float _MainFresnelSoftness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _FoamTex_ST;
uniform 	float _FoamDistortStrength;
uniform 	float _FoamUseUV2;
uniform 	mediump vec4 _FoamCol;
uniform 	vec4 _foamDirection;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AOTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
vec3 u_xlat11;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
float u_xlat26;
float u_xlat27;
float u_xlat29;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD2.w;
    u_xlat16_9.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_9.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_9.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
    u_xlat0.xy = _foamDirection.xy * (-_Time.yy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + _FoamTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_FoamUseUV2);
#else
    u_xlatb16 = 0.5<_FoamUseUV2;
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat16.xy * _FoamTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat0.xy).x;
    u_xlat16_25 = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat8.x = u_xlat16_25 * _FoamDistortStrength;
    u_xlat16.xy = vs_TEXCOORD3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_2.xy = texture(_AOTex, vs_TEXCOORD3.xy).xy;
    u_xlat16.xy = u_xlat8.xx * u_xlat16_2.yy + u_xlat16.xy;
    u_xlat8.x = u_xlat8.x * u_xlat16_2.y;
    u_xlat18.xy = vs_TEXCOORD3.xy * _MainTex_ST.xy + u_xlat8.xx;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat18.xy).xyz;
    u_xlat16_8.xyz = texture(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16.x = max(u_xlat8.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=9.99999994e-09);
#else
    u_xlatb8 = u_xlat8.x>=9.99999994e-09;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat16.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat8.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_1.xyz = u_xlat8.yyy * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat8.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyz;
    u_xlat8.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16.x = max(u_xlat8.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=9.99999994e-09);
#else
    u_xlatb8 = u_xlat8.x>=9.99999994e-09;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat16.xxx + (-vs_TEXCOORD1.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat5.xyz + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat26 = max(u_xlat18.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=9.99999994e-09);
#else
    u_xlatb18 = u_xlat18.x>=9.99999994e-09;
#endif
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat26) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat18.xxx * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat6.x) + hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat16_1.y = (-u_xlat6.y) + hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat16_1.z = (-u_xlat6.z) + hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.xyz = unity_OrthoParams.www * u_xlat16_1.xyz + u_xlat6.xyz;
    u_xlat26 = dot(u_xlat8.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat27 = max(_MainFresnelSoftness, 9.99999975e-05);
    u_xlat29 = (-u_xlat27) + _MainFresnelThreshold;
    u_xlat27 = u_xlat27 + _MainFresnelThreshold;
    u_xlat27 = (-u_xlat29) + u_xlat27;
    u_xlat26 = u_xlat26 + (-u_xlat29);
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat16_1.xyz = _MainFresnelColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = vec3(u_xlat26) * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat26 = max(_foamDirection.w, 9.99999975e-05);
    u_xlat27 = (-u_xlat26) + _foamDirection.z;
    u_xlat26 = u_xlat26 + _foamDirection.z;
    u_xlat26 = (-u_xlat27) + u_xlat26;
    u_xlat0.x = u_xlat16_0.x + (-u_xlat27);
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat0.x = u_xlat0.x * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat26;
    u_xlat16_4.xyz = u_xlat0.xxx * _FoamCol.zxy;
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz;
    u_xlat16_25 = log2(abs(u_xlat16_2.x));
    u_xlat16_25 = u_xlat16_25 * _AOContrast;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_7.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_3.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainColor.zxy;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat3.w = 1.0;
    u_xlat2.yw = texture(_Rim_Tex, vs_TEXCOORD3.xy).zw;
    u_xlat24 = u_xlat2.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_Rim2_Threshold>=u_xlat24);
#else
    u_xlatb24 = _Rim2_Threshold>=u_xlat24;
#endif
    u_xlat3.xyz = (bool(u_xlatb24)) ? vec3(_Rim2_Intensity, _Rim2_X, _Rim2_Y) : vec3(_Rim_Intensity, _Rim_X, _Rim_Y);
    u_xlat6.xyz = (bool(u_xlatb24)) ? _Rim2_Color.zxy : _Rim_Color.zxy;
    u_xlat11.xyz = u_xlat18.xxx * u_xlat5.xyz + u_xlat3.yzw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = _Rim_Tex_ST.xy * _RimNoise_Speed.xy;
    u_xlat8.xy = u_xlat8.xy * _Time.yy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat11.xy = vs_TEXCOORD4.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + u_xlat11.xy;
    u_xlat16_8.x = texture(_Rim_Tex, u_xlat8.xy).x;
    u_xlat8.x = u_xlat16_8.x * _RimNoise_Speed.w;
    u_xlat16_16 = texture(_Rim_Tex, vs_TEXCOORD4.xy).y;
    u_xlat0.x = (-u_xlat8.x) * u_xlat16_16 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat2.x = min(u_xlat0.x, 1.0);
    u_xlat16_0.xyz = texture(_Rim_Ramp, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat3.xxx;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat2.www + u_xlat16_1.xyz;
    u_xlat0.x = _EmisstionParams.z * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat8.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + _EmisstionParams.x;
    u_xlat16_8.xyz = texture(_EmissionTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_8.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_8.zxy * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-_AOColor1.zxy) + _AOColor2.zxy;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _AOColor1.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_8.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ISBODY" }
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	float _RimNoise_UV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(8) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0.x = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0.x){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat0.xz = (u_xlatb0.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = (u_xlatb0.y) ? in_TEXCOORD2.xy : u_xlat0.xz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat6, 9.99999994e-09);
    u_xlat1.x = inversesqrt(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = max(u_xlat6, 9.99999994e-09);
    u_xlat7 = inversesqrt(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat7) + vec3(-1.0, -0.0, -0.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 0.0, 0.0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump float _AOContrast;
uniform 	mediump vec4 _AOColor1;
uniform 	mediump vec4 _AOColor2;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump vec4 _MainFresnelColor;
uniform 	float _MainFresnelThreshold;
uniform 	float _MainFresnelSoftness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainNormalUVSpeed;
uniform 	float _SpinSpeed;
uniform 	float _FlowSpeed;
uniform 	float _AngularTiling;
uniform 	float _HeightTiling;
uniform 	mediump float _Twist;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _FoamTex_ST;
uniform 	float _FoamDistortStrength;
uniform 	float _FoamUseUV2;
uniform 	mediump vec4 _FoamCol;
uniform 	vec4 _foamDirection;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AOTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump float u_xlat16_9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
float u_xlat26;
bool u_xlatb26;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = _foamDirection.xy * (-_Time.yy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + _FoamTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_FoamUseUV2);
#else
    u_xlatb16 = 0.5<_FoamUseUV2;
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = vec2(_FlowSpeed, _SpinSpeed) * _Time.yy;
    u_xlat1.x = u_xlat1.x * _FoamTex_ST.y;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16.x = u_xlat16.x + u_xlat1.y;
    u_xlat9.x = u_xlat16.x + 0.5;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat9.x = fract(u_xlat9.x);
    u_xlat17.xy = vec2(_AngularTiling, _HeightTiling) * _FoamTex_ST.xy;
    u_xlat24 = u_xlat16.y * u_xlat17.y + u_xlat1.x;
    u_xlat1.x = u_xlat17.y * _Twist;
    u_xlat2.y = u_xlat9.x * u_xlat1.x + u_xlat24;
    u_xlat2.x = u_xlat17.x * u_xlat9.x;
    u_xlat3.x = u_xlat16.x * u_xlat17.x;
    u_xlat9.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_9 = texture(_FoamTex, u_xlat9.xy).x;
    u_xlat3.y = u_xlat16.x * u_xlat1.x + u_xlat24;
    u_xlat16.x = u_xlat16.x + -0.5;
    u_xlat16.x = abs(u_xlat16.x) + -0.25;
    u_xlat16.x = u_xlat16.x * 4.0;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat0.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_9;
    u_xlat8.x = u_xlat16.x * -2.0 + 3.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat0.x = max(_foamDirection.w, 9.99999975e-05);
    u_xlat8.x = (-u_xlat0.x) + _foamDirection.z;
    u_xlat0.x = u_xlat0.x + _foamDirection.z;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat16.x = u_xlat16_4.x * _FoamDistortStrength;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_4.xyz = u_xlat0.xxx * _FoamCol.zxy;
    u_xlat16_0.xy = texture(_AOTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz;
    u_xlat1.xy = _MainNormalUVSpeed.xy * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = vs_TEXCOORD3.xy * _MainTex_ST.xy + u_xlat1.xy;
    u_xlat8.xy = u_xlat16.xx * u_xlat16_0.yy + u_xlat1.xy;
    u_xlat16_28 = log2(abs(u_xlat16_0.x));
    u_xlat16_28 = u_xlat16_28 * _AOContrast;
    u_xlat16_28 = exp2(u_xlat16_28);
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat8.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat1.x = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat16_5.xyz * u_xlat1.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24 = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat16_29 = u_xlat24 * vs_TEXCOORD2.w;
    u_xlat16_6.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_6.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_29) * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat1.zzz * vs_TEXCOORD1.xyz + u_xlat16_5.xyz;
    u_xlat24 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat1.x = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat16_5.xyz * u_xlat1.xxx + (-vs_TEXCOORD1.xyz);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat25) + vec3(-0.0, -0.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat2.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_5.x = (-u_xlat3.x) + hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat16_5.y = (-u_xlat3.y) + hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat16_5.z = (-u_xlat3.z) + hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_5.xyz = unity_OrthoParams.www * u_xlat16_5.xyz + u_xlat3.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat26 = max(_MainFresnelSoftness, 9.99999975e-05);
    u_xlat3.x = (-u_xlat26) + _MainFresnelThreshold;
    u_xlat26 = u_xlat26 + _MainFresnelThreshold;
    u_xlat26 = (-u_xlat3.x) + u_xlat26;
    u_xlat25 = u_xlat25 + (-u_xlat3.x);
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat25 = u_xlat25 * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat25 * -2.0 + 3.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat26;
    u_xlat16_5.xyz = _MainFresnelColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.yz = texture(_Rim_Tex, vs_TEXCOORD3.xy).zw;
    u_xlat26 = u_xlat3.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_Rim2_Threshold>=u_xlat26);
#else
    u_xlatb26 = _Rim2_Threshold>=u_xlat26;
#endif
    u_xlat1.xyz = (bool(u_xlatb26)) ? vec3(_Rim2_Intensity, _Rim2_X, _Rim2_Y) : vec3(_Rim_Intensity, _Rim_X, _Rim_Y);
    u_xlat7.xyz = (bool(u_xlatb26)) ? _Rim2_Color.zxy : _Rim_Color.zxy;
    u_xlat9.xyz = vec3(u_xlat24) * u_xlat2.xyz + u_xlat1.yzw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = _Rim_Tex_ST.xy * _RimNoise_Speed.xy;
    u_xlat8.xy = u_xlat8.xy * _Time.yy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat9.xy = vs_TEXCOORD4.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + u_xlat9.xy;
    u_xlat16_8.x = texture(_Rim_Tex, u_xlat8.xy).x;
    u_xlat8.x = u_xlat16_8.x * _RimNoise_Speed.w;
    u_xlat16_16 = texture(_Rim_Tex, vs_TEXCOORD4.xy).y;
    u_xlat0.x = (-u_xlat8.x) * u_xlat16_16 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat3.x = min(u_xlat0.x, 1.0);
    u_xlat16_0.xyz = texture(_Rim_Ramp, u_xlat3.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat3.zzz + u_xlat16_4.xyz;
    u_xlat0.x = _EmisstionParams.z * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat8.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + _EmisstionParams.x;
    u_xlat16_8.xyz = texture(_EmissionTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_8.zxy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-_AOColor1.zxy) + _AOColor2.zxy;
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_5.xyz + _AOColor1.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_8.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ISBODY" }
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	float _RimNoise_UV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(8) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0.x = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0.x){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat0.xz = (u_xlatb0.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = (u_xlatb0.y) ? in_TEXCOORD2.xy : u_xlat0.xz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat6, 9.99999994e-09);
    u_xlat1.x = inversesqrt(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = max(u_xlat6, 9.99999994e-09);
    u_xlat7 = inversesqrt(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat7) + vec3(-1.0, -0.0, -0.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 0.0, 0.0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump float _AOContrast;
uniform 	mediump vec4 _AOColor1;
uniform 	mediump vec4 _AOColor2;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump vec4 _MainFresnelColor;
uniform 	float _MainFresnelThreshold;
uniform 	float _MainFresnelSoftness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainNormalUVSpeed;
uniform 	float _SpinSpeed;
uniform 	float _FlowSpeed;
uniform 	float _AngularTiling;
uniform 	float _HeightTiling;
uniform 	mediump float _Twist;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _FoamTex_ST;
uniform 	float _FoamDistortStrength;
uniform 	float _FoamUseUV2;
uniform 	mediump vec4 _FoamCol;
uniform 	vec4 _foamDirection;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AOTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(7) uniform mediump sampler2D _ACESLutTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump float u_xlat16_9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
float u_xlat26;
bool u_xlatb26;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = _foamDirection.xy * (-_Time.yy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + _FoamTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_FoamUseUV2);
#else
    u_xlatb16 = 0.5<_FoamUseUV2;
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = vec2(_FlowSpeed, _SpinSpeed) * _Time.yy;
    u_xlat1.x = u_xlat1.x * _FoamTex_ST.y;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16.x = u_xlat16.x + u_xlat1.y;
    u_xlat9.x = u_xlat16.x + 0.5;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat9.x = fract(u_xlat9.x);
    u_xlat17.xy = vec2(_AngularTiling, _HeightTiling) * _FoamTex_ST.xy;
    u_xlat24 = u_xlat16.y * u_xlat17.y + u_xlat1.x;
    u_xlat1.x = u_xlat17.y * _Twist;
    u_xlat2.y = u_xlat9.x * u_xlat1.x + u_xlat24;
    u_xlat2.x = u_xlat17.x * u_xlat9.x;
    u_xlat3.x = u_xlat16.x * u_xlat17.x;
    u_xlat9.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_9 = texture(_FoamTex, u_xlat9.xy).x;
    u_xlat3.y = u_xlat16.x * u_xlat1.x + u_xlat24;
    u_xlat16.x = u_xlat16.x + -0.5;
    u_xlat16.x = abs(u_xlat16.x) + -0.25;
    u_xlat16.x = u_xlat16.x * 4.0;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat0.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_9;
    u_xlat8.x = u_xlat16.x * -2.0 + 3.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat0.x = max(_foamDirection.w, 9.99999975e-05);
    u_xlat8.x = (-u_xlat0.x) + _foamDirection.z;
    u_xlat0.x = u_xlat0.x + _foamDirection.z;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat16.x = u_xlat16_4.x * _FoamDistortStrength;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_4.xyz = u_xlat0.xxx * _FoamCol.zxy;
    u_xlat16_0.xy = texture(_AOTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz;
    u_xlat1.xy = _MainNormalUVSpeed.xy * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = vs_TEXCOORD3.xy * _MainTex_ST.xy + u_xlat1.xy;
    u_xlat8.xy = u_xlat16.xx * u_xlat16_0.yy + u_xlat1.xy;
    u_xlat16_28 = log2(abs(u_xlat16_0.x));
    u_xlat16_28 = u_xlat16_28 * _AOContrast;
    u_xlat16_28 = exp2(u_xlat16_28);
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat8.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat1.x = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat16_5.xyz * u_xlat1.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24 = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat16_29 = u_xlat24 * vs_TEXCOORD2.w;
    u_xlat16_6.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_6.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_29) * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat1.zzz * vs_TEXCOORD1.xyz + u_xlat16_5.xyz;
    u_xlat24 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat1.x = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat16_5.xyz * u_xlat1.xxx + (-vs_TEXCOORD1.xyz);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat25) + vec3(-0.0, -0.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat2.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_5.x = (-u_xlat3.x) + hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat16_5.y = (-u_xlat3.y) + hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat16_5.z = (-u_xlat3.z) + hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_5.xyz = unity_OrthoParams.www * u_xlat16_5.xyz + u_xlat3.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat26 = max(_MainFresnelSoftness, 9.99999975e-05);
    u_xlat3.x = (-u_xlat26) + _MainFresnelThreshold;
    u_xlat26 = u_xlat26 + _MainFresnelThreshold;
    u_xlat26 = (-u_xlat3.x) + u_xlat26;
    u_xlat25 = u_xlat25 + (-u_xlat3.x);
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat25 = u_xlat25 * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat25 * -2.0 + 3.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat26;
    u_xlat16_5.xyz = _MainFresnelColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.zxy;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.yz = texture(_Rim_Tex, vs_TEXCOORD3.xy).zw;
    u_xlat26 = u_xlat3.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_Rim2_Threshold>=u_xlat26);
#else
    u_xlatb26 = _Rim2_Threshold>=u_xlat26;
#endif
    u_xlat1.xyz = (bool(u_xlatb26)) ? vec3(_Rim2_Intensity, _Rim2_X, _Rim2_Y) : vec3(_Rim_Intensity, _Rim_X, _Rim_Y);
    u_xlat7.xyz = (bool(u_xlatb26)) ? _Rim2_Color.zxy : _Rim_Color.zxy;
    u_xlat9.xyz = vec3(u_xlat24) * u_xlat2.xyz + u_xlat1.yzw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = _Rim_Tex_ST.xy * _RimNoise_Speed.xy;
    u_xlat8.xy = u_xlat8.xy * _Time.yy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat9.xy = vs_TEXCOORD4.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + u_xlat9.xy;
    u_xlat16_8.x = texture(_Rim_Tex, u_xlat8.xy).x;
    u_xlat8.x = u_xlat16_8.x * _RimNoise_Speed.w;
    u_xlat16_16 = texture(_Rim_Tex, vs_TEXCOORD4.xy).y;
    u_xlat0.x = (-u_xlat8.x) * u_xlat16_16 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat3.x = min(u_xlat0.x, 1.0);
    u_xlat16_0.xyz = texture(_Rim_Ramp, u_xlat3.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat3.zzz + u_xlat16_4.xyz;
    u_xlat0.x = _EmisstionParams.z * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat8.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + _EmisstionParams.x;
    u_xlat16_8.xyz = texture(_EmissionTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.zxy * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_8.zxy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-_AOColor1.zxy) + _AOColor2.zxy;
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_5.xyz + _AOColor1.zxy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_8.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	float _RimNoise_UV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(7) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0.x = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0.x){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat0.xz = (u_xlatb0.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = (u_xlatb0.y) ? in_TEXCOORD2.xy : u_xlat0.xz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat6, 9.99999994e-09);
    u_xlat1.x = inversesqrt(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = max(u_xlat6, 9.99999994e-09);
    u_xlat7 = inversesqrt(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat7) + vec3(-1.0, -0.0, -0.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 0.0, 0.0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump float _AOContrast;
uniform 	mediump vec4 _AOColor1;
uniform 	mediump vec4 _AOColor2;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump vec4 _MainFresnelColor;
uniform 	float _MainFresnelThreshold;
uniform 	float _MainFresnelSoftness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _FoamTex_ST;
uniform 	float _FoamDistortStrength;
uniform 	float _FoamUseUV2;
uniform 	mediump vec4 _FoamCol;
uniform 	vec4 _foamDirection;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AOTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _FoamTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
vec3 u_xlat11;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
float u_xlat26;
float u_xlat27;
float u_xlat29;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD2.w;
    u_xlat16_9.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_9.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_9.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
    u_xlat0.xy = _foamDirection.xy * (-_Time.yy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + _FoamTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_FoamUseUV2);
#else
    u_xlatb16 = 0.5<_FoamUseUV2;
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat16.xy * _FoamTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat0.xy).x;
    u_xlat16_25 = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat8.x = u_xlat16_25 * _FoamDistortStrength;
    u_xlat16.xy = vs_TEXCOORD3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_2.xy = texture(_AOTex, vs_TEXCOORD3.xy).xy;
    u_xlat16.xy = u_xlat8.xx * u_xlat16_2.yy + u_xlat16.xy;
    u_xlat8.x = u_xlat8.x * u_xlat16_2.y;
    u_xlat18.xy = vs_TEXCOORD3.xy * _MainTex_ST.xy + u_xlat8.xx;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat18.xy).xyz;
    u_xlat16_8.xyz = texture(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16.x = max(u_xlat8.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=9.99999994e-09);
#else
    u_xlatb8 = u_xlat8.x>=9.99999994e-09;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat16.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat8.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_1.xyz = u_xlat8.yyy * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat8.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyz;
    u_xlat8.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16.x = max(u_xlat8.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=9.99999994e-09);
#else
    u_xlatb8 = u_xlat8.x>=9.99999994e-09;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat16.xxx + (-vs_TEXCOORD1.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat5.xyz + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat26 = max(u_xlat18.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=9.99999994e-09);
#else
    u_xlatb18 = u_xlat18.x>=9.99999994e-09;
#endif
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat26) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat18.xxx * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat6.x) + hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat16_1.y = (-u_xlat6.y) + hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat16_1.z = (-u_xlat6.z) + hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.xyz = unity_OrthoParams.www * u_xlat16_1.xyz + u_xlat6.xyz;
    u_xlat26 = dot(u_xlat8.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat27 = max(_MainFresnelSoftness, 9.99999975e-05);
    u_xlat29 = (-u_xlat27) + _MainFresnelThreshold;
    u_xlat27 = u_xlat27 + _MainFresnelThreshold;
    u_xlat27 = (-u_xlat29) + u_xlat27;
    u_xlat26 = u_xlat26 + (-u_xlat29);
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat16_1.xyz = _MainFresnelColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = vec3(u_xlat26) * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat26 = max(_foamDirection.w, 9.99999975e-05);
    u_xlat27 = (-u_xlat26) + _foamDirection.z;
    u_xlat26 = u_xlat26 + _foamDirection.z;
    u_xlat26 = (-u_xlat27) + u_xlat26;
    u_xlat0.x = u_xlat16_0.x + (-u_xlat27);
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat0.x = u_xlat0.x * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat26;
    u_xlat16_4.xyz = u_xlat0.xxx * _FoamCol.xyz;
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz;
    u_xlat16_25 = log2(abs(u_xlat16_2.x));
    u_xlat16_25 = u_xlat16_25 * _AOContrast;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat3.w = 1.0;
    u_xlat2.yw = texture(_Rim_Tex, vs_TEXCOORD3.xy).zw;
    u_xlat24 = u_xlat2.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_Rim2_Threshold>=u_xlat24);
#else
    u_xlatb24 = _Rim2_Threshold>=u_xlat24;
#endif
    u_xlat3.xyz = (bool(u_xlatb24)) ? vec3(_Rim2_Intensity, _Rim2_X, _Rim2_Y) : vec3(_Rim_Intensity, _Rim_X, _Rim_Y);
    u_xlat6.xyz = (bool(u_xlatb24)) ? _Rim2_Color.xyz : _Rim_Color.xyz;
    u_xlat11.xyz = u_xlat18.xxx * u_xlat5.xyz + u_xlat3.yzw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = _Rim_Tex_ST.xy * _RimNoise_Speed.xy;
    u_xlat8.xy = u_xlat8.xy * _Time.yy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat11.xy = vs_TEXCOORD4.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + u_xlat11.xy;
    u_xlat16_8.x = texture(_Rim_Tex, u_xlat8.xy).x;
    u_xlat8.x = u_xlat16_8.x * _RimNoise_Speed.w;
    u_xlat16_16 = texture(_Rim_Tex, vs_TEXCOORD4.xy).y;
    u_xlat0.x = (-u_xlat8.x) * u_xlat16_16 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat2.x = min(u_xlat0.x, 1.0);
    u_xlat16_0.xyz = texture(_Rim_Ramp, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat2.www + u_xlat16_1.xyz;
    u_xlat0.x = _EmisstionParams.z * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat8.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + _EmisstionParams.x;
    u_xlat16_8.xyz = texture(_EmissionTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-_AOColor1.xyz) + _AOColor2.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _AOColor1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	float _RimNoise_UV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(7) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0.x = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0.x){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat0.xz = (u_xlatb0.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = (u_xlatb0.y) ? in_TEXCOORD2.xy : u_xlat0.xz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat6, 9.99999994e-09);
    u_xlat1.x = inversesqrt(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = max(u_xlat6, 9.99999994e-09);
    u_xlat7 = inversesqrt(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat7) + vec3(-1.0, -0.0, -0.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 0.0, 0.0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump float _AOContrast;
uniform 	mediump vec4 _AOColor1;
uniform 	mediump vec4 _AOColor2;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump vec4 _MainFresnelColor;
uniform 	float _MainFresnelThreshold;
uniform 	float _MainFresnelSoftness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _NormalMap_ST;
uniform 	vec4 _FoamTex_ST;
uniform 	float _FoamDistortStrength;
uniform 	float _FoamUseUV2;
uniform 	mediump vec4 _FoamCol;
uniform 	vec4 _foamDirection;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AOTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _FoamTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
vec3 u_xlat11;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
float u_xlat26;
float u_xlat27;
float u_xlat29;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    u_xlat16_1.x = u_xlat0.x * vs_TEXCOORD2.w;
    u_xlat16_9.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_9.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_9.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
    u_xlat0.xy = _foamDirection.xy * (-_Time.yy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + _FoamTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_FoamUseUV2);
#else
    u_xlatb16 = 0.5<_FoamUseUV2;
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat16.xy * _FoamTex_ST.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat0.xy).x;
    u_xlat16_25 = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat8.x = u_xlat16_25 * _FoamDistortStrength;
    u_xlat16.xy = vs_TEXCOORD3.xy * _NormalMap_ST.xy + _NormalMap_ST.zw;
    u_xlat16_2.xy = texture(_AOTex, vs_TEXCOORD3.xy).xy;
    u_xlat16.xy = u_xlat8.xx * u_xlat16_2.yy + u_xlat16.xy;
    u_xlat8.x = u_xlat8.x * u_xlat16_2.y;
    u_xlat18.xy = vs_TEXCOORD3.xy * _MainTex_ST.xy + u_xlat8.xx;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat18.xy).xyz;
    u_xlat16_8.xyz = texture(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16.x = max(u_xlat8.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=9.99999994e-09);
#else
    u_xlatb8 = u_xlat8.x>=9.99999994e-09;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat16.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_4.xyz = u_xlat8.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_1.xyz = u_xlat8.yyy * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat8.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyz;
    u_xlat8.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16.x = max(u_xlat8.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=9.99999994e-09);
#else
    u_xlatb8 = u_xlat8.x>=9.99999994e-09;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat16.xxx + (-vs_TEXCOORD1.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat5.xyz + vs_TEXCOORD1.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat26 = max(u_xlat18.x, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=9.99999994e-09);
#else
    u_xlatb18 = u_xlat18.x>=9.99999994e-09;
#endif
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat26 = inversesqrt(u_xlat26);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat26) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat18.xxx * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat6.x) + hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat16_1.y = (-u_xlat6.y) + hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat16_1.z = (-u_xlat6.z) + hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_1.xyz = unity_OrthoParams.www * u_xlat16_1.xyz + u_xlat6.xyz;
    u_xlat26 = dot(u_xlat8.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat27 = max(_MainFresnelSoftness, 9.99999975e-05);
    u_xlat29 = (-u_xlat27) + _MainFresnelThreshold;
    u_xlat27 = u_xlat27 + _MainFresnelThreshold;
    u_xlat27 = (-u_xlat29) + u_xlat27;
    u_xlat26 = u_xlat26 + (-u_xlat29);
    u_xlat27 = float(1.0) / u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat16_1.xyz = _MainFresnelColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = vec3(u_xlat26) * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat26 = max(_foamDirection.w, 9.99999975e-05);
    u_xlat27 = (-u_xlat26) + _foamDirection.z;
    u_xlat26 = u_xlat26 + _foamDirection.z;
    u_xlat26 = (-u_xlat27) + u_xlat26;
    u_xlat0.x = u_xlat16_0.x + (-u_xlat27);
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat0.x = u_xlat0.x * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat26;
    u_xlat16_4.xyz = u_xlat0.xxx * _FoamCol.xyz;
    u_xlat16_4.xyz = u_xlat16_2.yyy * u_xlat16_4.xyz;
    u_xlat16_25 = log2(abs(u_xlat16_2.x));
    u_xlat16_25 = u_xlat16_25 * _AOContrast;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat3.w = 1.0;
    u_xlat2.yw = texture(_Rim_Tex, vs_TEXCOORD3.xy).zw;
    u_xlat24 = u_xlat2.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_Rim2_Threshold>=u_xlat24);
#else
    u_xlatb24 = _Rim2_Threshold>=u_xlat24;
#endif
    u_xlat3.xyz = (bool(u_xlatb24)) ? vec3(_Rim2_Intensity, _Rim2_X, _Rim2_Y) : vec3(_Rim_Intensity, _Rim_X, _Rim_Y);
    u_xlat6.xyz = (bool(u_xlatb24)) ? _Rim2_Color.xyz : _Rim_Color.xyz;
    u_xlat11.xyz = u_xlat18.xxx * u_xlat5.xyz + u_xlat3.yzw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = _Rim_Tex_ST.xy * _RimNoise_Speed.xy;
    u_xlat8.xy = u_xlat8.xy * _Time.yy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat11.xy = vs_TEXCOORD4.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + u_xlat11.xy;
    u_xlat16_8.x = texture(_Rim_Tex, u_xlat8.xy).x;
    u_xlat8.x = u_xlat16_8.x * _RimNoise_Speed.w;
    u_xlat16_16 = texture(_Rim_Tex, vs_TEXCOORD4.xy).y;
    u_xlat0.x = (-u_xlat8.x) * u_xlat16_16 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat2.x = min(u_xlat0.x, 1.0);
    u_xlat16_0.xyz = texture(_Rim_Ramp, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat2.www + u_xlat16_1.xyz;
    u_xlat0.x = _EmisstionParams.z * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat8.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + _EmisstionParams.x;
    u_xlat16_8.xyz = texture(_EmissionTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_8.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-_AOColor1.xyz) + _AOColor2.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + _AOColor1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISBODY" }
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	float _RimNoise_UV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(7) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0.x = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0.x){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat0.xz = (u_xlatb0.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = (u_xlatb0.y) ? in_TEXCOORD2.xy : u_xlat0.xz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat6, 9.99999994e-09);
    u_xlat1.x = inversesqrt(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = max(u_xlat6, 9.99999994e-09);
    u_xlat7 = inversesqrt(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat7) + vec3(-1.0, -0.0, -0.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 0.0, 0.0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump float _AOContrast;
uniform 	mediump vec4 _AOColor1;
uniform 	mediump vec4 _AOColor2;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump vec4 _MainFresnelColor;
uniform 	float _MainFresnelThreshold;
uniform 	float _MainFresnelSoftness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainNormalUVSpeed;
uniform 	float _SpinSpeed;
uniform 	float _FlowSpeed;
uniform 	float _AngularTiling;
uniform 	float _HeightTiling;
uniform 	mediump float _Twist;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _FoamTex_ST;
uniform 	float _FoamDistortStrength;
uniform 	float _FoamUseUV2;
uniform 	mediump vec4 _FoamCol;
uniform 	vec4 _foamDirection;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AOTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _FoamTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump float u_xlat16_9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
float u_xlat26;
bool u_xlatb26;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = _foamDirection.xy * (-_Time.yy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + _FoamTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_FoamUseUV2);
#else
    u_xlatb16 = 0.5<_FoamUseUV2;
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = vec2(_FlowSpeed, _SpinSpeed) * _Time.yy;
    u_xlat1.x = u_xlat1.x * _FoamTex_ST.y;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16.x = u_xlat16.x + u_xlat1.y;
    u_xlat9.x = u_xlat16.x + 0.5;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat9.x = fract(u_xlat9.x);
    u_xlat17.xy = vec2(_AngularTiling, _HeightTiling) * _FoamTex_ST.xy;
    u_xlat24 = u_xlat16.y * u_xlat17.y + u_xlat1.x;
    u_xlat1.x = u_xlat17.y * _Twist;
    u_xlat2.y = u_xlat9.x * u_xlat1.x + u_xlat24;
    u_xlat2.x = u_xlat17.x * u_xlat9.x;
    u_xlat3.x = u_xlat16.x * u_xlat17.x;
    u_xlat9.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_9 = texture(_FoamTex, u_xlat9.xy).x;
    u_xlat3.y = u_xlat16.x * u_xlat1.x + u_xlat24;
    u_xlat16.x = u_xlat16.x + -0.5;
    u_xlat16.x = abs(u_xlat16.x) + -0.25;
    u_xlat16.x = u_xlat16.x * 4.0;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat0.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_9;
    u_xlat8.x = u_xlat16.x * -2.0 + 3.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat0.x = max(_foamDirection.w, 9.99999975e-05);
    u_xlat8.x = (-u_xlat0.x) + _foamDirection.z;
    u_xlat0.x = u_xlat0.x + _foamDirection.z;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat16.x = u_xlat16_4.x * _FoamDistortStrength;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_4.xyz = u_xlat0.xxx * _FoamCol.xyz;
    u_xlat16_0.xy = texture(_AOTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz;
    u_xlat1.xy = _MainNormalUVSpeed.xy * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = vs_TEXCOORD3.xy * _MainTex_ST.xy + u_xlat1.xy;
    u_xlat8.xy = u_xlat16.xx * u_xlat16_0.yy + u_xlat1.xy;
    u_xlat16_28 = log2(abs(u_xlat16_0.x));
    u_xlat16_28 = u_xlat16_28 * _AOContrast;
    u_xlat16_28 = exp2(u_xlat16_28);
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat8.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat1.x = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat16_5.xyz * u_xlat1.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24 = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat16_29 = u_xlat24 * vs_TEXCOORD2.w;
    u_xlat16_6.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_6.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_29) * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat1.zzz * vs_TEXCOORD1.xyz + u_xlat16_5.xyz;
    u_xlat24 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat1.x = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat16_5.xyz * u_xlat1.xxx + (-vs_TEXCOORD1.xyz);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat25) + vec3(-0.0, -0.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat2.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_5.x = (-u_xlat3.x) + hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat16_5.y = (-u_xlat3.y) + hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat16_5.z = (-u_xlat3.z) + hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_5.xyz = unity_OrthoParams.www * u_xlat16_5.xyz + u_xlat3.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat26 = max(_MainFresnelSoftness, 9.99999975e-05);
    u_xlat3.x = (-u_xlat26) + _MainFresnelThreshold;
    u_xlat26 = u_xlat26 + _MainFresnelThreshold;
    u_xlat26 = (-u_xlat3.x) + u_xlat26;
    u_xlat25 = u_xlat25 + (-u_xlat3.x);
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat25 = u_xlat25 * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat25 * -2.0 + 3.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat26;
    u_xlat16_5.xyz = _MainFresnelColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.yz = texture(_Rim_Tex, vs_TEXCOORD3.xy).zw;
    u_xlat26 = u_xlat3.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_Rim2_Threshold>=u_xlat26);
#else
    u_xlatb26 = _Rim2_Threshold>=u_xlat26;
#endif
    u_xlat1.xyz = (bool(u_xlatb26)) ? vec3(_Rim2_Intensity, _Rim2_X, _Rim2_Y) : vec3(_Rim_Intensity, _Rim_X, _Rim_Y);
    u_xlat7.xyz = (bool(u_xlatb26)) ? _Rim2_Color.xyz : _Rim_Color.xyz;
    u_xlat9.xyz = vec3(u_xlat24) * u_xlat2.xyz + u_xlat1.yzw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = _Rim_Tex_ST.xy * _RimNoise_Speed.xy;
    u_xlat8.xy = u_xlat8.xy * _Time.yy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat9.xy = vs_TEXCOORD4.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + u_xlat9.xy;
    u_xlat16_8.x = texture(_Rim_Tex, u_xlat8.xy).x;
    u_xlat8.x = u_xlat16_8.x * _RimNoise_Speed.w;
    u_xlat16_16 = texture(_Rim_Tex, vs_TEXCOORD4.xy).y;
    u_xlat0.x = (-u_xlat8.x) * u_xlat16_16 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat3.x = min(u_xlat0.x, 1.0);
    u_xlat16_0.xyz = texture(_Rim_Ramp, u_xlat3.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat3.zzz + u_xlat16_4.xyz;
    u_xlat0.x = _EmisstionParams.z * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat8.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + _EmisstionParams.x;
    u_xlat16_8.xyz = texture(_EmissionTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-_AOColor1.xyz) + _AOColor2.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_5.xyz + _AOColor1.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISBODY" }
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	float _RimNoise_UV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(7) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec3 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0.x = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0.x){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlatb0.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat0.xz = (u_xlatb0.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = (u_xlatb0.y) ? in_TEXCOORD2.xy : u_xlat0.xz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = max(u_xlat6, 9.99999994e-09);
    u_xlat1.x = inversesqrt(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat1.x = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_TANGENT0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = max(u_xlat6, 9.99999994e-09);
    u_xlat7 = inversesqrt(u_xlat7);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=9.99999994e-09);
#else
    u_xlatb6 = u_xlat6>=9.99999994e-09;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat7) + vec3(-1.0, -0.0, -0.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 0.0, 0.0);
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump float _AOContrast;
uniform 	mediump vec4 _AOColor1;
uniform 	mediump vec4 _AOColor2;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump vec4 _MainFresnelColor;
uniform 	float _MainFresnelThreshold;
uniform 	float _MainFresnelSoftness;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainNormalUVSpeed;
uniform 	float _SpinSpeed;
uniform 	float _FlowSpeed;
uniform 	float _AngularTiling;
uniform 	float _HeightTiling;
uniform 	mediump float _Twist;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	vec4 _FoamTex_ST;
uniform 	float _FoamDistortStrength;
uniform 	float _FoamUseUV2;
uniform 	mediump vec4 _FoamCol;
uniform 	vec4 _foamDirection;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AOTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _FoamTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump float u_xlat16_9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
float u_xlat26;
bool u_xlatb26;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = _foamDirection.xy * (-_Time.yy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + _FoamTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_FoamUseUV2);
#else
    u_xlatb16 = 0.5<_FoamUseUV2;
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat1.xy = vec2(_FlowSpeed, _SpinSpeed) * _Time.yy;
    u_xlat1.x = u_xlat1.x * _FoamTex_ST.y;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16.x = u_xlat16.x + u_xlat1.y;
    u_xlat9.x = u_xlat16.x + 0.5;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat9.x = fract(u_xlat9.x);
    u_xlat17.xy = vec2(_AngularTiling, _HeightTiling) * _FoamTex_ST.xy;
    u_xlat24 = u_xlat16.y * u_xlat17.y + u_xlat1.x;
    u_xlat1.x = u_xlat17.y * _Twist;
    u_xlat2.y = u_xlat9.x * u_xlat1.x + u_xlat24;
    u_xlat2.x = u_xlat17.x * u_xlat9.x;
    u_xlat3.x = u_xlat16.x * u_xlat17.x;
    u_xlat9.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_9 = texture(_FoamTex, u_xlat9.xy).x;
    u_xlat3.y = u_xlat16.x * u_xlat1.x + u_xlat24;
    u_xlat16.x = u_xlat16.x + -0.5;
    u_xlat16.x = abs(u_xlat16.x) + -0.25;
    u_xlat16.x = u_xlat16.x * 4.0;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat0.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + u_xlat16_9;
    u_xlat8.x = u_xlat16.x * -2.0 + 3.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x + u_xlat16_0.x;
    u_xlat0.x = max(_foamDirection.w, 9.99999975e-05);
    u_xlat8.x = (-u_xlat0.x) + _foamDirection.z;
    u_xlat0.x = u_xlat0.x + _foamDirection.z;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * 2.0 + -1.0;
    u_xlat16.x = u_xlat16_4.x * _FoamDistortStrength;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_4.xyz = u_xlat0.xxx * _FoamCol.xyz;
    u_xlat16_0.xy = texture(_AOTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz;
    u_xlat1.xy = _MainNormalUVSpeed.xy * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = vs_TEXCOORD3.xy * _MainTex_ST.xy + u_xlat1.xy;
    u_xlat8.xy = u_xlat16.xx * u_xlat16_0.yy + u_xlat1.xy;
    u_xlat16_28 = log2(abs(u_xlat16_0.x));
    u_xlat16_28 = u_xlat16_28 * _AOContrast;
    u_xlat16_28 = exp2(u_xlat16_28);
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat8.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat8.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat1.x = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat16_5.xyz * u_xlat1.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb24 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat24 = (u_xlatb24) ? 1.0 : -1.0;
    u_xlat16_29 = u_xlat24 * vs_TEXCOORD2.w;
    u_xlat16_6.xyz = vs_TEXCOORD1.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_6.xyz = vs_TEXCOORD1.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_29) * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat1.zzz * vs_TEXCOORD1.xyz + u_xlat16_5.xyz;
    u_xlat24 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat1.x = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat16_5.xyz * u_xlat1.xxx + (-vs_TEXCOORD1.xyz);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz + vs_TEXCOORD1.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat24, 9.99999994e-09);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat24>=9.99999994e-09);
#else
    u_xlatb24 = u_xlat24>=9.99999994e-09;
#endif
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat25) + vec3(-0.0, -0.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat2.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat16_5.x = (-u_xlat3.x) + hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat16_5.y = (-u_xlat3.y) + hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat16_5.z = (-u_xlat3.z) + hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_5.xyz = unity_OrthoParams.www * u_xlat16_5.xyz + u_xlat3.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat26 = max(_MainFresnelSoftness, 9.99999975e-05);
    u_xlat3.x = (-u_xlat26) + _MainFresnelThreshold;
    u_xlat26 = u_xlat26 + _MainFresnelThreshold;
    u_xlat26 = (-u_xlat3.x) + u_xlat26;
    u_xlat25 = u_xlat25 + (-u_xlat3.x);
    u_xlat26 = float(1.0) / u_xlat26;
    u_xlat25 = u_xlat25 * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat25 * -2.0 + 3.0;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat25 = u_xlat25 * u_xlat26;
    u_xlat16_5.xyz = _MainFresnelColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.yz = texture(_Rim_Tex, vs_TEXCOORD3.xy).zw;
    u_xlat26 = u_xlat3.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_Rim2_Threshold>=u_xlat26);
#else
    u_xlatb26 = _Rim2_Threshold>=u_xlat26;
#endif
    u_xlat1.xyz = (bool(u_xlatb26)) ? vec3(_Rim2_Intensity, _Rim2_X, _Rim2_Y) : vec3(_Rim_Intensity, _Rim_X, _Rim_Y);
    u_xlat7.xyz = (bool(u_xlatb26)) ? _Rim2_Color.xyz : _Rim_Color.xyz;
    u_xlat9.xyz = vec3(u_xlat24) * u_xlat2.xyz + u_xlat1.yzw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = _Rim_Tex_ST.xy * _RimNoise_Speed.xy;
    u_xlat8.xy = u_xlat8.xy * _Time.yy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat9.xy = vs_TEXCOORD4.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + u_xlat9.xy;
    u_xlat16_8.x = texture(_Rim_Tex, u_xlat8.xy).x;
    u_xlat8.x = u_xlat16_8.x * _RimNoise_Speed.w;
    u_xlat16_16 = texture(_Rim_Tex, vs_TEXCOORD4.xy).y;
    u_xlat0.x = (-u_xlat8.x) * u_xlat16_16 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat3.x = min(u_xlat0.x, 1.0);
    u_xlat16_0.xyz = texture(_Rim_Ramp, u_xlat3.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat3.zzz + u_xlat16_4.xyz;
    u_xlat0.x = _EmisstionParams.z * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat8.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat8.x + _EmisstionParams.x;
    u_xlat16_8.xyz = texture(_EmissionTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_8.xyz * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-_AOColor1.xyz) + _AOColor2.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_5.xyz + _AOColor1.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ISBODY" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ISBODY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISBODY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISBODY" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ISBODY" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ISBODY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISBODY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISBODY" }
""
}
}
}
 Pass {
 Name "SHELL"
  LOD 100
  Tags { "RenderType" = "Opaque" }
 ZWrite Off
 Cull Off
  GpuProgramID 124128
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	mediump float _ShellExtrude;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(4) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0 = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat6 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(_ShellExtrude) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = _TwistNoiseTexture_ST.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat0.xy = _TwistTexture_ST.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy * _TwistTexture_ST.xy + u_xlat0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	float _ShellClip;
uniform 	float _ShellSoftness;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump float _effectByNoise;
UNITY_LOCATION(0) uniform mediump sampler2D _TwistTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _TwistNoiseTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _ShellMaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat16_0 = texture(_TwistNoiseTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat0.xy = vec2(u_xlat16_1) * vec2(_effectByNoise) + vs_TEXCOORD0.zw;
    u_xlat16_0 = texture(_TwistTexture, u_xlat0.xy).x;
    u_xlat3 = (-_ShellSoftness) + _ShellClip;
    u_xlat0.x = (-u_xlat3) + u_xlat16_0;
    u_xlat6 = _ShellSoftness + _ShellClip;
    u_xlat3 = (-u_xlat3) + u_xlat6;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat16_3.x = texture(_ShellMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1 = u_xlat16_3.x * u_xlat0.x;
    SV_Target0.w = u_xlat16_1 * _ShellColor.w;
    u_xlat0.xyz = _ShellColor.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat9 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat9);
    u_xlat1.x = u_xlat9 * 0.0625 + u_xlat1.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_3.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	mediump float _ShellExtrude;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(4) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0 = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat6 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(_ShellExtrude) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = _TwistNoiseTexture_ST.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat0.xy = _TwistTexture_ST.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy * _TwistTexture_ST.xy + u_xlat0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	float _ShellClip;
uniform 	float _ShellSoftness;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump float _effectByNoise;
UNITY_LOCATION(0) uniform mediump sampler2D _TwistTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _TwistNoiseTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _ShellMaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_3;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat16_0 = texture(_TwistNoiseTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat0.xy = vec2(u_xlat16_1) * vec2(_effectByNoise) + vs_TEXCOORD0.zw;
    u_xlat16_0 = texture(_TwistTexture, u_xlat0.xy).x;
    u_xlat3 = (-_ShellSoftness) + _ShellClip;
    u_xlat0.x = (-u_xlat3) + u_xlat16_0;
    u_xlat6 = _ShellSoftness + _ShellClip;
    u_xlat3 = (-u_xlat3) + u_xlat6;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat16_3.x = texture(_ShellMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1 = u_xlat16_3.x * u_xlat0.x;
    SV_Target0.w = u_xlat16_1 * _ShellColor.w;
    u_xlat0.xyz = _ShellColor.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat9 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat9);
    u_xlat1.x = u_xlat9 * 0.0625 + u_xlat1.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_3.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	mediump float _ShellExtrude;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(3) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0 = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat6 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(_ShellExtrude) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = _TwistNoiseTexture_ST.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat0.xy = _TwistTexture_ST.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy * _TwistTexture_ST.xy + u_xlat0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	float _ShellClip;
uniform 	float _ShellSoftness;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump float _effectByNoise;
UNITY_LOCATION(0) uniform mediump sampler2D _TwistTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _TwistNoiseTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _ShellMaskTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat16_0 = texture(_TwistNoiseTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat0.xy = vec2(u_xlat16_1) * vec2(_effectByNoise) + vs_TEXCOORD0.zw;
    u_xlat16_0 = texture(_TwistTexture, u_xlat0.xy).x;
    u_xlat2 = (-_ShellSoftness) + _ShellClip;
    u_xlat0.x = (-u_xlat2) + u_xlat16_0;
    u_xlat4 = _ShellSoftness + _ShellClip;
    u_xlat2 = (-u_xlat2) + u_xlat4;
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
    u_xlat16_2 = texture(_ShellMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1 = u_xlat16_2 * u_xlat0.x;
    SV_Target0.w = u_xlat16_1 * _ShellColor.w;
    SV_Target0.xyz = _ShellColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
uniform 	float _VertexDistortEnable;
uniform 	vec4 _VertexMaskTex_ST;
uniform 	float _VertexDistortAmp;
uniform 	float _VertexDistortFreq;
uniform 	float _VertexDistortSpeed;
uniform 	float _maskPower;
uniform 	mediump float _ShellExtrude;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(3) uniform mediump sampler2D _VertexMaskTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
float u_xlat4;
float u_xlat6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_VertexDistortEnable);
#else
    u_xlatb0 = 0.5<_VertexDistortEnable;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _VertexMaskTex_ST.xy + _VertexMaskTex_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskTex, u_xlat0.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat2.xy = max(vec2(vec2(_maskPower, _maskPower)), vec2(0.0, 0.00100000005));
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat2.y;
        u_xlat0.x = exp2(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat2.x);
#else
        u_xlatb2 = 0.0<u_xlat2.x;
#endif
        u_xlat0.x = (u_xlatb2) ? u_xlat0.x : 1.0;
        u_xlat2.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat2.x = u_xlat2.x + in_POSITION0.z;
        u_xlat2.x = u_xlat2.x * _VertexDistortFreq;
        u_xlat2.x = _VertexDistortSpeed * _Time.y + u_xlat2.x;
        u_xlat2.x = sin(u_xlat2.x);
        u_xlat4 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
        u_xlat4 = inversesqrt(u_xlat4);
        u_xlat1.xyz = vec3(u_xlat4) * in_NORMAL0.xyz;
        u_xlat2.x = u_xlat2.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat2.x;
        u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    } else {
        u_xlat0.xyz = in_POSITION0.xyz;
    }
    u_xlat6 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat1.xyz = vec3(u_xlat6) * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(_ShellExtrude) + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = _TwistNoiseTexture_ST.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat0.xy = _TwistTexture_ST.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy * _TwistTexture_ST.xy + u_xlat0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	float _ShellClip;
uniform 	float _ShellSoftness;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump float _effectByNoise;
UNITY_LOCATION(0) uniform mediump sampler2D _TwistTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _TwistNoiseTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _ShellMaskTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_2;
float u_xlat4;
void main()
{
    u_xlat16_0 = texture(_TwistNoiseTexture, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = u_xlat16_0 * 2.0 + -1.0;
    u_xlat0.xy = vec2(u_xlat16_1) * vec2(_effectByNoise) + vs_TEXCOORD0.zw;
    u_xlat16_0 = texture(_TwistTexture, u_xlat0.xy).x;
    u_xlat2 = (-_ShellSoftness) + _ShellClip;
    u_xlat0.x = (-u_xlat2) + u_xlat16_0;
    u_xlat4 = _ShellSoftness + _ShellClip;
    u_xlat2 = (-u_xlat2) + u_xlat4;
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
    u_xlat16_2 = texture(_ShellMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1 = u_xlat16_2 * u_xlat0.x;
    SV_Target0.w = u_xlat16_1 * _ShellColor.w;
    SV_Target0.xyz = _ShellColor.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Unlit_WaterHeadGUI"
}