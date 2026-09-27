//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect_VX/VX_UVPolar" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_ZWrite ("深度写入", Float) = 0.0

_BlendSrc ("BlendSrc_混合源颜色系数", Float) = 5.0

_BlendDst ("BlendDst_混合目标色系数", Float) = 10.0

[Toggle] _Polar ("开启UV极坐标", Float) = 1.0

_RadialScale ("极坐标X缩放", Range(0, 64)) = 1.0

_RadialScale1 ("极坐标Y缩放", Range(0, 64)) = 1.0

_Diffuse ("主帖图", 2D) = "white" { }

_DiffuseColor ("主颜色", Color) = (1,1,1,1)

_ColorPower ("颜色强度", Float) = 1.0

_Alpha_Intensity ("Alpha强度", Float) = 1.0

_MainTexRotator ("主贴图旋转角度", Range(0, 360)) = 0.0

[Toggle] _RepeatX ("X轴向重复平铺", Float) = 1.0

[Toggle] _RepeatY ("Y轴向重复平铺", Float) = 0.0

_XYVxVy ("UV变化后的位移XY速度ZW", Vector) = (0,0,0,0)

[Toggle] _PolarNoise ("开启扰动跟随主图UV极坐标", Float) = 0.0

_NoiseTex ("扰动贴图", 2D) = "white" { }

_NoisePower ("扰动强度", Range(-2, 2)) = 0.0

_NoiseOffset ("扰动缩放与偏移校正", Range(0, 1)) = 0.0

_NoiseCenterNoiseSpeed ("扰动中心位置XY_扰动图速度ZW", Vector) = (0.5,0.5,0,0)

_NoiseScaleAndOffset ("扰动图UV极坐标后的缩放与偏移", Vector) = (1,1,0,0)

[Toggle] _PolarMask ("开启遮罩跟随主图UV极坐标", Float) = 0.0

_Mask ("遮罩贴图(可染色)", 2D) = "white" { }

_MaskSpeedX ("遮罩图X轴速度", Range(-10, 10)) = 0.0

_maskSpeedY ("遮罩图Y轴速度", Range(-10, 10)) = 0.0

_MaskRotator ("遮罩图旋转角度", Range(0, 360)) = 0.0

_MaskScaleAndOffset ("遮罩图UV极坐标后的缩放和偏移", Vector) = (1,1,0,0)

_HSV_Vector ("_HSV_Vector", Vector) = (0,1,1,0)

_BrightColor ("灰度亮部渐变色", Color) = (1,1,1,1)

_DarkColor ("灰度暗部渐变色", Color) = (1,1,1,1)

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_SaturateWeights ("SaturateWeights", Vector) = (1,0,0,1)

_Stencil_Ref ("StencilRef", Float) = 0.0

_Stencil_Comp ("Stencil_Comp", Float) = 8.0

_PanelRect ("PanelRect", Vector) = (0,0,1,1)

_PanelClipInfo ("PanelClipInfo", Vector) = (1,1,1,1)

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
  GpuProgramID 36906
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
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat12.y)<abs(u_xlat12.x));
#else
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
#endif
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat12.y<(-u_xlat12.y));
#else
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlat12.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat12.xy = u_xlat12.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat12.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat12.xy, u_xlat3.xy);
    u_xlat12.xy = u_xlat1.xy + vec2(0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_PolarNoise==1.0);
#else
    u_xlatb1 = _PolarNoise==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat12.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat6.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat6.xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat12.xy;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat12.y)<abs(u_xlat12.x));
#else
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
#endif
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat12.y<(-u_xlat12.y));
#else
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Polar==1.0);
#else
    u_xlatb12 = _Polar==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat12.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = 0.0;
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat13.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat19 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = u_xlat13.x * u_xlat19;
    u_xlat19 = u_xlat13.x * u_xlat13.x;
    u_xlat2.x = u_xlat19 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat19 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat19 * u_xlat2.x + -0.330299497;
    u_xlat19 = u_xlat19 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat19 * u_xlat13.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb8 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat2.x = u_xlatb8 ? u_xlat2.x : float(0.0);
    u_xlat13.x = u_xlat13.x * u_xlat19 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb19 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat19 = u_xlatb19 ? -3.14159274 : float(0.0);
    u_xlat13.x = u_xlat19 + u_xlat13.x;
    u_xlat19 = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat19<(-u_xlat19));
#else
    u_xlatb19 = u_xlat19<(-u_xlat19);
#endif
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat13.x = (u_xlatb19) ? (-u_xlat13.x) : u_xlat13.x;
    u_xlat13.x = u_xlat13.x * _RadialScale;
    u_xlat1.y = u_xlat13.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_PolarMask==1.0);
#else
    u_xlatb13 = _PolarMask==1.0;
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb13)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat13.x = u_xlat13.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat13.x);
    u_xlat3.x = cos(u_xlat13.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat13.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat13.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    u_xlat0 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_5.x;
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
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat12.y)<abs(u_xlat12.x));
#else
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
#endif
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat12.y<(-u_xlat12.y));
#else
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlat12.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat12.xy = u_xlat12.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat12.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat12.xy, u_xlat3.xy);
    u_xlat12.xy = u_xlat1.xy + vec2(0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_PolarNoise==1.0);
#else
    u_xlatb1 = _PolarNoise==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat12.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat6.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat6.xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat12.xy;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat12.y)<abs(u_xlat12.x));
#else
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
#endif
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat12.y<(-u_xlat12.y));
#else
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Polar==1.0);
#else
    u_xlatb12 = _Polar==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat12.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = 0.0;
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat13.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat19 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = u_xlat13.x * u_xlat19;
    u_xlat19 = u_xlat13.x * u_xlat13.x;
    u_xlat2.x = u_xlat19 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat19 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat19 * u_xlat2.x + -0.330299497;
    u_xlat19 = u_xlat19 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat19 * u_xlat13.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb8 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat2.x = u_xlatb8 ? u_xlat2.x : float(0.0);
    u_xlat13.x = u_xlat13.x * u_xlat19 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb19 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat19 = u_xlatb19 ? -3.14159274 : float(0.0);
    u_xlat13.x = u_xlat19 + u_xlat13.x;
    u_xlat19 = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat19<(-u_xlat19));
#else
    u_xlatb19 = u_xlat19<(-u_xlat19);
#endif
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat13.x = (u_xlatb19) ? (-u_xlat13.x) : u_xlat13.x;
    u_xlat13.x = u_xlat13.x * _RadialScale;
    u_xlat1.y = u_xlat13.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_PolarMask==1.0);
#else
    u_xlatb13 = _PolarMask==1.0;
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb13)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat13.x = u_xlat13.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat13.x);
    u_xlat3.x = cos(u_xlat13.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat13.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat13.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    u_xlat0 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_5.x;
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
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlat12.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat12.xy = u_xlat12.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat12.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat12.xy, u_xlat3.xy);
    u_xlat12.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlatb1 = _PolarNoise==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat12.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat6.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat6.xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat12.xy;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlatb12 = _Polar==1.0;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat12.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = 0.0;
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat13.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat19 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = u_xlat13.x * u_xlat19;
    u_xlat19 = u_xlat13.x * u_xlat13.x;
    u_xlat2.x = u_xlat19 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat19 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat19 * u_xlat2.x + -0.330299497;
    u_xlat19 = u_xlat19 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat19 * u_xlat13.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat2.x = u_xlatb8 ? u_xlat2.x : float(0.0);
    u_xlat13.x = u_xlat13.x * u_xlat19 + u_xlat2.x;
    u_xlatb19 = u_xlat1.y<(-u_xlat1.y);
    u_xlat19 = u_xlatb19 ? -3.14159274 : float(0.0);
    u_xlat13.x = u_xlat19 + u_xlat13.x;
    u_xlat19 = min(u_xlat1.y, u_xlat1.x);
    u_xlatb19 = u_xlat19<(-u_xlat19);
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat13.x = (u_xlatb19) ? (-u_xlat13.x) : u_xlat13.x;
    u_xlat13.x = u_xlat13.x * _RadialScale;
    u_xlat1.y = u_xlat13.x * 0.159154937;
    u_xlatb13 = _PolarMask==1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb13)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat13.x = u_xlat13.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat13.x);
    u_xlat3.x = cos(u_xlat13.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat13.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat13.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_5.x;
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
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlat12.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat12.xy = u_xlat12.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat12.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat12.xy, u_xlat3.xy);
    u_xlat12.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlatb1 = _PolarNoise==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat12.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat6.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat6.xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat12.xy;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlatb12 = _Polar==1.0;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat12.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = 0.0;
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat13.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat19 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = u_xlat13.x * u_xlat19;
    u_xlat19 = u_xlat13.x * u_xlat13.x;
    u_xlat2.x = u_xlat19 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat19 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat19 * u_xlat2.x + -0.330299497;
    u_xlat19 = u_xlat19 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat19 * u_xlat13.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat2.x = u_xlatb8 ? u_xlat2.x : float(0.0);
    u_xlat13.x = u_xlat13.x * u_xlat19 + u_xlat2.x;
    u_xlatb19 = u_xlat1.y<(-u_xlat1.y);
    u_xlat19 = u_xlatb19 ? -3.14159274 : float(0.0);
    u_xlat13.x = u_xlat19 + u_xlat13.x;
    u_xlat19 = min(u_xlat1.y, u_xlat1.x);
    u_xlatb19 = u_xlat19<(-u_xlat19);
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat13.x = (u_xlatb19) ? (-u_xlat13.x) : u_xlat13.x;
    u_xlat13.x = u_xlat13.x * _RadialScale;
    u_xlat1.y = u_xlat13.x * 0.159154937;
    u_xlatb13 = _PolarMask==1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb13)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat13.x = u_xlat13.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat13.x);
    u_xlat3.x = cos(u_xlat13.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat13.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat13.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_5.x;
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
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
bool u_xlatb9;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_18;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat14.y)<abs(u_xlat14.x));
#else
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
#endif
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat14.y<(-u_xlat14.y));
#else
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
    u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlat14.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat14.xy = u_xlat14.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat14.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat14.xy, u_xlat3.xy);
    u_xlat14.xy = u_xlat1.xy + vec2(0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_PolarNoise==1.0);
#else
    u_xlatb1 = _PolarNoise==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat14.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat7.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat7.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat14.xy;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat14.y)<abs(u_xlat14.x));
#else
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
#endif
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat14.y<(-u_xlat14.y));
#else
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
    u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(_Polar==1.0);
#else
    u_xlatb14 = _Polar==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb14)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat14.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat1 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_4.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat15.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat22 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = u_xlat15.x * u_xlat22;
    u_xlat22 = u_xlat15.x * u_xlat15.x;
    u_xlat2.x = u_xlat22 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat22 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat22 * u_xlat2.x + -0.330299497;
    u_xlat22 = u_xlat22 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat22 * u_xlat15.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb9 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat2.x = u_xlatb9 ? u_xlat2.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat22 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb22 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat22 = u_xlatb22 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat22 + u_xlat15.x;
    u_xlat22 = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22<(-u_xlat22));
#else
    u_xlatb22 = u_xlat22<(-u_xlat22);
#endif
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat15.x = (u_xlatb22) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _RadialScale;
    u_xlat1.y = u_xlat15.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_PolarMask==1.0);
#else
    u_xlatb15 = _PolarMask==1.0;
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb15)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat15.x = u_xlat15.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat5.z = u_xlat2.x;
    u_xlat5.y = u_xlat3.x;
    u_xlat5.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat15.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat15.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    u_xlat1 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_11.xxxx * u_xlat0.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb8 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat8) * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat16_11.x = abs(u_xlat7.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_11.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_18.x>=(-u_xlat16_18.x));
#else
    u_xlatb7 = u_xlat16_18.x>=(-u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_11.x = u_xlat16_18.y * u_xlat16_11.x;
    u_xlat16_11.x = fract(u_xlat16_11.x);
    u_xlat7.xyz = u_xlat16_18.xxx * u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat16_11.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat7.xyz = u_xlat16_11.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_11.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_6.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_6.xy = vec2(1.0, 1.0) / u_xlat16_6.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_6.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_6.xzw = u_xlat16_4.xxx * u_xlat16_6.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * u_xlat16_6.xzw;
    u_xlat16_25 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_25 = u_xlat16_6.y * u_xlat16_25;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_25) * u_xlat16_6.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_4.x;
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
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
bool u_xlatb9;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_18;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat14.y)<abs(u_xlat14.x));
#else
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
#endif
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat14.y<(-u_xlat14.y));
#else
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
    u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlat14.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat14.xy = u_xlat14.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat14.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat14.xy, u_xlat3.xy);
    u_xlat14.xy = u_xlat1.xy + vec2(0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_PolarNoise==1.0);
#else
    u_xlatb1 = _PolarNoise==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat14.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat7.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat7.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat14.xy;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat14.y)<abs(u_xlat14.x));
#else
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
#endif
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat14.y<(-u_xlat14.y));
#else
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
    u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(_Polar==1.0);
#else
    u_xlatb14 = _Polar==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb14)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat14.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat1 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_4.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat15.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat22 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = u_xlat15.x * u_xlat22;
    u_xlat22 = u_xlat15.x * u_xlat15.x;
    u_xlat2.x = u_xlat22 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat22 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat22 * u_xlat2.x + -0.330299497;
    u_xlat22 = u_xlat22 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat22 * u_xlat15.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb9 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat2.x = u_xlatb9 ? u_xlat2.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat22 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb22 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat22 = u_xlatb22 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat22 + u_xlat15.x;
    u_xlat22 = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22<(-u_xlat22));
#else
    u_xlatb22 = u_xlat22<(-u_xlat22);
#endif
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat15.x = (u_xlatb22) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _RadialScale;
    u_xlat1.y = u_xlat15.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_PolarMask==1.0);
#else
    u_xlatb15 = _PolarMask==1.0;
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb15)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat15.x = u_xlat15.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat5.z = u_xlat2.x;
    u_xlat5.y = u_xlat3.x;
    u_xlat5.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat15.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat15.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    u_xlat1 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_11.xxxx * u_xlat0.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb8 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat8) * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat16_11.x = abs(u_xlat7.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_11.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_18.x>=(-u_xlat16_18.x));
#else
    u_xlatb7 = u_xlat16_18.x>=(-u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_11.x = u_xlat16_18.y * u_xlat16_11.x;
    u_xlat16_11.x = fract(u_xlat16_11.x);
    u_xlat7.xyz = u_xlat16_18.xxx * u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat16_11.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat7.xyz = u_xlat16_11.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_11.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_6.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_6.xy = vec2(1.0, 1.0) / u_xlat16_6.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_6.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_6.xzw = u_xlat16_4.xxx * u_xlat16_6.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * u_xlat16_6.xzw;
    u_xlat16_25 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_25 = u_xlat16_6.y * u_xlat16_25;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_25) * u_xlat16_6.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_4.x;
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
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
bool u_xlatb9;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_18;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
    u_xlatb8 = u_xlat8<(-u_xlat8);
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlat14.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat14.xy = u_xlat14.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat14.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat14.xy, u_xlat3.xy);
    u_xlat14.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlatb1 = _PolarNoise==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat14.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat7.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat7.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat14.xy;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
    u_xlatb8 = u_xlat8<(-u_xlat8);
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlatb14 = _Polar==1.0;
    u_xlat0.xy = (bool(u_xlatb14)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat14.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_4.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat15.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat22 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = u_xlat15.x * u_xlat22;
    u_xlat22 = u_xlat15.x * u_xlat15.x;
    u_xlat2.x = u_xlat22 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat22 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat22 * u_xlat2.x + -0.330299497;
    u_xlat22 = u_xlat22 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat22 * u_xlat15.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat2.x = u_xlatb9 ? u_xlat2.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat22 + u_xlat2.x;
    u_xlatb22 = u_xlat1.y<(-u_xlat1.y);
    u_xlat22 = u_xlatb22 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat22 + u_xlat15.x;
    u_xlat22 = min(u_xlat1.y, u_xlat1.x);
    u_xlatb22 = u_xlat22<(-u_xlat22);
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat15.x = (u_xlatb22) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _RadialScale;
    u_xlat1.y = u_xlat15.x * 0.159154937;
    u_xlatb15 = _PolarMask==1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb15)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat15.x = u_xlat15.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat5.z = u_xlat2.x;
    u_xlat5.y = u_xlat3.x;
    u_xlat5.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat15.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat15.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat1 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_11.xxxx * u_xlat0.xywz + u_xlat2.xywz;
    u_xlatb8 = u_xlat1.x>=u_xlat0.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat8) * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat16_11.x = abs(u_xlat7.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_11.x * 360.0;
    u_xlatb7 = u_xlat16_18.x>=(-u_xlat16_18.x);
    u_xlat16_18.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_11.x = u_xlat16_18.y * u_xlat16_11.x;
    u_xlat16_11.x = fract(u_xlat16_11.x);
    u_xlat7.xyz = u_xlat16_18.xxx * u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat16_11.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat7.xyz = u_xlat16_11.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_11.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_6.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_6.xy = vec2(1.0, 1.0) / u_xlat16_6.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_6.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_6.xzw = u_xlat16_4.xxx * u_xlat16_6.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * u_xlat16_6.xzw;
    u_xlat16_25 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_25 = u_xlat16_6.y * u_xlat16_25;
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_25) * u_xlat16_6.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_4.x;
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
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
bool u_xlatb9;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_18;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
    u_xlatb8 = u_xlat8<(-u_xlat8);
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlat14.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat14.xy = u_xlat14.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat14.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat14.xy, u_xlat3.xy);
    u_xlat14.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlatb1 = _PolarNoise==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat14.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat7.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat7.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat14.xy;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
    u_xlatb8 = u_xlat8<(-u_xlat8);
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlatb14 = _Polar==1.0;
    u_xlat0.xy = (bool(u_xlatb14)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat14.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_4.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat15.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat22 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = u_xlat15.x * u_xlat22;
    u_xlat22 = u_xlat15.x * u_xlat15.x;
    u_xlat2.x = u_xlat22 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat22 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat22 * u_xlat2.x + -0.330299497;
    u_xlat22 = u_xlat22 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat22 * u_xlat15.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat2.x = u_xlatb9 ? u_xlat2.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat22 + u_xlat2.x;
    u_xlatb22 = u_xlat1.y<(-u_xlat1.y);
    u_xlat22 = u_xlatb22 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat22 + u_xlat15.x;
    u_xlat22 = min(u_xlat1.y, u_xlat1.x);
    u_xlatb22 = u_xlat22<(-u_xlat22);
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat15.x = (u_xlatb22) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _RadialScale;
    u_xlat1.y = u_xlat15.x * 0.159154937;
    u_xlatb15 = _PolarMask==1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb15)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat15.x = u_xlat15.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat5.z = u_xlat2.x;
    u_xlat5.y = u_xlat3.x;
    u_xlat5.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat15.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat15.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat1 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_11.xxxx * u_xlat0.xywz + u_xlat2.xywz;
    u_xlatb8 = u_xlat1.x>=u_xlat0.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat8) * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat16_11.x = abs(u_xlat7.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_11.x * 360.0;
    u_xlatb7 = u_xlat16_18.x>=(-u_xlat16_18.x);
    u_xlat16_18.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_11.x = u_xlat16_18.y * u_xlat16_11.x;
    u_xlat16_11.x = fract(u_xlat16_11.x);
    u_xlat7.xyz = u_xlat16_18.xxx * u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat16_11.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat7.xyz = u_xlat16_11.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_11.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_6.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_6.xy = vec2(1.0, 1.0) / u_xlat16_6.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_6.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_6.xzw = u_xlat16_4.xxx * u_xlat16_6.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * u_xlat16_6.xzw;
    u_xlat16_25 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_25 = u_xlat16_6.y * u_xlat16_25;
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_25) * u_xlat16_6.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_4.x;
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
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat12.y)<abs(u_xlat12.x));
#else
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
#endif
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat12.y<(-u_xlat12.y));
#else
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlat12.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat12.xy = u_xlat12.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat12.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat12.xy, u_xlat3.xy);
    u_xlat12.xy = u_xlat1.xy + vec2(0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_PolarNoise==1.0);
#else
    u_xlatb1 = _PolarNoise==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat12.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat6.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat6.xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat12.xy;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat12.y)<abs(u_xlat12.x));
#else
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
#endif
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat12.y<(-u_xlat12.y));
#else
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Polar==1.0);
#else
    u_xlatb12 = _Polar==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat12.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = 0.0;
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat13.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat19 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = u_xlat13.x * u_xlat19;
    u_xlat19 = u_xlat13.x * u_xlat13.x;
    u_xlat2.x = u_xlat19 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat19 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat19 * u_xlat2.x + -0.330299497;
    u_xlat19 = u_xlat19 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat19 * u_xlat13.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb8 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat2.x = u_xlatb8 ? u_xlat2.x : float(0.0);
    u_xlat13.x = u_xlat13.x * u_xlat19 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb19 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat19 = u_xlatb19 ? -3.14159274 : float(0.0);
    u_xlat13.x = u_xlat19 + u_xlat13.x;
    u_xlat19 = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat19<(-u_xlat19));
#else
    u_xlatb19 = u_xlat19<(-u_xlat19);
#endif
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat13.x = (u_xlatb19) ? (-u_xlat13.x) : u_xlat13.x;
    u_xlat13.x = u_xlat13.x * _RadialScale;
    u_xlat1.y = u_xlat13.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_PolarMask==1.0);
#else
    u_xlatb13 = _PolarMask==1.0;
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb13)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat13.x = u_xlat13.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat13.x);
    u_xlat3.x = cos(u_xlat13.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat13.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat13.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    u_xlat0 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_5.x;
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
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat12.y)<abs(u_xlat12.x));
#else
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
#endif
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat12.y<(-u_xlat12.y));
#else
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlat12.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat12.xy = u_xlat12.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat12.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat12.xy, u_xlat3.xy);
    u_xlat12.xy = u_xlat1.xy + vec2(0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_PolarNoise==1.0);
#else
    u_xlatb1 = _PolarNoise==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat12.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat6.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat6.xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat12.xy;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat12.y)<abs(u_xlat12.x));
#else
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
#endif
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat12.y<(-u_xlat12.y));
#else
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Polar==1.0);
#else
    u_xlatb12 = _Polar==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat12.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = 0.0;
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat13.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat19 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = u_xlat13.x * u_xlat19;
    u_xlat19 = u_xlat13.x * u_xlat13.x;
    u_xlat2.x = u_xlat19 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat19 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat19 * u_xlat2.x + -0.330299497;
    u_xlat19 = u_xlat19 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat19 * u_xlat13.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb8 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat2.x = u_xlatb8 ? u_xlat2.x : float(0.0);
    u_xlat13.x = u_xlat13.x * u_xlat19 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb19 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat19 = u_xlatb19 ? -3.14159274 : float(0.0);
    u_xlat13.x = u_xlat19 + u_xlat13.x;
    u_xlat19 = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat19<(-u_xlat19));
#else
    u_xlatb19 = u_xlat19<(-u_xlat19);
#endif
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat13.x = (u_xlatb19) ? (-u_xlat13.x) : u_xlat13.x;
    u_xlat13.x = u_xlat13.x * _RadialScale;
    u_xlat1.y = u_xlat13.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_PolarMask==1.0);
#else
    u_xlatb13 = _PolarMask==1.0;
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb13)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat13.x = u_xlat13.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat13.x);
    u_xlat3.x = cos(u_xlat13.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat13.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat13.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    u_xlat0 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_5.x;
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
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlat12.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat12.xy = u_xlat12.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat12.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat12.xy, u_xlat3.xy);
    u_xlat12.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlatb1 = _PolarNoise==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat12.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat6.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat6.xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat12.xy;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlatb12 = _Polar==1.0;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat12.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = 0.0;
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat13.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat19 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = u_xlat13.x * u_xlat19;
    u_xlat19 = u_xlat13.x * u_xlat13.x;
    u_xlat2.x = u_xlat19 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat19 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat19 * u_xlat2.x + -0.330299497;
    u_xlat19 = u_xlat19 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat19 * u_xlat13.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat2.x = u_xlatb8 ? u_xlat2.x : float(0.0);
    u_xlat13.x = u_xlat13.x * u_xlat19 + u_xlat2.x;
    u_xlatb19 = u_xlat1.y<(-u_xlat1.y);
    u_xlat19 = u_xlatb19 ? -3.14159274 : float(0.0);
    u_xlat13.x = u_xlat19 + u_xlat13.x;
    u_xlat19 = min(u_xlat1.y, u_xlat1.x);
    u_xlatb19 = u_xlat19<(-u_xlat19);
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat13.x = (u_xlatb19) ? (-u_xlat13.x) : u_xlat13.x;
    u_xlat13.x = u_xlat13.x * _RadialScale;
    u_xlat1.y = u_xlat13.x * 0.159154937;
    u_xlatb13 = _PolarMask==1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb13)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat13.x = u_xlat13.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat13.x);
    u_xlat3.x = cos(u_xlat13.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat13.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat13.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_5.x;
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
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec2 u_xlat16_5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlat12.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat12.xy = u_xlat12.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat12.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat12.xy, u_xlat3.xy);
    u_xlat12.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlatb1 = _PolarNoise==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat12.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat6.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat6.xy;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat12.xy;
    u_xlat12.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7 = min(abs(u_xlat12.y), abs(u_xlat12.x));
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat7 = u_xlat1.x * u_xlat1.x;
    u_xlat13.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat13.x = u_xlat7 * u_xlat13.x + 0.180141002;
    u_xlat13.x = u_xlat7 * u_xlat13.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat13.x + 0.999866009;
    u_xlat13.x = u_xlat7 * u_xlat1.x;
    u_xlat13.x = u_xlat13.x * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat12.y)<abs(u_xlat12.x);
    u_xlat13.x = u_xlatb19 ? u_xlat13.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat7 + u_xlat13.x;
    u_xlatb7 = u_xlat12.y<(-u_xlat12.y);
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat1.x;
    u_xlat7 = min(u_xlat12.y, u_xlat12.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat13.x = max(u_xlat12.y, u_xlat12.x);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat12.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = dot(u_xlat12.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb12 = u_xlat13.x>=(-u_xlat13.x);
    u_xlatb12 = u_xlatb12 && u_xlatb7;
    u_xlat12.x = (u_xlatb12) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat12.x = u_xlat12.x * _RadialScale;
    u_xlat2.y = u_xlat12.x * 0.159154937;
    u_xlatb12 = _Polar==1.0;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat12.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = 0.0;
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat13.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat19 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat13.x = u_xlat13.x * u_xlat19;
    u_xlat19 = u_xlat13.x * u_xlat13.x;
    u_xlat2.x = u_xlat19 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat19 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat19 * u_xlat2.x + -0.330299497;
    u_xlat19 = u_xlat19 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat19 * u_xlat13.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat2.x = u_xlatb8 ? u_xlat2.x : float(0.0);
    u_xlat13.x = u_xlat13.x * u_xlat19 + u_xlat2.x;
    u_xlatb19 = u_xlat1.y<(-u_xlat1.y);
    u_xlat19 = u_xlatb19 ? -3.14159274 : float(0.0);
    u_xlat13.x = u_xlat19 + u_xlat13.x;
    u_xlat19 = min(u_xlat1.y, u_xlat1.x);
    u_xlatb19 = u_xlat19<(-u_xlat19);
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat13.x = (u_xlatb19) ? (-u_xlat13.x) : u_xlat13.x;
    u_xlat13.x = u_xlat13.x * _RadialScale;
    u_xlat1.y = u_xlat13.x * 0.159154937;
    u_xlatb13 = _PolarMask==1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb13)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat13.x = u_xlat13.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat13.x);
    u_xlat3.x = cos(u_xlat13.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat4.y = u_xlat3.x;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat13.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat13.xy = u_xlat13.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat13.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat0 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.w * u_xlat16_5.x;
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
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
bool u_xlatb9;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_18;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat14.y)<abs(u_xlat14.x));
#else
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
#endif
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat14.y<(-u_xlat14.y));
#else
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
    u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlat14.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat14.xy = u_xlat14.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat14.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat14.xy, u_xlat3.xy);
    u_xlat14.xy = u_xlat1.xy + vec2(0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_PolarNoise==1.0);
#else
    u_xlatb1 = _PolarNoise==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat14.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat7.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat7.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat14.xy;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat14.y)<abs(u_xlat14.x));
#else
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
#endif
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat14.y<(-u_xlat14.y));
#else
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
    u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(_Polar==1.0);
#else
    u_xlatb14 = _Polar==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb14)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat14.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat1 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_4.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat15.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat22 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = u_xlat15.x * u_xlat22;
    u_xlat22 = u_xlat15.x * u_xlat15.x;
    u_xlat2.x = u_xlat22 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat22 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat22 * u_xlat2.x + -0.330299497;
    u_xlat22 = u_xlat22 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat22 * u_xlat15.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb9 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat2.x = u_xlatb9 ? u_xlat2.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat22 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb22 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat22 = u_xlatb22 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat22 + u_xlat15.x;
    u_xlat22 = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22<(-u_xlat22));
#else
    u_xlatb22 = u_xlat22<(-u_xlat22);
#endif
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat15.x = (u_xlatb22) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _RadialScale;
    u_xlat1.y = u_xlat15.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_PolarMask==1.0);
#else
    u_xlatb15 = _PolarMask==1.0;
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb15)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat15.x = u_xlat15.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat5.z = u_xlat2.x;
    u_xlat5.y = u_xlat3.x;
    u_xlat5.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat15.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat15.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    u_xlat1 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_11.xxxx * u_xlat0.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb8 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat8) * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat16_11.x = abs(u_xlat7.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_11.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_18.x>=(-u_xlat16_18.x));
#else
    u_xlatb7 = u_xlat16_18.x>=(-u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_11.x = u_xlat16_18.y * u_xlat16_11.x;
    u_xlat16_11.x = fract(u_xlat16_11.x);
    u_xlat7.xyz = u_xlat16_18.xxx * u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat16_11.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat7.xyz = u_xlat16_11.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_11.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_6.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_6.xy = vec2(1.0, 1.0) / u_xlat16_6.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_6.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_6.xzw = u_xlat16_4.xxx * u_xlat16_6.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * u_xlat16_6.xzw;
    u_xlat16_25 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_25 = u_xlat16_6.y * u_xlat16_25;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_25) * u_xlat16_6.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_4.x;
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
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
bool u_xlatb9;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_18;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat14.y)<abs(u_xlat14.x));
#else
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
#endif
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat14.y<(-u_xlat14.y));
#else
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
    u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlat14.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat14.xy = u_xlat14.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat14.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat14.xy, u_xlat3.xy);
    u_xlat14.xy = u_xlat1.xy + vec2(0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_PolarNoise==1.0);
#else
    u_xlatb1 = _PolarNoise==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat14.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat7.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat7.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat14.xy;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat14.y)<abs(u_xlat14.x));
#else
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
#endif
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat14.y<(-u_xlat14.y));
#else
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8<(-u_xlat8));
#else
    u_xlatb8 = u_xlat8<(-u_xlat8);
#endif
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(_Polar==1.0);
#else
    u_xlatb14 = _Polar==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb14)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat14.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat1 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_4.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat15.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat22 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = u_xlat15.x * u_xlat22;
    u_xlat22 = u_xlat15.x * u_xlat15.x;
    u_xlat2.x = u_xlat22 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat22 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat22 * u_xlat2.x + -0.330299497;
    u_xlat22 = u_xlat22 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat22 * u_xlat15.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb9 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat2.x = u_xlatb9 ? u_xlat2.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat22 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb22 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat22 = u_xlatb22 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat22 + u_xlat15.x;
    u_xlat22 = min(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22<(-u_xlat22));
#else
    u_xlatb22 = u_xlat22<(-u_xlat22);
#endif
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat15.x = (u_xlatb22) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _RadialScale;
    u_xlat1.y = u_xlat15.x * 0.159154937;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_PolarMask==1.0);
#else
    u_xlatb15 = _PolarMask==1.0;
#endif
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb15)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat15.x = u_xlat15.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat5.z = u_xlat2.x;
    u_xlat5.y = u_xlat3.x;
    u_xlat5.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat15.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat15.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    u_xlat1 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_11.xxxx * u_xlat0.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb8 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat8) * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat16_11.x = abs(u_xlat7.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_11.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_18.x>=(-u_xlat16_18.x));
#else
    u_xlatb7 = u_xlat16_18.x>=(-u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_11.x = u_xlat16_18.y * u_xlat16_11.x;
    u_xlat16_11.x = fract(u_xlat16_11.x);
    u_xlat7.xyz = u_xlat16_18.xxx * u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat16_11.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat7.xyz = u_xlat16_11.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_11.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_6.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_6.xy = vec2(1.0, 1.0) / u_xlat16_6.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_6.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_6.xzw = u_xlat16_4.xxx * u_xlat16_6.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * u_xlat16_6.xzw;
    u_xlat16_25 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_25 = u_xlat16_6.y * u_xlat16_25;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_25) * u_xlat16_6.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_4.x;
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
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
bool u_xlatb9;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_18;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
    u_xlatb8 = u_xlat8<(-u_xlat8);
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlat14.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat14.xy = u_xlat14.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat14.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat14.xy, u_xlat3.xy);
    u_xlat14.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlatb1 = _PolarNoise==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat14.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat7.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat7.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat14.xy;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
    u_xlatb8 = u_xlat8<(-u_xlat8);
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlatb14 = _Polar==1.0;
    u_xlat0.xy = (bool(u_xlatb14)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat14.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_4.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat15.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat22 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = u_xlat15.x * u_xlat22;
    u_xlat22 = u_xlat15.x * u_xlat15.x;
    u_xlat2.x = u_xlat22 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat22 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat22 * u_xlat2.x + -0.330299497;
    u_xlat22 = u_xlat22 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat22 * u_xlat15.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat2.x = u_xlatb9 ? u_xlat2.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat22 + u_xlat2.x;
    u_xlatb22 = u_xlat1.y<(-u_xlat1.y);
    u_xlat22 = u_xlatb22 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat22 + u_xlat15.x;
    u_xlat22 = min(u_xlat1.y, u_xlat1.x);
    u_xlatb22 = u_xlat22<(-u_xlat22);
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat15.x = (u_xlatb22) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _RadialScale;
    u_xlat1.y = u_xlat15.x * 0.159154937;
    u_xlatb15 = _PolarMask==1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb15)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat15.x = u_xlat15.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat5.z = u_xlat2.x;
    u_xlat5.y = u_xlat3.x;
    u_xlat5.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat15.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat15.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat1 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_11.xxxx * u_xlat0.xywz + u_xlat2.xywz;
    u_xlatb8 = u_xlat1.x>=u_xlat0.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat8) * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat16_11.x = abs(u_xlat7.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_11.x * 360.0;
    u_xlatb7 = u_xlat16_18.x>=(-u_xlat16_18.x);
    u_xlat16_18.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_11.x = u_xlat16_18.y * u_xlat16_11.x;
    u_xlat16_11.x = fract(u_xlat16_11.x);
    u_xlat7.xyz = u_xlat16_18.xxx * u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat16_11.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat7.xyz = u_xlat16_11.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_11.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_6.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_6.xy = vec2(1.0, 1.0) / u_xlat16_6.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_6.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_6.xzw = u_xlat16_4.xxx * u_xlat16_6.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * u_xlat16_6.xzw;
    u_xlat16_25 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_25 = u_xlat16_6.y * u_xlat16_25;
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_25) * u_xlat16_6.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_4.x;
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
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
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
uniform 	float _Polar;
uniform 	float _RadialScale1;
uniform 	vec4 _NoiseCenterNoiseSpeed;
uniform 	float _PolarNoise;
uniform 	float _RadialScale;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _MainTexRotator;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _XYVxVy;
uniform 	float _RepeatX;
uniform 	float _RepeatY;
uniform 	vec4 _DiffuseColor;
uniform 	float _MaskSpeedX;
uniform 	float _maskSpeedY;
uniform 	float _PolarMask;
uniform 	vec4 _Mask_ST;
uniform 	float _MaskRotator;
uniform 	vec4 _MaskScaleAndOffset;
uniform 	float _Alpha_Intensity;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
bool u_xlatb8;
bool u_xlatb9;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_18;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
    u_xlatb8 = u_xlat8<(-u_xlat8);
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlat14.xy = u_xlat2.xy + _NoiseScaleAndOffset.zw;
    u_xlat14.xy = u_xlat14.xy * _NoiseScaleAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Polar * 0.25;
    u_xlat1.x = _MainTexRotator * 0.00277777785 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 6.28318548;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.x = dot(u_xlat14.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat14.xy, u_xlat3.xy);
    u_xlat14.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlatb1 = _PolarNoise==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat14.xy : u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseCenterNoiseSpeed.zw + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = (-u_xlat10_0.x) + 1.0;
    u_xlat0.x = u_xlat0.x + (-_NoiseOffset);
    u_xlat7.xy = vs_TEXCOORD0.xy + (-_NoiseCenterNoiseSpeed.xy);
    u_xlat0.xy = u_xlat0.xx * u_xlat7.xy;
    u_xlat14.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoisePower, _NoisePower)) + u_xlat14.xy;
    u_xlat14.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1.x = max(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8 = min(abs(u_xlat14.y), abs(u_xlat14.x));
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat15.x = u_xlat8 * 0.0208350997 + -0.0851330012;
    u_xlat15.x = u_xlat8 * u_xlat15.x + 0.180141002;
    u_xlat15.x = u_xlat8 * u_xlat15.x + -0.330299497;
    u_xlat8 = u_xlat8 * u_xlat15.x + 0.999866009;
    u_xlat15.x = u_xlat8 * u_xlat1.x;
    u_xlat15.x = u_xlat15.x * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat14.y)<abs(u_xlat14.x);
    u_xlat15.x = u_xlatb22 ? u_xlat15.x : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat8 + u_xlat15.x;
    u_xlatb8 = u_xlat14.y<(-u_xlat14.y);
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat8 + u_xlat1.x;
    u_xlat8 = min(u_xlat14.y, u_xlat14.x);
    u_xlatb8 = u_xlat8<(-u_xlat8);
    u_xlat15.x = max(u_xlat14.y, u_xlat14.x);
    u_xlat14.x = dot(u_xlat14.xy, u_xlat14.xy);
    u_xlat14.x = sqrt(u_xlat14.x);
    u_xlat2.x = dot(u_xlat14.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb14 = u_xlat15.x>=(-u_xlat15.x);
    u_xlatb14 = u_xlatb14 && u_xlatb8;
    u_xlat14.x = (u_xlatb14) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlat14.x = u_xlat14.x * _RadialScale;
    u_xlat2.y = u_xlat14.x * 0.159154937;
    u_xlatb14 = _Polar==1.0;
    u_xlat0.xy = (bool(u_xlatb14)) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.y = u_xlat0.x + _XYVxVy.y;
    u_xlat0.x = u_xlat14.x + 0.5;
    u_xlat1.x = _Polar * 0.5 + _XYVxVy.x;
    u_xlat1.yz = _Time.yy * _XYVxVy.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xz;
    u_xlat1.w = 0.5;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.yw;
    u_xlat1.zw = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat2.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat1.xy = vec2(_RepeatX) * u_xlat2.xy + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat1.xy) + u_xlat1.xw;
    u_xlat0.xy = vec2(vec2(_RepeatY, _RepeatY)) * u_xlat0.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0;
    u_xlat16_4.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat0 = u_xlat1 * _DiffuseColor;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat15.x = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat22 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat15.x = u_xlat15.x * u_xlat22;
    u_xlat22 = u_xlat15.x * u_xlat15.x;
    u_xlat2.x = u_xlat22 * 0.0208350997 + -0.0851330012;
    u_xlat2.x = u_xlat22 * u_xlat2.x + 0.180141002;
    u_xlat2.x = u_xlat22 * u_xlat2.x + -0.330299497;
    u_xlat22 = u_xlat22 * u_xlat2.x + 0.999866009;
    u_xlat2.x = u_xlat22 * u_xlat15.x;
    u_xlat2.x = u_xlat2.x * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat2.x = u_xlatb9 ? u_xlat2.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat22 + u_xlat2.x;
    u_xlatb22 = u_xlat1.y<(-u_xlat1.y);
    u_xlat22 = u_xlatb22 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat22 + u_xlat15.x;
    u_xlat22 = min(u_xlat1.y, u_xlat1.x);
    u_xlatb22 = u_xlat22<(-u_xlat22);
    u_xlat2.x = max(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_RadialScale1, _RadialScale1)));
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat15.x = (u_xlatb22) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _RadialScale;
    u_xlat1.y = u_xlat15.x * 0.159154937;
    u_xlatb15 = _PolarMask==1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.xy = (bool(u_xlatb15)) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.x = (-_PolarMask) * 90.0 + _MaskRotator;
    u_xlat15.x = u_xlat15.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat5.z = u_xlat2.x;
    u_xlat5.y = u_xlat3.x;
    u_xlat5.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat5.xy);
    u_xlat2.x = dot(u_xlat1.xy, u_xlat5.yz);
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy + (-_MaskScaleAndOffset.zw);
    u_xlat1.xy = u_xlat1.xy / _MaskScaleAndOffset.xy;
    u_xlat15.xy = vec2(1.0, 1.0) / _MaskScaleAndOffset.xy;
    u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = (-u_xlat15.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskSpeedX, _maskSpeedY) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlat1 = u_xlat0 * vec4(_ColorPower, _ColorPower, _ColorPower, _Alpha_Intensity);
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_11.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat0.xy = u_xlat0.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_11.xxxx * u_xlat0.xywz + u_xlat2.xywz;
    u_xlatb8 = u_xlat1.x>=u_xlat0.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat8) * u_xlat2 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat16_11.x = abs(u_xlat7.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_11.x * 360.0;
    u_xlatb7 = u_xlat16_18.x>=(-u_xlat16_18.x);
    u_xlat16_18.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_11.x = u_xlat16_18.y * u_xlat16_11.x;
    u_xlat16_11.x = fract(u_xlat16_11.x);
    u_xlat7.xyz = u_xlat16_18.xxx * u_xlat16_11.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat16_11.x = u_xlat1.x * _HSV_Vector.y;
    u_xlat7.xyz = u_xlat16_11.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_11.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_6.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_6.xy = vec2(1.0, 1.0) / u_xlat16_6.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_6.x;
    u_xlat16_6.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_6.xzw = u_xlat16_4.xxx * u_xlat16_6.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * u_xlat16_6.xzw;
    u_xlat16_25 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_25 = u_xlat16_6.y * u_xlat16_25;
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_25) * u_xlat16_6.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat1.w * u_xlat16_4.x;
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
CustomEditor "CodeGenShaderGUI.VX_UVPolarGUI"
}