//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/Water_Characters" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _AlbedoTex ("Albedo贴图", 2D) = "white" { }

_WaterShallowColor ("浅水颜色", Color) = (1,1,1,1)

_WaterDeepColor ("深水颜色", Color) = (1,1,1,1)

_WaterSSSColor ("水面SSS颜色", Color) = (1,1,1,1)

[Tex] _WaterDepthTex ("水深度贴图", 2D) = "white" { }

_DeepShallowRange ("水深浅范围", Range(0, 5)) = 1.0

_FlowTex ("rg:flow map dir, b:流动范围", 2D) = "white" { }

_FlowSpeed ("流动速度", Range(-10, 10)) = 0.0

_FlowScale ("流动范围", Range(-1, 1)) = 0.0

_FloorDistortion ("水底扭曲强度", Range(0, 1)) = 0.0

_DefinitionWater ("水底清晰度", Range(0, 1)) = 0.0

_SpecularColor ("主光颜色", Color) = (1,1,1,1)

_SpecularRange ("高光范围", Float) = 1.0

_SpecularIntensity ("高光强度", Float) = 1.0

[Tex] _normalMap ("基础法线贴图", 2D) = "bump" { }

_WaveMap ("水波法线贴图", 2D) = "bump" { }

_WaveIntensity ("水波强度", Range(0, 2)) = 1.0

_WaveIntensity2 ("高光水波强度", Range(0, 2)) = 1.0

_WaveXSpeed ("水面流动速度", Range(0, 5)) = 1.0

[Tex] _FoamTex ("浮沫贴图", 2D) = "white" { }

_FoamColor ("浮沫颜色", Color) = (1,1,1,1)

_FoamRange ("浮沫区域范围", Float) = 1.0

_FoamDistortion ("浮沫扭曲强度", Range(0, 1)) = 0.0

[Tex] _FlowLightTex ("流光贴图", 2D) = "white" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightData ("XY: 流动速度方向; Z: 扭曲强度; W: 宽度", Vector) = (1,1,1,1)

_GlitterTex ("闪点贴图", 2D) = "white" { }

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 50)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

_GlitterFlowSpeed ("闪点流动速度", Range(-5, 5)) = 1.0

_WaterCube ("环境反射Cube", Cube) = "" { }

_CubeColor ("环境反射颜色", Color) = (1,1,1,1)

_FresnelScale ("环境反射区域范围", Float) = 1.0

_FresnelIntensity ("环境反射强度", Range(0, 5)) = 1.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
 "_GrabTexture"
}
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 20959
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_TEXCOORD3;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat15 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD3.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _FlowSpeed;
uniform 	mediump float _FlowScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _DeepShallowRange;
uniform 	mediump float _DefinitionWater;
uniform 	mediump float _FloorDistortion;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _WaveIntensity2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightData;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(5) uniform mediump sampler2D _WaterDepthTex;
UNITY_LOCATION(6) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(7) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_32;
vec2 u_xlat35;
mediump float u_xlat16_48;
float u_xlat50;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_54;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy;
    u_xlat1.x = _WaveXSpeed * _Time.x;
    u_xlat17.xy = u_xlat1.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_0.xy;
    u_xlat1.xw = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat1.xx;
    u_xlat2.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat16_18.xyz = texture(_FlowTex, vs_TEXCOORD3.xy).xyz;
    u_xlat18.xy = u_xlat16_18.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat35.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_4.xyz = texture(_WaveMap, u_xlat35.xy).xyz;
    u_xlat2.x = _FlowSpeed * _Time.y;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat18.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat2.x = (-u_xlat2.x) + 0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat18.xy = u_xlat18.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat17.xy = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_0.xyz = abs(u_xlat2.xxx) * u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = u_xlat16_0.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_0.xy = u_xlat16_4.zw;
    u_xlat16_48 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_0.xyw = vec3(u_xlat16_48) * u_xlat16_0.xyz;
    u_xlat16_4.z = u_xlat16_0.z;
    u_xlat17.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat1.xw = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat18.xy = (-u_xlat18.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_AlbedoTex, u_xlat3.xy).xyz;
    u_xlat16_18.xyz = texture(_AlbedoTex, u_xlat18.xy).xyz;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat1.xw).xyz;
    u_xlat16_1.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = u_xlat16_6.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_6.xy = u_xlat16_1.zw;
    u_xlat16_32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_6.xyw = vec3(u_xlat16_32) * u_xlat16_6.xyz;
    u_xlat16_1.z = u_xlat16_6.z;
    u_xlat16_0.xyz = u_xlat16_0.xyw * u_xlat16_6.xyw;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat7.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat5.xy = u_xlat9.xy;
    u_xlat10.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat11.xy = u_xlat7.xy;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_0.xyz, u_xlat11.xyz);
    u_xlat12.xy = u_xlat8.xy;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_0.xyz, u_xlat12.xyz);
    u_xlat51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_16.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_16.xyz, u_xlat8.xyz);
    u_xlat51 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16_16.xyz = u_xlat9.xyz * vec3(u_xlat51) + u_xlat10.xyz;
    u_xlat51 = dot(u_xlat16_16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat16_6.xyz = (-u_xlat16_18.zxy) + u_xlat16_3.zxy;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_18.zxy;
    u_xlat16_2.xy = texture(_WaterDepthTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_54 = log2(u_xlat16_2.x);
    u_xlat16_54 = u_xlat16_54 * _DeepShallowRange;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_14.xyz = _WaterShallowColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat16_14.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz + _WaterDeepColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat16_14.xyz;
    u_xlat3.xy = u_xlat16_0.xx * vec2(vec2(_FloorDistortion, _FloorDistortion)) + vs_TEXCOORD8.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_3.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.zxy * vec3(u_xlat51);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_54 = _DefinitionWater;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat16_54) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_14.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_14.xyz, u_xlat12.xyz);
    u_xlat50 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat3.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(u_xlat16_54);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat7.xyz;
    u_xlat50 = dot(u_xlat3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 100.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _SpecularRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_15.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat50) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xxx * _WaterSSSColor.zxy + u_xlat2.xyz;
    u_xlat50 = dot((-u_xlat16_14.xyz), u_xlat16_16.xyz);
    u_xlat50 = u_xlat50 + u_xlat50;
    u_xlat3.xyz = u_xlat16_16.xyz * (-vec3(u_xlat50)) + (-u_xlat16_14.xyz);
    u_xlat50 = dot(u_xlat16_14.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _FresnelScale;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_3.xyz = texture(_WaterCube, u_xlat3.xyz).xyz;
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat16_3.zxy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_FresnelIntensity);
    u_xlat2.xyz = u_xlat3.xyz * _CubeColor.zxy + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_0.xx * _FlowLightData.zz + vs_TEXCOORD3.zw;
    u_xlat35.xy = u_xlat16_0.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat5.xy = _Time.yy * _FlowLightData.xy + _FlowLightTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * _FlowLightTex_ST.xy + u_xlat5.xy;
    u_xlat16_50 = texture(_FlowLightTex, u_xlat3.xy).x;
    u_xlat16_0.x = (-vs_TEXCOORD3.w) + 1.0;
    u_xlat50 = u_xlat16_0.x * u_xlat16_50;
    u_xlat16_0.x = log2(u_xlat50);
    u_xlat16_0.x = u_xlat16_0.x * _FlowLightData.w;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_14.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_14.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_14.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_0.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_0.xx * u_xlat3.xy;
    u_xlat16_5.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat50 = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat16_0.x = 1.5;
    u_xlat16_14.y = u_xlat16_0.x * u_xlat50;
    u_xlat16_0.y = _GlitterScale;
    u_xlat16_14.x = u_xlat16_0.y * vs_TEXCOORD3.x;
    u_xlat16_0.xy = u_xlat16_0.xy * u_xlat16_14.xy;
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_5.zxy * u_xlat16_7.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_GlitterIntensity);
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat16_0.xyz * _GlitterColor.zxy + u_xlat2.xyz;
    u_xlat3.x = 0.0;
    u_xlat3.y = _Time.y * 0.5;
    u_xlat3.xy = u_xlat3.xy + _FoamTex_ST.zw;
    u_xlat3.xy = u_xlat35.xy * _FoamTex_ST.xy + u_xlat3.xy;
    u_xlat16_50 = texture(_FoamTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_FoamTex, vs_TEXCOORD3.xy).y;
    u_xlat16_0.x = log2(u_xlat16_3.x);
    u_xlat16_0.x = u_xlat16_0.x * _FoamRange;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = (-u_xlat16_50) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xxx * _FoamColor.zxy;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat16_0.xyz = (-u_xlat2.xyz) + _FogCol.zxy;
    u_xlat16_0.xyz = vs_TEXCOORD0.www * u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat50 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat50);
    u_xlat0.x = u_xlat50 * 0.0625 + u_xlat0.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_TEXCOORD3;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat15 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD3.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _FlowSpeed;
uniform 	mediump float _FlowScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _DeepShallowRange;
uniform 	mediump float _DefinitionWater;
uniform 	mediump float _FloorDistortion;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _WaveIntensity2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightData;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(5) uniform mediump sampler2D _WaterDepthTex;
UNITY_LOCATION(6) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(7) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_32;
vec2 u_xlat35;
mediump float u_xlat16_48;
float u_xlat50;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_54;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy;
    u_xlat1.x = _WaveXSpeed * _Time.x;
    u_xlat17.xy = u_xlat1.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_0.xy;
    u_xlat1.xw = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat1.xx;
    u_xlat2.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat16_18.xyz = texture(_FlowTex, vs_TEXCOORD3.xy).xyz;
    u_xlat18.xy = u_xlat16_18.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat35.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_4.xyz = texture(_WaveMap, u_xlat35.xy).xyz;
    u_xlat2.x = _FlowSpeed * _Time.y;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat18.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat2.x = (-u_xlat2.x) + 0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat18.xy = u_xlat18.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat17.xy = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_0.xyz = abs(u_xlat2.xxx) * u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = u_xlat16_0.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_0.xy = u_xlat16_4.zw;
    u_xlat16_48 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_0.xyw = vec3(u_xlat16_48) * u_xlat16_0.xyz;
    u_xlat16_4.z = u_xlat16_0.z;
    u_xlat17.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat1.xw = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat18.xy = (-u_xlat18.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_AlbedoTex, u_xlat3.xy).xyz;
    u_xlat16_18.xyz = texture(_AlbedoTex, u_xlat18.xy).xyz;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat1.xw).xyz;
    u_xlat16_1.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = u_xlat16_6.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_6.xy = u_xlat16_1.zw;
    u_xlat16_32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_6.xyw = vec3(u_xlat16_32) * u_xlat16_6.xyz;
    u_xlat16_1.z = u_xlat16_6.z;
    u_xlat16_0.xyz = u_xlat16_0.xyw * u_xlat16_6.xyw;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat7.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat5.xy = u_xlat9.xy;
    u_xlat10.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat11.xy = u_xlat7.xy;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_0.xyz, u_xlat11.xyz);
    u_xlat12.xy = u_xlat8.xy;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_0.xyz, u_xlat12.xyz);
    u_xlat51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_16.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_16.xyz, u_xlat8.xyz);
    u_xlat51 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16_16.xyz = u_xlat9.xyz * vec3(u_xlat51) + u_xlat10.xyz;
    u_xlat51 = dot(u_xlat16_16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat16_6.xyz = (-u_xlat16_18.zxy) + u_xlat16_3.zxy;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_18.zxy;
    u_xlat16_2.xy = texture(_WaterDepthTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_54 = log2(u_xlat16_2.x);
    u_xlat16_54 = u_xlat16_54 * _DeepShallowRange;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_14.xyz = _WaterShallowColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat16_14.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz + _WaterDeepColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat16_14.xyz;
    u_xlat3.xy = u_xlat16_0.xx * vec2(vec2(_FloorDistortion, _FloorDistortion)) + vs_TEXCOORD8.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_3.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.zxy * vec3(u_xlat51);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_54 = _DefinitionWater;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat16_54) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_14.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_14.xyz, u_xlat12.xyz);
    u_xlat50 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat3.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(u_xlat16_54);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat7.xyz;
    u_xlat50 = dot(u_xlat3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 100.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _SpecularRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_15.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat50) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xxx * _WaterSSSColor.zxy + u_xlat2.xyz;
    u_xlat50 = dot((-u_xlat16_14.xyz), u_xlat16_16.xyz);
    u_xlat50 = u_xlat50 + u_xlat50;
    u_xlat3.xyz = u_xlat16_16.xyz * (-vec3(u_xlat50)) + (-u_xlat16_14.xyz);
    u_xlat50 = dot(u_xlat16_14.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _FresnelScale;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_3.xyz = texture(_WaterCube, u_xlat3.xyz).xyz;
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat16_3.zxy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_FresnelIntensity);
    u_xlat2.xyz = u_xlat3.xyz * _CubeColor.zxy + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_0.xx * _FlowLightData.zz + vs_TEXCOORD3.zw;
    u_xlat35.xy = u_xlat16_0.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat5.xy = _Time.yy * _FlowLightData.xy + _FlowLightTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * _FlowLightTex_ST.xy + u_xlat5.xy;
    u_xlat16_50 = texture(_FlowLightTex, u_xlat3.xy).x;
    u_xlat16_0.x = (-vs_TEXCOORD3.w) + 1.0;
    u_xlat50 = u_xlat16_0.x * u_xlat16_50;
    u_xlat16_0.x = log2(u_xlat50);
    u_xlat16_0.x = u_xlat16_0.x * _FlowLightData.w;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_14.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_14.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_14.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_0.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_0.xx * u_xlat3.xy;
    u_xlat16_5.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat50 = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat16_0.x = 1.5;
    u_xlat16_14.y = u_xlat16_0.x * u_xlat50;
    u_xlat16_0.y = _GlitterScale;
    u_xlat16_14.x = u_xlat16_0.y * vs_TEXCOORD3.x;
    u_xlat16_0.xy = u_xlat16_0.xy * u_xlat16_14.xy;
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_5.zxy * u_xlat16_7.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_GlitterIntensity);
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat16_0.xyz * _GlitterColor.zxy + u_xlat2.xyz;
    u_xlat3.x = 0.0;
    u_xlat3.y = _Time.y * 0.5;
    u_xlat3.xy = u_xlat3.xy + _FoamTex_ST.zw;
    u_xlat3.xy = u_xlat35.xy * _FoamTex_ST.xy + u_xlat3.xy;
    u_xlat16_50 = texture(_FoamTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_FoamTex, vs_TEXCOORD3.xy).y;
    u_xlat16_0.x = log2(u_xlat16_3.x);
    u_xlat16_0.x = u_xlat16_0.x * _FoamRange;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = (-u_xlat16_50) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xxx * _FoamColor.zxy;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat16_0.xyz = (-u_xlat2.xyz) + _FogCol.zxy;
    u_xlat16_0.xyz = vs_TEXCOORD0.www * u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat50 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat50);
    u_xlat0.x = u_xlat50 * 0.0625 + u_xlat0.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_TEXCOORD3;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat15 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD3.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _FlowSpeed;
uniform 	mediump float _FlowScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _DeepShallowRange;
uniform 	mediump float _DefinitionWater;
uniform 	mediump float _FloorDistortion;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _WaveIntensity2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightData;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(5) uniform mediump sampler2D _WaterDepthTex;
UNITY_LOCATION(6) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(7) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_32;
vec2 u_xlat35;
mediump float u_xlat16_48;
float u_xlat50;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_54;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy;
    u_xlat1.x = _WaveXSpeed * _Time.x;
    u_xlat17.xy = u_xlat1.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_0.xy;
    u_xlat1.xw = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat1.xx;
    u_xlat2.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat16_18.xyz = texture(_FlowTex, vs_TEXCOORD3.xy).xyz;
    u_xlat18.xy = u_xlat16_18.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat35.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_4.xyz = texture(_WaveMap, u_xlat35.xy).xyz;
    u_xlat2.x = _FlowSpeed * _Time.y;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat18.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat2.x = (-u_xlat2.x) + 0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat18.xy = u_xlat18.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat17.xy = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_0.xyz = abs(u_xlat2.xxx) * u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = u_xlat16_0.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_0.xy = u_xlat16_4.zw;
    u_xlat16_48 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_0.xyw = vec3(u_xlat16_48) * u_xlat16_0.xyz;
    u_xlat16_4.z = u_xlat16_0.z;
    u_xlat17.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat1.xw = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat18.xy = (-u_xlat18.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_AlbedoTex, u_xlat3.xy).xyz;
    u_xlat16_18.xyz = texture(_AlbedoTex, u_xlat18.xy).xyz;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat1.xw).xyz;
    u_xlat16_1.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = u_xlat16_6.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_6.xy = u_xlat16_1.zw;
    u_xlat16_32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_6.xyw = vec3(u_xlat16_32) * u_xlat16_6.xyz;
    u_xlat16_1.z = u_xlat16_6.z;
    u_xlat16_0.xyz = u_xlat16_0.xyw * u_xlat16_6.xyw;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat7.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat5.xy = u_xlat9.xy;
    u_xlat10.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat11.xy = u_xlat7.xy;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_0.xyz, u_xlat11.xyz);
    u_xlat12.xy = u_xlat8.xy;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_0.xyz, u_xlat12.xyz);
    u_xlat51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_16.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_16.xyz, u_xlat8.xyz);
    u_xlat51 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16_16.xyz = u_xlat9.xyz * vec3(u_xlat51) + u_xlat10.xyz;
    u_xlat51 = dot(u_xlat16_16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat16_6.xyz = (-u_xlat16_18.zxy) + u_xlat16_3.zxy;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_18.zxy;
    u_xlat16_2.xy = texture(_WaterDepthTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_54 = log2(u_xlat16_2.x);
    u_xlat16_54 = u_xlat16_54 * _DeepShallowRange;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_14.xyz = _WaterShallowColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat16_14.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz + _WaterDeepColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat16_14.xyz;
    u_xlat3.xy = u_xlat16_0.xx * vec2(vec2(_FloorDistortion, _FloorDistortion)) + vs_TEXCOORD8.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_3.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.zxy * vec3(u_xlat51);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_54 = _DefinitionWater;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat16_54) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_14.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_14.xyz, u_xlat12.xyz);
    u_xlat50 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat3.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(u_xlat16_54);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat7.xyz;
    u_xlat50 = dot(u_xlat3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 100.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _SpecularRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_15.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat50) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xxx * _WaterSSSColor.zxy + u_xlat2.xyz;
    u_xlat50 = dot((-u_xlat16_14.xyz), u_xlat16_16.xyz);
    u_xlat50 = u_xlat50 + u_xlat50;
    u_xlat3.xyz = u_xlat16_16.xyz * (-vec3(u_xlat50)) + (-u_xlat16_14.xyz);
    u_xlat50 = dot(u_xlat16_14.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _FresnelScale;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_3.xyz = texture(_WaterCube, u_xlat3.xyz).xyz;
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat16_3.zxy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_FresnelIntensity);
    u_xlat2.xyz = u_xlat3.xyz * _CubeColor.zxy + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_0.xx * _FlowLightData.zz + vs_TEXCOORD3.zw;
    u_xlat35.xy = u_xlat16_0.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat5.xy = _Time.yy * _FlowLightData.xy + _FlowLightTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * _FlowLightTex_ST.xy + u_xlat5.xy;
    u_xlat16_50 = texture(_FlowLightTex, u_xlat3.xy).x;
    u_xlat16_0.x = (-vs_TEXCOORD3.w) + 1.0;
    u_xlat50 = u_xlat16_0.x * u_xlat16_50;
    u_xlat16_0.x = log2(u_xlat50);
    u_xlat16_0.x = u_xlat16_0.x * _FlowLightData.w;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_14.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_14.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_14.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_0.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_0.xx * u_xlat3.xy;
    u_xlat16_5.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat50 = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat16_0.x = 1.5;
    u_xlat16_14.y = u_xlat16_0.x * u_xlat50;
    u_xlat16_0.y = _GlitterScale;
    u_xlat16_14.x = u_xlat16_0.y * vs_TEXCOORD3.x;
    u_xlat16_0.xy = u_xlat16_0.xy * u_xlat16_14.xy;
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_5.zxy * u_xlat16_7.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_GlitterIntensity);
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat16_0.xyz * _GlitterColor.zxy + u_xlat2.xyz;
    u_xlat3.x = 0.0;
    u_xlat3.y = _Time.y * 0.5;
    u_xlat3.xy = u_xlat3.xy + _FoamTex_ST.zw;
    u_xlat3.xy = u_xlat35.xy * _FoamTex_ST.xy + u_xlat3.xy;
    u_xlat16_50 = texture(_FoamTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_FoamTex, vs_TEXCOORD3.xy).y;
    u_xlat16_0.x = log2(u_xlat16_3.x);
    u_xlat16_0.x = u_xlat16_0.x * _FoamRange;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = (-u_xlat16_50) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xxx * _FoamColor.zxy;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat16_0.xyz = (-u_xlat2.xyz) + _FogCol.zxy;
    u_xlat16_0.xyz = vs_TEXCOORD0.www * u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat50 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat50);
    u_xlat0.x = u_xlat50 * 0.0625 + u_xlat0.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_TEXCOORD3;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat15 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD3.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _FlowSpeed;
uniform 	mediump float _FlowScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _DeepShallowRange;
uniform 	mediump float _DefinitionWater;
uniform 	mediump float _FloorDistortion;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _WaveIntensity2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightData;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(5) uniform mediump sampler2D _WaterDepthTex;
UNITY_LOCATION(6) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(7) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(10) uniform mediump sampler2D _GlitterTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_32;
vec2 u_xlat35;
mediump float u_xlat16_48;
float u_xlat50;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_54;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy;
    u_xlat1.x = _WaveXSpeed * _Time.x;
    u_xlat17.xy = u_xlat1.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_0.xy;
    u_xlat1.xw = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat1.xx;
    u_xlat2.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat16_18.xyz = texture(_FlowTex, vs_TEXCOORD3.xy).xyz;
    u_xlat18.xy = u_xlat16_18.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat35.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_4.xyz = texture(_WaveMap, u_xlat35.xy).xyz;
    u_xlat2.x = _FlowSpeed * _Time.y;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat18.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat2.x = (-u_xlat2.x) + 0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat18.xy = u_xlat18.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat17.xy = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_0.xyz = abs(u_xlat2.xxx) * u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = u_xlat16_0.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_0.xy = u_xlat16_4.zw;
    u_xlat16_48 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_0.xyw = vec3(u_xlat16_48) * u_xlat16_0.xyz;
    u_xlat16_4.z = u_xlat16_0.z;
    u_xlat17.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat1.xw = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat18.xy = (-u_xlat18.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_AlbedoTex, u_xlat3.xy).xyz;
    u_xlat16_18.xyz = texture(_AlbedoTex, u_xlat18.xy).xyz;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat1.xw).xyz;
    u_xlat16_1.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = u_xlat16_6.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_6.xy = u_xlat16_1.zw;
    u_xlat16_32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_6.xyw = vec3(u_xlat16_32) * u_xlat16_6.xyz;
    u_xlat16_1.z = u_xlat16_6.z;
    u_xlat16_0.xyz = u_xlat16_0.xyw * u_xlat16_6.xyw;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat7.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat5.xy = u_xlat9.xy;
    u_xlat10.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat11.xy = u_xlat7.xy;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_0.xyz, u_xlat11.xyz);
    u_xlat12.xy = u_xlat8.xy;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_0.xyz, u_xlat12.xyz);
    u_xlat51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_16.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_16.xyz, u_xlat8.xyz);
    u_xlat51 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16_16.xyz = u_xlat9.xyz * vec3(u_xlat51) + u_xlat10.xyz;
    u_xlat51 = dot(u_xlat16_16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat16_6.xyz = (-u_xlat16_18.zxy) + u_xlat16_3.zxy;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_18.zxy;
    u_xlat16_2.xy = texture(_WaterDepthTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_54 = log2(u_xlat16_2.x);
    u_xlat16_54 = u_xlat16_54 * _DeepShallowRange;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_14.xyz = _WaterShallowColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat16_14.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz + _WaterDeepColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat16_14.xyz;
    u_xlat3.xy = u_xlat16_0.xx * vec2(vec2(_FloorDistortion, _FloorDistortion)) + vs_TEXCOORD8.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_3.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.zxy * vec3(u_xlat51);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_54 = _DefinitionWater;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat16_54) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_14.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_14.xyz, u_xlat12.xyz);
    u_xlat50 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat3.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(u_xlat16_54);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat7.xyz;
    u_xlat50 = dot(u_xlat3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 100.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _SpecularRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_15.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat50) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xxx * _WaterSSSColor.zxy + u_xlat2.xyz;
    u_xlat50 = dot((-u_xlat16_14.xyz), u_xlat16_16.xyz);
    u_xlat50 = u_xlat50 + u_xlat50;
    u_xlat3.xyz = u_xlat16_16.xyz * (-vec3(u_xlat50)) + (-u_xlat16_14.xyz);
    u_xlat50 = dot(u_xlat16_14.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _FresnelScale;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_3.xyz = texture(_WaterCube, u_xlat3.xyz).xyz;
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat16_3.zxy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_FresnelIntensity);
    u_xlat2.xyz = u_xlat3.xyz * _CubeColor.zxy + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_0.xx * _FlowLightData.zz + vs_TEXCOORD3.zw;
    u_xlat35.xy = u_xlat16_0.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat5.xy = _Time.yy * _FlowLightData.xy + _FlowLightTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * _FlowLightTex_ST.xy + u_xlat5.xy;
    u_xlat16_50 = texture(_FlowLightTex, u_xlat3.xy).x;
    u_xlat16_0.x = (-vs_TEXCOORD3.w) + 1.0;
    u_xlat50 = u_xlat16_0.x * u_xlat16_50;
    u_xlat16_0.x = log2(u_xlat50);
    u_xlat16_0.x = u_xlat16_0.x * _FlowLightData.w;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2.xyz = u_xlat16_0.xxx * _FlowLightColor.zxy + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_14.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_14.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_14.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_0.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_0.xx * u_xlat3.xy;
    u_xlat16_5.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat50 = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat16_0.x = 1.5;
    u_xlat16_14.y = u_xlat16_0.x * u_xlat50;
    u_xlat16_0.y = _GlitterScale;
    u_xlat16_14.x = u_xlat16_0.y * vs_TEXCOORD3.x;
    u_xlat16_0.xy = u_xlat16_0.xy * u_xlat16_14.xy;
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_5.zxy * u_xlat16_7.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_GlitterIntensity);
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat16_0.xyz * _GlitterColor.zxy + u_xlat2.xyz;
    u_xlat3.x = 0.0;
    u_xlat3.y = _Time.y * 0.5;
    u_xlat3.xy = u_xlat3.xy + _FoamTex_ST.zw;
    u_xlat3.xy = u_xlat35.xy * _FoamTex_ST.xy + u_xlat3.xy;
    u_xlat16_50 = texture(_FoamTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_FoamTex, vs_TEXCOORD3.xy).y;
    u_xlat16_0.x = log2(u_xlat16_3.x);
    u_xlat16_0.x = u_xlat16_0.x * _FoamRange;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = (-u_xlat16_50) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xxx * _FoamColor.zxy;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat16_0.xyz = (-u_xlat2.xyz) + _FogCol.zxy;
    u_xlat16_0.xyz = vs_TEXCOORD0.www * u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat50 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat50);
    u_xlat0.x = u_xlat50 * 0.0625 + u_xlat0.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _FogCol;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.zxy * u_xlat0.xxx;
    u_xlat16_1.xyz = (-u_xlat0.xxx) * u_xlat16_5.zxy + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
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
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_5.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _FogCol;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.zxy * u_xlat0.xxx;
    u_xlat16_1.xyz = (-u_xlat0.xxx) * u_xlat16_5.zxy + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
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
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_5.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _FogCol;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.zxy * u_xlat0.xxx;
    u_xlat16_1.xyz = (-u_xlat0.xxx) * u_xlat16_5.zxy + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
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
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_5.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _FogCol;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.zxy * u_xlat0.xxx;
    u_xlat16_1.xyz = (-u_xlat0.xxx) * u_xlat16_5.zxy + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
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
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_5.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_TEXCOORD3;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat15 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD3.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _FlowSpeed;
uniform 	mediump float _FlowScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _DeepShallowRange;
uniform 	mediump float _DefinitionWater;
uniform 	mediump float _FloorDistortion;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _WaveIntensity2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightData;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _WaterDepthTex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_32;
vec2 u_xlat35;
mediump float u_xlat16_48;
float u_xlat50;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_54;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy;
    u_xlat1.x = _WaveXSpeed * _Time.x;
    u_xlat17.xy = u_xlat1.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_0.xy;
    u_xlat1.xw = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat1.xx;
    u_xlat2.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat16_18.xyz = texture(_FlowTex, vs_TEXCOORD3.xy).xyz;
    u_xlat18.xy = u_xlat16_18.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat35.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_4.xyz = texture(_WaveMap, u_xlat35.xy).xyz;
    u_xlat2.x = _FlowSpeed * _Time.y;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat18.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat2.x = (-u_xlat2.x) + 0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat18.xy = u_xlat18.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat17.xy = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_0.xyz = abs(u_xlat2.xxx) * u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = u_xlat16_0.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_0.xy = u_xlat16_4.zw;
    u_xlat16_48 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_0.xyw = vec3(u_xlat16_48) * u_xlat16_0.xyz;
    u_xlat16_4.z = u_xlat16_0.z;
    u_xlat17.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat1.xw = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat18.xy = (-u_xlat18.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_AlbedoTex, u_xlat3.xy).xyz;
    u_xlat16_18.xyz = texture(_AlbedoTex, u_xlat18.xy).xyz;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat1.xw).xyz;
    u_xlat16_1.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = u_xlat16_6.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_6.xy = u_xlat16_1.zw;
    u_xlat16_32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_6.xyw = vec3(u_xlat16_32) * u_xlat16_6.xyz;
    u_xlat16_1.z = u_xlat16_6.z;
    u_xlat16_0.xyz = u_xlat16_0.xyw * u_xlat16_6.xyw;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat7.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat5.xy = u_xlat9.xy;
    u_xlat10.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat11.xy = u_xlat7.xy;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_0.xyz, u_xlat11.xyz);
    u_xlat12.xy = u_xlat8.xy;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_0.xyz, u_xlat12.xyz);
    u_xlat51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_16.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_16.xyz, u_xlat8.xyz);
    u_xlat51 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16_16.xyz = u_xlat9.xyz * vec3(u_xlat51) + u_xlat10.xyz;
    u_xlat51 = dot(u_xlat16_16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat16_6.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_18.xyz;
    u_xlat16_2.xy = texture(_WaterDepthTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_54 = log2(u_xlat16_2.x);
    u_xlat16_54 = u_xlat16_54 * _DeepShallowRange;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_14.xyz = _WaterShallowColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz + _WaterDeepColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat16_14.xyz;
    u_xlat3.xy = u_xlat16_0.xx * vec2(vec2(_FloorDistortion, _FloorDistortion)) + vs_TEXCOORD8.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_3.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(u_xlat51);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_54 = _DefinitionWater;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat16_54) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_14.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_14.xyz, u_xlat12.xyz);
    u_xlat50 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat3.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(u_xlat16_54);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat7.xyz;
    u_xlat50 = dot(u_xlat3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 100.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _SpecularRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_15.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat50) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xxx * _WaterSSSColor.xyz + u_xlat2.xyz;
    u_xlat50 = dot((-u_xlat16_14.xyz), u_xlat16_16.xyz);
    u_xlat50 = u_xlat50 + u_xlat50;
    u_xlat3.xyz = u_xlat16_16.xyz * (-vec3(u_xlat50)) + (-u_xlat16_14.xyz);
    u_xlat50 = dot(u_xlat16_14.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _FresnelScale;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_3.xyz = texture(_WaterCube, u_xlat3.xyz).xyz;
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_FresnelIntensity);
    u_xlat2.xyz = u_xlat3.xyz * _CubeColor.xyz + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_0.xx * _FlowLightData.zz + vs_TEXCOORD3.zw;
    u_xlat35.xy = u_xlat16_0.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat5.xy = _Time.yy * _FlowLightData.xy + _FlowLightTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * _FlowLightTex_ST.xy + u_xlat5.xy;
    u_xlat16_50 = texture(_FlowLightTex, u_xlat3.xy).x;
    u_xlat16_0.x = (-vs_TEXCOORD3.w) + 1.0;
    u_xlat50 = u_xlat16_0.x * u_xlat16_50;
    u_xlat16_0.x = log2(u_xlat50);
    u_xlat16_0.x = u_xlat16_0.x * _FlowLightData.w;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_14.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_14.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_14.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_0.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_0.xx * u_xlat3.xy;
    u_xlat16_5.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat50 = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat16_0.x = 1.5;
    u_xlat16_14.y = u_xlat16_0.x * u_xlat50;
    u_xlat16_0.y = _GlitterScale;
    u_xlat16_14.x = u_xlat16_0.y * vs_TEXCOORD3.x;
    u_xlat16_0.xy = u_xlat16_0.xy * u_xlat16_14.xy;
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_GlitterIntensity);
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat16_0.xyz * _GlitterColor.xyz + u_xlat2.xyz;
    u_xlat3.x = 0.0;
    u_xlat3.y = _Time.y * 0.5;
    u_xlat3.xy = u_xlat3.xy + _FoamTex_ST.zw;
    u_xlat3.xy = u_xlat35.xy * _FoamTex_ST.xy + u_xlat3.xy;
    u_xlat16_50 = texture(_FoamTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_FoamTex, vs_TEXCOORD3.xy).y;
    u_xlat16_0.x = log2(u_xlat16_3.x);
    u_xlat16_0.x = u_xlat16_0.x * _FoamRange;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = (-u_xlat16_50) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xxx * _FoamColor.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat16_0.xyz = (-u_xlat2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_TEXCOORD3;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat15 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD3.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _FlowSpeed;
uniform 	mediump float _FlowScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _DeepShallowRange;
uniform 	mediump float _DefinitionWater;
uniform 	mediump float _FloorDistortion;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _WaveIntensity2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightData;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _WaterDepthTex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_32;
vec2 u_xlat35;
mediump float u_xlat16_48;
float u_xlat50;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_54;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy;
    u_xlat1.x = _WaveXSpeed * _Time.x;
    u_xlat17.xy = u_xlat1.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_0.xy;
    u_xlat1.xw = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat1.xx;
    u_xlat2.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat16_18.xyz = texture(_FlowTex, vs_TEXCOORD3.xy).xyz;
    u_xlat18.xy = u_xlat16_18.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat35.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_4.xyz = texture(_WaveMap, u_xlat35.xy).xyz;
    u_xlat2.x = _FlowSpeed * _Time.y;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat18.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat2.x = (-u_xlat2.x) + 0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat18.xy = u_xlat18.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat17.xy = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_0.xyz = abs(u_xlat2.xxx) * u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = u_xlat16_0.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_0.xy = u_xlat16_4.zw;
    u_xlat16_48 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_0.xyw = vec3(u_xlat16_48) * u_xlat16_0.xyz;
    u_xlat16_4.z = u_xlat16_0.z;
    u_xlat17.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat1.xw = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat18.xy = (-u_xlat18.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_AlbedoTex, u_xlat3.xy).xyz;
    u_xlat16_18.xyz = texture(_AlbedoTex, u_xlat18.xy).xyz;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat1.xw).xyz;
    u_xlat16_1.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = u_xlat16_6.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_6.xy = u_xlat16_1.zw;
    u_xlat16_32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_6.xyw = vec3(u_xlat16_32) * u_xlat16_6.xyz;
    u_xlat16_1.z = u_xlat16_6.z;
    u_xlat16_0.xyz = u_xlat16_0.xyw * u_xlat16_6.xyw;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat7.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat5.xy = u_xlat9.xy;
    u_xlat10.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat11.xy = u_xlat7.xy;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_0.xyz, u_xlat11.xyz);
    u_xlat12.xy = u_xlat8.xy;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_0.xyz, u_xlat12.xyz);
    u_xlat51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_16.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_16.xyz, u_xlat8.xyz);
    u_xlat51 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16_16.xyz = u_xlat9.xyz * vec3(u_xlat51) + u_xlat10.xyz;
    u_xlat51 = dot(u_xlat16_16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat16_6.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_18.xyz;
    u_xlat16_2.xy = texture(_WaterDepthTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_54 = log2(u_xlat16_2.x);
    u_xlat16_54 = u_xlat16_54 * _DeepShallowRange;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_14.xyz = _WaterShallowColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz + _WaterDeepColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat16_14.xyz;
    u_xlat3.xy = u_xlat16_0.xx * vec2(vec2(_FloorDistortion, _FloorDistortion)) + vs_TEXCOORD8.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_3.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(u_xlat51);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_54 = _DefinitionWater;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat16_54) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_14.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_14.xyz, u_xlat12.xyz);
    u_xlat50 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat3.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(u_xlat16_54);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat7.xyz;
    u_xlat50 = dot(u_xlat3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 100.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _SpecularRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_15.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat50) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xxx * _WaterSSSColor.xyz + u_xlat2.xyz;
    u_xlat50 = dot((-u_xlat16_14.xyz), u_xlat16_16.xyz);
    u_xlat50 = u_xlat50 + u_xlat50;
    u_xlat3.xyz = u_xlat16_16.xyz * (-vec3(u_xlat50)) + (-u_xlat16_14.xyz);
    u_xlat50 = dot(u_xlat16_14.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _FresnelScale;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_3.xyz = texture(_WaterCube, u_xlat3.xyz).xyz;
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_FresnelIntensity);
    u_xlat2.xyz = u_xlat3.xyz * _CubeColor.xyz + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_0.xx * _FlowLightData.zz + vs_TEXCOORD3.zw;
    u_xlat35.xy = u_xlat16_0.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat5.xy = _Time.yy * _FlowLightData.xy + _FlowLightTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * _FlowLightTex_ST.xy + u_xlat5.xy;
    u_xlat16_50 = texture(_FlowLightTex, u_xlat3.xy).x;
    u_xlat16_0.x = (-vs_TEXCOORD3.w) + 1.0;
    u_xlat50 = u_xlat16_0.x * u_xlat16_50;
    u_xlat16_0.x = log2(u_xlat50);
    u_xlat16_0.x = u_xlat16_0.x * _FlowLightData.w;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_14.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_14.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_14.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_0.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_0.xx * u_xlat3.xy;
    u_xlat16_5.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat50 = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat16_0.x = 1.5;
    u_xlat16_14.y = u_xlat16_0.x * u_xlat50;
    u_xlat16_0.y = _GlitterScale;
    u_xlat16_14.x = u_xlat16_0.y * vs_TEXCOORD3.x;
    u_xlat16_0.xy = u_xlat16_0.xy * u_xlat16_14.xy;
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_GlitterIntensity);
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat16_0.xyz * _GlitterColor.xyz + u_xlat2.xyz;
    u_xlat3.x = 0.0;
    u_xlat3.y = _Time.y * 0.5;
    u_xlat3.xy = u_xlat3.xy + _FoamTex_ST.zw;
    u_xlat3.xy = u_xlat35.xy * _FoamTex_ST.xy + u_xlat3.xy;
    u_xlat16_50 = texture(_FoamTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_FoamTex, vs_TEXCOORD3.xy).y;
    u_xlat16_0.x = log2(u_xlat16_3.x);
    u_xlat16_0.x = u_xlat16_0.x * _FoamRange;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = (-u_xlat16_50) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xxx * _FoamColor.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat16_0.xyz = (-u_xlat2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_TEXCOORD3;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat15 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD3.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _FlowSpeed;
uniform 	mediump float _FlowScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _DeepShallowRange;
uniform 	mediump float _DefinitionWater;
uniform 	mediump float _FloorDistortion;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _WaveIntensity2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightData;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _WaterDepthTex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_32;
vec2 u_xlat35;
mediump float u_xlat16_48;
float u_xlat50;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_54;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy;
    u_xlat1.x = _WaveXSpeed * _Time.x;
    u_xlat17.xy = u_xlat1.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_0.xy;
    u_xlat1.xw = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat1.xx;
    u_xlat2.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat16_18.xyz = texture(_FlowTex, vs_TEXCOORD3.xy).xyz;
    u_xlat18.xy = u_xlat16_18.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat35.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_4.xyz = texture(_WaveMap, u_xlat35.xy).xyz;
    u_xlat2.x = _FlowSpeed * _Time.y;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat18.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat2.x = (-u_xlat2.x) + 0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat18.xy = u_xlat18.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat17.xy = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_0.xyz = abs(u_xlat2.xxx) * u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = u_xlat16_0.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_0.xy = u_xlat16_4.zw;
    u_xlat16_48 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_0.xyw = vec3(u_xlat16_48) * u_xlat16_0.xyz;
    u_xlat16_4.z = u_xlat16_0.z;
    u_xlat17.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat1.xw = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat18.xy = (-u_xlat18.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_AlbedoTex, u_xlat3.xy).xyz;
    u_xlat16_18.xyz = texture(_AlbedoTex, u_xlat18.xy).xyz;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat1.xw).xyz;
    u_xlat16_1.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = u_xlat16_6.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_6.xy = u_xlat16_1.zw;
    u_xlat16_32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_6.xyw = vec3(u_xlat16_32) * u_xlat16_6.xyz;
    u_xlat16_1.z = u_xlat16_6.z;
    u_xlat16_0.xyz = u_xlat16_0.xyw * u_xlat16_6.xyw;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat7.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat5.xy = u_xlat9.xy;
    u_xlat10.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat11.xy = u_xlat7.xy;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_0.xyz, u_xlat11.xyz);
    u_xlat12.xy = u_xlat8.xy;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_0.xyz, u_xlat12.xyz);
    u_xlat51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_16.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_16.xyz, u_xlat8.xyz);
    u_xlat51 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16_16.xyz = u_xlat9.xyz * vec3(u_xlat51) + u_xlat10.xyz;
    u_xlat51 = dot(u_xlat16_16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat16_6.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_18.xyz;
    u_xlat16_2.xy = texture(_WaterDepthTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_54 = log2(u_xlat16_2.x);
    u_xlat16_54 = u_xlat16_54 * _DeepShallowRange;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_14.xyz = _WaterShallowColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz + _WaterDeepColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat16_14.xyz;
    u_xlat3.xy = u_xlat16_0.xx * vec2(vec2(_FloorDistortion, _FloorDistortion)) + vs_TEXCOORD8.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_3.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(u_xlat51);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_54 = _DefinitionWater;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat16_54) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_14.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_14.xyz, u_xlat12.xyz);
    u_xlat50 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat3.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(u_xlat16_54);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat7.xyz;
    u_xlat50 = dot(u_xlat3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 100.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _SpecularRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_15.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat50) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xxx * _WaterSSSColor.xyz + u_xlat2.xyz;
    u_xlat50 = dot((-u_xlat16_14.xyz), u_xlat16_16.xyz);
    u_xlat50 = u_xlat50 + u_xlat50;
    u_xlat3.xyz = u_xlat16_16.xyz * (-vec3(u_xlat50)) + (-u_xlat16_14.xyz);
    u_xlat50 = dot(u_xlat16_14.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _FresnelScale;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_3.xyz = texture(_WaterCube, u_xlat3.xyz).xyz;
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_FresnelIntensity);
    u_xlat2.xyz = u_xlat3.xyz * _CubeColor.xyz + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_0.xx * _FlowLightData.zz + vs_TEXCOORD3.zw;
    u_xlat35.xy = u_xlat16_0.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat5.xy = _Time.yy * _FlowLightData.xy + _FlowLightTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * _FlowLightTex_ST.xy + u_xlat5.xy;
    u_xlat16_50 = texture(_FlowLightTex, u_xlat3.xy).x;
    u_xlat16_0.x = (-vs_TEXCOORD3.w) + 1.0;
    u_xlat50 = u_xlat16_0.x * u_xlat16_50;
    u_xlat16_0.x = log2(u_xlat50);
    u_xlat16_0.x = u_xlat16_0.x * _FlowLightData.w;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_14.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_14.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_14.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_0.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_0.xx * u_xlat3.xy;
    u_xlat16_5.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat50 = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat16_0.x = 1.5;
    u_xlat16_14.y = u_xlat16_0.x * u_xlat50;
    u_xlat16_0.y = _GlitterScale;
    u_xlat16_14.x = u_xlat16_0.y * vs_TEXCOORD3.x;
    u_xlat16_0.xy = u_xlat16_0.xy * u_xlat16_14.xy;
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_GlitterIntensity);
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat16_0.xyz * _GlitterColor.xyz + u_xlat2.xyz;
    u_xlat3.x = 0.0;
    u_xlat3.y = _Time.y * 0.5;
    u_xlat3.xy = u_xlat3.xy + _FoamTex_ST.zw;
    u_xlat3.xy = u_xlat35.xy * _FoamTex_ST.xy + u_xlat3.xy;
    u_xlat16_50 = texture(_FoamTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_FoamTex, vs_TEXCOORD3.xy).y;
    u_xlat16_0.x = log2(u_xlat16_3.x);
    u_xlat16_0.x = u_xlat16_0.x * _FoamRange;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = (-u_xlat16_50) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xxx * _FoamColor.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat16_0.xyz = (-u_xlat2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_TEXCOORD3;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat15 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = in_TEXCOORD3.xy;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _FlowSpeed;
uniform 	mediump float _FlowScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _DeepShallowRange;
uniform 	mediump float _DefinitionWater;
uniform 	mediump float _FloorDistortion;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _WaveIntensity2;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightData;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _WaterDepthTex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
mediump float u_xlat16_32;
vec2 u_xlat35;
mediump float u_xlat16_48;
float u_xlat50;
mediump float u_xlat16_50;
float u_xlat51;
mediump float u_xlat16_54;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy;
    u_xlat1.x = _WaveXSpeed * _Time.x;
    u_xlat17.xy = u_xlat1.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_0.xy;
    u_xlat1.xw = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat1.xx;
    u_xlat2.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat16_18.xyz = texture(_FlowTex, vs_TEXCOORD3.xy).xyz;
    u_xlat18.xy = u_xlat16_18.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat35.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_4.xyz = texture(_WaveMap, u_xlat35.xy).xyz;
    u_xlat2.x = _FlowSpeed * _Time.y;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat18.xy = u_xlat2.xx * u_xlat18.xy;
    u_xlat2.x = (-u_xlat2.x) + 0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat18.xy = u_xlat18.xy * vec2(vec2(_FlowScale, _FlowScale));
    u_xlat17.xy = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat17.xy;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_0.xyz = abs(u_xlat2.xxx) * u_xlat16_0.xyz + u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = u_xlat16_0.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_0.xy = u_xlat16_4.zw;
    u_xlat16_48 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_0.xyw = vec3(u_xlat16_48) * u_xlat16_0.xyz;
    u_xlat16_4.z = u_xlat16_0.z;
    u_xlat17.xy = (-u_xlat3.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat1.xw = (-u_xlat18.xy) * u_xlat16_18.zz + u_xlat1.xw;
    u_xlat18.xy = (-u_xlat18.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_18.zz + vs_TEXCOORD3.xy;
    u_xlat16_3.xyz = texture(_AlbedoTex, u_xlat3.xy).xyz;
    u_xlat16_18.xyz = texture(_AlbedoTex, u_xlat18.xy).xyz;
    u_xlat16_5.xyz = texture(_WaveMap, u_xlat1.xw).xyz;
    u_xlat16_1.xyz = texture(_WaveMap, u_xlat17.xy).xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = u_xlat16_6.xyxy * vec4(_WaveIntensity2, _WaveIntensity2, _WaveIntensity, _WaveIntensity);
    u_xlat16_6.xy = u_xlat16_1.zw;
    u_xlat16_32 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_32 = inversesqrt(u_xlat16_32);
    u_xlat16_6.xyw = vec3(u_xlat16_32) * u_xlat16_6.xyz;
    u_xlat16_1.z = u_xlat16_6.z;
    u_xlat16_0.xyz = u_xlat16_0.xyw * u_xlat16_6.xyw;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat7.xyz = vec3(u_xlat51) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.x = u_xlat7.z;
    u_xlat5.xy = u_xlat9.xy;
    u_xlat10.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat11.xy = u_xlat7.xy;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_0.xyz, u_xlat11.xyz);
    u_xlat12.xy = u_xlat8.xy;
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_0.xyz, u_xlat12.xyz);
    u_xlat51 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat10.xyz = vec3(u_xlat51) * u_xlat10.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_16.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_16.xyz, u_xlat9.xyz);
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_16.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_16.xyz, u_xlat8.xyz);
    u_xlat51 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16_16.xyz = u_xlat9.xyz * vec3(u_xlat51) + u_xlat10.xyz;
    u_xlat51 = dot(u_xlat16_16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat16_6.xyz = (-u_xlat16_18.xyz) + u_xlat16_3.xyz;
    u_xlat16_6.xyz = abs(u_xlat2.xxx) * u_xlat16_6.xyz + u_xlat16_18.xyz;
    u_xlat16_2.xy = texture(_WaterDepthTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_54 = log2(u_xlat16_2.x);
    u_xlat16_54 = u_xlat16_54 * _DeepShallowRange;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_14.xyz = _WaterShallowColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat16_14.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz + _WaterDeepColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat16_14.xyz;
    u_xlat3.xy = u_xlat16_0.xx * vec2(vec2(_FloorDistortion, _FloorDistortion)) + vs_TEXCOORD8.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_3.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(u_xlat51);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_14.xyz + (-u_xlat2.xyz);
    u_xlat16_54 = _DefinitionWater;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat16_54) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_54 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_1.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_15.xyz = u_xlat16_4.xyz * vec3(u_xlat16_54);
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_14.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_14.xyz, u_xlat12.xyz);
    u_xlat50 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat50 = max(u_xlat50, 1.17549435e-38);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat3.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_54 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat16_54) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * vec3(u_xlat16_54);
    u_xlat50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat50 = inversesqrt(u_xlat50);
    u_xlat5.xyz = vec3(u_xlat50) * u_xlat7.xyz;
    u_xlat50 = dot(u_xlat3.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 100.0;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _SpecularRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_15.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat2.xyz = u_xlat16_15.xyz * vec3(u_xlat50) + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat3.xxx * _WaterSSSColor.xyz + u_xlat2.xyz;
    u_xlat50 = dot((-u_xlat16_14.xyz), u_xlat16_16.xyz);
    u_xlat50 = u_xlat50 + u_xlat50;
    u_xlat3.xyz = u_xlat16_16.xyz * (-vec3(u_xlat50)) + (-u_xlat16_14.xyz);
    u_xlat50 = dot(u_xlat16_14.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat50 = (-u_xlat50) + 1.0;
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _FresnelScale;
    u_xlat50 = exp2(u_xlat50);
    u_xlat16_3.xyz = texture(_WaterCube, u_xlat3.xyz).xyz;
    u_xlat3.xyz = vec3(u_xlat50) * u_xlat16_3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_FresnelIntensity);
    u_xlat2.xyz = u_xlat3.xyz * _CubeColor.xyz + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_0.xx * _FlowLightData.zz + vs_TEXCOORD3.zw;
    u_xlat35.xy = u_xlat16_0.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat5.xy = _Time.yy * _FlowLightData.xy + _FlowLightTex_ST.zw;
    u_xlat3.xy = u_xlat3.xy * _FlowLightTex_ST.xy + u_xlat5.xy;
    u_xlat16_50 = texture(_FlowLightTex, u_xlat3.xy).x;
    u_xlat16_0.x = (-vs_TEXCOORD3.w) + 1.0;
    u_xlat50 = u_xlat16_0.x * u_xlat16_50;
    u_xlat16_0.x = log2(u_xlat50);
    u_xlat16_0.x = u_xlat16_0.x * _FlowLightData.w;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz + u_xlat2.xyz;
    u_xlat3.xy = u_xlat16_14.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_14.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_14.zz + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.zw;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_0.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_0.xx * u_xlat3.xy;
    u_xlat16_5.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat50 = _Time.x * _GlitterFlowSpeed + vs_TEXCOORD3.y;
    u_xlat16_0.x = 1.5;
    u_xlat16_14.y = u_xlat16_0.x * u_xlat50;
    u_xlat16_0.y = _GlitterScale;
    u_xlat16_14.x = u_xlat16_0.y * vs_TEXCOORD3.x;
    u_xlat16_0.xy = u_xlat16_0.xy * u_xlat16_14.xy;
    u_xlat16_7.xyz = texture(_GlitterTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_GlitterIntensity);
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = min(u_xlat16_0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.xyz = u_xlat16_0.xyz * _GlitterColor.xyz + u_xlat2.xyz;
    u_xlat3.x = 0.0;
    u_xlat3.y = _Time.y * 0.5;
    u_xlat3.xy = u_xlat3.xy + _FoamTex_ST.zw;
    u_xlat3.xy = u_xlat35.xy * _FoamTex_ST.xy + u_xlat3.xy;
    u_xlat16_50 = texture(_FoamTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_FoamTex, vs_TEXCOORD3.xy).y;
    u_xlat16_0.x = log2(u_xlat16_3.x);
    u_xlat16_0.x = u_xlat16_0.x * _FoamRange;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.x = (-u_xlat16_50) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat16_0.xxx * _FoamColor.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat16_0.xyz + u_xlat2.xyz;
    u_xlat16_0.xyz = (-u_xlat2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_0.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat0.xxx;
    u_xlat16_1.xyz = (-u_xlat0.xxx) * u_xlat16_5.xyz + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat0.xxx;
    u_xlat16_1.xyz = (-u_xlat0.xxx) * u_xlat16_5.xyz + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat0.xxx;
    u_xlat16_1.xyz = (-u_xlat0.xxx) * u_xlat16_5.xyz + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    vs_TEXCOORD5.y = u_xlat16_2.x;
    vs_TEXCOORD5.x = u_xlat1.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD6.x = u_xlat1.y;
    vs_TEXCOORD7.x = u_xlat1.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_2.y;
    vs_TEXCOORD7.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD1.zxy;
    u_xlat3.xyz = vs_TEXCOORD1.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat3.x;
    u_xlat0.x = u_xlat2.z;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat3.x = u_xlat2.y;
    u_xlat2.y = u_xlat3.z;
    u_xlat2.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat3.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_5.xyz = texture(_AlbedoTex, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat0.xxx;
    u_xlat16_1.xyz = (-u_xlat0.xxx) * u_xlat16_5.xyz + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_1.xyz + u_xlat2.xyz;
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
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 115771
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
CustomEditor "CodeGenShaderGUI.Theseus_Water_CharactersGUI"
}