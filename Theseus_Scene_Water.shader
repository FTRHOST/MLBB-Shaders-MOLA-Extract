//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/Water" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_cutoff ("AlphaCut", Range(0, 1)) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_specularAlphaMode ("高光透明模式", Float) = 1.0

[Toggle] _alphatomask ("AlphaToCoverage", Float) = 0.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _WaterTex ("水体遮罩贴图", 2D) = "white" { }

_WaterShallowColor ("浅水颜色", Color) = (1,1,1,1)

_WaterDeepColor ("深水颜色", Color) = (1,1,1,1)

_WaveMap ("水波法线贴图", 2D) = "bump" { }

_WaveIntensity ("水波法线强度", Range(0, 2)) = 1.0

_WaveXSpeed ("水面流动速度", Range(-5, 5)) = 1.0

[Tex] _FoamTex ("浮沫贴图", 2D) = "white" { }

_FoamColor ("浮沫颜色", Color) = (1,1,1,1)

_FoamRange ("浮沫范围", Float) = 1.0

_FoamDistortion ("浮沫扭曲强度", Range(0, 1)) = 0.0

_DiffuseNormalMapIntensity ("漫反射法线强度", Range(0, 1)) = 1.0

_MainLightData ("主光方向与强度", Vector) = (1,1,1,1)

_SpecularColor ("主光颜色", Color) = (1,1,1,1)

_SpecularRange ("高光范围", Float) = 1.0

_WaterSSSColor ("水面SSS颜色", Color) = (1,1,1,1)

_WaterSSSRange ("水面SSS范围", Float) = 1.0

_WaterCube ("环境反射Cube", Cube) = "" { }

_CubeColor ("环境反射颜色", Color) = (1,1,1,1)

_FresnelScale ("环境反射区域范围", Float) = 1.0

_FresnelIntensity ("环境反射强度", Range(0, 5)) = 1.0

_RotateCube ("旋转Cube贴图", Range(0, 360)) = 0.0

_ReflectionTex ("水面反射贴图", 2D) = "white" { }

_ReflectionDistortion ("水面反射扭曲强度", Range(0, 10)) = 0.0

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_AlphaMapPower ("透明范围", Float) = 1.0

_AlphaMapIntensity ("透明强度", Range(0, 1)) = 1.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 13038
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
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat12;
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
    vs_COLOR0 = in_COLOR0;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _DiffuseNormalMapIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _MainLightData;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _WaterSSSRange;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump float _RotateCube;
uniform 	mediump float _ReflectionDistortion;
uniform 	mediump vec3 _FogColor;
uniform 	mediump float _AlphaMapPower;
uniform 	mediump float _AlphaMapIntensity;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec2 u_xlat27;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat36;
void main()
{
    u_xlat0.x = _WaveXSpeed * _Time.x;
    u_xlat11.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002);
    u_xlat11.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_WaveMap, u_xlat11.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat11.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat0.xx;
    u_xlat16_11.xyz = texture(_WaveMap, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_34 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_34 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_34) + vs_TEXCOORD2.yzx;
    u_xlat11.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat11.x = max(u_xlat11.x, 1.17549435e-38);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat11.z;
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat4.x = u_xlat11.y;
    u_xlat11.y = u_xlat4.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat11.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat11.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat11.x = max(u_xlat11.x, 1.17549435e-38);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat11.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(vec3(_DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity)) * u_xlat4.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat4.xy = _MainLightData.xy * vec2(-0.0174532924, 0.0174532924);
    u_xlat36 = sin(u_xlat4.y);
    u_xlat15.xy = cos(u_xlat4.xy);
    u_xlat5.y = sin((-u_xlat4.x));
    u_xlat16_5.x = u_xlat36 * u_xlat15.x;
    u_xlat16_5.z = u_xlat15.x * u_xlat15.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
    u_xlat16_12.xyz = _WaterShallowColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat16_14.xyz = texture(_WaterTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_14.xxx * u_xlat16_12.xyz + _WaterDeepColor.zxy;
    u_xlat6.xyz = u_xlat16_12.xyz * u_xlat3.xxx;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat8.x = u_xlat7.x * u_xlat16_12.x + u_xlat5.x;
    u_xlat8.z = u_xlat7.z * u_xlat16_12.x + u_xlat5.z;
    u_xlat8.y = u_xlat7.y * u_xlat16_12.x + u_xlat5.y;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat7.xyz;
    u_xlat3.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_2.x = dot(u_xlat11.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = log2(u_xlat16_13.x);
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _SpecularRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_9.xyz = _MainLightData.www * _SpecularColor.zxy;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat5.xyz = u_xlat16_2.xzw * u_xlat16_14.yyy + u_xlat6.xyz;
    u_xlat16_2.x = max(_WaterSSSRange, 0.0);
    u_xlat16_2.x = u_xlat16_13.x * u_xlat16_2.x;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WaterSSSColor.zxy;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_14.yyy + u_xlat5.xyz;
    u_xlat5.xy = u_xlat16_1.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat27.xy = u_xlat16_1.xx * vec2(vec2(_ReflectionDistortion, _ReflectionDistortion)) + vs_TEXCOORD5.xy;
    u_xlat27.xy = u_xlat27.xy / vs_TEXCOORD5.ww;
    u_xlat16_6.xyz = texture(_ReflectionTex, u_xlat27.xy).xyz;
    u_xlat5.xy = u_xlat5.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat5.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat5.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat5.xy).x;
    u_xlat16_2.x = (-vs_COLOR0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _FoamRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_0.x) + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_2.xxx * _FoamColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_13.xyz + u_xlat3.xyz;
    u_xlat16_13.x = dot((-u_xlat16_12.xyz), u_xlat11.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat11.xyz * (-u_xlat16_13.xxx) + (-u_xlat16_12.xyz);
    u_xlat16_9.x = dot(u_xlat16_12.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = log2(u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * _FresnelScale;
    u_xlat16_9.x = exp2(u_xlat16_9.x);
    u_xlat16_10.y = u_xlat16_13.y;
    u_xlat0.x = _RotateCube * 0.0174532924;
    u_xlat5.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat7.z = u_xlat0.x;
    u_xlat7.y = u_xlat5.x;
    u_xlat7.x = (-u_xlat0.x);
    u_xlat16_10.z = dot(u_xlat7.xy, u_xlat16_13.xz);
    u_xlat16_10.x = dot(u_xlat7.yz, u_xlat16_13.xz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat16_10.xyz).xyz;
    u_xlat0.xyz = u_xlat16_9.xxx * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FresnelIntensity, _FresnelIntensity, _FresnelIntensity));
    u_xlat5.xyz = u_xlat0.xyz * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y);
    u_xlat16_13.xyz = (-u_xlat0.xyz) * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y) + _FoamColor.zxy;
    u_xlat16_13.xyz = u_xlat16_2.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat16_14.zzz * _FogColor.zxy + u_xlat0.xyz;
    u_xlat16_13.xyz = (-u_xlat16_6.zxy) + _FoamColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_13.xyz + u_xlat16_6.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.x = log2(vs_COLOR0.w);
    u_xlat16_2.x = u_xlat16_2.x * _AlphaMapPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + -1.0;
    SV_Target0.w = _AlphaMapIntensity * u_xlat16_2.x + 1.0;
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
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat12;
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
    vs_COLOR0 = in_COLOR0;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _DiffuseNormalMapIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _MainLightData;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _WaterSSSRange;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump float _RotateCube;
uniform 	mediump float _ReflectionDistortion;
uniform 	mediump vec3 _FogColor;
uniform 	mediump float _AlphaMapPower;
uniform 	mediump float _AlphaMapIntensity;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec2 u_xlat27;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat36;
void main()
{
    u_xlat0.x = _WaveXSpeed * _Time.x;
    u_xlat11.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002);
    u_xlat11.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_WaveMap, u_xlat11.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat11.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat0.xx;
    u_xlat16_11.xyz = texture(_WaveMap, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_34 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_34 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_34) + vs_TEXCOORD2.yzx;
    u_xlat11.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat11.x = max(u_xlat11.x, 1.17549435e-38);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat11.z;
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat4.x = u_xlat11.y;
    u_xlat11.y = u_xlat4.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat11.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat11.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat11.x = max(u_xlat11.x, 1.17549435e-38);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat11.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(vec3(_DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity)) * u_xlat4.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat4.xy = _MainLightData.xy * vec2(-0.0174532924, 0.0174532924);
    u_xlat36 = sin(u_xlat4.y);
    u_xlat15.xy = cos(u_xlat4.xy);
    u_xlat5.y = sin((-u_xlat4.x));
    u_xlat16_5.x = u_xlat36 * u_xlat15.x;
    u_xlat16_5.z = u_xlat15.x * u_xlat15.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
    u_xlat16_12.xyz = _WaterShallowColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat16_14.xyz = texture(_WaterTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_14.xxx * u_xlat16_12.xyz + _WaterDeepColor.zxy;
    u_xlat6.xyz = u_xlat16_12.xyz * u_xlat3.xxx;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat8.x = u_xlat7.x * u_xlat16_12.x + u_xlat5.x;
    u_xlat8.z = u_xlat7.z * u_xlat16_12.x + u_xlat5.z;
    u_xlat8.y = u_xlat7.y * u_xlat16_12.x + u_xlat5.y;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat7.xyz;
    u_xlat3.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_2.x = dot(u_xlat11.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = log2(u_xlat16_13.x);
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _SpecularRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_9.xyz = _MainLightData.www * _SpecularColor.zxy;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat5.xyz = u_xlat16_2.xzw * u_xlat16_14.yyy + u_xlat6.xyz;
    u_xlat16_2.x = max(_WaterSSSRange, 0.0);
    u_xlat16_2.x = u_xlat16_13.x * u_xlat16_2.x;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WaterSSSColor.zxy;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_14.yyy + u_xlat5.xyz;
    u_xlat5.xy = u_xlat16_1.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat27.xy = u_xlat16_1.xx * vec2(vec2(_ReflectionDistortion, _ReflectionDistortion)) + vs_TEXCOORD5.xy;
    u_xlat27.xy = u_xlat27.xy / vs_TEXCOORD5.ww;
    u_xlat16_6.xyz = texture(_ReflectionTex, u_xlat27.xy).xyz;
    u_xlat5.xy = u_xlat5.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat5.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat5.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat5.xy).x;
    u_xlat16_2.x = (-vs_COLOR0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _FoamRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_0.x) + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_2.xxx * _FoamColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_13.xyz + u_xlat3.xyz;
    u_xlat16_13.x = dot((-u_xlat16_12.xyz), u_xlat11.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat11.xyz * (-u_xlat16_13.xxx) + (-u_xlat16_12.xyz);
    u_xlat16_9.x = dot(u_xlat16_12.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = log2(u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * _FresnelScale;
    u_xlat16_9.x = exp2(u_xlat16_9.x);
    u_xlat16_10.y = u_xlat16_13.y;
    u_xlat0.x = _RotateCube * 0.0174532924;
    u_xlat5.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat7.z = u_xlat0.x;
    u_xlat7.y = u_xlat5.x;
    u_xlat7.x = (-u_xlat0.x);
    u_xlat16_10.z = dot(u_xlat7.xy, u_xlat16_13.xz);
    u_xlat16_10.x = dot(u_xlat7.yz, u_xlat16_13.xz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat16_10.xyz).xyz;
    u_xlat0.xyz = u_xlat16_9.xxx * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FresnelIntensity, _FresnelIntensity, _FresnelIntensity));
    u_xlat5.xyz = u_xlat0.xyz * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y);
    u_xlat16_13.xyz = (-u_xlat0.xyz) * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y) + _FoamColor.zxy;
    u_xlat16_13.xyz = u_xlat16_2.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat16_14.zzz * _FogColor.zxy + u_xlat0.xyz;
    u_xlat16_13.xyz = (-u_xlat16_6.zxy) + _FoamColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_13.xyz + u_xlat16_6.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.x = log2(vs_COLOR0.w);
    u_xlat16_2.x = u_xlat16_2.x * _AlphaMapPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + -1.0;
    SV_Target0.w = _AlphaMapIntensity * u_xlat16_2.x + 1.0;
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
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat12;
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
    vs_COLOR0 = in_COLOR0;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _DiffuseNormalMapIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _MainLightData;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _WaterSSSRange;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump float _RotateCube;
uniform 	mediump float _ReflectionDistortion;
uniform 	mediump vec3 _FogColor;
uniform 	mediump float _AlphaMapPower;
uniform 	mediump float _AlphaMapIntensity;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec2 u_xlat27;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat36;
void main()
{
    u_xlat0.x = _WaveXSpeed * _Time.x;
    u_xlat11.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002);
    u_xlat11.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_WaveMap, u_xlat11.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat11.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat0.xx;
    u_xlat16_11.xyz = texture(_WaveMap, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_34 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_34 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_34) + vs_TEXCOORD2.yzx;
    u_xlat11.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat11.x = max(u_xlat11.x, 1.17549435e-38);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat11.z;
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat4.x = u_xlat11.y;
    u_xlat11.y = u_xlat4.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat11.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat11.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat11.x = max(u_xlat11.x, 1.17549435e-38);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat11.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(vec3(_DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity)) * u_xlat4.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat4.xy = _MainLightData.xy * vec2(-0.0174532924, 0.0174532924);
    u_xlat36 = sin(u_xlat4.y);
    u_xlat15.xy = cos(u_xlat4.xy);
    u_xlat5.y = sin((-u_xlat4.x));
    u_xlat16_5.x = u_xlat36 * u_xlat15.x;
    u_xlat16_5.z = u_xlat15.x * u_xlat15.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
    u_xlat16_12.xyz = _WaterShallowColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat16_14.xyz = texture(_WaterTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_14.xxx * u_xlat16_12.xyz + _WaterDeepColor.zxy;
    u_xlat6.xyz = u_xlat16_12.xyz * u_xlat3.xxx;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat8.x = u_xlat7.x * u_xlat16_12.x + u_xlat5.x;
    u_xlat8.z = u_xlat7.z * u_xlat16_12.x + u_xlat5.z;
    u_xlat8.y = u_xlat7.y * u_xlat16_12.x + u_xlat5.y;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat7.xyz;
    u_xlat3.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_2.x = dot(u_xlat11.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = log2(u_xlat16_13.x);
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _SpecularRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_9.xyz = _MainLightData.www * _SpecularColor.zxy;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat5.xyz = u_xlat16_2.xzw * u_xlat16_14.yyy + u_xlat6.xyz;
    u_xlat16_2.x = max(_WaterSSSRange, 0.0);
    u_xlat16_2.x = u_xlat16_13.x * u_xlat16_2.x;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WaterSSSColor.zxy;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_14.yyy + u_xlat5.xyz;
    u_xlat5.xy = u_xlat16_1.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat27.xy = u_xlat16_1.xx * vec2(vec2(_ReflectionDistortion, _ReflectionDistortion)) + vs_TEXCOORD5.xy;
    u_xlat27.xy = u_xlat27.xy / vs_TEXCOORD5.ww;
    u_xlat16_6.xyz = texture(_ReflectionTex, u_xlat27.xy).xyz;
    u_xlat5.xy = u_xlat5.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat5.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat5.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat5.xy).x;
    u_xlat16_2.x = (-vs_COLOR0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _FoamRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_0.x) + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_2.xxx * _FoamColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_13.xyz + u_xlat3.xyz;
    u_xlat16_13.x = dot((-u_xlat16_12.xyz), u_xlat11.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat11.xyz * (-u_xlat16_13.xxx) + (-u_xlat16_12.xyz);
    u_xlat16_9.x = dot(u_xlat16_12.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = log2(u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * _FresnelScale;
    u_xlat16_9.x = exp2(u_xlat16_9.x);
    u_xlat16_10.y = u_xlat16_13.y;
    u_xlat0.x = _RotateCube * 0.0174532924;
    u_xlat5.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat7.z = u_xlat0.x;
    u_xlat7.y = u_xlat5.x;
    u_xlat7.x = (-u_xlat0.x);
    u_xlat16_10.z = dot(u_xlat7.xy, u_xlat16_13.xz);
    u_xlat16_10.x = dot(u_xlat7.yz, u_xlat16_13.xz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat16_10.xyz).xyz;
    u_xlat0.xyz = u_xlat16_9.xxx * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FresnelIntensity, _FresnelIntensity, _FresnelIntensity));
    u_xlat5.xyz = u_xlat0.xyz * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y);
    u_xlat16_13.xyz = (-u_xlat0.xyz) * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y) + _FoamColor.zxy;
    u_xlat16_13.xyz = u_xlat16_2.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat16_14.zzz * _FogColor.zxy + u_xlat0.xyz;
    u_xlat16_13.xyz = (-u_xlat16_6.zxy) + _FoamColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_13.xyz + u_xlat16_6.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.x = log2(vs_COLOR0.w);
    u_xlat16_2.x = u_xlat16_2.x * _AlphaMapPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + -1.0;
    SV_Target0.w = _AlphaMapIntensity * u_xlat16_2.x + 1.0;
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
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat12;
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
    vs_COLOR0 = in_COLOR0;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _DiffuseNormalMapIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _MainLightData;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _WaterSSSRange;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump float _RotateCube;
uniform 	mediump float _ReflectionDistortion;
uniform 	mediump vec3 _FogColor;
uniform 	mediump float _AlphaMapPower;
uniform 	mediump float _AlphaMapIntensity;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
vec2 u_xlat27;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat36;
void main()
{
    u_xlat0.x = _WaveXSpeed * _Time.x;
    u_xlat11.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002);
    u_xlat11.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_WaveMap, u_xlat11.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat11.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat0.xx;
    u_xlat16_11.xyz = texture(_WaveMap, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_34 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_34 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_34) + vs_TEXCOORD2.yzx;
    u_xlat11.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat11.x = max(u_xlat11.x, 1.17549435e-38);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat11.z;
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat4.x = u_xlat11.y;
    u_xlat11.y = u_xlat4.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat11.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat11.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat11.x = max(u_xlat11.x, 1.17549435e-38);
    u_xlat11.x = inversesqrt(u_xlat11.x);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat11.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(vec3(_DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity)) * u_xlat4.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat4.xy = _MainLightData.xy * vec2(-0.0174532924, 0.0174532924);
    u_xlat36 = sin(u_xlat4.y);
    u_xlat15.xy = cos(u_xlat4.xy);
    u_xlat5.y = sin((-u_xlat4.x));
    u_xlat16_5.x = u_xlat36 * u_xlat15.x;
    u_xlat16_5.z = u_xlat15.x * u_xlat15.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
    u_xlat16_12.xyz = _WaterShallowColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat16_14.xyz = texture(_WaterTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_14.xxx * u_xlat16_12.xyz + _WaterDeepColor.zxy;
    u_xlat6.xyz = u_xlat16_12.xyz * u_xlat3.xxx;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_12.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat8.x = u_xlat7.x * u_xlat16_12.x + u_xlat5.x;
    u_xlat8.z = u_xlat7.z * u_xlat16_12.x + u_xlat5.z;
    u_xlat8.y = u_xlat7.y * u_xlat16_12.x + u_xlat5.y;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat7.xyz;
    u_xlat3.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat8.xyz;
    u_xlat16_2.x = dot(u_xlat11.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_13.x = log2(u_xlat16_13.x);
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _SpecularRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_9.xyz = _MainLightData.www * _SpecularColor.zxy;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat5.xyz = u_xlat16_2.xzw * u_xlat16_14.yyy + u_xlat6.xyz;
    u_xlat16_2.x = max(_WaterSSSRange, 0.0);
    u_xlat16_2.x = u_xlat16_13.x * u_xlat16_2.x;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WaterSSSColor.zxy;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_14.yyy + u_xlat5.xyz;
    u_xlat5.xy = u_xlat16_1.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat27.xy = u_xlat16_1.xx * vec2(vec2(_ReflectionDistortion, _ReflectionDistortion)) + vs_TEXCOORD5.xy;
    u_xlat27.xy = u_xlat27.xy / vs_TEXCOORD5.ww;
    u_xlat16_6.xyz = texture(_ReflectionTex, u_xlat27.xy).xyz;
    u_xlat5.xy = u_xlat5.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat5.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat5.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat5.xy).x;
    u_xlat16_2.x = (-vs_COLOR0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _FoamRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_0.x) + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_2.xxx * _FoamColor.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_13.xyz + u_xlat3.xyz;
    u_xlat16_13.x = dot((-u_xlat16_12.xyz), u_xlat11.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat11.xyz * (-u_xlat16_13.xxx) + (-u_xlat16_12.xyz);
    u_xlat16_9.x = dot(u_xlat16_12.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = log2(u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * _FresnelScale;
    u_xlat16_9.x = exp2(u_xlat16_9.x);
    u_xlat16_10.y = u_xlat16_13.y;
    u_xlat0.x = _RotateCube * 0.0174532924;
    u_xlat5.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat7.z = u_xlat0.x;
    u_xlat7.y = u_xlat5.x;
    u_xlat7.x = (-u_xlat0.x);
    u_xlat16_10.z = dot(u_xlat7.xy, u_xlat16_13.xz);
    u_xlat16_10.x = dot(u_xlat7.yz, u_xlat16_13.xz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat16_10.xyz).xyz;
    u_xlat0.xyz = u_xlat16_9.xxx * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FresnelIntensity, _FresnelIntensity, _FresnelIntensity));
    u_xlat5.xyz = u_xlat0.xyz * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y);
    u_xlat16_13.xyz = (-u_xlat0.xyz) * vec3(_CubeColor.z, _CubeColor.x, _CubeColor.y) + _FoamColor.zxy;
    u_xlat16_13.xyz = u_xlat16_2.xxx * u_xlat16_13.xyz + u_xlat5.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat16_14.zzz * _FogColor.zxy + u_xlat0.xyz;
    u_xlat16_13.xyz = (-u_xlat16_6.zxy) + _FoamColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_13.xyz + u_xlat16_6.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.x = log2(vs_COLOR0.w);
    u_xlat16_2.x = u_xlat16_2.x * _AlphaMapPower;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + -1.0;
    SV_Target0.w = _AlphaMapIntensity * u_xlat16_2.x + 1.0;
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
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat12;
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
    vs_COLOR0 = in_COLOR0;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _DiffuseNormalMapIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _MainLightData;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _WaterSSSRange;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump float _RotateCube;
uniform 	mediump float _ReflectionDistortion;
uniform 	mediump vec3 _FogColor;
uniform 	mediump float _AlphaMapPower;
uniform 	mediump float _AlphaMapIntensity;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _FoamTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
vec2 u_xlat22;
mediump float u_xlat16_28;
float u_xlat30;
void main()
{
    u_xlat0.x = _WaveXSpeed * _Time.x;
    u_xlat9.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002);
    u_xlat9.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat9.xy;
    u_xlat16_9.xyz = texture(_WaveMap, u_xlat9.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_1.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat9.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat0.xx;
    u_xlat16_9.xyz = texture(_WaveMap, u_xlat9.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_28 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_28 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_28) + vs_TEXCOORD2.yzx;
    u_xlat9.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat9.z;
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat4.x = u_xlat9.y;
    u_xlat9.y = u_xlat4.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat9.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat9.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat9.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(vec3(_DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity)) * u_xlat4.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat4.xy = _MainLightData.xy * vec2(-0.0174532924, 0.0174532924);
    u_xlat30 = sin(u_xlat4.y);
    u_xlat13.xy = cos(u_xlat4.xy);
    u_xlat5.y = sin((-u_xlat4.x));
    u_xlat16_5.x = u_xlat30 * u_xlat13.x;
    u_xlat16_5.z = u_xlat13.x * u_xlat13.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
    u_xlat16_10.xyz = _WaterShallowColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat16_12.xyz = texture(_WaterTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_12.xxx * u_xlat16_10.xyz + _WaterDeepColor.xyz;
    u_xlat4.xyz = u_xlat16_10.xyz * u_xlat3.xxx;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat7.x = u_xlat6.x * u_xlat16_10.x + u_xlat5.x;
    u_xlat7.z = u_xlat6.z * u_xlat16_10.x + u_xlat5.z;
    u_xlat7.y = u_xlat6.y * u_xlat16_10.x + u_xlat5.y;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat6.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat7.xyz;
    u_xlat16_2.x = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
    u_xlat16_11 = log2(u_xlat16_11);
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _SpecularRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_8.xyz = _MainLightData.www * _SpecularColor.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat4.xyz = u_xlat16_2.xzw * u_xlat16_12.yyy + u_xlat4.xyz;
    u_xlat16_2.x = max(_WaterSSSRange, 0.0);
    u_xlat16_2.x = u_xlat16_11 * u_xlat16_2.x;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WaterSSSColor.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_12.yyy + u_xlat4.xyz;
    u_xlat4.xy = u_xlat16_1.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat22.xy = u_xlat16_1.xx * vec2(vec2(_ReflectionDistortion, _ReflectionDistortion)) + vs_TEXCOORD5.xy;
    u_xlat22.xy = u_xlat22.xy / vs_TEXCOORD5.ww;
    u_xlat16_5.xyz = texture(_ReflectionTex, u_xlat22.xy).xyz;
    u_xlat4.xy = u_xlat4.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat4.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat4.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat4.xy).x;
    u_xlat16_1.x = (-vs_COLOR0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FoamRange;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_0.x) + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xxx * _FoamColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_2.xyz + u_xlat3.xyz;
    u_xlat16_2.x = dot((-u_xlat16_10.xyz), u_xlat9.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat9.xyz * (-u_xlat16_2.xxx) + (-u_xlat16_10.xyz);
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = log2(u_xlat16_10.x);
    u_xlat16_10.x = u_xlat16_10.x * _FresnelScale;
    u_xlat16_10.x = exp2(u_xlat16_10.x);
    u_xlat16_8.y = u_xlat16_2.y;
    u_xlat0.x = _RotateCube * 0.0174532924;
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat6.z = u_xlat0.x;
    u_xlat6.y = u_xlat4.x;
    u_xlat6.x = (-u_xlat0.x);
    u_xlat16_8.z = dot(u_xlat6.xy, u_xlat16_2.xz);
    u_xlat16_8.x = dot(u_xlat6.yz, u_xlat16_2.xz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat16_8.xyz).xyz;
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FresnelIntensity, _FresnelIntensity, _FresnelIntensity));
    u_xlat4.xyz = u_xlat0.xyz * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z);
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z) + _FoamColor.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat16_12.zzz * _FogColor.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_5.xyz) + _FoamColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_1.x = log2(vs_COLOR0.w);
    u_xlat16_1.x = u_xlat16_1.x * _AlphaMapPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    SV_Target0.w = _AlphaMapIntensity * u_xlat16_1.x + 1.0;
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
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat12;
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
    vs_COLOR0 = in_COLOR0;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _DiffuseNormalMapIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _MainLightData;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _WaterSSSRange;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump float _RotateCube;
uniform 	mediump float _ReflectionDistortion;
uniform 	mediump vec3 _FogColor;
uniform 	mediump float _AlphaMapPower;
uniform 	mediump float _AlphaMapIntensity;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _FoamTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
vec2 u_xlat22;
mediump float u_xlat16_28;
float u_xlat30;
void main()
{
    u_xlat0.x = _WaveXSpeed * _Time.x;
    u_xlat9.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002);
    u_xlat9.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat9.xy;
    u_xlat16_9.xyz = texture(_WaveMap, u_xlat9.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_1.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat9.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat0.xx;
    u_xlat16_9.xyz = texture(_WaveMap, u_xlat9.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_28 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_28 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_28) + vs_TEXCOORD2.yzx;
    u_xlat9.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat9.z;
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat4.x = u_xlat9.y;
    u_xlat9.y = u_xlat4.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat9.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat9.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat9.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(vec3(_DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity)) * u_xlat4.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat4.xy = _MainLightData.xy * vec2(-0.0174532924, 0.0174532924);
    u_xlat30 = sin(u_xlat4.y);
    u_xlat13.xy = cos(u_xlat4.xy);
    u_xlat5.y = sin((-u_xlat4.x));
    u_xlat16_5.x = u_xlat30 * u_xlat13.x;
    u_xlat16_5.z = u_xlat13.x * u_xlat13.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
    u_xlat16_10.xyz = _WaterShallowColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat16_12.xyz = texture(_WaterTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_12.xxx * u_xlat16_10.xyz + _WaterDeepColor.xyz;
    u_xlat4.xyz = u_xlat16_10.xyz * u_xlat3.xxx;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat7.x = u_xlat6.x * u_xlat16_10.x + u_xlat5.x;
    u_xlat7.z = u_xlat6.z * u_xlat16_10.x + u_xlat5.z;
    u_xlat7.y = u_xlat6.y * u_xlat16_10.x + u_xlat5.y;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat6.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat7.xyz;
    u_xlat16_2.x = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
    u_xlat16_11 = log2(u_xlat16_11);
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _SpecularRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_8.xyz = _MainLightData.www * _SpecularColor.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat4.xyz = u_xlat16_2.xzw * u_xlat16_12.yyy + u_xlat4.xyz;
    u_xlat16_2.x = max(_WaterSSSRange, 0.0);
    u_xlat16_2.x = u_xlat16_11 * u_xlat16_2.x;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WaterSSSColor.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_12.yyy + u_xlat4.xyz;
    u_xlat4.xy = u_xlat16_1.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat22.xy = u_xlat16_1.xx * vec2(vec2(_ReflectionDistortion, _ReflectionDistortion)) + vs_TEXCOORD5.xy;
    u_xlat22.xy = u_xlat22.xy / vs_TEXCOORD5.ww;
    u_xlat16_5.xyz = texture(_ReflectionTex, u_xlat22.xy).xyz;
    u_xlat4.xy = u_xlat4.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat4.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat4.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat4.xy).x;
    u_xlat16_1.x = (-vs_COLOR0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FoamRange;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_0.x) + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xxx * _FoamColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_2.xyz + u_xlat3.xyz;
    u_xlat16_2.x = dot((-u_xlat16_10.xyz), u_xlat9.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat9.xyz * (-u_xlat16_2.xxx) + (-u_xlat16_10.xyz);
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = log2(u_xlat16_10.x);
    u_xlat16_10.x = u_xlat16_10.x * _FresnelScale;
    u_xlat16_10.x = exp2(u_xlat16_10.x);
    u_xlat16_8.y = u_xlat16_2.y;
    u_xlat0.x = _RotateCube * 0.0174532924;
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat6.z = u_xlat0.x;
    u_xlat6.y = u_xlat4.x;
    u_xlat6.x = (-u_xlat0.x);
    u_xlat16_8.z = dot(u_xlat6.xy, u_xlat16_2.xz);
    u_xlat16_8.x = dot(u_xlat6.yz, u_xlat16_2.xz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat16_8.xyz).xyz;
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FresnelIntensity, _FresnelIntensity, _FresnelIntensity));
    u_xlat4.xyz = u_xlat0.xyz * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z);
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z) + _FoamColor.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat16_12.zzz * _FogColor.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_5.xyz) + _FoamColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_1.x = log2(vs_COLOR0.w);
    u_xlat16_1.x = u_xlat16_1.x * _AlphaMapPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    SV_Target0.w = _AlphaMapIntensity * u_xlat16_1.x + 1.0;
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
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat12;
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
    vs_COLOR0 = in_COLOR0;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _DiffuseNormalMapIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _MainLightData;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _WaterSSSRange;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump float _RotateCube;
uniform 	mediump float _ReflectionDistortion;
uniform 	mediump vec3 _FogColor;
uniform 	mediump float _AlphaMapPower;
uniform 	mediump float _AlphaMapIntensity;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _FoamTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
vec2 u_xlat22;
mediump float u_xlat16_28;
float u_xlat30;
void main()
{
    u_xlat0.x = _WaveXSpeed * _Time.x;
    u_xlat9.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002);
    u_xlat9.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat9.xy;
    u_xlat16_9.xyz = texture(_WaveMap, u_xlat9.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_1.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat9.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat0.xx;
    u_xlat16_9.xyz = texture(_WaveMap, u_xlat9.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_28 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_28 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_28) + vs_TEXCOORD2.yzx;
    u_xlat9.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat9.z;
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat4.x = u_xlat9.y;
    u_xlat9.y = u_xlat4.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat9.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat9.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat9.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(vec3(_DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity)) * u_xlat4.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat4.xy = _MainLightData.xy * vec2(-0.0174532924, 0.0174532924);
    u_xlat30 = sin(u_xlat4.y);
    u_xlat13.xy = cos(u_xlat4.xy);
    u_xlat5.y = sin((-u_xlat4.x));
    u_xlat16_5.x = u_xlat30 * u_xlat13.x;
    u_xlat16_5.z = u_xlat13.x * u_xlat13.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
    u_xlat16_10.xyz = _WaterShallowColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat16_12.xyz = texture(_WaterTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_12.xxx * u_xlat16_10.xyz + _WaterDeepColor.xyz;
    u_xlat4.xyz = u_xlat16_10.xyz * u_xlat3.xxx;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat7.x = u_xlat6.x * u_xlat16_10.x + u_xlat5.x;
    u_xlat7.z = u_xlat6.z * u_xlat16_10.x + u_xlat5.z;
    u_xlat7.y = u_xlat6.y * u_xlat16_10.x + u_xlat5.y;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat6.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat7.xyz;
    u_xlat16_2.x = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
    u_xlat16_11 = log2(u_xlat16_11);
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _SpecularRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_8.xyz = _MainLightData.www * _SpecularColor.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat4.xyz = u_xlat16_2.xzw * u_xlat16_12.yyy + u_xlat4.xyz;
    u_xlat16_2.x = max(_WaterSSSRange, 0.0);
    u_xlat16_2.x = u_xlat16_11 * u_xlat16_2.x;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WaterSSSColor.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_12.yyy + u_xlat4.xyz;
    u_xlat4.xy = u_xlat16_1.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat22.xy = u_xlat16_1.xx * vec2(vec2(_ReflectionDistortion, _ReflectionDistortion)) + vs_TEXCOORD5.xy;
    u_xlat22.xy = u_xlat22.xy / vs_TEXCOORD5.ww;
    u_xlat16_5.xyz = texture(_ReflectionTex, u_xlat22.xy).xyz;
    u_xlat4.xy = u_xlat4.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat4.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat4.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat4.xy).x;
    u_xlat16_1.x = (-vs_COLOR0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FoamRange;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_0.x) + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xxx * _FoamColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_2.xyz + u_xlat3.xyz;
    u_xlat16_2.x = dot((-u_xlat16_10.xyz), u_xlat9.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat9.xyz * (-u_xlat16_2.xxx) + (-u_xlat16_10.xyz);
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = log2(u_xlat16_10.x);
    u_xlat16_10.x = u_xlat16_10.x * _FresnelScale;
    u_xlat16_10.x = exp2(u_xlat16_10.x);
    u_xlat16_8.y = u_xlat16_2.y;
    u_xlat0.x = _RotateCube * 0.0174532924;
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat6.z = u_xlat0.x;
    u_xlat6.y = u_xlat4.x;
    u_xlat6.x = (-u_xlat0.x);
    u_xlat16_8.z = dot(u_xlat6.xy, u_xlat16_2.xz);
    u_xlat16_8.x = dot(u_xlat6.yz, u_xlat16_2.xz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat16_8.xyz).xyz;
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FresnelIntensity, _FresnelIntensity, _FresnelIntensity));
    u_xlat4.xyz = u_xlat0.xyz * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z);
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z) + _FoamColor.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat16_12.zzz * _FogColor.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_5.xyz) + _FoamColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_1.x = log2(vs_COLOR0.w);
    u_xlat16_1.x = u_xlat16_1.x * _AlphaMapPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    SV_Target0.w = _AlphaMapIntensity * u_xlat16_1.x + 1.0;
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
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat12;
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
    vs_COLOR0 = in_COLOR0;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterShallowColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _WaveMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump float _DiffuseNormalMapIntensity;
uniform 	mediump vec4 _FoamTex_ST;
uniform 	mediump float _FoamRange;
uniform 	mediump vec4 _FoamColor;
uniform 	mediump float _FoamDistortion;
uniform 	mediump vec4 _MainLightData;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump vec4 _WaterSSSColor;
uniform 	mediump float _WaterSSSRange;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump float _RotateCube;
uniform 	mediump float _ReflectionDistortion;
uniform 	mediump vec3 _FogColor;
uniform 	mediump float _AlphaMapPower;
uniform 	mediump float _AlphaMapIntensity;
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
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _WaveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _FoamTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
vec2 u_xlat22;
mediump float u_xlat16_28;
float u_xlat30;
void main()
{
    u_xlat0.x = _WaveXSpeed * _Time.x;
    u_xlat9.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002);
    u_xlat9.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat9.xy;
    u_xlat16_9.xyz = texture(_WaveMap, u_xlat9.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_28 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_1.xyz = vec3(u_xlat16_28) * u_xlat16_1.xyz;
    u_xlat9.xy = vs_TEXCOORD3.xy * _WaveMap_ST.xy + u_xlat0.xx;
    u_xlat16_9.xyz = texture(_WaveMap, u_xlat9.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_28 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_28 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_28) + vs_TEXCOORD2.yzx;
    u_xlat9.x = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat4.x;
    u_xlat3.x = u_xlat9.z;
    u_xlat3.x = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat4.x = u_xlat9.y;
    u_xlat9.y = u_xlat4.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_1.xyz, u_xlat9.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat9.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat9.x = max(u_xlat9.x, 1.17549435e-38);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat9.xxx + vec3(-0.0, -1.0, -0.0);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(vec3(_DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity, _DiffuseNormalMapIntensity)) * u_xlat4.xyz + vec3(0.0, 1.0, 0.0);
    u_xlat4.xy = _MainLightData.xy * vec2(-0.0174532924, 0.0174532924);
    u_xlat30 = sin(u_xlat4.y);
    u_xlat13.xy = cos(u_xlat4.xy);
    u_xlat5.y = sin((-u_xlat4.x));
    u_xlat16_5.x = u_xlat30 * u_xlat13.x;
    u_xlat16_5.z = u_xlat13.x * u_xlat13.y;
    u_xlat5.xz = u_xlat16_5.xz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat5.xyz);
    u_xlat3.x = u_xlat3.x * 0.5 + 0.5;
    u_xlat16_10.xyz = _WaterShallowColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat16_12.xyz = texture(_WaterTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_12.xxx * u_xlat16_10.xyz + _WaterDeepColor.xyz;
    u_xlat4.xyz = u_xlat16_10.xyz * u_xlat3.xxx;
    u_xlat6.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_10.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat7.x = u_xlat6.x * u_xlat16_10.x + u_xlat5.x;
    u_xlat7.z = u_xlat6.z * u_xlat16_10.x + u_xlat5.z;
    u_xlat7.y = u_xlat6.y * u_xlat16_10.x + u_xlat5.y;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat6.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat7.xyz;
    u_xlat16_2.x = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_11 = dot(vs_TEXCOORD1.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
    u_xlat16_11 = log2(u_xlat16_11);
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _SpecularRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_8.xyz = _MainLightData.www * _SpecularColor.xyz;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_8.xyz;
    u_xlat4.xyz = u_xlat16_2.xzw * u_xlat16_12.yyy + u_xlat4.xyz;
    u_xlat16_2.x = max(_WaterSSSRange, 0.0);
    u_xlat16_2.x = u_xlat16_11 * u_xlat16_2.x;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WaterSSSColor.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_12.yyy + u_xlat4.xyz;
    u_xlat4.xy = u_xlat16_1.xx * vec2(_FoamDistortion) + vs_TEXCOORD3.xy;
    u_xlat22.xy = u_xlat16_1.xx * vec2(vec2(_ReflectionDistortion, _ReflectionDistortion)) + vs_TEXCOORD5.xy;
    u_xlat22.xy = u_xlat22.xy / vs_TEXCOORD5.ww;
    u_xlat16_5.xyz = texture(_ReflectionTex, u_xlat22.xy).xyz;
    u_xlat4.xy = u_xlat4.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat4.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat4.xy;
    u_xlat16_0.x = texture(_FoamTex, u_xlat4.xy).x;
    u_xlat16_1.x = (-vs_COLOR0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FoamRange;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_0.x) + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xxx * _FoamColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_2.xyz + u_xlat3.xyz;
    u_xlat16_2.x = dot((-u_xlat16_10.xyz), u_xlat9.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat9.xyz * (-u_xlat16_2.xxx) + (-u_xlat16_10.xyz);
    u_xlat16_10.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.x = log2(u_xlat16_10.x);
    u_xlat16_10.x = u_xlat16_10.x * _FresnelScale;
    u_xlat16_10.x = exp2(u_xlat16_10.x);
    u_xlat16_8.y = u_xlat16_2.y;
    u_xlat0.x = _RotateCube * 0.0174532924;
    u_xlat4.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat6.z = u_xlat0.x;
    u_xlat6.y = u_xlat4.x;
    u_xlat6.x = (-u_xlat0.x);
    u_xlat16_8.z = dot(u_xlat6.xy, u_xlat16_2.xz);
    u_xlat16_8.x = dot(u_xlat6.yz, u_xlat16_2.xz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat16_8.xyz).xyz;
    u_xlat0.xyz = u_xlat16_10.xxx * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_FresnelIntensity, _FresnelIntensity, _FresnelIntensity));
    u_xlat4.xyz = u_xlat0.xyz * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z);
    u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(_CubeColor.x, _CubeColor.y, _CubeColor.z) + _FoamColor.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat16_12.zzz * _FogColor.xyz + u_xlat0.xyz;
    u_xlat16_10.xyz = (-u_xlat16_5.xyz) + _FoamColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_10.xyz + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_1.x = log2(vs_COLOR0.w);
    u_xlat16_1.x = u_xlat16_1.x * _AlphaMapPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    SV_Target0.w = _AlphaMapIntensity * u_xlat16_1.x + 1.0;
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
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 71553
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
CustomEditor "CodeGenShaderGUI.Theseus_Scene_WaterGUI"
}