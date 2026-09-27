//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect_VX/VX_ColorTone" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_ZWrite ("深度写入", Float) = 0.0

_BlendSrc ("BlendSrc_混合源颜色系数", Float) = 5.0

_BlendDst ("BlendDst_混合目标色系数", Float) = 10.0

_Diffuse ("主贴图", 2D) = "white" { }

_DiffuseColor ("主颜色", Color) = (1,1,1,1)

_ColorPower2 ("颜色强度", Float) = 1.0

_Alpha ("透明度", Float) = 1.0

_Main_VxVyRoaRov ("主贴图速度XY_旋转ZW", Vector) = (0,0,0,0)

[Enum(Alpha,0,Luminance,1,GNoise,2)] _ColorType ("选择颜色映射的通道", Float) = 1.0

_InnerColor ("亮色映射", Color) = (0,0.896702,1,1)

_MidColor ("中间色映射", Color) = (0,0.492712,1,1)

_OutColor ("暗色映射", Color) = (0,0.147958,1,1)

_BGColor ("背景颜色", Color) = (0,0,0,0)

_ColorSoft ("颜色融合度", Range(0, 1)) = 0.0

_ColorPower ("颜色强度(遮罩强度)", Range(0, 2)) = 1.0

_MidColorPower ("中间色强度", Range(0, 4)) = 0.20000000298023224

_ColorrOffset ("中间色偏移", Range(0, 0.9999)) = 0.5

_AlphaRange ("透明度范围", Range(0, 2)) = 1.0

_MaskTex ("遮罩图", 2D) = "white" { }

_Mask_VxVyRoaRov ("遮罩图速度XY_旋转ZW", Vector) = (0,0,0,0)

_Nolse ("扰动图", 2D) = "white" { }

_NoisePower ("扰动强度", Range(0, 2)) = 0.0

_NoiseOffset ("扰动校正", Range(0, 1)) = 0.0

_Noise_VxVyRoaRov ("扰动图速度XY_旋转ZW", Vector) = (0,0,0,0)

_HSV_Vector ("_HSV_Vector", Vector) = (0,1,1,0)

_BrightColor ("灰度亮部渐变色", Color) = (1,1,1,1)

_DarkColor ("灰度暗部渐变色", Color) = (1,1,1,1)

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_SaturateWeights ("SaturateWeights", Vector) = (1,0,0,1)

_PanelRect ("PanelRect", Vector) = (0,0,1,1)

_PanelClipInfo ("PanelClipInfo", Vector) = (1,1,1,1)

_Stencil_Ref ("StencilRef", Float) = 0.0

_Stencil_Comp ("Stencil_Comp", Float) = 8.0

_TempParameter1 ("临时参数1", Vector) = (0,0,1,1)

_TempParameter2 ("临时参数2", Vector) = (0,0,1,1)

_TempParameter3 ("临时参数3", Vector) = (0,0,1,1)

_TempParameter4 ("临时参数4", Vector) = (0,0,1,1)

_TempParameter5 ("临时参数5", Vector) = (0,0,1,1)

_TempParameter6 ("临时参数6", Vector) = (0,0,1,1)

_TempTex1 ("临时贴图1", 2D) = "white" { }

_TempTex2 ("临时贴图2", 2D) = "white" { }

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "Unlit"
  LOD 100
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 65099
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Nolse;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat8.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat8.xy;
    u_xlat16.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat16.xy = u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat1.xy = u_xlat16.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat16.xy;
    u_xlat17.xy = (-u_xlat16.xy) + u_xlat0.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat16.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.y<u_xlat0.x);
#else
    u_xlatb16 = u_xlat0.y<u_xlat0.x;
#endif
    u_xlat3 = (bool(u_xlatb16)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat9.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat9.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat16.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat16.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat8.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat8.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_ColorType==1.0);
#else
    u_xlatb8 = _ColorType==1.0;
#endif
    u_xlat8.x = (u_xlatb8) ? u_xlat16_7.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(1.0<_ColorType);
#else
    u_xlatb16 = 1.0<_ColorType;
#endif
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : u_xlat8.x;
    u_xlat8.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat16_8.xyz = texture(_MaskTex, u_xlat8.xy).xyz;
    u_xlat16_7.x = dot(u_xlat16_8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat8.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = _ColorPower + -1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat0.x>=_ColorrOffset);
#else
    u_xlatb8 = u_xlat0.x>=_ColorrOffset;
#endif
    u_xlat16.x = (-u_xlat0.x) + 1.0;
    u_xlat24 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat24 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat8.x = (u_xlatb8) ? u_xlat16.x : u_xlat1.x;
    u_xlat16.x = u_xlat1.x / u_xlat24;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlat24 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat9.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.x = u_xlat8.x * u_xlat24 + (-u_xlat9.x);
    u_xlat8.x = u_xlat1.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat0.z = u_xlat16.x * 0.5 + (-u_xlat9.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xz = min(max(u_xlat0.xz, 0.0), 1.0);
#else
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat0.z * -2.0 + 3.0;
    u_xlat16.x = u_xlat0.z * u_xlat0.z;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat8.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_7.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Nolse;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat8.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat8.xy;
    u_xlat16.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat16.xy = u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat1.xy = u_xlat16.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat16.xy;
    u_xlat17.xy = (-u_xlat16.xy) + u_xlat0.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat16.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.y<u_xlat0.x);
#else
    u_xlatb16 = u_xlat0.y<u_xlat0.x;
#endif
    u_xlat3 = (bool(u_xlatb16)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat9.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat9.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat16.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat16.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat8.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat8.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_ColorType==1.0);
#else
    u_xlatb8 = _ColorType==1.0;
#endif
    u_xlat8.x = (u_xlatb8) ? u_xlat16_7.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(1.0<_ColorType);
#else
    u_xlatb16 = 1.0<_ColorType;
#endif
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : u_xlat8.x;
    u_xlat8.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat16_8.xyz = texture(_MaskTex, u_xlat8.xy).xyz;
    u_xlat16_7.x = dot(u_xlat16_8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat8.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = _ColorPower + -1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat0.x>=_ColorrOffset);
#else
    u_xlatb8 = u_xlat0.x>=_ColorrOffset;
#endif
    u_xlat16.x = (-u_xlat0.x) + 1.0;
    u_xlat24 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat24 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat8.x = (u_xlatb8) ? u_xlat16.x : u_xlat1.x;
    u_xlat16.x = u_xlat1.x / u_xlat24;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlat24 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat9.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.x = u_xlat8.x * u_xlat24 + (-u_xlat9.x);
    u_xlat8.x = u_xlat1.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat0.z = u_xlat16.x * 0.5 + (-u_xlat9.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xz = min(max(u_xlat0.xz, 0.0), 1.0);
#else
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat0.z * -2.0 + 3.0;
    u_xlat16.x = u_xlat0.z * u_xlat0.z;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat8.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _Nolse;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat8.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat8.xy;
    u_xlat16.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat16.xy = u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat1.xy = u_xlat16.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat16.xy;
    u_xlat17.xy = (-u_xlat16.xy) + u_xlat0.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat16.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
    u_xlatb16 = u_xlat0.y<u_xlat0.x;
    u_xlat3 = (bool(u_xlatb16)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat9.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat9.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat16.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat16.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat8.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat8.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8 = _ColorType==1.0;
    u_xlat8.x = (u_xlatb8) ? u_xlat16_7.x : u_xlat10_2.w;
    u_xlatb16 = 1.0<_ColorType;
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : u_xlat8.x;
    u_xlat8.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat10_8.xyz = texture2D(_MaskTex, u_xlat8.xy).xyz;
    u_xlat16_7.x = dot(u_xlat10_8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat8.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = _ColorPower + -1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat8.x;
    u_xlatb8 = u_xlat0.x>=_ColorrOffset;
    u_xlat16.x = (-u_xlat0.x) + 1.0;
    u_xlat24 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat24 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat8.x = (u_xlatb8) ? u_xlat16.x : u_xlat1.x;
    u_xlat16.x = u_xlat1.x / u_xlat24;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlat24 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat9.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.x = u_xlat8.x * u_xlat24 + (-u_xlat9.x);
    u_xlat8.x = u_xlat1.x * u_xlat8.x;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat24 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat0.z = u_xlat16.x * 0.5 + (-u_xlat9.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
    u_xlat24 = u_xlat0.z * -2.0 + 3.0;
    u_xlat16.x = u_xlat0.z * u_xlat0.z;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat8.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _Nolse;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat8.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat8.xy;
    u_xlat16.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat16.xy = u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat1.xy = u_xlat16.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat16.xy;
    u_xlat17.xy = (-u_xlat16.xy) + u_xlat0.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat16.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
    u_xlatb16 = u_xlat0.y<u_xlat0.x;
    u_xlat3 = (bool(u_xlatb16)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat9.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat9.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat16.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat16.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat8.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat8.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8 = _ColorType==1.0;
    u_xlat8.x = (u_xlatb8) ? u_xlat16_7.x : u_xlat10_2.w;
    u_xlatb16 = 1.0<_ColorType;
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : u_xlat8.x;
    u_xlat8.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat10_8.xyz = texture2D(_MaskTex, u_xlat8.xy).xyz;
    u_xlat16_7.x = dot(u_xlat10_8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat8.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = _ColorPower + -1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat8.x;
    u_xlatb8 = u_xlat0.x>=_ColorrOffset;
    u_xlat16.x = (-u_xlat0.x) + 1.0;
    u_xlat24 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat24 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat8.x = (u_xlatb8) ? u_xlat16.x : u_xlat1.x;
    u_xlat16.x = u_xlat1.x / u_xlat24;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlat24 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat9.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.x = u_xlat8.x * u_xlat24 + (-u_xlat9.x);
    u_xlat8.x = u_xlat1.x * u_xlat8.x;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat24 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat0.z = u_xlat16.x * 0.5 + (-u_xlat9.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
    u_xlat24 = u_xlat0.z * -2.0 + 3.0;
    u_xlat16.x = u_xlat0.z * u_xlat0.z;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat8.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Nolse;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat9.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat9.xy;
    u_xlat18.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat18.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat1.xy = u_xlat18.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat18.xy;
    u_xlat19.xy = (-u_xlat18.xy) + u_xlat0.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat18.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<u_xlat0.x);
#else
    u_xlatb18 = u_xlat0.y<u_xlat0.x;
#endif
    u_xlat3 = (bool(u_xlatb18)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat10.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat10.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat10.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat18.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat18.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat9.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat9.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_ColorType==1.0);
#else
    u_xlatb9 = _ColorType==1.0;
#endif
    u_xlat9.x = (u_xlatb9) ? u_xlat16_7.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(1.0<_ColorType);
#else
    u_xlatb18 = 1.0<_ColorType;
#endif
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat9.x;
    u_xlat9.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat16_9.xyz = texture(_MaskTex, u_xlat9.xy).xyz;
    u_xlat16_7.x = dot(u_xlat16_9.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = _ColorPower + -1.0;
    u_xlat9.x = u_xlat9.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.x>=_ColorrOffset);
#else
    u_xlatb9 = u_xlat0.x>=_ColorrOffset;
#endif
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat27 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat27 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat9.x = (u_xlatb9) ? u_xlat18.x : u_xlat1.x;
    u_xlat18.x = u_xlat1.x / u_xlat27;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat27 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat10.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat10.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9.x = u_xlat9.x * u_xlat27 + (-u_xlat10.x);
    u_xlat9.x = u_xlat1.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat27;
    u_xlat0.z = u_xlat18.x * 0.5 + (-u_xlat10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat10.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xz = min(max(u_xlat0.xz, 0.0), 1.0);
#else
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat0.z * -2.0 + 3.0;
    u_xlat18.x = u_xlat0.z * u_xlat0.z;
    u_xlat18.x = u_xlat18.x * u_xlat27;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat9.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_16.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorPower2) + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_16.xxxx * u_xlat0.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb10 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = u_xlat10.xxxx * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat10.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat9.x = u_xlat9.x / u_xlat10.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.z;
    u_xlat16_16.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb9 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat9.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat10.x;
    u_xlat16_16.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_16.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat16_16.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_8.xzw;
    u_xlat16_34 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_34 = u_xlat16_8.y * u_xlat16_34;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_34 * -2.0 + 3.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Nolse;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat9.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat9.xy;
    u_xlat18.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat18.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat1.xy = u_xlat18.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat18.xy;
    u_xlat19.xy = (-u_xlat18.xy) + u_xlat0.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat18.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<u_xlat0.x);
#else
    u_xlatb18 = u_xlat0.y<u_xlat0.x;
#endif
    u_xlat3 = (bool(u_xlatb18)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat10.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat10.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat10.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat18.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat18.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat9.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat9.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_ColorType==1.0);
#else
    u_xlatb9 = _ColorType==1.0;
#endif
    u_xlat9.x = (u_xlatb9) ? u_xlat16_7.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(1.0<_ColorType);
#else
    u_xlatb18 = 1.0<_ColorType;
#endif
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat9.x;
    u_xlat9.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat16_9.xyz = texture(_MaskTex, u_xlat9.xy).xyz;
    u_xlat16_7.x = dot(u_xlat16_9.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = _ColorPower + -1.0;
    u_xlat9.x = u_xlat9.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.x>=_ColorrOffset);
#else
    u_xlatb9 = u_xlat0.x>=_ColorrOffset;
#endif
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat27 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat27 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat9.x = (u_xlatb9) ? u_xlat18.x : u_xlat1.x;
    u_xlat18.x = u_xlat1.x / u_xlat27;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat27 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat10.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat10.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9.x = u_xlat9.x * u_xlat27 + (-u_xlat10.x);
    u_xlat9.x = u_xlat1.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat27;
    u_xlat0.z = u_xlat18.x * 0.5 + (-u_xlat10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat10.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xz = min(max(u_xlat0.xz, 0.0), 1.0);
#else
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat0.z * -2.0 + 3.0;
    u_xlat18.x = u_xlat0.z * u_xlat0.z;
    u_xlat18.x = u_xlat18.x * u_xlat27;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat9.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_16.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorPower2) + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_16.xxxx * u_xlat0.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb10 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = u_xlat10.xxxx * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat10.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat9.x = u_xlat9.x / u_xlat10.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.z;
    u_xlat16_16.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb9 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat9.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat10.x;
    u_xlat16_16.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_16.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat16_16.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_8.xzw;
    u_xlat16_34 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_34 = u_xlat16_8.y * u_xlat16_34;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_34 * -2.0 + 3.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _Nolse;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
bool u_xlatb9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat9.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat9.xy;
    u_xlat18.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat18.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat1.xy = u_xlat18.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat18.xy;
    u_xlat19.xy = (-u_xlat18.xy) + u_xlat0.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat18.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat19.xy;
    u_xlatb18 = u_xlat0.y<u_xlat0.x;
    u_xlat3 = (bool(u_xlatb18)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat10.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat10.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat10.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat18.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat18.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat9.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat9.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb9 = _ColorType==1.0;
    u_xlat9.x = (u_xlatb9) ? u_xlat16_7.x : u_xlat10_2.w;
    u_xlatb18 = 1.0<_ColorType;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat9.x;
    u_xlat9.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat10_9.xyz = texture2D(_MaskTex, u_xlat9.xy).xyz;
    u_xlat16_7.x = dot(u_xlat10_9.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = _ColorPower + -1.0;
    u_xlat9.x = u_xlat9.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat9.x;
    u_xlatb9 = u_xlat0.x>=_ColorrOffset;
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat27 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat27 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat9.x = (u_xlatb9) ? u_xlat18.x : u_xlat1.x;
    u_xlat18.x = u_xlat1.x / u_xlat27;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat27 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat10.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat10.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9.x = u_xlat9.x * u_xlat27 + (-u_xlat10.x);
    u_xlat9.x = u_xlat1.x * u_xlat9.x;
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat27;
    u_xlat0.z = u_xlat18.x * 0.5 + (-u_xlat10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat10.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
    u_xlat27 = u_xlat0.z * -2.0 + 3.0;
    u_xlat18.x = u_xlat0.z * u_xlat0.z;
    u_xlat18.x = u_xlat18.x * u_xlat27;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat9.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_16.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorPower2) + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_16.xxxx * u_xlat0.xywz + u_xlat2.xywz;
    u_xlatb10 = u_xlat1.x>=u_xlat0.x;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = u_xlat10.xxxx * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat10.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat9.x = u_xlat9.x / u_xlat10.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.z;
    u_xlat16_16.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
    u_xlatb9 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlat16_25.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat9.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat10.x;
    u_xlat16_16.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_16.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat16_16.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_8.xzw;
    u_xlat16_34 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_34 = u_xlat16_8.y * u_xlat16_34;
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_34 * -2.0 + 3.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _Nolse;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
bool u_xlatb9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat9.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat9.xy;
    u_xlat18.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat18.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat1.xy = u_xlat18.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat18.xy;
    u_xlat19.xy = (-u_xlat18.xy) + u_xlat0.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat18.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat19.xy;
    u_xlatb18 = u_xlat0.y<u_xlat0.x;
    u_xlat3 = (bool(u_xlatb18)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat10.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat10.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat10.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat18.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat18.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat9.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat9.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb9 = _ColorType==1.0;
    u_xlat9.x = (u_xlatb9) ? u_xlat16_7.x : u_xlat10_2.w;
    u_xlatb18 = 1.0<_ColorType;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat9.x;
    u_xlat9.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat10_9.xyz = texture2D(_MaskTex, u_xlat9.xy).xyz;
    u_xlat16_7.x = dot(u_xlat10_9.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = _ColorPower + -1.0;
    u_xlat9.x = u_xlat9.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat9.x;
    u_xlatb9 = u_xlat0.x>=_ColorrOffset;
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat27 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat27 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat9.x = (u_xlatb9) ? u_xlat18.x : u_xlat1.x;
    u_xlat18.x = u_xlat1.x / u_xlat27;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat27 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat10.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat10.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9.x = u_xlat9.x * u_xlat27 + (-u_xlat10.x);
    u_xlat9.x = u_xlat1.x * u_xlat9.x;
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat27;
    u_xlat0.z = u_xlat18.x * 0.5 + (-u_xlat10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat10.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
    u_xlat27 = u_xlat0.z * -2.0 + 3.0;
    u_xlat18.x = u_xlat0.z * u_xlat0.z;
    u_xlat18.x = u_xlat18.x * u_xlat27;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat9.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_16.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorPower2) + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_16.xxxx * u_xlat0.xywz + u_xlat2.xywz;
    u_xlatb10 = u_xlat1.x>=u_xlat0.x;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = u_xlat10.xxxx * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat10.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat9.x = u_xlat9.x / u_xlat10.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.z;
    u_xlat16_16.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
    u_xlatb9 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlat16_25.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat9.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat10.x;
    u_xlat16_16.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_16.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat16_16.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_8.xzw;
    u_xlat16_34 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_34 = u_xlat16_8.y * u_xlat16_34;
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_34 * -2.0 + 3.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Nolse;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat8.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat8.xy;
    u_xlat16.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat16.xy = u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat1.xy = u_xlat16.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat16.xy;
    u_xlat17.xy = (-u_xlat16.xy) + u_xlat0.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat16.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.y<u_xlat0.x);
#else
    u_xlatb16 = u_xlat0.y<u_xlat0.x;
#endif
    u_xlat3 = (bool(u_xlatb16)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat9.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat9.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat16.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat16.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat8.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat8.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_ColorType==1.0);
#else
    u_xlatb8 = _ColorType==1.0;
#endif
    u_xlat8.x = (u_xlatb8) ? u_xlat16_7.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(1.0<_ColorType);
#else
    u_xlatb16 = 1.0<_ColorType;
#endif
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : u_xlat8.x;
    u_xlat8.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat16_8.xyz = texture(_MaskTex, u_xlat8.xy).xyz;
    u_xlat16_7.x = dot(u_xlat16_8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat8.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = _ColorPower + -1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat0.x>=_ColorrOffset);
#else
    u_xlatb8 = u_xlat0.x>=_ColorrOffset;
#endif
    u_xlat16.x = (-u_xlat0.x) + 1.0;
    u_xlat24 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat24 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat8.x = (u_xlatb8) ? u_xlat16.x : u_xlat1.x;
    u_xlat16.x = u_xlat1.x / u_xlat24;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlat24 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat9.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.x = u_xlat8.x * u_xlat24 + (-u_xlat9.x);
    u_xlat8.x = u_xlat1.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat0.z = u_xlat16.x * 0.5 + (-u_xlat9.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xz = min(max(u_xlat0.xz, 0.0), 1.0);
#else
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat0.z * -2.0 + 3.0;
    u_xlat16.x = u_xlat0.z * u_xlat0.z;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat8.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Nolse;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat8.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat8.xy;
    u_xlat16.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat16.xy = u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat1.xy = u_xlat16.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat16.xy;
    u_xlat17.xy = (-u_xlat16.xy) + u_xlat0.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat16.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.y<u_xlat0.x);
#else
    u_xlatb16 = u_xlat0.y<u_xlat0.x;
#endif
    u_xlat3 = (bool(u_xlatb16)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat9.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat9.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat16.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat16.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat8.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat8.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_ColorType==1.0);
#else
    u_xlatb8 = _ColorType==1.0;
#endif
    u_xlat8.x = (u_xlatb8) ? u_xlat16_7.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(1.0<_ColorType);
#else
    u_xlatb16 = 1.0<_ColorType;
#endif
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : u_xlat8.x;
    u_xlat8.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat16_8.xyz = texture(_MaskTex, u_xlat8.xy).xyz;
    u_xlat16_7.x = dot(u_xlat16_8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat8.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = _ColorPower + -1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat0.x>=_ColorrOffset);
#else
    u_xlatb8 = u_xlat0.x>=_ColorrOffset;
#endif
    u_xlat16.x = (-u_xlat0.x) + 1.0;
    u_xlat24 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat24 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat8.x = (u_xlatb8) ? u_xlat16.x : u_xlat1.x;
    u_xlat16.x = u_xlat1.x / u_xlat24;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlat24 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat9.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.x = u_xlat8.x * u_xlat24 + (-u_xlat9.x);
    u_xlat8.x = u_xlat1.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat0.z = u_xlat16.x * 0.5 + (-u_xlat9.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xz = min(max(u_xlat0.xz, 0.0), 1.0);
#else
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
#endif
    u_xlat24 = u_xlat0.z * -2.0 + 3.0;
    u_xlat16.x = u_xlat0.z * u_xlat0.z;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat8.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _Nolse;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat8.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat8.xy;
    u_xlat16.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat16.xy = u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat1.xy = u_xlat16.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat16.xy;
    u_xlat17.xy = (-u_xlat16.xy) + u_xlat0.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat16.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
    u_xlatb16 = u_xlat0.y<u_xlat0.x;
    u_xlat3 = (bool(u_xlatb16)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat9.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat9.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat16.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat16.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat8.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat8.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8 = _ColorType==1.0;
    u_xlat8.x = (u_xlatb8) ? u_xlat16_7.x : u_xlat10_2.w;
    u_xlatb16 = 1.0<_ColorType;
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : u_xlat8.x;
    u_xlat8.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat10_8.xyz = texture2D(_MaskTex, u_xlat8.xy).xyz;
    u_xlat16_7.x = dot(u_xlat10_8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat8.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = _ColorPower + -1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat8.x;
    u_xlatb8 = u_xlat0.x>=_ColorrOffset;
    u_xlat16.x = (-u_xlat0.x) + 1.0;
    u_xlat24 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat24 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat8.x = (u_xlatb8) ? u_xlat16.x : u_xlat1.x;
    u_xlat16.x = u_xlat1.x / u_xlat24;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlat24 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat9.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.x = u_xlat8.x * u_xlat24 + (-u_xlat9.x);
    u_xlat8.x = u_xlat1.x * u_xlat8.x;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat24 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat0.z = u_xlat16.x * 0.5 + (-u_xlat9.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
    u_xlat24 = u_xlat0.z * -2.0 + 3.0;
    u_xlat16.x = u_xlat0.z * u_xlat0.z;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat8.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _Nolse;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec2 u_xlat16_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat8.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat8.xy;
    u_xlat16.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat16.xy = u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = floor(u_xlat16.xy);
    u_xlat1.xy = u_xlat16.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat16.xy;
    u_xlat17.xy = (-u_xlat16.xy) + u_xlat0.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat16.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat17.xy;
    u_xlatb16 = u_xlat0.y<u_xlat0.x;
    u_xlat3 = (bool(u_xlatb16)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat9.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat9.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat9.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat9.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat16.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat16.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat8.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat8.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8 = _ColorType==1.0;
    u_xlat8.x = (u_xlatb8) ? u_xlat16_7.x : u_xlat10_2.w;
    u_xlatb16 = 1.0<_ColorType;
    u_xlat0.x = (u_xlatb16) ? u_xlat0.x : u_xlat8.x;
    u_xlat8.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat8.x = u_xlat8.x * 6.28318501;
    u_xlat1.x = sin(u_xlat8.x);
    u_xlat2.x = cos(u_xlat8.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat8.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat8.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat8.xy, u_xlat3.yz);
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat8.xy;
    u_xlat10_8.xyz = texture2D(_MaskTex, u_xlat8.xy).xyz;
    u_xlat16_7.x = dot(u_xlat10_8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat8.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = _ColorPower + -1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat8.x;
    u_xlatb8 = u_xlat0.x>=_ColorrOffset;
    u_xlat16.x = (-u_xlat0.x) + 1.0;
    u_xlat24 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat24 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat8.x = (u_xlatb8) ? u_xlat16.x : u_xlat1.x;
    u_xlat16.x = u_xlat1.x / u_xlat24;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x * 0.5;
    u_xlat24 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat9.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat9.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.x = u_xlat8.x * u_xlat24 + (-u_xlat9.x);
    u_xlat8.x = u_xlat1.x * u_xlat8.x;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat24 = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat0.z = u_xlat16.x * 0.5 + (-u_xlat9.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
    u_xlat24 = u_xlat0.z * -2.0 + 3.0;
    u_xlat16.x = u_xlat0.z * u_xlat0.z;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat8.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Nolse;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat9.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat9.xy;
    u_xlat18.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat18.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat1.xy = u_xlat18.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat18.xy;
    u_xlat19.xy = (-u_xlat18.xy) + u_xlat0.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat18.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<u_xlat0.x);
#else
    u_xlatb18 = u_xlat0.y<u_xlat0.x;
#endif
    u_xlat3 = (bool(u_xlatb18)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat10.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat10.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat10.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat18.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat18.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat9.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat9.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_ColorType==1.0);
#else
    u_xlatb9 = _ColorType==1.0;
#endif
    u_xlat9.x = (u_xlatb9) ? u_xlat16_7.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(1.0<_ColorType);
#else
    u_xlatb18 = 1.0<_ColorType;
#endif
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat9.x;
    u_xlat9.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat16_9.xyz = texture(_MaskTex, u_xlat9.xy).xyz;
    u_xlat16_7.x = dot(u_xlat16_9.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = _ColorPower + -1.0;
    u_xlat9.x = u_xlat9.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.x>=_ColorrOffset);
#else
    u_xlatb9 = u_xlat0.x>=_ColorrOffset;
#endif
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat27 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat27 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat9.x = (u_xlatb9) ? u_xlat18.x : u_xlat1.x;
    u_xlat18.x = u_xlat1.x / u_xlat27;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat27 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat10.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat10.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9.x = u_xlat9.x * u_xlat27 + (-u_xlat10.x);
    u_xlat9.x = u_xlat1.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat27;
    u_xlat0.z = u_xlat18.x * 0.5 + (-u_xlat10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat10.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xz = min(max(u_xlat0.xz, 0.0), 1.0);
#else
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat0.z * -2.0 + 3.0;
    u_xlat18.x = u_xlat0.z * u_xlat0.z;
    u_xlat18.x = u_xlat18.x * u_xlat27;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat9.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_16.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorPower2) + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_16.xxxx * u_xlat0.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb10 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = u_xlat10.xxxx * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat10.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat9.x = u_xlat9.x / u_xlat10.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.z;
    u_xlat16_16.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb9 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat9.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat10.x;
    u_xlat16_16.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_16.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat16_16.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_8.xzw;
    u_xlat16_34 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_34 = u_xlat16_8.y * u_xlat16_34;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_34 * -2.0 + 3.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Nolse;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat9.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat9.xy;
    u_xlat18.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat18.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat1.xy = u_xlat18.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat18.xy;
    u_xlat19.xy = (-u_xlat18.xy) + u_xlat0.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat18.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<u_xlat0.x);
#else
    u_xlatb18 = u_xlat0.y<u_xlat0.x;
#endif
    u_xlat3 = (bool(u_xlatb18)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat10.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat10.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat10.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat18.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat18.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat9.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat9.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_ColorType==1.0);
#else
    u_xlatb9 = _ColorType==1.0;
#endif
    u_xlat9.x = (u_xlatb9) ? u_xlat16_7.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(1.0<_ColorType);
#else
    u_xlatb18 = 1.0<_ColorType;
#endif
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat9.x;
    u_xlat9.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat16_9.xyz = texture(_MaskTex, u_xlat9.xy).xyz;
    u_xlat16_7.x = dot(u_xlat16_9.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = _ColorPower + -1.0;
    u_xlat9.x = u_xlat9.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.x>=_ColorrOffset);
#else
    u_xlatb9 = u_xlat0.x>=_ColorrOffset;
#endif
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat27 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat27 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat9.x = (u_xlatb9) ? u_xlat18.x : u_xlat1.x;
    u_xlat18.x = u_xlat1.x / u_xlat27;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat27 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat10.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat10.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9.x = u_xlat9.x * u_xlat27 + (-u_xlat10.x);
    u_xlat9.x = u_xlat1.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat27;
    u_xlat0.z = u_xlat18.x * 0.5 + (-u_xlat10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat10.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xz = min(max(u_xlat0.xz, 0.0), 1.0);
#else
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat0.z * -2.0 + 3.0;
    u_xlat18.x = u_xlat0.z * u_xlat0.z;
    u_xlat18.x = u_xlat18.x * u_xlat27;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat9.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_16.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorPower2) + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_16.xxxx * u_xlat0.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb10 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = u_xlat10.xxxx * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat10.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat9.x = u_xlat9.x / u_xlat10.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.z;
    u_xlat16_16.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb9 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat9.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat10.x;
    u_xlat16_16.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_16.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat16_16.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_8.xzw;
    u_xlat16_34 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_34 = u_xlat16_8.y * u_xlat16_34;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34 = min(max(u_xlat16_34, 0.0), 1.0);
#else
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_34 * -2.0 + 3.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _Nolse;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
bool u_xlatb9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat9.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat9.xy;
    u_xlat18.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat18.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat1.xy = u_xlat18.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat18.xy;
    u_xlat19.xy = (-u_xlat18.xy) + u_xlat0.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat18.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat19.xy;
    u_xlatb18 = u_xlat0.y<u_xlat0.x;
    u_xlat3 = (bool(u_xlatb18)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat10.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat10.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat10.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat18.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat18.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat9.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat9.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb9 = _ColorType==1.0;
    u_xlat9.x = (u_xlatb9) ? u_xlat16_7.x : u_xlat10_2.w;
    u_xlatb18 = 1.0<_ColorType;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat9.x;
    u_xlat9.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat10_9.xyz = texture2D(_MaskTex, u_xlat9.xy).xyz;
    u_xlat16_7.x = dot(u_xlat10_9.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = _ColorPower + -1.0;
    u_xlat9.x = u_xlat9.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat9.x;
    u_xlatb9 = u_xlat0.x>=_ColorrOffset;
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat27 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat27 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat9.x = (u_xlatb9) ? u_xlat18.x : u_xlat1.x;
    u_xlat18.x = u_xlat1.x / u_xlat27;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat27 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat10.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat10.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9.x = u_xlat9.x * u_xlat27 + (-u_xlat10.x);
    u_xlat9.x = u_xlat1.x * u_xlat9.x;
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat27;
    u_xlat0.z = u_xlat18.x * 0.5 + (-u_xlat10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat10.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
    u_xlat27 = u_xlat0.z * -2.0 + 3.0;
    u_xlat18.x = u_xlat0.z * u_xlat0.z;
    u_xlat18.x = u_xlat18.x * u_xlat27;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat9.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_16.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorPower2) + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_16.xxxx * u_xlat0.xywz + u_xlat2.xywz;
    u_xlatb10 = u_xlat1.x>=u_xlat0.x;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = u_xlat10.xxxx * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat10.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat9.x = u_xlat9.x / u_xlat10.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.z;
    u_xlat16_16.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
    u_xlatb9 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlat16_25.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat9.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat10.x;
    u_xlat16_16.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_16.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat16_16.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_8.xzw;
    u_xlat16_34 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_34 = u_xlat16_8.y * u_xlat16_34;
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_34 * -2.0 + 3.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	vec4 _BGColor;
uniform 	vec4 _OutColor;
uniform 	vec4 _InnerColor;
uniform 	float _ColorSoft;
uniform 	vec4 _Mask_VxVyRoaRov;
uniform 	vec4 _MaskTex_ST;
uniform 	float _ColorPower;
uniform 	float _ColorType;
uniform 	vec4 _Main_VxVyRoaRov;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _Noise_VxVyRoaRov;
uniform 	vec4 _Nolse_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _ColorrOffset;
uniform 	vec4 _MidColor;
uniform 	float _MidColorPower;
uniform 	float _AlphaRange;
uniform 	vec4 _DiffuseColor;
uniform 	float _ColorPower2;
uniform 	float _Alpha;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _Nolse;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
bool u_xlatb9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _Time.y * _Noise_VxVyRoaRov.w + _Noise_VxVyRoaRov.z;
    u_xlat0.x = u_xlat0.x * 6.28318501;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Nolse_ST.xy + _Nolse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat2.yz);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Time.yy * _Noise_VxVyRoaRov.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Nolse, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat9.x = _Time.y * _Main_VxVyRoaRov.w + _Main_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Main_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat0.xy = u_xlat0.xx * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat9.xy;
    u_xlat18.x = dot(u_xlat0.xy, vec2(0.366025418, 0.366025418));
    u_xlat18.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat18.xy = floor(u_xlat18.xy);
    u_xlat1.xy = u_xlat18.xy * vec2(0.00346020772, 0.00346020772);
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = (-u_xlat1.xy) * vec2(289.0, 289.0) + u_xlat18.xy;
    u_xlat19.xy = (-u_xlat18.xy) + u_xlat0.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat18.xy, vec2(0.211324871, 0.211324871));
    u_xlat0.xy = u_xlat0.xx + u_xlat19.xy;
    u_xlatb18 = u_xlat0.y<u_xlat0.x;
    u_xlat3 = (bool(u_xlatb18)) ? vec4(1.0, 0.0, -1.0, -0.0) : vec4(0.0, 1.0, -0.0, -1.0);
    u_xlat4.y = u_xlat3.y;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat10.xyz = u_xlat1.yyy + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat10.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat10.xyz;
    u_xlat1.xyz = u_xlat1.xxx + u_xlat10.xyz;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = float(0.0);
    u_xlat4.z = float(1.0);
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(34.0, 34.0, 34.0) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.00346020772, 0.00346020772, 0.00346020772);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat1.xyz = (-u_xlat4.xyz) * vec3(289.0, 289.0, 289.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.024390243, 0.024390243, 0.024390243);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat4.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.xyz = u_xlat1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = floor(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat1.xyz + (-u_xlat4.xyz);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-0.5, -0.5, -0.5);
    u_xlat18.x = u_xlat0.y * u_xlat1.x;
    u_xlat5.x = u_xlat4.x * u_xlat0.x + u_xlat18.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0 = u_xlat0.xyxy + vec4(0.211324871, 0.211324871, -0.577350259, -0.577350259);
    u_xlat6.z = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.xy = u_xlat3.zw + u_xlat0.xy;
    u_xlat6.y = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat3.xyz = (-u_xlat6.xyz) + vec3(0.5, 0.5, 0.5);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz;
    u_xlat6.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat9.xz = u_xlat0.yw * u_xlat1.yz;
    u_xlat5.yz = u_xlat4.yz * u_xlat0.xz + u_xlat9.xz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(0.853734732, 0.853734732, 0.853734732) + vec3(1.79284286, 1.79284286, 1.79284286);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = u_xlat0.x * 65.0 + 0.5;
    u_xlat16_7.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb9 = _ColorType==1.0;
    u_xlat9.x = (u_xlatb9) ? u_xlat16_7.x : u_xlat10_2.w;
    u_xlatb18 = 1.0<_ColorType;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat9.x;
    u_xlat9.x = _Time.y * _Mask_VxVyRoaRov.w + _Mask_VxVyRoaRov.z;
    u_xlat9.x = u_xlat9.x * 6.28318501;
    u_xlat1.x = sin(u_xlat9.x);
    u_xlat2.x = cos(u_xlat9.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat9.xy, u_xlat3.yz);
    u_xlat9.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Time.yy * _Mask_VxVyRoaRov.xy + u_xlat9.xy;
    u_xlat10_9.xyz = texture2D(_MaskTex, u_xlat9.xy).xyz;
    u_xlat16_7.x = dot(u_xlat10_9.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat9.x = u_xlat16_7.x * _ColorPower;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = _ColorPower + -1.0;
    u_xlat9.x = u_xlat9.x * u_xlat16_7.x;
    u_xlat0.x = u_xlat0.x * _ColorPower + u_xlat9.x;
    u_xlatb9 = u_xlat0.x>=_ColorrOffset;
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat27 = (-_ColorrOffset) + 1.0;
    u_xlat1.x = u_xlat27 / _ColorrOffset;
    u_xlat1.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_AlphaRange, _AlphaRange)));
    u_xlat9.x = (u_xlatb9) ? u_xlat18.x : u_xlat1.x;
    u_xlat18.x = u_xlat1.x / u_xlat27;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat27 = _MidColorPower + 1.0;
    u_xlat1.x = _ColorSoft * 0.5 + 0.5;
    u_xlat10.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat10.x) + u_xlat1.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat9.x = u_xlat9.x * u_xlat27 + (-u_xlat10.x);
    u_xlat9.x = u_xlat1.x * u_xlat9.x;
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat27 = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat9.x * u_xlat27;
    u_xlat0.z = u_xlat18.x * 0.5 + (-u_xlat10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat10.x);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.xz = clamp(u_xlat0.xz, 0.0, 1.0);
    u_xlat27 = u_xlat0.z * -2.0 + 3.0;
    u_xlat18.x = u_xlat0.z * u_xlat0.z;
    u_xlat18.x = u_xlat18.x * u_xlat27;
    u_xlat1 = (-_OutColor) + _InnerColor;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + _OutColor;
    u_xlat2 = (-u_xlat1) + _MidColor;
    u_xlat1 = u_xlat9.xxxx * u_xlat2 + u_xlat1;
    u_xlat1 = u_xlat1 + (-_BGColor);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _BGColor;
    u_xlat1 = u_xlat0 * vs_COLOR0;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1 = u_xlat0 * vec4(_ColorPower2, _ColorPower2, _ColorPower2, _Alpha);
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_16.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorPower2) + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_16.xxxx * u_xlat0.xywz + u_xlat2.xywz;
    u_xlatb10 = u_xlat1.x>=u_xlat0.x;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = u_xlat10.xxxx * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat10.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat9.x = u_xlat9.x / u_xlat10.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.z;
    u_xlat16_16.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
    u_xlatb9 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlat16_25.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat9.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat10.x;
    u_xlat16_16.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_16.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat16_16.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_7.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz * u_xlat16_8.xzw;
    u_xlat16_34 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_34 = u_xlat16_8.y * u_xlat16_34;
    u_xlat16_34 = clamp(u_xlat16_34, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_34 * -2.0 + 3.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_7.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_7.x;
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
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.VX_ColorToneGUI"
}