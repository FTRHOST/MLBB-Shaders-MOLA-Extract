//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Unlit/ThunderDragon" {
Properties {

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("基础色贴图", 2D) = "white" { }

_albedoColor ("基础颜色", Color) = (1,1,1,1)

_normalMap ("法线贴图", 2D) = "bump" { }

_normalIntensity ("法线强度", Range(0, 2)) = 1.0

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_FlowMap ("流动贴图", 2D) = "white" { }

_FlowIntensity ("流动强度", Range(-1, 1)) = 1.0

_FlowSpeed ("流动速度", Range(-20, 20)) = 1.0

_MaskMap ("遮罩贴图", 2D) = "white" { }

_WarpMap ("扭曲贴图", 2D) = "white" { }

_WarpDirSpeed ("扭曲流动方向速度", Vector) = (1,0,0,0)

_WarpIntensity ("扭曲强度", Range(-1, 1)) = 1.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightMap ("上层流光纹理", 2D) = "white" { }

_FlowLightColor ("上层流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("上层流光参数", Vector) = (0,1,1,1)

_FlowLightDownMap ("下层流光纹理", 2D) = "white" { }

_FlowLightDownColor ("下层流光颜色", Color) = (1,1,1,1)

_FlowLightDownFactory ("下层流光参数", Vector) = (0,1,1,1)

_FresnelColor ("菲涅尔1颜色", Color) = (1,1,1,1)

_FresnelPower ("菲涅尔1范围", Range(0, 10)) = 1.0

_FresnelIntensity ("菲涅尔1强度", Float) = 1.0

_Fresnel2Color ("菲涅尔2颜色", Color) = (1,1,1,1)

_Fresnel2Power ("菲涅尔2范围", Range(0, 10)) = 1.0

_Fresnel2Intensity ("菲涅尔2强度", Float) = 1.0

_RimLightMapEnable ("启用边缘光贴图", Float) = 0.0

_RimLightMap ("边缘光贴图", 2D) = "black" { }

_RimColor ("边缘光颜色", Color) = (1,1,1,1)

_RimPower ("边缘光范围", Range(0, 10)) = 1.0

_RimIntensity ("边缘光强度", Range(0, 10)) = 1.0

_RimHarden ("边缘光边缘硬化", Range(0, 1)) = 1.0

_VertexDistortEnable ("启用顶点扰动", Float) = 0.0

_VertexMaskMap ("顶点扰动遮罩", 2D) = "white" { }

_VertexMaskMapPower ("遮罩幂次", Range(0.01, 8)) = 1.0

_VertexDistortDir ("扰动方向（世界空间）", Vector) = (0,1,0,0)

_VertexDistortSpeed ("扰动速度", Float) = 1.0

_VertexDistortFreq ("扰动频率", Float) = 1.0

_VertexDistortAmp ("扰动振幅", Float) = 0.0

_VertexDistortRandomness ("波形随机度", Range(0, 1)) = 0.6499999761581421

_VertexDistortSeed ("随机种子", Float) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 26568
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
uniform 	mediump float _VertexDistortEnable;
uniform 	vec4 _VertexMaskMap_ST;
uniform 	mediump float _VertexMaskMapPower;
uniform 	vec4 _VertexDistortDir;
uniform 	mediump float _VertexDistortSpeed;
uniform 	mediump float _VertexDistortFreq;
uniform 	mediump float _VertexDistortAmp;
uniform 	mediump float _VertexDistortRandomness;
uniform 	mediump float _VertexDistortSeed;
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
UNITY_LOCATION(10) uniform mediump sampler2D _VertexMaskMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5>=_VertexDistortEnable);
#else
    u_xlatb0 = 0.5>=_VertexDistortEnable;
#endif
    if(u_xlatb0){
        u_xlat5.xyz = in_POSITION0.xyz;
    }
    if(!u_xlatb0){
        u_xlat1.xy = in_TEXCOORD0.xy * _VertexMaskMap_ST.xy + _VertexMaskMap_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskMap, u_xlat1.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat1.x = max(_VertexMaskMapPower, 9.99999975e-05);
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat1.x;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat1.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat1.x = u_xlat1.x + in_POSITION0.z;
        u_xlat1.x = u_xlat1.x * _VertexDistortFreq;
        u_xlat1.x = _VertexDistortSpeed * _Time.y + u_xlat1.x;
        u_xlat1.z = _VertexDistortSeed * 6.28318548 + u_xlat1.x;
        u_xlat2.xy = vec2(_VertexDistortSeed) * vec2(7.64663696, 4.59300852);
        u_xlat16 = u_xlat1.x * 1.73099995 + u_xlat2.x;
        u_xlat1.w = u_xlat16 + 1.92999995;
        u_xlat6.xyz = sin(u_xlat1.xzw);
        u_xlat16 = u_xlat6.z * 0.285699993;
        u_xlat11 = u_xlat6.y * 0.571399987 + u_xlat16;
        u_xlat1.x = u_xlat1.x * 2.41700006 + (-u_xlat2.y);
        u_xlat1.x = u_xlat1.x + 4.17000008;
        u_xlat1.x = sin(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * 0.142900005 + u_xlat11;
        u_xlat16_3.x = _VertexDistortRandomness;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
        u_xlat1.x = (-u_xlat6.x) + u_xlat1.x;
        u_xlat1.x = u_xlat16_3.x * u_xlat1.x + u_xlat6.x;
        u_xlat6.xyz = _VertexDistortDir.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _VertexDistortDir.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _VertexDistortDir.zzz + u_xlat6.xyz;
        u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat2.x = max(u_xlat2.x, 9.99999994e-09);
        u_xlat2.x = inversesqrt(u_xlat2.x);
        u_xlat6.xyz = u_xlat6.xyz * u_xlat2.xxx;
        u_xlat1.x = u_xlat1.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat1.x;
        u_xlat5.xyz = u_xlat6.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat15 * in_TANGENT0.w;
    u_xlat4 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat4;
    gl_Position = u_xlat4 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump vec4 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightDownMap_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump vec4 _FlowLightDownFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump float _Fresnel2Power;
uniform 	mediump float _Fresnel2Intensity;
uniform 	mediump float _RimLightMapEnable;
uniform 	mediump vec4 _RimColor;
uniform 	mediump float _RimPower;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimHarden;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(4) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(6) uniform mediump sampler2D _FlowLightDownMap;
UNITY_LOCATION(7) uniform mediump sampler2D _RimLightMap;
UNITY_LOCATION(8) uniform mediump sampler2D _MaskMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
float u_xlat24;
mediump float u_xlat16_25;
void main()
{
    u_xlat16_0.xy = texture(_FlowMap, vs_TEXCOORD3.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat0.xy * (-vec2(_FlowIntensity));
    u_xlat0.xy = _Time.yy * vec2(0.100000001, 0.00100000005);
    u_xlat16.x = u_xlat0.x * _FlowSpeed + 0.5;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat2.xy = (-u_xlat16_1.xy) * u_xlat16.xx + vs_TEXCOORD3.xy;
    u_xlat16_2.xyz = texture(_emissiveMap, u_xlat2.xy).xyz;
    u_xlat0.x = u_xlat0.x * _FlowSpeed;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat3.xy = (-u_xlat16_1.xy) * u_xlat0.xx + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat3.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.zxy + (-u_xlat16_3.zxy);
    u_xlat16_17 = (-u_xlat0.x) + 0.5;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_17;
    u_xlat2.xyz = abs(vec3(u_xlat16_17)) * u_xlat2.xyz + u_xlat16_3.zxy;
    u_xlat16_4.xyz = u_xlat2.xyz * _emissiveColor.zxy;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2.xy = _WarpDirSpeed.xy * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_5.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy + _WarpMap_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat16_2.xy = texture(_WarpMap, u_xlat2.xy).xy;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2 = texture(_MaskMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_2.zz * u_xlat16_5.xy;
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(_WarpIntensity) + vs_TEXCOORD3.xy;
    u_xlat16.xy = (-u_xlat16_1.xy) * u_xlat16.xx + u_xlat16_5.xy;
    u_xlat3.xy = (-u_xlat16_1.xy) * u_xlat0.xx + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_RimLightMap, u_xlat16_5.xy).x;
    u_xlat16_3.xyz = texture(_albedoMap, u_xlat3.xy).xyz;
    u_xlat16_6.xyz = texture(_albedoMap, u_xlat16.xy).xyz;
    u_xlat6.xyz = (-u_xlat16_3.zxy) + u_xlat16_6.zxy;
    u_xlat3.xyz = abs(vec3(u_xlat16_17)) * u_xlat6.xyz + u_xlat16_3.zxy;
    u_xlat16_1.xyz = u_xlat3.xyz * _albedoColor.zxy;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.y>=(-u_xlat0.y));
#else
    u_xlatb16 = u_xlat0.y>=(-u_xlat0.y);
#endif
    u_xlat8.x = fract(abs(u_xlat0.y));
    u_xlat8.x = (u_xlatb16) ? u_xlat8.x : (-u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 1000.0;
    u_xlat16.xy = u_xlat8.xx * _FlowLightFactory.yz + _FlowLightMap_ST.zw;
    u_xlat3.xy = u_xlat8.xx * _FlowLightDownFactory.yz + _FlowLightDownMap_ST.zw;
    u_xlat16_25 = (-_UseFlowLight2U) + 1.0;
    u_xlat16_4.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_4.xy = vs_TEXCOORD3.xy * vec2(u_xlat16_25) + u_xlat16_4.xy;
    u_xlat8.xy = u_xlat16_4.xy * _FlowLightMap_ST.xy + u_xlat16.xy;
    u_xlat3.xy = u_xlat16_4.xy * _FlowLightDownMap_ST.xy + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_FlowLightDownMap, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.zxy * _FlowLightDownColor.zxy;
    u_xlat16_8.xyz = texture(_FlowLightMap, u_xlat8.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat16_8.zxy);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _FlowLightFactory.www;
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _FlowLightColor.zxy;
    u_xlat16_25 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_25) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_2.xxx + u_xlat16_1.xyz;
    u_xlat16_25 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_2.yyy + u_xlat16_1.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vs_TEXCOORD1.zxy;
    u_xlat16_25 = dot(vs_TEXCOORD2.zxy, u_xlat16_4.xyz);
    u_xlat16_5.xyz = (-u_xlat16_4.zxy) * vec3(u_xlat16_25) + vs_TEXCOORD2.yzx;
    u_xlat8.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat8.x = max(u_xlat8.x, 1.17549435e-38);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat16_5.yxz;
    u_xlat16_5.xyz = u_xlat8.yxz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * u_xlat8.xzy + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat16_5.x;
    u_xlat2.x = u_xlat8.z;
    u_xlat16_3.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_normalIntensity);
    u_xlat2.z = u_xlat16_4.y;
    u_xlat2.x = dot(u_xlat16_7.xyz, u_xlat2.xyz);
    u_xlat3.z = u_xlat16_4.z;
    u_xlat8.z = u_xlat16_4.x;
    u_xlat3.x = u_xlat8.y;
    u_xlat3.y = u_xlat16_5.y;
    u_xlat8.y = u_xlat16_5.z;
    u_xlat2.z = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat2.y = dot(u_xlat16_7.xyz, u_xlat3.xyz);
    u_xlat16_25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat2.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_5.xyz = u_xlat8.xyz * vec3(u_xlat16_25);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = max(u_xlat8.x, 0.00100000005);
    u_xlat16_25 = log2(u_xlat8.x);
    u_xlat16_4.x = u_xlat16_25 * _RimPower;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_12 = max(_RimIntensity, 0.0);
    u_xlat8.x = min(_RimHarden, 0.999000013);
    u_xlat16.x = u_xlat16_4.x * u_xlat16_12 + (-u_xlat8.x);
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_4.x = (-_RimLightMapEnable) + 1.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_0.x * _RimLightMapEnable + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_4.xxx * _RimColor.zxy + u_xlat16_1.xyz;
    u_xlat16_4.x = u_xlat16_25 * _Fresnel2Power;
    u_xlat16_25 = u_xlat16_25 * _FresnelPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _FresnelIntensity;
    u_xlat16_25 = u_xlat16_2.w * u_xlat16_25;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_4.x = u_xlat16_4.x * _Fresnel2Intensity;
    u_xlat16_4.x = u_xlat16_2.w * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _Fresnel2Color.zxy;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * _FresnelColor.zxy + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
uniform 	mediump float _VertexDistortEnable;
uniform 	vec4 _VertexMaskMap_ST;
uniform 	mediump float _VertexMaskMapPower;
uniform 	vec4 _VertexDistortDir;
uniform 	mediump float _VertexDistortSpeed;
uniform 	mediump float _VertexDistortFreq;
uniform 	mediump float _VertexDistortAmp;
uniform 	mediump float _VertexDistortRandomness;
uniform 	mediump float _VertexDistortSeed;
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
UNITY_LOCATION(10) uniform mediump sampler2D _VertexMaskMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5>=_VertexDistortEnable);
#else
    u_xlatb0 = 0.5>=_VertexDistortEnable;
#endif
    if(u_xlatb0){
        u_xlat5.xyz = in_POSITION0.xyz;
    }
    if(!u_xlatb0){
        u_xlat1.xy = in_TEXCOORD0.xy * _VertexMaskMap_ST.xy + _VertexMaskMap_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskMap, u_xlat1.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat1.x = max(_VertexMaskMapPower, 9.99999975e-05);
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat1.x;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat1.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat1.x = u_xlat1.x + in_POSITION0.z;
        u_xlat1.x = u_xlat1.x * _VertexDistortFreq;
        u_xlat1.x = _VertexDistortSpeed * _Time.y + u_xlat1.x;
        u_xlat1.z = _VertexDistortSeed * 6.28318548 + u_xlat1.x;
        u_xlat2.xy = vec2(_VertexDistortSeed) * vec2(7.64663696, 4.59300852);
        u_xlat16 = u_xlat1.x * 1.73099995 + u_xlat2.x;
        u_xlat1.w = u_xlat16 + 1.92999995;
        u_xlat6.xyz = sin(u_xlat1.xzw);
        u_xlat16 = u_xlat6.z * 0.285699993;
        u_xlat11 = u_xlat6.y * 0.571399987 + u_xlat16;
        u_xlat1.x = u_xlat1.x * 2.41700006 + (-u_xlat2.y);
        u_xlat1.x = u_xlat1.x + 4.17000008;
        u_xlat1.x = sin(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * 0.142900005 + u_xlat11;
        u_xlat16_3.x = _VertexDistortRandomness;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
        u_xlat1.x = (-u_xlat6.x) + u_xlat1.x;
        u_xlat1.x = u_xlat16_3.x * u_xlat1.x + u_xlat6.x;
        u_xlat6.xyz = _VertexDistortDir.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _VertexDistortDir.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _VertexDistortDir.zzz + u_xlat6.xyz;
        u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat2.x = max(u_xlat2.x, 9.99999994e-09);
        u_xlat2.x = inversesqrt(u_xlat2.x);
        u_xlat6.xyz = u_xlat6.xyz * u_xlat2.xxx;
        u_xlat1.x = u_xlat1.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat1.x;
        u_xlat5.xyz = u_xlat6.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat15 * in_TANGENT0.w;
    u_xlat4 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat4;
    gl_Position = u_xlat4 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump vec4 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightDownMap_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump vec4 _FlowLightDownFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump float _Fresnel2Power;
uniform 	mediump float _Fresnel2Intensity;
uniform 	mediump float _RimLightMapEnable;
uniform 	mediump vec4 _RimColor;
uniform 	mediump float _RimPower;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimHarden;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(4) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(6) uniform mediump sampler2D _FlowLightDownMap;
UNITY_LOCATION(7) uniform mediump sampler2D _RimLightMap;
UNITY_LOCATION(8) uniform mediump sampler2D _MaskMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
float u_xlat24;
mediump float u_xlat16_25;
void main()
{
    u_xlat16_0.xy = texture(_FlowMap, vs_TEXCOORD3.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat0.xy * (-vec2(_FlowIntensity));
    u_xlat0.xy = _Time.yy * vec2(0.100000001, 0.00100000005);
    u_xlat16.x = u_xlat0.x * _FlowSpeed + 0.5;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat2.xy = (-u_xlat16_1.xy) * u_xlat16.xx + vs_TEXCOORD3.xy;
    u_xlat16_2.xyz = texture(_emissiveMap, u_xlat2.xy).xyz;
    u_xlat0.x = u_xlat0.x * _FlowSpeed;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat3.xy = (-u_xlat16_1.xy) * u_xlat0.xx + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat3.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.zxy + (-u_xlat16_3.zxy);
    u_xlat16_17 = (-u_xlat0.x) + 0.5;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_17;
    u_xlat2.xyz = abs(vec3(u_xlat16_17)) * u_xlat2.xyz + u_xlat16_3.zxy;
    u_xlat16_4.xyz = u_xlat2.xyz * _emissiveColor.zxy;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2.xy = _WarpDirSpeed.xy * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_5.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy + _WarpMap_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat16_2.xy = texture(_WarpMap, u_xlat2.xy).xy;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2 = texture(_MaskMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_2.zz * u_xlat16_5.xy;
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(_WarpIntensity) + vs_TEXCOORD3.xy;
    u_xlat16.xy = (-u_xlat16_1.xy) * u_xlat16.xx + u_xlat16_5.xy;
    u_xlat3.xy = (-u_xlat16_1.xy) * u_xlat0.xx + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_RimLightMap, u_xlat16_5.xy).x;
    u_xlat16_3.xyz = texture(_albedoMap, u_xlat3.xy).xyz;
    u_xlat16_6.xyz = texture(_albedoMap, u_xlat16.xy).xyz;
    u_xlat6.xyz = (-u_xlat16_3.zxy) + u_xlat16_6.zxy;
    u_xlat3.xyz = abs(vec3(u_xlat16_17)) * u_xlat6.xyz + u_xlat16_3.zxy;
    u_xlat16_1.xyz = u_xlat3.xyz * _albedoColor.zxy;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.y>=(-u_xlat0.y));
#else
    u_xlatb16 = u_xlat0.y>=(-u_xlat0.y);
#endif
    u_xlat8.x = fract(abs(u_xlat0.y));
    u_xlat8.x = (u_xlatb16) ? u_xlat8.x : (-u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 1000.0;
    u_xlat16.xy = u_xlat8.xx * _FlowLightFactory.yz + _FlowLightMap_ST.zw;
    u_xlat3.xy = u_xlat8.xx * _FlowLightDownFactory.yz + _FlowLightDownMap_ST.zw;
    u_xlat16_25 = (-_UseFlowLight2U) + 1.0;
    u_xlat16_4.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_4.xy = vs_TEXCOORD3.xy * vec2(u_xlat16_25) + u_xlat16_4.xy;
    u_xlat8.xy = u_xlat16_4.xy * _FlowLightMap_ST.xy + u_xlat16.xy;
    u_xlat3.xy = u_xlat16_4.xy * _FlowLightDownMap_ST.xy + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_FlowLightDownMap, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.zxy * _FlowLightDownColor.zxy;
    u_xlat16_8.xyz = texture(_FlowLightMap, u_xlat8.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat16_8.zxy);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _FlowLightFactory.www;
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _FlowLightColor.zxy;
    u_xlat16_25 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_25) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_2.xxx + u_xlat16_1.xyz;
    u_xlat16_25 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_2.yyy + u_xlat16_1.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vs_TEXCOORD1.zxy;
    u_xlat16_25 = dot(vs_TEXCOORD2.zxy, u_xlat16_4.xyz);
    u_xlat16_5.xyz = (-u_xlat16_4.zxy) * vec3(u_xlat16_25) + vs_TEXCOORD2.yzx;
    u_xlat8.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat8.x = max(u_xlat8.x, 1.17549435e-38);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat16_5.yxz;
    u_xlat16_5.xyz = u_xlat8.yxz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * u_xlat8.xzy + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat16_5.x;
    u_xlat2.x = u_xlat8.z;
    u_xlat16_3.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_normalIntensity);
    u_xlat2.z = u_xlat16_4.y;
    u_xlat2.x = dot(u_xlat16_7.xyz, u_xlat2.xyz);
    u_xlat3.z = u_xlat16_4.z;
    u_xlat8.z = u_xlat16_4.x;
    u_xlat3.x = u_xlat8.y;
    u_xlat3.y = u_xlat16_5.y;
    u_xlat8.y = u_xlat16_5.z;
    u_xlat2.z = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat2.y = dot(u_xlat16_7.xyz, u_xlat3.xyz);
    u_xlat16_25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat2.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_5.xyz = u_xlat8.xyz * vec3(u_xlat16_25);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = max(u_xlat8.x, 0.00100000005);
    u_xlat16_25 = log2(u_xlat8.x);
    u_xlat16_4.x = u_xlat16_25 * _RimPower;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_12 = max(_RimIntensity, 0.0);
    u_xlat8.x = min(_RimHarden, 0.999000013);
    u_xlat16.x = u_xlat16_4.x * u_xlat16_12 + (-u_xlat8.x);
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_4.x = (-_RimLightMapEnable) + 1.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_0.x * _RimLightMapEnable + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_4.xxx * _RimColor.zxy + u_xlat16_1.xyz;
    u_xlat16_4.x = u_xlat16_25 * _Fresnel2Power;
    u_xlat16_25 = u_xlat16_25 * _FresnelPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _FresnelIntensity;
    u_xlat16_25 = u_xlat16_2.w * u_xlat16_25;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_4.x = u_xlat16_4.x * _Fresnel2Intensity;
    u_xlat16_4.x = u_xlat16_2.w * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _Fresnel2Color.zxy;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * _FresnelColor.zxy + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
uniform 	mediump float _VertexDistortEnable;
uniform 	vec4 _VertexMaskMap_ST;
uniform 	mediump float _VertexMaskMapPower;
uniform 	vec4 _VertexDistortDir;
uniform 	mediump float _VertexDistortSpeed;
uniform 	mediump float _VertexDistortFreq;
uniform 	mediump float _VertexDistortAmp;
uniform 	mediump float _VertexDistortRandomness;
uniform 	mediump float _VertexDistortSeed;
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
UNITY_LOCATION(9) uniform mediump sampler2D _VertexMaskMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5>=_VertexDistortEnable);
#else
    u_xlatb0 = 0.5>=_VertexDistortEnable;
#endif
    if(u_xlatb0){
        u_xlat5.xyz = in_POSITION0.xyz;
    }
    if(!u_xlatb0){
        u_xlat1.xy = in_TEXCOORD0.xy * _VertexMaskMap_ST.xy + _VertexMaskMap_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskMap, u_xlat1.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat1.x = max(_VertexMaskMapPower, 9.99999975e-05);
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat1.x;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat1.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat1.x = u_xlat1.x + in_POSITION0.z;
        u_xlat1.x = u_xlat1.x * _VertexDistortFreq;
        u_xlat1.x = _VertexDistortSpeed * _Time.y + u_xlat1.x;
        u_xlat1.z = _VertexDistortSeed * 6.28318548 + u_xlat1.x;
        u_xlat2.xy = vec2(_VertexDistortSeed) * vec2(7.64663696, 4.59300852);
        u_xlat16 = u_xlat1.x * 1.73099995 + u_xlat2.x;
        u_xlat1.w = u_xlat16 + 1.92999995;
        u_xlat6.xyz = sin(u_xlat1.xzw);
        u_xlat16 = u_xlat6.z * 0.285699993;
        u_xlat11 = u_xlat6.y * 0.571399987 + u_xlat16;
        u_xlat1.x = u_xlat1.x * 2.41700006 + (-u_xlat2.y);
        u_xlat1.x = u_xlat1.x + 4.17000008;
        u_xlat1.x = sin(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * 0.142900005 + u_xlat11;
        u_xlat16_3.x = _VertexDistortRandomness;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
        u_xlat1.x = (-u_xlat6.x) + u_xlat1.x;
        u_xlat1.x = u_xlat16_3.x * u_xlat1.x + u_xlat6.x;
        u_xlat6.xyz = _VertexDistortDir.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _VertexDistortDir.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _VertexDistortDir.zzz + u_xlat6.xyz;
        u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat2.x = max(u_xlat2.x, 9.99999994e-09);
        u_xlat2.x = inversesqrt(u_xlat2.x);
        u_xlat6.xyz = u_xlat6.xyz * u_xlat2.xxx;
        u_xlat1.x = u_xlat1.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat1.x;
        u_xlat5.xyz = u_xlat6.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat15 * in_TANGENT0.w;
    u_xlat4 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat4;
    gl_Position = u_xlat4 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump vec4 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightDownMap_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump vec4 _FlowLightDownFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump float _Fresnel2Power;
uniform 	mediump float _Fresnel2Intensity;
uniform 	mediump float _RimLightMapEnable;
uniform 	mediump vec4 _RimColor;
uniform 	mediump float _RimPower;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimHarden;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(4) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(6) uniform mediump sampler2D _FlowLightDownMap;
UNITY_LOCATION(7) uniform mediump sampler2D _RimLightMap;
UNITY_LOCATION(8) uniform mediump sampler2D _MaskMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec2 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump float u_xlat16_25;
void main()
{
    u_xlat16_0.xy = texture(_FlowMap, vs_TEXCOORD3.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat0.xy * (-vec2(_FlowIntensity));
    u_xlat0.xy = _Time.yy * vec2(0.100000001, 0.00100000005);
    u_xlat16.x = u_xlat0.x * _FlowSpeed + 0.5;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat2.xy = (-u_xlat16_1.xy) * u_xlat16.xx + vs_TEXCOORD3.xy;
    u_xlat16_2.xyz = texture(_emissiveMap, u_xlat2.xy).xyz;
    u_xlat0.x = u_xlat0.x * _FlowSpeed;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat3.xy = (-u_xlat16_1.xy) * u_xlat0.xx + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat3.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_17 = (-u_xlat0.x) + 0.5;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_17;
    u_xlat2.xyz = abs(vec3(u_xlat16_17)) * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * _emissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2.xy = _WarpDirSpeed.xy * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_5.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy + _WarpMap_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat16_2.xy = texture(_WarpMap, u_xlat2.xy).xy;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2 = texture(_MaskMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_2.zz * u_xlat16_5.xy;
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(_WarpIntensity) + vs_TEXCOORD3.xy;
    u_xlat16.xy = (-u_xlat16_1.xy) * u_xlat16.xx + u_xlat16_5.xy;
    u_xlat3.xy = (-u_xlat16_1.xy) * u_xlat0.xx + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_RimLightMap, u_xlat16_5.xy).x;
    u_xlat16_3.xyz = texture(_albedoMap, u_xlat3.xy).xyz;
    u_xlat16_6.xyz = texture(_albedoMap, u_xlat16.xy).xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) + u_xlat16_6.xyz;
    u_xlat3.xyz = abs(vec3(u_xlat16_17)) * u_xlat6.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat3.xyz * _albedoColor.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.y>=(-u_xlat0.y));
#else
    u_xlatb16 = u_xlat0.y>=(-u_xlat0.y);
#endif
    u_xlat8.x = fract(abs(u_xlat0.y));
    u_xlat8.x = (u_xlatb16) ? u_xlat8.x : (-u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 1000.0;
    u_xlat16.xy = u_xlat8.xx * _FlowLightFactory.yz + _FlowLightMap_ST.zw;
    u_xlat3.xy = u_xlat8.xx * _FlowLightDownFactory.yz + _FlowLightDownMap_ST.zw;
    u_xlat16_25 = (-_UseFlowLight2U) + 1.0;
    u_xlat16_4.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_4.xy = vs_TEXCOORD3.xy * vec2(u_xlat16_25) + u_xlat16_4.xy;
    u_xlat8.xy = u_xlat16_4.xy * _FlowLightMap_ST.xy + u_xlat16.xy;
    u_xlat3.xy = u_xlat16_4.xy * _FlowLightDownMap_ST.xy + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_FlowLightDownMap, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _FlowLightDownColor.xyz;
    u_xlat16_8.xyz = texture(_FlowLightMap, u_xlat8.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat16_8.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _FlowLightFactory.www;
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _FlowLightColor.xyz;
    u_xlat16_25 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_25) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_2.xxx + u_xlat16_1.xyz;
    u_xlat16_25 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_2.yyy + u_xlat16_1.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vs_TEXCOORD1.zxy;
    u_xlat16_25 = dot(vs_TEXCOORD2.zxy, u_xlat16_4.xyz);
    u_xlat16_5.xyz = (-u_xlat16_4.zxy) * vec3(u_xlat16_25) + vs_TEXCOORD2.yzx;
    u_xlat8.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat8.x = max(u_xlat8.x, 1.17549435e-38);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat16_5.yxz;
    u_xlat16_5.xyz = u_xlat8.yxz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * u_xlat8.xzy + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat16_5.x;
    u_xlat2.x = u_xlat8.z;
    u_xlat16_3.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_normalIntensity);
    u_xlat2.z = u_xlat16_4.y;
    u_xlat2.x = dot(u_xlat16_7.xyz, u_xlat2.xyz);
    u_xlat3.z = u_xlat16_4.z;
    u_xlat8.z = u_xlat16_4.x;
    u_xlat3.x = u_xlat8.y;
    u_xlat3.y = u_xlat16_5.y;
    u_xlat8.y = u_xlat16_5.z;
    u_xlat2.z = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat2.y = dot(u_xlat16_7.xyz, u_xlat3.xyz);
    u_xlat16_25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat2.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_5.xyz = u_xlat8.xyz * vec3(u_xlat16_25);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = max(u_xlat8.x, 0.00100000005);
    u_xlat16_25 = log2(u_xlat8.x);
    u_xlat16_4.x = u_xlat16_25 * _RimPower;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_12 = max(_RimIntensity, 0.0);
    u_xlat8.x = min(_RimHarden, 0.999000013);
    u_xlat16.x = u_xlat16_4.x * u_xlat16_12 + (-u_xlat8.x);
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_4.x = (-_RimLightMapEnable) + 1.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_0.x * _RimLightMapEnable + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_4.xxx * _RimColor.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = u_xlat16_25 * _Fresnel2Power;
    u_xlat16_25 = u_xlat16_25 * _FresnelPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _FresnelIntensity;
    u_xlat16_25 = u_xlat16_2.w * u_xlat16_25;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_4.x = u_xlat16_4.x * _Fresnel2Intensity;
    u_xlat16_4.x = u_xlat16_2.w * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _Fresnel2Color.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * _FresnelColor.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
uniform 	mediump float _VertexDistortEnable;
uniform 	vec4 _VertexMaskMap_ST;
uniform 	mediump float _VertexMaskMapPower;
uniform 	vec4 _VertexDistortDir;
uniform 	mediump float _VertexDistortSpeed;
uniform 	mediump float _VertexDistortFreq;
uniform 	mediump float _VertexDistortAmp;
uniform 	mediump float _VertexDistortRandomness;
uniform 	mediump float _VertexDistortSeed;
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
UNITY_LOCATION(9) uniform mediump sampler2D _VertexMaskMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5>=_VertexDistortEnable);
#else
    u_xlatb0 = 0.5>=_VertexDistortEnable;
#endif
    if(u_xlatb0){
        u_xlat5.xyz = in_POSITION0.xyz;
    }
    if(!u_xlatb0){
        u_xlat1.xy = in_TEXCOORD0.xy * _VertexMaskMap_ST.xy + _VertexMaskMap_ST.zw;
        u_xlat0.x = textureLod(_VertexMaskMap, u_xlat1.xy, 0.0).x;
        u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat1.x = max(_VertexMaskMapPower, 9.99999975e-05);
        u_xlat0.x = log2(u_xlat0.x);
        u_xlat0.x = u_xlat0.x * u_xlat1.x;
        u_xlat0.x = exp2(u_xlat0.x);
        u_xlat1.x = in_POSITION0.y + in_POSITION0.x;
        u_xlat1.x = u_xlat1.x + in_POSITION0.z;
        u_xlat1.x = u_xlat1.x * _VertexDistortFreq;
        u_xlat1.x = _VertexDistortSpeed * _Time.y + u_xlat1.x;
        u_xlat1.z = _VertexDistortSeed * 6.28318548 + u_xlat1.x;
        u_xlat2.xy = vec2(_VertexDistortSeed) * vec2(7.64663696, 4.59300852);
        u_xlat16 = u_xlat1.x * 1.73099995 + u_xlat2.x;
        u_xlat1.w = u_xlat16 + 1.92999995;
        u_xlat6.xyz = sin(u_xlat1.xzw);
        u_xlat16 = u_xlat6.z * 0.285699993;
        u_xlat11 = u_xlat6.y * 0.571399987 + u_xlat16;
        u_xlat1.x = u_xlat1.x * 2.41700006 + (-u_xlat2.y);
        u_xlat1.x = u_xlat1.x + 4.17000008;
        u_xlat1.x = sin(u_xlat1.x);
        u_xlat1.x = u_xlat1.x * 0.142900005 + u_xlat11;
        u_xlat16_3.x = _VertexDistortRandomness;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
        u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
        u_xlat1.x = (-u_xlat6.x) + u_xlat1.x;
        u_xlat1.x = u_xlat16_3.x * u_xlat1.x + u_xlat6.x;
        u_xlat6.xyz = _VertexDistortDir.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _VertexDistortDir.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _VertexDistortDir.zzz + u_xlat6.xyz;
        u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat2.x = max(u_xlat2.x, 9.99999994e-09);
        u_xlat2.x = inversesqrt(u_xlat2.x);
        u_xlat6.xyz = u_xlat6.xyz * u_xlat2.xxx;
        u_xlat1.x = u_xlat1.x * _VertexDistortAmp;
        u_xlat0.x = u_xlat0.x * u_xlat1.x;
        u_xlat5.xyz = u_xlat6.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    }
    u_xlat1.xyz = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat15 * in_TANGENT0.w;
    u_xlat4 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat4;
    gl_Position = u_xlat4 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _normalIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump float _FlowIntensity;
uniform 	mediump float _FlowSpeed;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump vec4 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _FlowLightMap_ST;
uniform 	mediump vec4 _FlowLightDownMap_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _FlowLightDownColor;
uniform 	mediump vec4 _FlowLightDownFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump float _Fresnel2Power;
uniform 	mediump float _Fresnel2Intensity;
uniform 	mediump float _RimLightMapEnable;
uniform 	mediump vec4 _RimColor;
uniform 	mediump float _RimPower;
uniform 	mediump float _RimIntensity;
uniform 	mediump float _RimHarden;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(4) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightMap;
UNITY_LOCATION(6) uniform mediump sampler2D _FlowLightDownMap;
UNITY_LOCATION(7) uniform mediump sampler2D _RimLightMap;
UNITY_LOCATION(8) uniform mediump sampler2D _MaskMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec2 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump float u_xlat16_25;
void main()
{
    u_xlat16_0.xy = texture(_FlowMap, vs_TEXCOORD3.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.xy = u_xlat0.xy * (-vec2(_FlowIntensity));
    u_xlat0.xy = _Time.yy * vec2(0.100000001, 0.00100000005);
    u_xlat16.x = u_xlat0.x * _FlowSpeed + 0.5;
    u_xlat16.x = fract(u_xlat16.x);
    u_xlat2.xy = (-u_xlat16_1.xy) * u_xlat16.xx + vs_TEXCOORD3.xy;
    u_xlat16_2.xyz = texture(_emissiveMap, u_xlat2.xy).xyz;
    u_xlat0.x = u_xlat0.x * _FlowSpeed;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat3.xy = (-u_xlat16_1.xy) * u_xlat0.xx + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat3.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_17 = (-u_xlat0.x) + 0.5;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_17;
    u_xlat2.xyz = abs(vec3(u_xlat16_17)) * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * _emissiveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat2.xy = _WarpDirSpeed.xy * _Time.yy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_5.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy + _WarpMap_ST.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat16_2.xy = texture(_WarpMap, u_xlat2.xy).xy;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_2 = texture(_MaskMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_2.zz * u_xlat16_5.xy;
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(_WarpIntensity) + vs_TEXCOORD3.xy;
    u_xlat16.xy = (-u_xlat16_1.xy) * u_xlat16.xx + u_xlat16_5.xy;
    u_xlat3.xy = (-u_xlat16_1.xy) * u_xlat0.xx + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_RimLightMap, u_xlat16_5.xy).x;
    u_xlat16_3.xyz = texture(_albedoMap, u_xlat3.xy).xyz;
    u_xlat16_6.xyz = texture(_albedoMap, u_xlat16.xy).xyz;
    u_xlat6.xyz = (-u_xlat16_3.xyz) + u_xlat16_6.xyz;
    u_xlat3.xyz = abs(vec3(u_xlat16_17)) * u_xlat6.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat3.xyz * _albedoColor.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.y>=(-u_xlat0.y));
#else
    u_xlatb16 = u_xlat0.y>=(-u_xlat0.y);
#endif
    u_xlat8.x = fract(abs(u_xlat0.y));
    u_xlat8.x = (u_xlatb16) ? u_xlat8.x : (-u_xlat8.x);
    u_xlat8.x = u_xlat8.x * 1000.0;
    u_xlat16.xy = u_xlat8.xx * _FlowLightFactory.yz + _FlowLightMap_ST.zw;
    u_xlat3.xy = u_xlat8.xx * _FlowLightDownFactory.yz + _FlowLightDownMap_ST.zw;
    u_xlat16_25 = (-_UseFlowLight2U) + 1.0;
    u_xlat16_4.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_4.xy = vs_TEXCOORD3.xy * vec2(u_xlat16_25) + u_xlat16_4.xy;
    u_xlat8.xy = u_xlat16_4.xy * _FlowLightMap_ST.xy + u_xlat16.xy;
    u_xlat3.xy = u_xlat16_4.xy * _FlowLightDownMap_ST.xy + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_FlowLightDownMap, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _FlowLightDownColor.xyz;
    u_xlat16_8.xyz = texture(_FlowLightMap, u_xlat8.xy).xyz;
    u_xlat16_5.xyz = log2(u_xlat16_8.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _FlowLightFactory.www;
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * _FlowLightColor.xyz;
    u_xlat16_25 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_25) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_2.xxx + u_xlat16_1.xyz;
    u_xlat16_25 = max(_FlowLightDownFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_2.yyy + u_xlat16_1.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vs_TEXCOORD1.zxy;
    u_xlat16_25 = dot(vs_TEXCOORD2.zxy, u_xlat16_4.xyz);
    u_xlat16_5.xyz = (-u_xlat16_4.zxy) * vec3(u_xlat16_25) + vs_TEXCOORD2.yzx;
    u_xlat8.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat8.x = max(u_xlat8.x, 1.17549435e-38);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat16_5.yxz;
    u_xlat16_5.xyz = u_xlat8.yxz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * u_xlat8.xzy + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_TEXCOORD2.www;
    u_xlat2.y = u_xlat16_5.x;
    u_xlat2.x = u_xlat8.z;
    u_xlat16_3.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_normalIntensity);
    u_xlat2.z = u_xlat16_4.y;
    u_xlat2.x = dot(u_xlat16_7.xyz, u_xlat2.xyz);
    u_xlat3.z = u_xlat16_4.z;
    u_xlat8.z = u_xlat16_4.x;
    u_xlat3.x = u_xlat8.y;
    u_xlat3.y = u_xlat16_5.y;
    u_xlat8.y = u_xlat16_5.z;
    u_xlat2.z = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat2.y = dot(u_xlat16_7.xyz, u_xlat3.xyz);
    u_xlat16_25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat2.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_5.xyz = u_xlat8.xyz * vec3(u_xlat16_25);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = max(u_xlat8.x, 0.00100000005);
    u_xlat16_25 = log2(u_xlat8.x);
    u_xlat16_4.x = u_xlat16_25 * _RimPower;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_12 = max(_RimIntensity, 0.0);
    u_xlat8.x = min(_RimHarden, 0.999000013);
    u_xlat16.x = u_xlat16_4.x * u_xlat16_12 + (-u_xlat8.x);
    u_xlat8.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_4.x = (-_RimLightMapEnable) + 1.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_0.x * _RimLightMapEnable + u_xlat16_4.x;
    u_xlat16_1.xyz = u_xlat16_4.xxx * _RimColor.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = u_xlat16_25 * _Fresnel2Power;
    u_xlat16_25 = u_xlat16_25 * _FresnelPower;
    u_xlat16_25 = exp2(u_xlat16_25);
    u_xlat16_25 = u_xlat16_25 * _FresnelIntensity;
    u_xlat16_25 = u_xlat16_2.w * u_xlat16_25;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_4.x = u_xlat16_4.x * _Fresnel2Intensity;
    u_xlat16_4.x = u_xlat16_2.w * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _Fresnel2Color.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_25) * _FresnelColor.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
CustomEditor "CodeGenShaderGUI.Theseus_Unlit_ThunderDragonGUI"
}