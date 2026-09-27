//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/<effect>_Fx_Pa_Add_ND_MLuv" {
Properties {

[Toggle(OpenCustom)] _OpenCustom ("开启Custom", Float) = 1.0

_Diffuse ("Diffuse", 2D) = "white" { }

_DiffuseColor ("DiffuseColor", Color) = (1,1,1,1)

_Power ("Power", Float) = 1.0

_Noise ("Noise", 2D) = "white" { }

_NoisePower ("NoisePower", Range(0, 2)) = 0.0

_Noise_Speed_U ("Noise_Speed_U", Float) = 0.0

_Noise_Speed_V ("Noise_Speed_V", Float) = 0.0

_Mask ("Mask", 2D) = "white" { }

_MaskColor ("MaskColor", Color) = (1,1,1,1)

_MaskPower ("MaskPower", Float) = 0.0

[Toggle(_COLOUR_ON)] _COLOUR_ON ("色彩开关(禁动画中K开关)", Float) = 0.0

_Hue ("色相", Range(-0.5, 0.5)) = 0.0

_Saturation ("饱和度", Range(0, 2)) = 1.0

_Contrast ("对比度", Range(0, 2)) = 1.0

_SaturRightColor ("灰度渐变亮色", Color) = (1,1,1,1)

_SaturLeftColor ("灰度渐变暗色", Color) = (1,1,1,1)

_SaturRightColorWeights ("灰度渐变亮色权重", Range(0.5, 1)) = 1.0

_SaturLeftColorWeights ("灰度渐变暗色权重", Range(0, 0.5)) = 0.0

[Toggle] _Crystal_UseCustomColor ("UseCustomColor", Float) = 0.0

_Crystal_CustomColorHSV ("CustomColorHsv", Vector) = (0,1,1,0)

[Toggle(_HEIGHTGRADIENT_ON)] _HEIGHTGRADIENT_ON ("高度渐变开关(禁动画中K开关)", Float) = 0.0

_Height ("平面高度", Float) = 0.0

_HeightGradient ("高度渐变值", Float) = 0.5

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 7041
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_18 = u_xlat16_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat16_0.xyz = u_xlat16_4.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.x>=u_xlat1.x);
#else
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_18 = u_xlat16_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat16_0.xyz = u_xlat16_4.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.x>=u_xlat1.x);
#else
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_18 = u_xlat10_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_18 = u_xlat10_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat12;
bool u_xlatb12;
vec3 u_xlat15;
vec2 u_xlat21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat31;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_27 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_27 = u_xlat16_3.z * u_xlat16_27;
    u_xlat3.xy = vec2(u_xlat16_27) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Power);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb12 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_27 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat12.xy = u_xlat16_0.yz * vec2(_Power) + (-u_xlat16_5.zy);
    u_xlat6.x = float(1.0);
    u_xlat6.y = float(-1.0);
    u_xlat12.xy = vec2(u_xlat16_27) * u_xlat12.xy;
    u_xlat7.xy = u_xlat16_0.zy * vec2(_Power) + u_xlat12.xy;
    u_xlat7.zw = vec2(u_xlat16_27) * u_xlat6.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_5.x>=u_xlat7.x);
#else
    u_xlatb12 = u_xlat16_5.x>=u_xlat7.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat6.xyz = (-u_xlat7.xyw);
    u_xlat6.w = (-u_xlat16_5.x);
    u_xlat0.x = u_xlat16_0.x * _Power + u_xlat6.x;
    u_xlat0.yzw = u_xlat6.yzw + u_xlat7.yzx;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat12.x = u_xlat12.x * u_xlat0.w + u_xlat16_5.x;
    u_xlat21.x = min(u_xlat6.y, u_xlat12.x);
    u_xlat21.x = (-u_xlat21.x) + u_xlat6.x;
    u_xlat12.x = (-u_xlat6.y) + u_xlat12.x;
    u_xlat31 = u_xlat21.x * 6.0 + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat31;
    u_xlat12.x = u_xlat12.x + u_xlat6.z;
    u_xlat31 = u_xlat6.x + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat31;
    u_xlat16_28 = abs(u_xlat12.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb12 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_5.xy = (bool(u_xlatb12)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat21.x * _Saturation;
    u_xlat15.xyz = u_xlat16_5.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat15.xyz = fract(u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat15.xyz = abs(u_xlat15.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = vec3(u_xlat16_29) * u_xlat15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat15.xyz * u_xlat6.xxx;
    u_xlat16_5.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + _SaturLeftColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_28 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_28) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_28) * u_xlat21.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.x>=u_xlat0.x);
#else
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat4.x = u_xlat12.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat4.x / u_xlat21.x;
        u_xlat16_28 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat12;
bool u_xlatb12;
vec3 u_xlat15;
vec2 u_xlat21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat31;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_27 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_27 = u_xlat16_3.z * u_xlat16_27;
    u_xlat3.xy = vec2(u_xlat16_27) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Power);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb12 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_27 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat12.xy = u_xlat16_0.yz * vec2(_Power) + (-u_xlat16_5.zy);
    u_xlat6.x = float(1.0);
    u_xlat6.y = float(-1.0);
    u_xlat12.xy = vec2(u_xlat16_27) * u_xlat12.xy;
    u_xlat7.xy = u_xlat16_0.zy * vec2(_Power) + u_xlat12.xy;
    u_xlat7.zw = vec2(u_xlat16_27) * u_xlat6.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_5.x>=u_xlat7.x);
#else
    u_xlatb12 = u_xlat16_5.x>=u_xlat7.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat6.xyz = (-u_xlat7.xyw);
    u_xlat6.w = (-u_xlat16_5.x);
    u_xlat0.x = u_xlat16_0.x * _Power + u_xlat6.x;
    u_xlat0.yzw = u_xlat6.yzw + u_xlat7.yzx;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat12.x = u_xlat12.x * u_xlat0.w + u_xlat16_5.x;
    u_xlat21.x = min(u_xlat6.y, u_xlat12.x);
    u_xlat21.x = (-u_xlat21.x) + u_xlat6.x;
    u_xlat12.x = (-u_xlat6.y) + u_xlat12.x;
    u_xlat31 = u_xlat21.x * 6.0 + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat31;
    u_xlat12.x = u_xlat12.x + u_xlat6.z;
    u_xlat31 = u_xlat6.x + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat31;
    u_xlat16_28 = abs(u_xlat12.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb12 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_5.xy = (bool(u_xlatb12)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat21.x * _Saturation;
    u_xlat15.xyz = u_xlat16_5.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat15.xyz = fract(u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat15.xyz = abs(u_xlat15.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = vec3(u_xlat16_29) * u_xlat15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat15.xyz * u_xlat6.xxx;
    u_xlat16_5.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + _SaturLeftColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_28 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_28) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_28) * u_xlat21.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.x>=u_xlat0.x);
#else
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat4.x = u_xlat12.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat4.x / u_xlat21.x;
        u_xlat16_28 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat12;
bool u_xlatb12;
vec3 u_xlat15;
vec2 u_xlat21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat31;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_27 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_27 = u_xlat10_3.z * u_xlat16_27;
    u_xlat3.xy = vec2(u_xlat16_27) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlatb12 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_27 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat12.xy = u_xlat16_0.yz * vec2(_Power) + (-u_xlat16_5.zy);
    u_xlat6.x = float(1.0);
    u_xlat6.y = float(-1.0);
    u_xlat12.xy = vec2(u_xlat16_27) * u_xlat12.xy;
    u_xlat7.xy = u_xlat16_0.zy * vec2(_Power) + u_xlat12.xy;
    u_xlat7.zw = vec2(u_xlat16_27) * u_xlat6.xy + vec2(-1.0, 0.666666687);
    u_xlatb12 = u_xlat16_5.x>=u_xlat7.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat6.xyz = (-u_xlat7.xyw);
    u_xlat6.w = (-u_xlat16_5.x);
    u_xlat0.x = u_xlat16_0.x * _Power + u_xlat6.x;
    u_xlat0.yzw = u_xlat6.yzw + u_xlat7.yzx;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat12.x = u_xlat12.x * u_xlat0.w + u_xlat16_5.x;
    u_xlat21.x = min(u_xlat6.y, u_xlat12.x);
    u_xlat21.x = (-u_xlat21.x) + u_xlat6.x;
    u_xlat12.x = (-u_xlat6.y) + u_xlat12.x;
    u_xlat31 = u_xlat21.x * 6.0 + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat31;
    u_xlat12.x = u_xlat12.x + u_xlat6.z;
    u_xlat31 = u_xlat6.x + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat31;
    u_xlat16_28 = abs(u_xlat12.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
    u_xlatb12 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_5.xy = (bool(u_xlatb12)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat21.x * _Saturation;
    u_xlat15.xyz = u_xlat16_5.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat15.xyz = fract(u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat15.xyz = abs(u_xlat15.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = vec3(u_xlat16_29) * u_xlat15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat15.xyz * u_xlat6.xxx;
    u_xlat16_5.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + _SaturLeftColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_28 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_28) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_28) * u_xlat21.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat4.x = u_xlat12.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat4.x / u_xlat21.x;
        u_xlat16_28 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat12;
bool u_xlatb12;
vec3 u_xlat15;
vec2 u_xlat21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat31;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_27 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_27 = u_xlat10_3.z * u_xlat16_27;
    u_xlat3.xy = vec2(u_xlat16_27) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlatb12 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_27 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat12.xy = u_xlat16_0.yz * vec2(_Power) + (-u_xlat16_5.zy);
    u_xlat6.x = float(1.0);
    u_xlat6.y = float(-1.0);
    u_xlat12.xy = vec2(u_xlat16_27) * u_xlat12.xy;
    u_xlat7.xy = u_xlat16_0.zy * vec2(_Power) + u_xlat12.xy;
    u_xlat7.zw = vec2(u_xlat16_27) * u_xlat6.xy + vec2(-1.0, 0.666666687);
    u_xlatb12 = u_xlat16_5.x>=u_xlat7.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat6.xyz = (-u_xlat7.xyw);
    u_xlat6.w = (-u_xlat16_5.x);
    u_xlat0.x = u_xlat16_0.x * _Power + u_xlat6.x;
    u_xlat0.yzw = u_xlat6.yzw + u_xlat7.yzx;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat12.x = u_xlat12.x * u_xlat0.w + u_xlat16_5.x;
    u_xlat21.x = min(u_xlat6.y, u_xlat12.x);
    u_xlat21.x = (-u_xlat21.x) + u_xlat6.x;
    u_xlat12.x = (-u_xlat6.y) + u_xlat12.x;
    u_xlat31 = u_xlat21.x * 6.0 + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat31;
    u_xlat12.x = u_xlat12.x + u_xlat6.z;
    u_xlat31 = u_xlat6.x + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat31;
    u_xlat16_28 = abs(u_xlat12.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
    u_xlatb12 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_5.xy = (bool(u_xlatb12)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat21.x * _Saturation;
    u_xlat15.xyz = u_xlat16_5.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat15.xyz = fract(u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat15.xyz = abs(u_xlat15.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = vec3(u_xlat16_29) * u_xlat15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat15.xyz * u_xlat6.xxx;
    u_xlat16_5.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + _SaturLeftColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_28 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_28) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_28) * u_xlat21.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat4.x = u_xlat12.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat4.x / u_xlat21.x;
        u_xlat16_28 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_18 = u_xlat16_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat3.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb9 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat3.x = (u_xlatb9) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat16_0.xyz = u_xlat16_4.xxx * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.x>=u_xlat1.x);
#else
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_18 = u_xlat16_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat3.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb9 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat3.x = (u_xlatb9) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat16_0.xyz = u_xlat16_4.xxx * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.x>=u_xlat1.x);
#else
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_18 = u_xlat10_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat3.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb9 = _Height>=vs_TEXCOORD2.y;
    u_xlat3.x = (u_xlatb9) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_18 = u_xlat10_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat3.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb9 = _Height>=vs_TEXCOORD2.y;
    u_xlat3.x = (u_xlatb9) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_30 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_30 = u_xlat16_3.z * u_xlat16_30;
    u_xlat3.xy = vec2(u_xlat16_30) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat13.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb23 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat13.x = (u_xlatb23) ? 0.0 : u_xlat13.x;
    u_xlat13.x = u_xlat13.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat5.xyw = u_xlat16_0.yzx * u_xlat13.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb23 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_0.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat16_0.yz * u_xlat13.xx + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat5.w>=u_xlat0.x);
#else
    u_xlatb13 = u_xlat5.w>=u_xlat0.x;
#endif
    u_xlat13.x = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat5;
    u_xlat13.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat13.x = u_xlat0.x + (-u_xlat13.x);
    u_xlat23.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat34 = u_xlat13.x * 6.0 + 1.00000001e-10;
    u_xlat23.x = u_xlat23.x / u_xlat34;
    u_xlat23.x = u_xlat0.z + u_xlat23.x;
    u_xlat34 = u_xlat0.x + 1.00000001e-10;
    u_xlat13.x = u_xlat13.x / u_xlat34;
    u_xlat16_31 = abs(u_xlat23.x) + _Hue;
    u_xlat16_32 = u_xlat16_31 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_32>=(-u_xlat16_32));
#else
    u_xlatb23 = u_xlat16_32>=(-u_xlat16_32);
#endif
    u_xlat16_8.xy = (bool(u_xlatb23)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.y;
    u_xlat16_31 = fract(u_xlat16_31);
    u_xlat16_32 = u_xlat13.x * _Saturation;
    u_xlat6.xyz = u_xlat16_8.xxx * vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = vec3(u_xlat16_32) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_31 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_32 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_31 = float(1.0) / u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_32 = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_9.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_31) * u_xlat16_9.xyz + _SaturLeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_31 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat23.x = float(1.0);
        u_xlat23.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_31) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_31) * u_xlat23.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.x>=u_xlat0.x);
#else
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat13.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat13.y, u_xlat3.x);
        u_xlat4.x = u_xlat13.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat13.y) + u_xlat3.x;
        u_xlat23.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat23.x;
        u_xlat3.x = u_xlat3.x + u_xlat13.z;
        u_xlat23.x = u_xlat13.x + 1.00000001e-10;
        u_xlat13.y = u_xlat4.x / u_xlat23.x;
        u_xlat16_31 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_8.xy = u_xlat13.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_8.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_8.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_30 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_30 = u_xlat16_3.z * u_xlat16_30;
    u_xlat3.xy = vec2(u_xlat16_30) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat13.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb23 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat13.x = (u_xlatb23) ? 0.0 : u_xlat13.x;
    u_xlat13.x = u_xlat13.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat5.xyw = u_xlat16_0.yzx * u_xlat13.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb23 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_0.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat16_0.yz * u_xlat13.xx + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat5.w>=u_xlat0.x);
#else
    u_xlatb13 = u_xlat5.w>=u_xlat0.x;
#endif
    u_xlat13.x = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat5;
    u_xlat13.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat13.x = u_xlat0.x + (-u_xlat13.x);
    u_xlat23.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat34 = u_xlat13.x * 6.0 + 1.00000001e-10;
    u_xlat23.x = u_xlat23.x / u_xlat34;
    u_xlat23.x = u_xlat0.z + u_xlat23.x;
    u_xlat34 = u_xlat0.x + 1.00000001e-10;
    u_xlat13.x = u_xlat13.x / u_xlat34;
    u_xlat16_31 = abs(u_xlat23.x) + _Hue;
    u_xlat16_32 = u_xlat16_31 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_32>=(-u_xlat16_32));
#else
    u_xlatb23 = u_xlat16_32>=(-u_xlat16_32);
#endif
    u_xlat16_8.xy = (bool(u_xlatb23)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.y;
    u_xlat16_31 = fract(u_xlat16_31);
    u_xlat16_32 = u_xlat13.x * _Saturation;
    u_xlat6.xyz = u_xlat16_8.xxx * vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = vec3(u_xlat16_32) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_31 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_32 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_31 = float(1.0) / u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_32 = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_9.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_31) * u_xlat16_9.xyz + _SaturLeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_31 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat23.x = float(1.0);
        u_xlat23.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_31) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_31) * u_xlat23.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.x>=u_xlat0.x);
#else
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat13.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat13.y, u_xlat3.x);
        u_xlat4.x = u_xlat13.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat13.y) + u_xlat3.x;
        u_xlat23.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat23.x;
        u_xlat3.x = u_xlat3.x + u_xlat13.z;
        u_xlat23.x = u_xlat13.x + 1.00000001e-10;
        u_xlat13.y = u_xlat4.x / u_xlat23.x;
        u_xlat16_31 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_8.xy = u_xlat13.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_8.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_8.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_30 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_30 = u_xlat10_3.z * u_xlat16_30;
    u_xlat3.xy = vec2(u_xlat16_30) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat13.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb23 = _Height>=vs_TEXCOORD2.y;
    u_xlat13.x = (u_xlatb23) ? 0.0 : u_xlat13.x;
    u_xlat13.x = u_xlat13.x / _HeightGradient;
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
    u_xlat5.xyw = u_xlat16_0.yzx * u_xlat13.xxx;
    u_xlatb23 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_0.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat16_0.yz * u_xlat13.xx + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
    u_xlatb13 = u_xlat5.w>=u_xlat0.x;
    u_xlat13.x = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat5;
    u_xlat13.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat13.x = u_xlat0.x + (-u_xlat13.x);
    u_xlat23.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat34 = u_xlat13.x * 6.0 + 1.00000001e-10;
    u_xlat23.x = u_xlat23.x / u_xlat34;
    u_xlat23.x = u_xlat0.z + u_xlat23.x;
    u_xlat34 = u_xlat0.x + 1.00000001e-10;
    u_xlat13.x = u_xlat13.x / u_xlat34;
    u_xlat16_31 = abs(u_xlat23.x) + _Hue;
    u_xlat16_32 = u_xlat16_31 * 360.0;
    u_xlatb23 = u_xlat16_32>=(-u_xlat16_32);
    u_xlat16_8.xy = (bool(u_xlatb23)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.y;
    u_xlat16_31 = fract(u_xlat16_31);
    u_xlat16_32 = u_xlat13.x * _Saturation;
    u_xlat6.xyz = u_xlat16_8.xxx * vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = vec3(u_xlat16_32) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_31 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_32 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_31 = float(1.0) / u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_32 = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_9.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_31) * u_xlat16_9.xyz + _SaturLeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat10_4.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_31 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat23.x = float(1.0);
        u_xlat23.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_31) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_31) * u_xlat23.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat13.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat13.y, u_xlat3.x);
        u_xlat4.x = u_xlat13.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat13.y) + u_xlat3.x;
        u_xlat23.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat23.x;
        u_xlat3.x = u_xlat3.x + u_xlat13.z;
        u_xlat23.x = u_xlat13.x + 1.00000001e-10;
        u_xlat13.y = u_xlat4.x / u_xlat23.x;
        u_xlat16_31 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_8.xy = u_xlat13.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_8.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_8.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_30 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_30 = u_xlat10_3.z * u_xlat16_30;
    u_xlat3.xy = vec2(u_xlat16_30) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat13.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb23 = _Height>=vs_TEXCOORD2.y;
    u_xlat13.x = (u_xlatb23) ? 0.0 : u_xlat13.x;
    u_xlat13.x = u_xlat13.x / _HeightGradient;
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
    u_xlat5.xyw = u_xlat16_0.yzx * u_xlat13.xxx;
    u_xlatb23 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_0.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat16_0.yz * u_xlat13.xx + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
    u_xlatb13 = u_xlat5.w>=u_xlat0.x;
    u_xlat13.x = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat5;
    u_xlat13.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat13.x = u_xlat0.x + (-u_xlat13.x);
    u_xlat23.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat34 = u_xlat13.x * 6.0 + 1.00000001e-10;
    u_xlat23.x = u_xlat23.x / u_xlat34;
    u_xlat23.x = u_xlat0.z + u_xlat23.x;
    u_xlat34 = u_xlat0.x + 1.00000001e-10;
    u_xlat13.x = u_xlat13.x / u_xlat34;
    u_xlat16_31 = abs(u_xlat23.x) + _Hue;
    u_xlat16_32 = u_xlat16_31 * 360.0;
    u_xlatb23 = u_xlat16_32>=(-u_xlat16_32);
    u_xlat16_8.xy = (bool(u_xlatb23)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.y;
    u_xlat16_31 = fract(u_xlat16_31);
    u_xlat16_32 = u_xlat13.x * _Saturation;
    u_xlat6.xyz = u_xlat16_8.xxx * vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = vec3(u_xlat16_32) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_31 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_32 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_31 = float(1.0) / u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_32 = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_9.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_31) * u_xlat16_9.xyz + _SaturLeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat10_4.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_31 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat23.x = float(1.0);
        u_xlat23.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_31) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_31) * u_xlat23.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat13.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat13.y, u_xlat3.x);
        u_xlat4.x = u_xlat13.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat13.y) + u_xlat3.x;
        u_xlat23.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat23.x;
        u_xlat3.x = u_xlat3.x + u_xlat13.z;
        u_xlat23.x = u_xlat13.x + 1.00000001e-10;
        u_xlat13.y = u_xlat4.x / u_xlat23.x;
        u_xlat16_31 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_8.xy = u_xlat13.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_8.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_8.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_18 = u_xlat16_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat16_0.xyz = u_xlat16_4.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.x>=u_xlat1.x);
#else
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_18 = u_xlat16_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat16_0.xyz = u_xlat16_4.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.x>=u_xlat1.x);
#else
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_18 = u_xlat10_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_18 = u_xlat10_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat12;
bool u_xlatb12;
vec3 u_xlat15;
vec2 u_xlat21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat31;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_27 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_27 = u_xlat16_3.z * u_xlat16_27;
    u_xlat3.xy = vec2(u_xlat16_27) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Power);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb12 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_27 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat12.xy = u_xlat16_0.yz * vec2(_Power) + (-u_xlat16_5.zy);
    u_xlat6.x = float(1.0);
    u_xlat6.y = float(-1.0);
    u_xlat12.xy = vec2(u_xlat16_27) * u_xlat12.xy;
    u_xlat7.xy = u_xlat16_0.zy * vec2(_Power) + u_xlat12.xy;
    u_xlat7.zw = vec2(u_xlat16_27) * u_xlat6.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_5.x>=u_xlat7.x);
#else
    u_xlatb12 = u_xlat16_5.x>=u_xlat7.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat6.xyz = (-u_xlat7.xyw);
    u_xlat6.w = (-u_xlat16_5.x);
    u_xlat0.x = u_xlat16_0.x * _Power + u_xlat6.x;
    u_xlat0.yzw = u_xlat6.yzw + u_xlat7.yzx;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat12.x = u_xlat12.x * u_xlat0.w + u_xlat16_5.x;
    u_xlat21.x = min(u_xlat6.y, u_xlat12.x);
    u_xlat21.x = (-u_xlat21.x) + u_xlat6.x;
    u_xlat12.x = (-u_xlat6.y) + u_xlat12.x;
    u_xlat31 = u_xlat21.x * 6.0 + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat31;
    u_xlat12.x = u_xlat12.x + u_xlat6.z;
    u_xlat31 = u_xlat6.x + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat31;
    u_xlat16_28 = abs(u_xlat12.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb12 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_5.xy = (bool(u_xlatb12)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat21.x * _Saturation;
    u_xlat15.xyz = u_xlat16_5.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat15.xyz = fract(u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat15.xyz = abs(u_xlat15.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = vec3(u_xlat16_29) * u_xlat15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat15.xyz * u_xlat6.xxx;
    u_xlat16_5.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + _SaturLeftColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_28 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_28) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_28) * u_xlat21.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.x>=u_xlat0.x);
#else
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat4.x = u_xlat12.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat4.x / u_xlat21.x;
        u_xlat16_28 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat12;
bool u_xlatb12;
vec3 u_xlat15;
vec2 u_xlat21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat31;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_27 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_27 = u_xlat16_3.z * u_xlat16_27;
    u_xlat3.xy = vec2(u_xlat16_27) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Power);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb12 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_27 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat12.xy = u_xlat16_0.yz * vec2(_Power) + (-u_xlat16_5.zy);
    u_xlat6.x = float(1.0);
    u_xlat6.y = float(-1.0);
    u_xlat12.xy = vec2(u_xlat16_27) * u_xlat12.xy;
    u_xlat7.xy = u_xlat16_0.zy * vec2(_Power) + u_xlat12.xy;
    u_xlat7.zw = vec2(u_xlat16_27) * u_xlat6.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_5.x>=u_xlat7.x);
#else
    u_xlatb12 = u_xlat16_5.x>=u_xlat7.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat6.xyz = (-u_xlat7.xyw);
    u_xlat6.w = (-u_xlat16_5.x);
    u_xlat0.x = u_xlat16_0.x * _Power + u_xlat6.x;
    u_xlat0.yzw = u_xlat6.yzw + u_xlat7.yzx;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat12.x = u_xlat12.x * u_xlat0.w + u_xlat16_5.x;
    u_xlat21.x = min(u_xlat6.y, u_xlat12.x);
    u_xlat21.x = (-u_xlat21.x) + u_xlat6.x;
    u_xlat12.x = (-u_xlat6.y) + u_xlat12.x;
    u_xlat31 = u_xlat21.x * 6.0 + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat31;
    u_xlat12.x = u_xlat12.x + u_xlat6.z;
    u_xlat31 = u_xlat6.x + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat31;
    u_xlat16_28 = abs(u_xlat12.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb12 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_5.xy = (bool(u_xlatb12)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat21.x * _Saturation;
    u_xlat15.xyz = u_xlat16_5.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat15.xyz = fract(u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat15.xyz = abs(u_xlat15.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = vec3(u_xlat16_29) * u_xlat15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat15.xyz * u_xlat6.xxx;
    u_xlat16_5.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + _SaturLeftColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_28 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_28) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_28) * u_xlat21.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.x>=u_xlat0.x);
#else
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat4.x = u_xlat12.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat4.x / u_xlat21.x;
        u_xlat16_28 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat12;
bool u_xlatb12;
vec3 u_xlat15;
vec2 u_xlat21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat31;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_27 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_27 = u_xlat10_3.z * u_xlat16_27;
    u_xlat3.xy = vec2(u_xlat16_27) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlatb12 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_27 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat12.xy = u_xlat16_0.yz * vec2(_Power) + (-u_xlat16_5.zy);
    u_xlat6.x = float(1.0);
    u_xlat6.y = float(-1.0);
    u_xlat12.xy = vec2(u_xlat16_27) * u_xlat12.xy;
    u_xlat7.xy = u_xlat16_0.zy * vec2(_Power) + u_xlat12.xy;
    u_xlat7.zw = vec2(u_xlat16_27) * u_xlat6.xy + vec2(-1.0, 0.666666687);
    u_xlatb12 = u_xlat16_5.x>=u_xlat7.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat6.xyz = (-u_xlat7.xyw);
    u_xlat6.w = (-u_xlat16_5.x);
    u_xlat0.x = u_xlat16_0.x * _Power + u_xlat6.x;
    u_xlat0.yzw = u_xlat6.yzw + u_xlat7.yzx;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat12.x = u_xlat12.x * u_xlat0.w + u_xlat16_5.x;
    u_xlat21.x = min(u_xlat6.y, u_xlat12.x);
    u_xlat21.x = (-u_xlat21.x) + u_xlat6.x;
    u_xlat12.x = (-u_xlat6.y) + u_xlat12.x;
    u_xlat31 = u_xlat21.x * 6.0 + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat31;
    u_xlat12.x = u_xlat12.x + u_xlat6.z;
    u_xlat31 = u_xlat6.x + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat31;
    u_xlat16_28 = abs(u_xlat12.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
    u_xlatb12 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_5.xy = (bool(u_xlatb12)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat21.x * _Saturation;
    u_xlat15.xyz = u_xlat16_5.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat15.xyz = fract(u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat15.xyz = abs(u_xlat15.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = vec3(u_xlat16_29) * u_xlat15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat15.xyz * u_xlat6.xxx;
    u_xlat16_5.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + _SaturLeftColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_28 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_28) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_28) * u_xlat21.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat4.x = u_xlat12.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat4.x / u_xlat21.x;
        u_xlat16_28 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat12;
bool u_xlatb12;
vec3 u_xlat15;
vec2 u_xlat21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
float u_xlat31;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_27 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_27 = u_xlat10_3.z * u_xlat16_27;
    u_xlat3.xy = vec2(u_xlat16_27) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlatb12 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_27 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat12.xy = u_xlat16_0.yz * vec2(_Power) + (-u_xlat16_5.zy);
    u_xlat6.x = float(1.0);
    u_xlat6.y = float(-1.0);
    u_xlat12.xy = vec2(u_xlat16_27) * u_xlat12.xy;
    u_xlat7.xy = u_xlat16_0.zy * vec2(_Power) + u_xlat12.xy;
    u_xlat7.zw = vec2(u_xlat16_27) * u_xlat6.xy + vec2(-1.0, 0.666666687);
    u_xlatb12 = u_xlat16_5.x>=u_xlat7.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat6.xyz = (-u_xlat7.xyw);
    u_xlat6.w = (-u_xlat16_5.x);
    u_xlat0.x = u_xlat16_0.x * _Power + u_xlat6.x;
    u_xlat0.yzw = u_xlat6.yzw + u_xlat7.yzx;
    u_xlat6.xyz = u_xlat12.xxx * u_xlat0.xyz + u_xlat7.xyw;
    u_xlat12.x = u_xlat12.x * u_xlat0.w + u_xlat16_5.x;
    u_xlat21.x = min(u_xlat6.y, u_xlat12.x);
    u_xlat21.x = (-u_xlat21.x) + u_xlat6.x;
    u_xlat12.x = (-u_xlat6.y) + u_xlat12.x;
    u_xlat31 = u_xlat21.x * 6.0 + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat31;
    u_xlat12.x = u_xlat12.x + u_xlat6.z;
    u_xlat31 = u_xlat6.x + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat31;
    u_xlat16_28 = abs(u_xlat12.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
    u_xlatb12 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_5.xy = (bool(u_xlatb12)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_5.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat21.x * _Saturation;
    u_xlat15.xyz = u_xlat16_5.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat15.xyz = fract(u_xlat15.xyz);
    u_xlat15.xyz = u_xlat15.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat15.xyz = abs(u_xlat15.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
    u_xlat15.xyz = u_xlat15.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.xyz = vec3(u_xlat16_29) * u_xlat15.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat15.xyz * u_xlat6.xxx;
    u_xlat16_5.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + _SaturLeftColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_8.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_28 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_28) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_28) * u_xlat21.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat4.x = u_xlat12.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat4.x / u_xlat21.x;
        u_xlat16_28 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_18 = u_xlat16_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat3.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb9 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat3.x = (u_xlatb9) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat16_0.xyz = u_xlat16_4.xxx * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.x>=u_xlat1.x);
#else
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_18 = u_xlat16_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat3.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb9 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat3.x = (u_xlatb9) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat16_0.xyz = u_xlat16_4.xxx * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_0.x>=u_xlat1.x);
#else
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_18 = u_xlat10_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat3.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb9 = _Height>=vs_TEXCOORD2.y;
    u_xlat3.x = (u_xlatb9) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_18 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_18 = u_xlat10_3.z * u_xlat16_18;
    u_xlat3.xy = vec2(u_xlat16_18) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat3.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb9 = _Height>=vs_TEXCOORD2.y;
    u_xlat3.x = (u_xlatb9) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat16_0.xyz * u_xlat3.xxx;
    u_xlat16_0.xyz = u_xlat10_4.xxx * u_xlat3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_0.zy) + u_xlat16_0.yz;
        u_xlat15.x = float(1.0);
        u_xlat15.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat3.xy + u_xlat16_0.zy;
        u_xlat1.zw = vec2(u_xlat16_18) * u_xlat15.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_0.x>=u_xlat1.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat1.xyw);
        u_xlat2.w = (-u_xlat16_0.x);
        u_xlat4.x = u_xlat16_0.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
        u_xlat9.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat1.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_0.x;
        u_xlat4.x = min(u_xlat9.y, u_xlat3.x);
        u_xlat4.x = u_xlat9.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat9.y) + u_xlat3.x;
        u_xlat15.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat15.x;
        u_xlat3.x = u_xlat3.x + u_xlat9.z;
        u_xlat15.x = u_xlat9.x + 1.00000001e-10;
        u_xlat9.y = u_xlat4.x / u_xlat15.x;
        u_xlat16_18 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat9.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_5.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat3.xyz * u_xlat16_5.yyy;
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_30 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_30 = u_xlat16_3.z * u_xlat16_30;
    u_xlat3.xy = vec2(u_xlat16_30) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat13.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb23 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat13.x = (u_xlatb23) ? 0.0 : u_xlat13.x;
    u_xlat13.x = u_xlat13.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat5.xyw = u_xlat16_0.yzx * u_xlat13.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb23 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_0.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat16_0.yz * u_xlat13.xx + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat5.w>=u_xlat0.x);
#else
    u_xlatb13 = u_xlat5.w>=u_xlat0.x;
#endif
    u_xlat13.x = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat5;
    u_xlat13.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat13.x = u_xlat0.x + (-u_xlat13.x);
    u_xlat23.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat34 = u_xlat13.x * 6.0 + 1.00000001e-10;
    u_xlat23.x = u_xlat23.x / u_xlat34;
    u_xlat23.x = u_xlat0.z + u_xlat23.x;
    u_xlat34 = u_xlat0.x + 1.00000001e-10;
    u_xlat13.x = u_xlat13.x / u_xlat34;
    u_xlat16_31 = abs(u_xlat23.x) + _Hue;
    u_xlat16_32 = u_xlat16_31 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_32>=(-u_xlat16_32));
#else
    u_xlatb23 = u_xlat16_32>=(-u_xlat16_32);
#endif
    u_xlat16_8.xy = (bool(u_xlatb23)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.y;
    u_xlat16_31 = fract(u_xlat16_31);
    u_xlat16_32 = u_xlat13.x * _Saturation;
    u_xlat6.xyz = u_xlat16_8.xxx * vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = vec3(u_xlat16_32) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_31 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_32 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_31 = float(1.0) / u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_32 = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_9.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_31) * u_xlat16_9.xyz + _SaturLeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_31 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat23.x = float(1.0);
        u_xlat23.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_31) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_31) * u_xlat23.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.x>=u_xlat0.x);
#else
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat13.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat13.y, u_xlat3.x);
        u_xlat4.x = u_xlat13.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat13.y) + u_xlat3.x;
        u_xlat23.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat23.x;
        u_xlat3.x = u_xlat3.x + u_xlat13.z;
        u_xlat23.x = u_xlat13.x + 1.00000001e-10;
        u_xlat13.y = u_xlat4.x / u_xlat23.x;
        u_xlat16_31 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_8.xy = u_xlat13.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_8.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_8.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_3.xyz = texture(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_30 = u_xlat16_3.y * u_xlat16_3.x;
    u_xlat16_30 = u_xlat16_3.z * u_xlat16_30;
    u_xlat3.xy = vec2(u_xlat16_30) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4.xyz = texture(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat13.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb23 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat13.x = (u_xlatb23) ? 0.0 : u_xlat13.x;
    u_xlat13.x = u_xlat13.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat5.xyw = u_xlat16_0.yzx * u_xlat13.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb23 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_0.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat16_0.yz * u_xlat13.xx + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat5.w>=u_xlat0.x);
#else
    u_xlatb13 = u_xlat5.w>=u_xlat0.x;
#endif
    u_xlat13.x = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat5;
    u_xlat13.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat13.x = u_xlat0.x + (-u_xlat13.x);
    u_xlat23.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat34 = u_xlat13.x * 6.0 + 1.00000001e-10;
    u_xlat23.x = u_xlat23.x / u_xlat34;
    u_xlat23.x = u_xlat0.z + u_xlat23.x;
    u_xlat34 = u_xlat0.x + 1.00000001e-10;
    u_xlat13.x = u_xlat13.x / u_xlat34;
    u_xlat16_31 = abs(u_xlat23.x) + _Hue;
    u_xlat16_32 = u_xlat16_31 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(u_xlat16_32>=(-u_xlat16_32));
#else
    u_xlatb23 = u_xlat16_32>=(-u_xlat16_32);
#endif
    u_xlat16_8.xy = (bool(u_xlatb23)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.y;
    u_xlat16_31 = fract(u_xlat16_31);
    u_xlat16_32 = u_xlat13.x * _Saturation;
    u_xlat6.xyz = u_xlat16_8.xxx * vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = vec3(u_xlat16_32) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_31 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_32 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_31 = float(1.0) / u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_32 = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_9.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_31) * u_xlat16_9.xyz + _SaturLeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_31 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat23.x = float(1.0);
        u_xlat23.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_31) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_31) * u_xlat23.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(u_xlat16_1.x>=u_xlat0.x);
#else
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat13.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat13.y, u_xlat3.x);
        u_xlat4.x = u_xlat13.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat13.y) + u_xlat3.x;
        u_xlat23.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat23.x;
        u_xlat3.x = u_xlat3.x + u_xlat13.z;
        u_xlat23.x = u_xlat13.x + 1.00000001e-10;
        u_xlat13.y = u_xlat4.x / u_xlat23.x;
        u_xlat16_31 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_8.xy = u_xlat13.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_8.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_8.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_30 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_30 = u_xlat10_3.z * u_xlat16_30;
    u_xlat3.xy = vec2(u_xlat16_30) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat13.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb23 = _Height>=vs_TEXCOORD2.y;
    u_xlat13.x = (u_xlatb23) ? 0.0 : u_xlat13.x;
    u_xlat13.x = u_xlat13.x / _HeightGradient;
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
    u_xlat5.xyw = u_xlat16_0.yzx * u_xlat13.xxx;
    u_xlatb23 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_0.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat16_0.yz * u_xlat13.xx + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
    u_xlatb13 = u_xlat5.w>=u_xlat0.x;
    u_xlat13.x = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat5;
    u_xlat13.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat13.x = u_xlat0.x + (-u_xlat13.x);
    u_xlat23.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat34 = u_xlat13.x * 6.0 + 1.00000001e-10;
    u_xlat23.x = u_xlat23.x / u_xlat34;
    u_xlat23.x = u_xlat0.z + u_xlat23.x;
    u_xlat34 = u_xlat0.x + 1.00000001e-10;
    u_xlat13.x = u_xlat13.x / u_xlat34;
    u_xlat16_31 = abs(u_xlat23.x) + _Hue;
    u_xlat16_32 = u_xlat16_31 * 360.0;
    u_xlatb23 = u_xlat16_32>=(-u_xlat16_32);
    u_xlat16_8.xy = (bool(u_xlatb23)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.y;
    u_xlat16_31 = fract(u_xlat16_31);
    u_xlat16_32 = u_xlat13.x * _Saturation;
    u_xlat6.xyz = u_xlat16_8.xxx * vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = vec3(u_xlat16_32) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_31 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_32 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_31 = float(1.0) / u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_32 = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_9.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_31) * u_xlat16_9.xyz + _SaturLeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat10_4.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_31 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat23.x = float(1.0);
        u_xlat23.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_31) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_31) * u_xlat23.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat13.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat13.y, u_xlat3.x);
        u_xlat4.x = u_xlat13.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat13.y) + u_xlat3.x;
        u_xlat23.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat23.x;
        u_xlat3.x = u_xlat3.x + u_xlat13.z;
        u_xlat23.x = u_xlat13.x + 1.00000001e-10;
        u_xlat13.y = u_xlat4.x / u_xlat23.x;
        u_xlat16_31 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_8.xy = u_xlat13.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_8.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_8.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _Power;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskColor;
uniform 	mediump float _MaskPower;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump float _Noise_Speed_V;
uniform 	mediump float _Noise_Speed_U;
uniform 	mediump float _NoisePower;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Height;
uniform 	mediump float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_30;
mediump float u_xlat16_31;
mediump float u_xlat16_32;
float u_xlat34;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = _MaskColor.xyz * _MaskColor.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat3.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + vs_TEXCOORD0.xy;
    u_xlat3.xy = u_xlat3.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_3.xyz = texture2D(_Noise, u_xlat3.xy).xyw;
    u_xlat4 = vs_TEXCOORD1 * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16_30 = u_xlat10_3.y * u_xlat10_3.x;
    u_xlat16_30 = u_xlat10_3.z * u_xlat16_30;
    u_xlat3.xy = vec2(u_xlat16_30) * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat4.xy;
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xy = u_xlat4.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat16_5.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _DiffuseColor.www;
    u_xlat16_0.xyz = u_xlat10_3.xyz * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_3.www * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Power);
    u_xlat13.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb23 = _Height>=vs_TEXCOORD2.y;
    u_xlat13.x = (u_xlatb23) ? 0.0 : u_xlat13.x;
    u_xlat13.x = u_xlat13.x / _HeightGradient;
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
    u_xlat5.xyw = u_xlat16_0.yzx * u_xlat13.xxx;
    u_xlatb23 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_0.x = (u_xlatb23) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat16_0.yz * u_xlat13.xx + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
    u_xlatb13 = u_xlat5.w>=u_xlat0.x;
    u_xlat13.x = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat13.xxxx * u_xlat0 + u_xlat5;
    u_xlat13.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat13.x = u_xlat0.x + (-u_xlat13.x);
    u_xlat23.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat34 = u_xlat13.x * 6.0 + 1.00000001e-10;
    u_xlat23.x = u_xlat23.x / u_xlat34;
    u_xlat23.x = u_xlat0.z + u_xlat23.x;
    u_xlat34 = u_xlat0.x + 1.00000001e-10;
    u_xlat13.x = u_xlat13.x / u_xlat34;
    u_xlat16_31 = abs(u_xlat23.x) + _Hue;
    u_xlat16_32 = u_xlat16_31 * 360.0;
    u_xlatb23 = u_xlat16_32>=(-u_xlat16_32);
    u_xlat16_8.xy = (bool(u_xlatb23)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.y;
    u_xlat16_31 = fract(u_xlat16_31);
    u_xlat16_32 = u_xlat13.x * _Saturation;
    u_xlat6.xyz = u_xlat16_8.xxx * vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = vec3(u_xlat16_32) * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_8.xyz = u_xlat6.xyz * vec3(_Contrast);
    u_xlat16_31 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_32 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_31 = float(1.0) / u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_32 = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_32;
    u_xlat16_9.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_31) * u_xlat16_9.xyz + _SaturLeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat10_4.xxx * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = u_xlat10_4.xxx * u_xlat10_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MaskColor.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_MaskPower);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_8.xyz * vs_COLOR0.www + u_xlat16_1.xyz;
    u_xlatb3 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3){
        u_xlatb3 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_31 = (u_xlatb3) ? 1.0 : 0.0;
        u_xlat3.xy = (-u_xlat16_1.zy) + u_xlat16_1.yz;
        u_xlat23.x = float(1.0);
        u_xlat23.y = float(-1.0);
        u_xlat0.xy = vec2(u_xlat16_31) * u_xlat3.xy + u_xlat16_1.zy;
        u_xlat0.zw = vec2(u_xlat16_31) * u_xlat23.xy + vec2(-1.0, 0.666666687);
        u_xlatb3 = u_xlat16_1.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
        u_xlat2.xyz = (-u_xlat0.xyw);
        u_xlat2.w = (-u_xlat16_1.x);
        u_xlat4.x = u_xlat16_1.x + u_xlat2.x;
        u_xlat4.yzw = u_xlat0.yzx + u_xlat2.yzw;
        u_xlat13.xyz = u_xlat3.xxx * u_xlat4.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat4.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat13.y, u_xlat3.x);
        u_xlat4.x = u_xlat13.x + (-u_xlat4.x);
        u_xlat3.x = (-u_xlat13.y) + u_xlat3.x;
        u_xlat23.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat23.x;
        u_xlat3.x = u_xlat3.x + u_xlat13.z;
        u_xlat23.x = u_xlat13.x + 1.00000001e-10;
        u_xlat13.y = u_xlat4.x / u_xlat23.x;
        u_xlat16_31 = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_8.xy = u_xlat13.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = vec3(u_xlat16_31) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_8.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat3.xyz * u_xlat16_8.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
}
}
}
}