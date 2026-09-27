//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Effect/Crystal" {
Properties {

_SpecIntensity ("高光强度", Float) = 1.0

_Intensity ("整体强度", Float) = 1.0

_Alpha ("MainTex不透明度", Range(0, 1)) = 1.0

_DirectionalLight_Color ("平行光颜色", Color) = (1,1,1,1)

_Ambient_Color ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_AdditionalRefAlpha ("反射部分不透明度", Range(0, 10)) = 0.0

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("法线贴图", 2D) = "bump" { }

_AO_Em_Sanshe ("R:AO G:补光 B:接受投影", 2D) = "white" { }

_AO_Intensity ("AO强度", Float) = 1.0

[Toggle] _EMISSION_ON ("自发光开关", Float) = 0.0

_EmissionTex ("自发光贴图(RGB)", 2D) = "black" { }

_Em_Intensity ("自发光强度", Float) = 1.0

_Em_Speed ("自发光呼吸速度", Float) = 0.0

_Metal_Rough_Skin ("R:金属度 G:粗糙度 B:3S", 2D) = "white" { }

_Metal_Intensity ("金属度强度", Float) = 1.0

_Rough_Intensity ("粗糙度强度", Float) = 1.0

_Skin_Intensity ("3S强度", Float) = 1.0

_LutTex ("3S贴图", 2D) = "white" { }

_Anti3S_Color ("3S补光颜色", Color) = (0,0,0,1)

_Anti3S_Power ("3S补光范围", Float) = 1.0

_Anti3S_Intensity ("3S补光强度", Float) = 1.0

[Space(10)] [Header(CubeMap)] _Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Cube_Gem_Color ("水晶反射颜色", Color) = (1,1,1,1)

_Cube_Gem_Intensity ("水晶内部反射强度", Float) = 1.0

_Cube_GemOut_Intensity ("水晶表面反射强度", Float) = 1.0

_Cube_Intensity ("非水晶部分反射强度", Float) = 1.0

_Refract_Color ("水晶折射颜色", Color) = (1,1,1,1)

_Refract_Rate ("水晶折射率", Range(0, 1)) = 0.5

_Refract_Intensity ("水晶折射强度", Float) = 1.0

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

[Space(10)] [Header(LiuGuang)] [Toggle(_LG_ON)] _LG_ON ("流光开关", Float) = 0.0

[Toggle] _Use_2U ("使用2U", Float) = 0.0

_LG_Mask ("流光遮罩(RGB色)", 2D) = "white" { }

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_NoiseTex ("流光扰动", 2D) = "black" { }

_LG_Noise_Speed ("XY:扰动流速", Vector) = (0,0,0,0)

_LG_Noise_Intensity ("扰动强度", Float) = 0.0

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 1.0

_U_LG ("U向流动速度", Float) = 0.0

_V_LG ("V向流动速度", Float) = 0.0

[Enum(UV1,0,UV2,1)] _RampUVType ("渐变UV通道", Float) = 1.0

_RampTex ("渐变图", 2D) = "white" { }

_RampIntensity ("渐变强度", Range(0, 1)) = 0.5

}
SubShader {
 Pass {
 Name "Crystal"
  Tags { "LIGHTMODE" = "FORWARDBASE" "SHADOWSUPPORT" = "true" }
  GpuProgramID 38579
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat5.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat5.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat5.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat5.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat5.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat5.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat5.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat5.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat5.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat5.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat5.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat5.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
vec2 u_xlat35;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_Use_2U==1.0);
#else
    u_xlatb49 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_49 = texture(_LG_NoiseTex, u_xlat35.xy).x;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = vec2(u_xlat16_49) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat35.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat35.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat6.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat6.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
vec2 u_xlat35;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_Use_2U==1.0);
#else
    u_xlatb49 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_49 = texture(_LG_NoiseTex, u_xlat35.xy).x;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = vec2(u_xlat16_49) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat35.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat35.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat6.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat6.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
vec2 u_xlat35;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_Use_2U==1.0);
#else
    u_xlatb49 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_49 = texture(_LG_NoiseTex, u_xlat35.xy).x;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = vec2(u_xlat16_49) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat35.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat35.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat6.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat6.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
vec2 u_xlat35;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_Use_2U==1.0);
#else
    u_xlatb49 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_49 = texture(_LG_NoiseTex, u_xlat35.xy).x;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = vec2(u_xlat16_49) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat35.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat35.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat6.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat6.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat5.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat5.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat5.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat16_8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat16_8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat16_8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_7 = log2(u_xlat49);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat5.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat5.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat5.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat16_8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat16_8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat16_8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_7 = log2(u_xlat49);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat5.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat5.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat5.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat16_8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat16_8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat16_8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_7 = log2(u_xlat49);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
float u_xlat49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat3.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat5.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat5.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat5.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat16_8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat16_8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat16_8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_7 = log2(u_xlat49);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
vec2 u_xlat35;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_Use_2U==1.0);
#else
    u_xlatb49 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_49 = texture(_LG_NoiseTex, u_xlat35.xy).x;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = vec2(u_xlat16_49) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat35.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat35.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat6.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat6.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat16_8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat16_8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat16_8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_7 = log2(u_xlat49);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
vec2 u_xlat35;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_Use_2U==1.0);
#else
    u_xlatb49 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_49 = texture(_LG_NoiseTex, u_xlat35.xy).x;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = vec2(u_xlat16_49) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat35.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat35.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat6.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat6.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat16_8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat16_8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat16_8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_7 = log2(u_xlat49);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
vec2 u_xlat35;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_Use_2U==1.0);
#else
    u_xlatb49 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_49 = texture(_LG_NoiseTex, u_xlat35.xy).x;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = vec2(u_xlat16_49) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat35.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat35.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat6.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat6.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat16_8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat16_8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat16_8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_7 = log2(u_xlat49);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
mediump float u_xlat16_18;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
float u_xlat32;
mediump vec2 u_xlat16_32;
bool u_xlatb32;
mediump float u_xlat16_34;
vec2 u_xlat35;
float u_xlat49;
mediump float u_xlat16_49;
bool u_xlatb49;
mediump float u_xlat16_50;
mediump float u_xlat16_52;
float u_xlat53;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_32.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat49 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 1.17549435e-38);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_50 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat16_2.xyz = vec3(u_xlat16_50) * u_xlat16_2.xyz;
    u_xlat53 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat53 = max(u_xlat53, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat22.x = max(u_xlat22.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_32.x) + 1.0;
    u_xlat16_52 = u_xlat16_52 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = (-u_xlat16_52) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_23.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_23.xyz = u_xlat16_23.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_24 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_24 = u_xlat22.x * u_xlat22.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_8.x + (-u_xlat16_24);
    u_xlat16_24 = u_xlat16_24 + 1.0;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_24;
    u_xlat16_50 = u_xlat16_8.x / u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * 0.25 + -9.99999975e-06;
    u_xlat16_50 = max(u_xlat16_50, 0.0);
    u_xlat16_50 = min(u_xlat16_50, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_50) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat32 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat17 = (-u_xlat32) * u_xlat32 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat17 + 1.0;
    u_xlat17 = sqrt(u_xlat1.x);
    u_xlat17 = _Refract_Rate * u_xlat32 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat22.xyz = u_xlat5.xyz * vec3(u_xlat17);
    u_xlat22.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat22.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat22.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat32 = u_xlat32 + u_xlat32;
    u_xlat22.xyz = u_xlat5.xyz * (-vec3(u_xlat32)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat22.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat32 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat32);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat53 * u_xlat53;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_50 = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = max(u_xlat16_50, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_50) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_52) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_50 = u_xlat22.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_50);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb32 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb32){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_50 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_50);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_50 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_50 = u_xlat16_50 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 1.0);
    u_xlat16_52 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat53) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_50) + (-u_xlat16_8.xyz);
    u_xlat16_18 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_18) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat22.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb17 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb17)) ? u_xlat6.xxx : u_xlat22.xyz;
    u_xlat16_34 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_34;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat49) + vs_TEXCOORD6.xyz;
    u_xlat49 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_Use_2U==1.0);
#else
    u_xlatb49 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_49 = texture(_LG_NoiseTex, u_xlat35.xy).x;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = vec2(u_xlat16_49) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat35.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat35.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat5.xyz = vec3(u_xlat49) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD6.x + _Sanshe_X;
    u_xlat6.y = vs_TEXCOORD6.y + _Sanshe_Y;
    u_xlat6.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_34 = log2(u_xlat49);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Fw;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * _Sanshe_Power;
    u_xlat16_8.x = vs_TEXCOORD6.x + _Sanshe2_X;
    u_xlat16_8.y = vs_TEXCOORD6.y + _Sanshe2_Y;
    u_xlat16_8.z = vs_TEXCOORD6.z;
    u_xlat49 = dot(u_xlat5.xyz, u_xlat16_8.xyz);
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat49 = (-u_xlat49) + 1.0;
    u_xlat49 = max(u_xlat49, 0.0);
    u_xlat16_7 = log2(u_xlat49);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_32.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb49 = !!(_RampUVType==1.0);
#else
    u_xlatb49 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb49)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_23.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_52) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_52) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_52) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_36 = (-_Sanshe_X) + 1.0;
    u_xlat16_7 = (-_Sanshe_Y) + 1.0;
    u_xlat16_36 = u_xlat16_36 * 3.1400001;
    u_xlat16_8.x = sin(u_xlat16_36);
    u_xlat16_15.x = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_7 * 3.1400001;
    u_xlat16_7 = sin(u_xlat16_36);
    u_xlat16_16 = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_15.x + u_xlat16_16;
    u_xlat16_8.z = u_xlat16_36 * 0.5;
    u_xlat16_8.y = u_xlat16_7;
    u_xlat52 = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_36 = (-_Sanshe_X) + 1.0;
    u_xlat16_7 = (-_Sanshe_Y) + 1.0;
    u_xlat16_36 = u_xlat16_36 * 3.1400001;
    u_xlat16_8.x = sin(u_xlat16_36);
    u_xlat16_15.x = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_7 * 3.1400001;
    u_xlat16_7 = sin(u_xlat16_36);
    u_xlat16_16 = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_15.x + u_xlat16_16;
    u_xlat16_8.z = u_xlat16_36 * 0.5;
    u_xlat16_8.y = u_xlat16_7;
    u_xlat52 = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_36 = (-_Sanshe_X) + 1.0;
    u_xlat16_7 = (-_Sanshe_Y) + 1.0;
    u_xlat16_36 = u_xlat16_36 * 3.1400001;
    u_xlat16_8.x = sin(u_xlat16_36);
    u_xlat16_15.x = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_7 * 3.1400001;
    u_xlat16_7 = sin(u_xlat16_36);
    u_xlat16_16 = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_15.x + u_xlat16_16;
    u_xlat16_8.z = u_xlat16_36 * 0.5;
    u_xlat16_8.y = u_xlat16_7;
    u_xlat52 = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_36 = (-_Sanshe_X) + 1.0;
    u_xlat16_7 = (-_Sanshe_Y) + 1.0;
    u_xlat16_36 = u_xlat16_36 * 3.1400001;
    u_xlat16_8.x = sin(u_xlat16_36);
    u_xlat16_15.x = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_7 * 3.1400001;
    u_xlat16_7 = sin(u_xlat16_36);
    u_xlat16_16 = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_15.x + u_xlat16_16;
    u_xlat16_8.z = u_xlat16_36 * 0.5;
    u_xlat16_8.y = u_xlat16_7;
    u_xlat52 = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
vec2 u_xlat37;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_Use_2U==1.0);
#else
    u_xlatb52 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_52 = texture(_LG_NoiseTex, u_xlat37.xy).x;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = vec2(u_xlat16_52) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat37.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat37.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat16_36 = (-_Sanshe_X) + 1.0;
    u_xlat16_7 = (-_Sanshe_Y) + 1.0;
    u_xlat16_36 = u_xlat16_36 * 3.1400001;
    u_xlat16_8.x = sin(u_xlat16_36);
    u_xlat16_15.x = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_7 * 3.1400001;
    u_xlat16_7 = sin(u_xlat16_36);
    u_xlat16_16 = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_15.x + u_xlat16_16;
    u_xlat16_8.z = u_xlat16_36 * 0.5;
    u_xlat16_8.y = u_xlat16_7;
    u_xlat52 = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_55) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
vec2 u_xlat37;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_Use_2U==1.0);
#else
    u_xlatb52 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_52 = texture(_LG_NoiseTex, u_xlat37.xy).x;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = vec2(u_xlat16_52) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat37.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat37.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat16_36 = (-_Sanshe_X) + 1.0;
    u_xlat16_7 = (-_Sanshe_Y) + 1.0;
    u_xlat16_36 = u_xlat16_36 * 3.1400001;
    u_xlat16_8.x = sin(u_xlat16_36);
    u_xlat16_15.x = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_7 * 3.1400001;
    u_xlat16_7 = sin(u_xlat16_36);
    u_xlat16_16 = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_15.x + u_xlat16_16;
    u_xlat16_8.z = u_xlat16_36 * 0.5;
    u_xlat16_8.y = u_xlat16_7;
    u_xlat52 = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_55) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
vec2 u_xlat37;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_Use_2U==1.0);
#else
    u_xlatb52 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_52 = texture(_LG_NoiseTex, u_xlat37.xy).x;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = vec2(u_xlat16_52) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat37.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat37.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat16_36 = (-_Sanshe_X) + 1.0;
    u_xlat16_7 = (-_Sanshe_Y) + 1.0;
    u_xlat16_36 = u_xlat16_36 * 3.1400001;
    u_xlat16_8.x = sin(u_xlat16_36);
    u_xlat16_15.x = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_7 * 3.1400001;
    u_xlat16_7 = sin(u_xlat16_36);
    u_xlat16_16 = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_15.x + u_xlat16_16;
    u_xlat16_8.z = u_xlat16_36 * 0.5;
    u_xlat16_8.y = u_xlat16_7;
    u_xlat52 = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_55) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
vec2 u_xlat37;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_Use_2U==1.0);
#else
    u_xlatb52 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_52 = texture(_LG_NoiseTex, u_xlat37.xy).x;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = vec2(u_xlat16_52) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat37.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat37.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat16_36 = (-_Sanshe_X) + 1.0;
    u_xlat16_7 = (-_Sanshe_Y) + 1.0;
    u_xlat16_36 = u_xlat16_36 * 3.1400001;
    u_xlat16_8.x = sin(u_xlat16_36);
    u_xlat16_15.x = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_7 * 3.1400001;
    u_xlat16_7 = sin(u_xlat16_36);
    u_xlat16_16 = cos(u_xlat16_36);
    u_xlat16_36 = u_xlat16_15.x + u_xlat16_16;
    u_xlat16_8.z = u_xlat16_36 * 0.5;
    u_xlat16_8.y = u_xlat16_7;
    u_xlat52 = dot(u_xlat16_8.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_55) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_42;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat16_42.xy = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_15.x = sin(u_xlat16_8.x);
    u_xlat16_7 = cos(u_xlat16_8.x);
    u_xlat16_8.xz = u_xlat16_42.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_16 = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_36 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_36 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_15.x = sin(u_xlat16_8.y);
    u_xlat16_7 = cos(u_xlat16_8.y);
    u_xlat16_16 = cos(u_xlat16_8.z);
    u_xlat16_8.x = sin(u_xlat16_8.z);
    u_xlat16_7 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_7 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_7 = log2(u_xlat52);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_42;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat16_42.xy = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_15.x = sin(u_xlat16_8.x);
    u_xlat16_7 = cos(u_xlat16_8.x);
    u_xlat16_8.xz = u_xlat16_42.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_16 = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_36 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_36 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_15.x = sin(u_xlat16_8.y);
    u_xlat16_7 = cos(u_xlat16_8.y);
    u_xlat16_16 = cos(u_xlat16_8.z);
    u_xlat16_8.x = sin(u_xlat16_8.z);
    u_xlat16_7 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_7 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_7 = log2(u_xlat52);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_42;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat16_42.xy = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_15.x = sin(u_xlat16_8.x);
    u_xlat16_7 = cos(u_xlat16_8.x);
    u_xlat16_8.xz = u_xlat16_42.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_16 = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_36 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_36 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_15.x = sin(u_xlat16_8.y);
    u_xlat16_7 = cos(u_xlat16_8.y);
    u_xlat16_16 = cos(u_xlat16_8.z);
    u_xlat16_8.x = sin(u_xlat16_8.z);
    u_xlat16_7 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_7 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_7 = log2(u_xlat52);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
mediump vec2 u_xlat16_42;
float u_xlat52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat16_42.xy = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_15.x = sin(u_xlat16_8.x);
    u_xlat16_7 = cos(u_xlat16_8.x);
    u_xlat16_8.xz = u_xlat16_42.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_16 = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_36 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_36 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_15.x = sin(u_xlat16_8.y);
    u_xlat16_7 = cos(u_xlat16_8.y);
    u_xlat16_16 = cos(u_xlat16_8.z);
    u_xlat16_8.x = sin(u_xlat16_8.z);
    u_xlat16_7 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_7 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_7 = log2(u_xlat52);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat3.xy).xyz;
    u_xlat5.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
vec2 u_xlat37;
mediump vec2 u_xlat16_42;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_Use_2U==1.0);
#else
    u_xlatb52 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_52 = texture(_LG_NoiseTex, u_xlat37.xy).x;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = vec2(u_xlat16_52) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat37.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat37.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat16_8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat16_42.xy = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_15.x = sin(u_xlat16_8.x);
    u_xlat16_7 = cos(u_xlat16_8.x);
    u_xlat16_8.xz = u_xlat16_42.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_16 = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_36 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_36 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_15.x = sin(u_xlat16_8.y);
    u_xlat16_7 = cos(u_xlat16_8.y);
    u_xlat16_16 = cos(u_xlat16_8.z);
    u_xlat16_8.x = sin(u_xlat16_8.z);
    u_xlat16_7 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_7 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_7 = log2(u_xlat52);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_55) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
vec2 u_xlat37;
mediump vec2 u_xlat16_42;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_Use_2U==1.0);
#else
    u_xlatb52 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_52 = texture(_LG_NoiseTex, u_xlat37.xy).x;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = vec2(u_xlat16_52) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat37.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat37.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat16_8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat16_42.xy = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_15.x = sin(u_xlat16_8.x);
    u_xlat16_7 = cos(u_xlat16_8.x);
    u_xlat16_8.xz = u_xlat16_42.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_16 = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_36 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_36 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_15.x = sin(u_xlat16_8.y);
    u_xlat16_7 = cos(u_xlat16_8.y);
    u_xlat16_16 = cos(u_xlat16_8.z);
    u_xlat16_8.x = sin(u_xlat16_8.z);
    u_xlat16_7 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_7 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_7 = log2(u_xlat52);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_55) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
vec2 u_xlat37;
mediump vec2 u_xlat16_42;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_Use_2U==1.0);
#else
    u_xlatb52 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_52 = texture(_LG_NoiseTex, u_xlat37.xy).x;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = vec2(u_xlat16_52) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat37.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat37.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat16_8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat16_42.xy = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_15.x = sin(u_xlat16_8.x);
    u_xlat16_7 = cos(u_xlat16_8.x);
    u_xlat16_8.xz = u_xlat16_42.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_16 = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_36 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_36 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_15.x = sin(u_xlat16_8.y);
    u_xlat16_7 = cos(u_xlat16_8.y);
    u_xlat16_16 = cos(u_xlat16_8.z);
    u_xlat16_8.x = sin(u_xlat16_8.z);
    u_xlat16_7 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_7 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_7 = log2(u_xlat52);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_55) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
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
in highp vec4 in_POSITION0;
in highp vec3 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec3 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
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
    vs_COLOR0.xyz = in_COLOR0.xyz;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb12 = unity_OrthoParams.w==0.0;
#endif
    u_xlat1.x = (u_xlatb12) ? u_xlat0.x : hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = (u_xlatb12) ? u_xlat0.y : hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = (u_xlatb12) ? u_xlat0.z : hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump float _Intensity;
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	mediump float _AO_Intensity;
uniform 	mediump float _EMISSION_ON;
uniform 	mediump float _Em_Intensity;
uniform 	mediump float _Em_Speed;
uniform 	mediump float _Metal_Intensity;
uniform 	mediump float _Rough_Intensity;
uniform 	mediump float _Skin_Intensity;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump vec3 _Cube_Gem_Color;
uniform 	mediump float _Cube_Gem_Intensity;
uniform 	mediump float _Cube_GemOut_Intensity;
uniform 	mediump float _Cube_Intensity;
uniform 	mediump vec3 _Refract_Color;
uniform 	mediump float _Refract_Rate;
uniform 	mediump float _Refract_Intensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump vec4 _Anti3S_Color;
uniform 	float _Anti3S_Power;
uniform 	mediump float _Anti3S_Intensity;
uniform 	mediump vec4 _DirectionalLight_Color;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump float _Use_2U;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_NoiseTex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec2 _LG_Noise_Speed;
uniform 	float _LG_Noise_Intensity;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _RampUVType;
uniform 	vec4 _RampTex_ST;
uniform 	mediump float _RampIntensity;
uniform 	mediump float _SpecIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Normal;
UNITY_LOCATION(5) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(6) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _LG_NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _RampTex;
in highp vec3 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_19;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_25;
float u_xlat34;
mediump vec2 u_xlat16_34;
bool u_xlatb34;
mediump float u_xlat16_36;
vec2 u_xlat37;
mediump vec2 u_xlat16_42;
float u_xlat52;
mediump float u_xlat16_52;
bool u_xlatb52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
float u_xlat56;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat0.xy).xyz;
    u_xlat16_34.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat3.x = vs_TEXCOORD4.x;
    u_xlat3.y = vs_TEXCOORD5.x;
    u_xlat3.z = vs_TEXCOORD3.x;
    u_xlat3.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat5.x = vs_TEXCOORD4.y;
    u_xlat5.y = vs_TEXCOORD5.y;
    u_xlat5.z = vs_TEXCOORD3.y;
    u_xlat3.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat5.x = vs_TEXCOORD4.z;
    u_xlat5.y = vs_TEXCOORD5.z;
    u_xlat5.z = vs_TEXCOORD3.z;
    u_xlat3.z = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat52 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 1.17549435e-38);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat5.xyz = vec3(u_xlat52) * u_xlat3.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_53 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat56 = dot(u_xlat5.xyz, vs_TEXCOORD6.xyz);
    u_xlat56 = max(u_xlat56, 0.0);
    u_xlat6.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = dot(u_xlat16_2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_2.xyz);
    u_xlat23.x = max(u_xlat23.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(_Metal_Intensity, _Rough_Intensity, _Skin_Intensity);
    u_xlat16_2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_55 = u_xlat16_55 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = (-u_xlat16_55) + 1.0;
    u_xlat16_7 = (-u_xlat16_2.x) + 1.0;
    u_xlat16_24.xyz = u_xlat16_4.xyz * vec3(u_xlat16_7);
    u_xlat16_24.xyz = u_xlat16_24.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.100000001);
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_2.y;
    u_xlat16_25 = u_xlat16_2.y * u_xlat16_2.y + 0.5;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_25 = u_xlat23.x * u_xlat23.x;
    u_xlat16_8.x = u_xlat16_2.y * u_xlat16_8.x;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_8.x + (-u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 + 1.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_25;
    u_xlat16_53 = u_xlat16_8.x / u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * 0.25 + -9.99999975e-06;
    u_xlat16_53 = max(u_xlat16_53, 0.0);
    u_xlat16_53 = min(u_xlat16_53, 20.0);
    u_xlat16_8.xyz = u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_9.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_10.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * vec3(vec3(_SpecIntensity, _SpecIntensity, _SpecIntensity)) + u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _DirectionalLight_Color.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_7) * _Ambient_Color.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_10.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat34 = dot((-vs_TEXCOORD6.xyz), u_xlat5.xyz);
    u_xlat1.x = _Refract_Rate * _Refract_Rate;
    u_xlat18 = (-u_xlat34) * u_xlat34 + 1.0;
    u_xlat1.x = (-u_xlat1.x) * u_xlat18 + 1.0;
    u_xlat18 = sqrt(u_xlat1.x);
    u_xlat18 = _Refract_Rate * u_xlat34 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.0);
#else
    u_xlatb1 = u_xlat1.x>=0.0;
#endif
    u_xlat23.xyz = u_xlat5.xyz * vec3(u_xlat18);
    u_xlat23.xyz = vec3(vec3(_Refract_Rate, _Refract_Rate, _Refract_Rate)) * (-vs_TEXCOORD6.xyz) + (-u_xlat23.xyz);
    u_xlat1.xyz = bool(u_xlatb1) ? u_xlat23.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat34 = u_xlat34 + u_xlat34;
    u_xlat23.xyz = u_xlat5.xyz * (-vec3(u_xlat34)) + (-vs_TEXCOORD6.xyz);
    u_xlat16_7 = u_xlat16_2.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat23.xyz, u_xlat16_7);
    u_xlat16_11 = u_xlat16_10 * vec4(vec4(_Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity, _Cube_GemOut_Intensity));
    u_xlat10 = u_xlat16_10 * vec4(_Cube_Gem_Intensity);
    u_xlat10 = max(u_xlat10, u_xlat16_11);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat34 = (-vs_COLOR0.x) + 1.0;
    u_xlat12.xyz = u_xlat16_1.xyz * vec3(u_xlat34);
    u_xlat1.xyz = max(u_xlat16_1.xyz, u_xlat12.xyz);
    u_xlat16_11.xyz = log2(abs(u_xlat10.xyz));
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_11.xyz = exp2(u_xlat16_11.xyz);
    u_xlat16_13.xyz = log2(abs(u_xlat1.xyz));
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_13.xyz = exp2(u_xlat16_13.xyz);
    u_xlat16_7 = u_xlat56 * u_xlat56;
    u_xlat16_14.xyz = vec3(u_xlat16_7) * _Refract_Color.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_Refract_Intensity);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = max(u_xlat16_53, 0.200000003);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_14.xyz;
    u_xlat16_11.xyz = u_xlat10.www * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_55) * u_xlat16_11.xyz;
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(_Cube_Gem_Color.x, _Cube_Gem_Color.y, _Cube_Gem_Color.z);
    u_xlat1.xyz = u_xlat16_11.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + (-u_xlat16_15.xyz);
    u_xlat1.xyz = vs_COLOR0.xxx * u_xlat1.xyz + u_xlat16_15.xyz;
    u_xlat16_53 = u_xlat23.y * 0.200000003 + 0.800000012;
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_53);
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb34 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb34){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat16_15.xyz = log2(abs(u_xlat16_0.xyz));
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
        u_xlat16_15.xyz = exp2(u_xlat16_15.xyz);
        u_xlat16_53 = max(_Em_Intensity, 0.0);
        u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_53);
        u_xlat0.x = _Em_Speed * _Time.y;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat0.xyz = (-u_xlat16_15.xyz) * abs(u_xlat0.xxx) + u_xlat16_15.xyz;
        u_xlat16_0.xyz = u_xlat0.xyz;
    } else {
        u_xlat16_0.x = float(0.0);
        u_xlat16_0.y = float(0.0);
        u_xlat16_0.z = float(0.0);
    }
    u_xlat16_53 = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_53 = u_xlat16_53 + 1.0;
    u_xlat16_53 = min(u_xlat16_53, 1.0);
    u_xlat16_55 = u_xlat16_3.w * _Alpha;
    u_xlat16_8.xyz = u_xlat16_2.xxx * u_xlat16_8.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat16_8.xyz = vec3(u_xlat16_55) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = (-u_xlat56) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_15.xyz = vec3(u_xlat16_53) + (-u_xlat16_8.xyz);
    u_xlat16_19 = (-u_xlat16_2.y) * 0.980000019 + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_15.xyz + u_xlat16_8.xyz;
    u_xlat1.x = u_xlat6.x * 0.5 + 0.5;
    u_xlat1.y = u_xlat16_2.z;
    u_xlat23.xyz = texture(_LutTex, u_xlat1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Skin_Intensity==0.0);
#else
    u_xlatb18 = _Skin_Intensity==0.0;
#endif
    u_xlat6.x = u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = (bool(u_xlatb18)) ? u_xlat6.xxx : u_xlat23.xyz;
    u_xlat16_36 = u_xlat16_2.z * _Anti3S_Intensity;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Anti3S_Power;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat16_36;
    u_xlat1.xyz = u_xlat1.xxx * _Anti3S_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat52) + vs_TEXCOORD6.xyz;
    u_xlat52 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_Use_2U==1.0);
#else
    u_xlatb52 = _Use_2U==1.0;
#endif
    u_xlat3.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * _LG_Noise_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_NoiseTex_ST.xy + _LG_NoiseTex_ST.zw;
    u_xlat16_52 = texture(_LG_NoiseTex, u_xlat37.xy).x;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = vec2(u_xlat16_52) * vec2(vec2(_LG_Noise_Intensity, _LG_Noise_Intensity)) + u_xlat37.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6 = texture(_LG_Tex, u_xlat37.xy);
    u_xlat16_3.xyz = texture(_LG_Mask, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity));
    u_xlat3.xyz = u_xlat16_6.www * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * _LG_Color.xyz;
    u_xlat16_8.xy = (-vec2(_Sanshe_X, _Sanshe2_X)) + vec2(1.0, 1.0);
    u_xlat16_42.xy = (-vec2(_Sanshe_Y, _Sanshe2_Y)) + vec2(1.0, 1.0);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_15.x = sin(u_xlat16_8.x);
    u_xlat16_7 = cos(u_xlat16_8.x);
    u_xlat16_8.xz = u_xlat16_42.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_16 = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_36 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_36 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_36 = log2(u_xlat52);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Fw;
    u_xlat16_36 = exp2(u_xlat16_36);
    u_xlat16_36 = u_xlat16_36 * _Sanshe_Power;
    u_xlat16_15.x = sin(u_xlat16_8.y);
    u_xlat16_7 = cos(u_xlat16_8.y);
    u_xlat16_16 = cos(u_xlat16_8.z);
    u_xlat16_8.x = sin(u_xlat16_8.z);
    u_xlat16_7 = u_xlat16_7 + u_xlat16_16;
    u_xlat16_15.z = u_xlat16_7 * 0.5;
    u_xlat16_15.y = u_xlat16_8.x;
    u_xlat52 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat52 = max(u_xlat52, 0.0);
    u_xlat16_7 = log2(u_xlat52);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Fw;
    u_xlat16_7 = exp2(u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * _Sanshe2_Power;
    u_xlat16_8.xyz = vec3(u_xlat16_7) * _Sanshe2_color.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_36) * _Sanshe_color.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_34.yyy * u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * u_xlat16_2.xyw + u_xlat16_8.xyz;
    u_xlat16_2.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb52 = !!(_RampUVType==1.0);
#else
    u_xlatb52 = _RampUVType==1.0;
#endif
    u_xlat5.xy = (bool(u_xlatb52)) ? vs_TEXCOORD1.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = u_xlat5.xy * _RampTex_ST.xy + _RampTex_ST.zw;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat5.xy).xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat16_24.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_55) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat16_55) + u_xlat16_4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_55) + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(_RampIntensity) * u_xlat16_4.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb1 = 0.0>=_COLOR_MODE;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = u_xlat16_2.xyz / u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
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
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_Directional_Sanshe" "_LG_ON" "_SANSHE2" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" }
  GpuProgramID 81282
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
Keywords { "MODE_UNITY" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
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
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
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
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
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
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
}
}
}
}