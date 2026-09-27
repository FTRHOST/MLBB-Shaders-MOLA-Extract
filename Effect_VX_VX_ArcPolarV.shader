//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect_VX/VX_ArcPolarV" {
Properties {

_BlendSrc ("BlendSrc_混合源颜色系数", Float) = 5.0

_BlendDst ("BlendDst_混合目标色系数", Float) = 10.0

_Cull ("剔除模式", Float) = 2.0

_ZWrite ("深度写入", Float) = 0.0

_Custom ("Custom_自定义曲线开关（主帖图偏移XY_圆角矩形偏移ZW）", Float) = 0.0

_Diffuse ("主贴图", 2D) = "white" { }

_DiffuseColor ("主颜色", Color) = (1,1,1,1)

_DiffuseArcXYVxVy ("主图螺旋变形后的XY偏移和XY速度", Vector) = (0,0,0,0)

_DiffuseArcTilingRoaRov ("主图螺旋后的平铺与旋转", Vector) = (1,1,0,0)

[Toggle] _ScreenUVOn ("螺旋Mask使用屏幕UV", Float) = 0.0

_ArcTilingAndOffset ("螺旋平铺与偏移", Vector) = (1,1,0,0)

[Toggle] _DiffuseArcUVOn ("主图使用螺旋UV", Float) = 0.0

[Toggle] _ArcNoise ("扰动图使用螺旋UV", Float) = 0.0

[Toggle] _ArcMask ("遮罩图使用螺旋UV", Float) = 0.0

[Toggle] _RectArcUVOn ("圆角矩形Mask使用螺旋UV", Float) = 0.0

_ArcPolarRadialScale ("螺旋径向缩放", Float) = 1.0

_ArcUVRotateAngle ("螺旋旋转角度", Range(0, 360)) = 0.0

_ArcPolarV_RotateSpeed ("螺旋自旋速度", Float) = -0.20000000298023224

_ArcRadialPower ("螺旋径向权重", Float) = 1.0

_ArcCounts ("螺旋线数量", Float) = 3.0

_ArcPolarV_Radian ("螺旋线弧度", Range(0.0001, 1)) = 0.5047652125358582

_ArcMaskScale ("螺旋Mask范围", Range(-1, 1)) = 0.20000000298023224

_AcrMaskSmooth ("螺旋mask软边范围", Range(0.5, 1)) = 0.5

_NoiseTex ("遮罩图R_扰动图G", 2D) = "white" { }

_MaskTiOf ("遮罩图TiOf", Vector) = (1,1,0,0)

_NoiseScaleAndOffset ("扰动图TiOf", Vector) = (1,1,0,0)

_NoiseAnchorVxVy ("扰动中心与UV速度", Vector) = (0.5,0.5,0,0)

_NoisePower ("扰动强度", Range(-2, 2)) = 0.0

_NoiseOffset ("扰动缩放与偏移校正", Range(0, 1)) = 0.3930000066757202

[Toggle] _RepeatX ("圆角矩形X轴重复平铺", Float) = 1.0

[Toggle] _RepeatY ("圆角矩形Y轴重复平铺", Float) = 0.0

_RectTilingAndOffset ("圆角矩形_平铺XY_偏移ZW", Vector) = (1,1,0,0)

_RectMask_WHFrSf ("圆角矩形_宽高圆角软边", Vector) = (0.2,0.2,0,0.1)

_RectMask_XYRoaRov ("圆角矩形_平铺后的偏移XY旋转ZW", Vector) = (0.5,0.5,0,0)

_COLOUR_ON ("色彩开关(禁动画中K开关)", Float) = 0.0

_HSV_Vector ("_HSV_Vector", Vector) = (0,1,1,0)

_BrightColor ("灰度亮部渐变色", Color) = (1,1,1,1)

_DarkColor ("灰度暗部渐变色", Color) = (1,1,1,1)

_RampColorRotator ("渐变色角度", Range(0, 360)) = 0.0

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_SaturateWeights ("SaturateWeights", Vector) = (1,0,0,0)

_Stencil_Ref ("StencilRef", Float) = 0.0

_Stencil_Comp ("Stencil_Comp", Float) = 8.0

_PanelRect ("PanelRect", Vector) = (0,0,1,1)

_PanelClipInfo ("PanelClipInfo", Vector) = (1,1,1,1)

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
  GpuProgramID 21353
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat14;
bvec2 u_xlatb14;
bool u_xlatb18;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb7 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat7.x = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7.x<(-u_xlat7.x));
#else
    u_xlatb7 = u_xlat7.x<(-u_xlat7.x);
#endif
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat14>=(-u_xlat14));
#else
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
#endif
    u_xlatb7 = u_xlatb14.x && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat21 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat21 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat21;
    u_xlat4.x = sin(u_xlat21);
    u_xlat5 = cos(u_xlat21);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat14;
bvec2 u_xlatb14;
bool u_xlatb18;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb7 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat7.x = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7.x<(-u_xlat7.x));
#else
    u_xlatb7 = u_xlat7.x<(-u_xlat7.x);
#endif
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat14>=(-u_xlat14));
#else
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
#endif
    u_xlatb7 = u_xlatb14.x && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat21 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat21 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat21;
    u_xlat4.x = sin(u_xlat21);
    u_xlat5 = cos(u_xlat21);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat14;
bvec2 u_xlatb14;
bool u_xlatb18;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
    u_xlatb7 = u_xlat4.y<(-u_xlat4.y);
    u_xlat7.x = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb7 = u_xlat7.x<(-u_xlat7.x);
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
    u_xlatb7 = u_xlatb14.x && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat21 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat21 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat21;
    u_xlat4.x = sin(u_xlat21);
    u_xlat5 = cos(u_xlat21);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
float u_xlat14;
bvec2 u_xlatb14;
bool u_xlatb18;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
    u_xlatb7 = u_xlat4.y<(-u_xlat4.y);
    u_xlat7.x = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb7 = u_xlat7.x<(-u_xlat7.x);
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
    u_xlatb7 = u_xlatb14.x && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat21 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat21 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat21;
    u_xlat4.x = sin(u_xlat21);
    u_xlat5 = cos(u_xlat21);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb16.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb16.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat8.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat16 = u_xlat8.x * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat8.x * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat8.x * u_xlat16 + -0.330299497;
    u_xlat8.x = u_xlat8.x * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat8.x * u_xlat0.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb20 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat16 = u_xlatb20 ? u_xlat16 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb8 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat8.x = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat8.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<(-u_xlat8.x));
#else
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
#endif
    u_xlat16 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(u_xlat16>=(-u_xlat16));
#else
    u_xlatb16.x = u_xlat16>=(-u_xlat16);
#endif
    u_xlatb8 = u_xlatb16.x && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat8.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat16 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat16 + u_xlat8.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat8.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat8.x = u_xlat8.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat8.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_RectArcUVOn);
#else
    u_xlatb8 = 0.5<_RectArcUVOn;
#endif
    u_xlat8.xy = (bool(u_xlatb8)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb16.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat8.xy + _RectTilingAndOffset.zw;
    u_xlat8.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat8.xy;
    u_xlat20.xy = u_xlat8.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat20.xy);
    u_xlat8.xy = (-u_xlat8.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat8.xy = vec2(_RepeatX, _RepeatY) * u_xlat8.xy + u_xlat20.xy;
    u_xlat8.xy = u_xlat8.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat8.xy = abs(u_xlat8.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat20.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24 = min(u_xlat24, u_xlat20.x);
    u_xlat8.xy = vec2(u_xlat24) + u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat24) + u_xlat8.x;
    u_xlat8.x = u_xlat8.x / abs(_RectMask_WHFrSf.w);
    u_xlat16 = (-u_xlat8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb24) ? u_xlat16 : u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + _AcrMaskSmooth;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat8.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat8.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat8.x;
    u_xlat5.x = sin(u_xlat8.x);
    u_xlat6 = cos(u_xlat8.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat8.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat8.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb16.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb16.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat8.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat16 = u_xlat8.x * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat8.x * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat8.x * u_xlat16 + -0.330299497;
    u_xlat8.x = u_xlat8.x * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat8.x * u_xlat0.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb20 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat16 = u_xlatb20 ? u_xlat16 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb8 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat8.x = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat8.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<(-u_xlat8.x));
#else
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
#endif
    u_xlat16 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(u_xlat16>=(-u_xlat16));
#else
    u_xlatb16.x = u_xlat16>=(-u_xlat16);
#endif
    u_xlatb8 = u_xlatb16.x && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat8.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat16 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat16 + u_xlat8.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat8.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat8.x = u_xlat8.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat8.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_RectArcUVOn);
#else
    u_xlatb8 = 0.5<_RectArcUVOn;
#endif
    u_xlat8.xy = (bool(u_xlatb8)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb16.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat8.xy + _RectTilingAndOffset.zw;
    u_xlat8.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat8.xy;
    u_xlat20.xy = u_xlat8.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat20.xy);
    u_xlat8.xy = (-u_xlat8.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat8.xy = vec2(_RepeatX, _RepeatY) * u_xlat8.xy + u_xlat20.xy;
    u_xlat8.xy = u_xlat8.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat8.xy = abs(u_xlat8.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat20.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24 = min(u_xlat24, u_xlat20.x);
    u_xlat8.xy = vec2(u_xlat24) + u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat24) + u_xlat8.x;
    u_xlat8.x = u_xlat8.x / abs(_RectMask_WHFrSf.w);
    u_xlat16 = (-u_xlat8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb24) ? u_xlat16 : u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + _AcrMaskSmooth;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat8.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat8.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat8.x;
    u_xlat5.x = sin(u_xlat8.x);
    u_xlat6 = cos(u_xlat8.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat8.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat8.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb16.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb16.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat8.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat16 = u_xlat8.x * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat8.x * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat8.x * u_xlat16 + -0.330299497;
    u_xlat8.x = u_xlat8.x * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat8.x * u_xlat0.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb20 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat16 = u_xlatb20 ? u_xlat16 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16;
    u_xlatb8 = u_xlat4.y<(-u_xlat4.y);
    u_xlat8.x = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat8.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
    u_xlat16 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb16.x = u_xlat16>=(-u_xlat16);
    u_xlatb8 = u_xlatb16.x && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat8.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat16 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat16 + u_xlat8.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat8.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat8.x = u_xlat8.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat8.x);
    u_xlatb8 = 0.5<_RectArcUVOn;
    u_xlat8.xy = (bool(u_xlatb8)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb16.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat8.xy + _RectTilingAndOffset.zw;
    u_xlat8.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat8.xy;
    u_xlat20.xy = u_xlat8.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat20.xy);
    u_xlat8.xy = (-u_xlat8.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat8.xy = vec2(_RepeatX, _RepeatY) * u_xlat8.xy + u_xlat20.xy;
    u_xlat8.xy = u_xlat8.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat8.xy = abs(u_xlat8.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat20.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24 = min(u_xlat24, u_xlat20.x);
    u_xlat8.xy = vec2(u_xlat24) + u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat24) + u_xlat8.x;
    u_xlat8.x = u_xlat8.x / abs(_RectMask_WHFrSf.w);
    u_xlat16 = (-u_xlat8.x) + 1.0;
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1 = (u_xlatb24) ? u_xlat16 : u_xlat8.x;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat8.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + _AcrMaskSmooth;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat16_1 * u_xlat0.x;
    u_xlat8.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat8.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat8.x;
    u_xlat5.x = sin(u_xlat8.x);
    u_xlat6 = cos(u_xlat8.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat8.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb16.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb16.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat8.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat16 = u_xlat8.x * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat8.x * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat8.x * u_xlat16 + -0.330299497;
    u_xlat8.x = u_xlat8.x * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat8.x * u_xlat0.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb20 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat16 = u_xlatb20 ? u_xlat16 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16;
    u_xlatb8 = u_xlat4.y<(-u_xlat4.y);
    u_xlat8.x = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat8.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
    u_xlat16 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb16.x = u_xlat16>=(-u_xlat16);
    u_xlatb8 = u_xlatb16.x && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat8.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat16 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat16 + u_xlat8.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat8.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat8.x = u_xlat8.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat8.x);
    u_xlatb8 = 0.5<_RectArcUVOn;
    u_xlat8.xy = (bool(u_xlatb8)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb16.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat8.xy + _RectTilingAndOffset.zw;
    u_xlat8.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat8.xy;
    u_xlat20.xy = u_xlat8.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat20.xy);
    u_xlat8.xy = (-u_xlat8.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat8.xy = vec2(_RepeatX, _RepeatY) * u_xlat8.xy + u_xlat20.xy;
    u_xlat8.xy = u_xlat8.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat8.xy = abs(u_xlat8.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat20.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24 = min(u_xlat24, u_xlat20.x);
    u_xlat8.xy = vec2(u_xlat24) + u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat24) + u_xlat8.x;
    u_xlat8.x = u_xlat8.x / abs(_RectMask_WHFrSf.w);
    u_xlat16 = (-u_xlat8.x) + 1.0;
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1 = (u_xlatb24) ? u_xlat16 : u_xlat8.x;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat8.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + _AcrMaskSmooth;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat16_1 * u_xlat0.x;
    u_xlat8.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat8.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat8.x;
    u_xlat5.x = sin(u_xlat8.x);
    u_xlat6 = cos(u_xlat8.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat8.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bvec2 u_xlatb7;
float u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb7.x = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat7.x = u_xlatb7.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(u_xlat7.x<(-u_xlat7.x));
#else
    u_xlatb7.x = u_xlat7.x<(-u_xlat7.x);
#endif
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat14>=(-u_xlat14));
#else
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
#endif
    u_xlatb7.x = u_xlatb14.x && u_xlatb7.x;
    u_xlat0.x = (u_xlatb7.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(0.5<_RectArcUVOn);
#else
    u_xlatb7.x = 0.5<_RectArcUVOn;
#endif
    u_xlat7.xy = (u_xlatb7.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _RectTilingAndOffset.zw;
    u_xlat7.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat7.xy;
    u_xlat18.xy = u_xlat7.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat18.xy);
    u_xlat7.xy = (-u_xlat7.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat7.xy = vec2(_RepeatX, _RepeatY) * u_xlat7.xy + u_xlat18.xy;
    u_xlat7.xy = u_xlat7.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat7.xy = abs(u_xlat7.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat18.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat25 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat18.x = min(u_xlat25, u_xlat18.x);
    u_xlat7.xy = u_xlat7.xy + u_xlat18.xx;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat18.x) + u_xlat7.x;
    u_xlat7.x = u_xlat7.x / abs(_RectMask_WHFrSf.w);
    u_xlat14 = (-u_xlat7.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb18 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb18) ? u_xlat14 : u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb7.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb7.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb7.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb7.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).y;
    u_xlat21 = (-u_xlat16_21) + 1.0;
    u_xlat21 = u_xlat21 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat16_4 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bvec2 u_xlatb7;
float u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb7.x = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat7.x = u_xlatb7.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(u_xlat7.x<(-u_xlat7.x));
#else
    u_xlatb7.x = u_xlat7.x<(-u_xlat7.x);
#endif
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat14>=(-u_xlat14));
#else
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
#endif
    u_xlatb7.x = u_xlatb14.x && u_xlatb7.x;
    u_xlat0.x = (u_xlatb7.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(0.5<_RectArcUVOn);
#else
    u_xlatb7.x = 0.5<_RectArcUVOn;
#endif
    u_xlat7.xy = (u_xlatb7.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _RectTilingAndOffset.zw;
    u_xlat7.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat7.xy;
    u_xlat18.xy = u_xlat7.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat18.xy);
    u_xlat7.xy = (-u_xlat7.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat7.xy = vec2(_RepeatX, _RepeatY) * u_xlat7.xy + u_xlat18.xy;
    u_xlat7.xy = u_xlat7.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat7.xy = abs(u_xlat7.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat18.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat25 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat18.x = min(u_xlat25, u_xlat18.x);
    u_xlat7.xy = u_xlat7.xy + u_xlat18.xx;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat18.x) + u_xlat7.x;
    u_xlat7.x = u_xlat7.x / abs(_RectMask_WHFrSf.w);
    u_xlat14 = (-u_xlat7.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb18 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb18) ? u_xlat14 : u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb7.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb7.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb7.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb7.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).y;
    u_xlat21 = (-u_xlat16_21) + 1.0;
    u_xlat21 = u_xlat21 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat16_4 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bvec2 u_xlatb7;
float u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
    u_xlatb7.x = u_xlat4.y<(-u_xlat4.y);
    u_xlat7.x = u_xlatb7.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb7.x = u_xlat7.x<(-u_xlat7.x);
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
    u_xlatb7.x = u_xlatb14.x && u_xlatb7.x;
    u_xlat0.x = (u_xlatb7.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlatb7.x = 0.5<_RectArcUVOn;
    u_xlat7.xy = (u_xlatb7.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _RectTilingAndOffset.zw;
    u_xlat7.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat7.xy;
    u_xlat18.xy = u_xlat7.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat18.xy);
    u_xlat7.xy = (-u_xlat7.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat7.xy = vec2(_RepeatX, _RepeatY) * u_xlat7.xy + u_xlat18.xy;
    u_xlat7.xy = u_xlat7.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat7.xy = abs(u_xlat7.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat18.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat25 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat18.x = min(u_xlat25, u_xlat18.x);
    u_xlat7.xy = u_xlat7.xy + u_xlat18.xx;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat18.x) + u_xlat7.x;
    u_xlat7.x = u_xlat7.x / abs(_RectMask_WHFrSf.w);
    u_xlat14 = (-u_xlat7.x) + 1.0;
    u_xlatb18 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1 = (u_xlatb18) ? u_xlat14 : u_xlat7.x;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat16_1 * u_xlat0.x;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb7.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb7.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb7.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb7.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).y;
    u_xlat21 = (-u_xlat10_21) + 1.0;
    u_xlat21 = u_xlat21 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat10_4 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat10_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bvec2 u_xlatb7;
float u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
    u_xlatb7.x = u_xlat4.y<(-u_xlat4.y);
    u_xlat7.x = u_xlatb7.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb7.x = u_xlat7.x<(-u_xlat7.x);
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
    u_xlatb7.x = u_xlatb14.x && u_xlatb7.x;
    u_xlat0.x = (u_xlatb7.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlatb7.x = 0.5<_RectArcUVOn;
    u_xlat7.xy = (u_xlatb7.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _RectTilingAndOffset.zw;
    u_xlat7.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat7.xy;
    u_xlat18.xy = u_xlat7.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat18.xy);
    u_xlat7.xy = (-u_xlat7.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat7.xy = vec2(_RepeatX, _RepeatY) * u_xlat7.xy + u_xlat18.xy;
    u_xlat7.xy = u_xlat7.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat7.xy = abs(u_xlat7.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat18.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat25 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat18.x = min(u_xlat25, u_xlat18.x);
    u_xlat7.xy = u_xlat7.xy + u_xlat18.xx;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat18.x) + u_xlat7.x;
    u_xlat7.x = u_xlat7.x / abs(_RectMask_WHFrSf.w);
    u_xlat14 = (-u_xlat7.x) + 1.0;
    u_xlatb18 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1 = (u_xlatb18) ? u_xlat14 : u_xlat7.x;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat16_1 * u_xlat0.x;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb7.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb7.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb7.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb7.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).y;
    u_xlat21 = (-u_xlat10_21) + 1.0;
    u_xlat21 = u_xlat21 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat10_4 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat10_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb10 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat10.x = u_xlatb10 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10.x<(-u_xlat10.x));
#else
    u_xlatb10 = u_xlat10.x<(-u_xlat10.x);
#endif
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat20>=(-u_xlat20));
#else
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
#endif
    u_xlatb10 = u_xlatb20.x && u_xlatb10;
    u_xlat0.x = (u_xlatb10) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat30 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat30;
    u_xlat4.x = sin(u_xlat30);
    u_xlat5 = cos(u_xlat30);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb10 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb10 = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat16_17.x>=(-u_xlat16_17.x));
#else
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
#endif
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb10 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat10.x = u_xlatb10 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10.x<(-u_xlat10.x));
#else
    u_xlatb10 = u_xlat10.x<(-u_xlat10.x);
#endif
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat20>=(-u_xlat20));
#else
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
#endif
    u_xlatb10 = u_xlatb20.x && u_xlatb10;
    u_xlat0.x = (u_xlatb10) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat30 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat30;
    u_xlat4.x = sin(u_xlat30);
    u_xlat5 = cos(u_xlat30);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb10 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb10 = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat16_17.x>=(-u_xlat16_17.x));
#else
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
#endif
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
    u_xlatb10 = u_xlat4.y<(-u_xlat4.y);
    u_xlat10.x = u_xlatb10 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb10 = u_xlat10.x<(-u_xlat10.x);
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
    u_xlatb10 = u_xlatb20.x && u_xlatb10;
    u_xlat0.x = (u_xlatb10) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat30 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat30;
    u_xlat4.x = sin(u_xlat30);
    u_xlat5 = cos(u_xlat30);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlatb10 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb10 = u_xlat10_1.x>=u_xlat2.x;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
    u_xlatb10 = u_xlat4.y<(-u_xlat4.y);
    u_xlat10.x = u_xlatb10 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb10 = u_xlat10.x<(-u_xlat10.x);
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
    u_xlatb10 = u_xlatb20.x && u_xlatb10;
    u_xlat0.x = (u_xlatb10) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat30 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat30;
    u_xlat4.x = sin(u_xlat30);
    u_xlat5 = cos(u_xlat30);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlatb10 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb10 = u_xlat10_1.x>=u_xlat2.x;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_9;
mediump vec2 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_19;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb22.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb22.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat11.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat11.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat11.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat11.x * u_xlat22 + -0.330299497;
    u_xlat11.x = u_xlat11.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat11.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb26 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat22 = u_xlatb26 ? u_xlat22 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb11 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat11.x = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat11.x + u_xlat0.x;
    u_xlat11.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x<(-u_xlat11.x));
#else
    u_xlatb11 = u_xlat11.x<(-u_xlat11.x);
#endif
    u_xlat22 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22.x = u_xlat22>=(-u_xlat22);
#endif
    u_xlatb11 = u_xlatb22.x && u_xlatb11;
    u_xlat0.x = (u_xlatb11) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat11.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat11.x = fract(u_xlat11.x);
    u_xlat22 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat11.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat11.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat11.x = u_xlat11.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(0.5<_RectArcUVOn);
#else
    u_xlatb11 = 0.5<_RectArcUVOn;
#endif
    u_xlat11.xy = (bool(u_xlatb11)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb22.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat11.xy = u_xlat11.xy + _RectTilingAndOffset.zw;
    u_xlat11.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat11.xy;
    u_xlat26.xy = u_xlat11.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat26.xy);
    u_xlat11.xy = (-u_xlat11.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat11.xy = vec2(_RepeatX, _RepeatY) * u_xlat11.xy + u_xlat26.xy;
    u_xlat11.xy = u_xlat11.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat11.xy = abs(u_xlat11.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat33 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat26.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat33 = min(u_xlat33, u_xlat26.x);
    u_xlat11.xy = vec2(u_xlat33) + u_xlat11.xy;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = (-u_xlat33) + u_xlat11.x;
    u_xlat11.x = u_xlat11.x / abs(_RectMask_WHFrSf.w);
    u_xlat22 = (-u_xlat11.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb33 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat11.x) + u_xlat0.x;
    u_xlat11.x = (-u_xlat11.x) + _AcrMaskSmooth;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat11.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat11.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat11.x;
    u_xlat5.x = sin(u_xlat11.x);
    u_xlat6 = cos(u_xlat11.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat11.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat11.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb11 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb11 = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat11.x = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat11.xxxx * u_xlat3 + u_xlat2;
    u_xlat11.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.x;
    u_xlat22 = u_xlat11.x * 6.0 + 1.00000001e-10;
    u_xlat33 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat22 = u_xlat33 / u_xlat22;
    u_xlat22 = u_xlat22 + u_xlat2.z;
    u_xlat16_8.x = abs(u_xlat22) + _HSV_Vector.x;
    u_xlat16_19.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat16_19.x>=(-u_xlat16_19.x));
#else
    u_xlatb22.x = u_xlat16_19.x>=(-u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb22.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_19.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat16_19.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat22 = u_xlat2.x + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat22;
    u_xlat16_8.x = u_xlat11.x * _HSV_Vector.y;
    u_xlat11.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat16_8.xyz = u_xlat11.xyz * _HSV_Vector.zzz;
    u_xlat16_41 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_41 = u_xlat16_41 + (-_SaturateWeights.y);
    u_xlat16_9.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_9.xy = vec2(1.0, 1.0) / u_xlat16_9.xy;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_41 * -2.0 + 3.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_41) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat11.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_8.x = _RampColorRotator * 0.0174532924;
    u_xlat16_10.x = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_10.y = u_xlat16_8.x;
    u_xlat11.x = dot(u_xlat11.xy, u_xlat16_10.xy);
    u_xlat11.x = u_xlat11.x + 0.5;
    u_xlat16_8.x = u_xlat11.x + (-_SaturateWeights.z);
    u_xlat16_8.x = u_xlat16_9.y * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_19.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_8.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_9;
mediump vec2 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_19;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb22.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb22.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat11.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat11.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat11.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat11.x * u_xlat22 + -0.330299497;
    u_xlat11.x = u_xlat11.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat11.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb26 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat22 = u_xlatb26 ? u_xlat22 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb11 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat11.x = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat11.x + u_xlat0.x;
    u_xlat11.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x<(-u_xlat11.x));
#else
    u_xlatb11 = u_xlat11.x<(-u_xlat11.x);
#endif
    u_xlat22 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22.x = u_xlat22>=(-u_xlat22);
#endif
    u_xlatb11 = u_xlatb22.x && u_xlatb11;
    u_xlat0.x = (u_xlatb11) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat11.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat11.x = fract(u_xlat11.x);
    u_xlat22 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat11.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat11.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat11.x = u_xlat11.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(0.5<_RectArcUVOn);
#else
    u_xlatb11 = 0.5<_RectArcUVOn;
#endif
    u_xlat11.xy = (bool(u_xlatb11)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb22.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat11.xy = u_xlat11.xy + _RectTilingAndOffset.zw;
    u_xlat11.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat11.xy;
    u_xlat26.xy = u_xlat11.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat26.xy);
    u_xlat11.xy = (-u_xlat11.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat11.xy = vec2(_RepeatX, _RepeatY) * u_xlat11.xy + u_xlat26.xy;
    u_xlat11.xy = u_xlat11.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat11.xy = abs(u_xlat11.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat33 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat26.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat33 = min(u_xlat33, u_xlat26.x);
    u_xlat11.xy = vec2(u_xlat33) + u_xlat11.xy;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = (-u_xlat33) + u_xlat11.x;
    u_xlat11.x = u_xlat11.x / abs(_RectMask_WHFrSf.w);
    u_xlat22 = (-u_xlat11.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb33 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat11.x) + u_xlat0.x;
    u_xlat11.x = (-u_xlat11.x) + _AcrMaskSmooth;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat11.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat11.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat11.x;
    u_xlat5.x = sin(u_xlat11.x);
    u_xlat6 = cos(u_xlat11.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat11.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat11.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb11 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb11 = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat11.x = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat11.xxxx * u_xlat3 + u_xlat2;
    u_xlat11.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.x;
    u_xlat22 = u_xlat11.x * 6.0 + 1.00000001e-10;
    u_xlat33 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat22 = u_xlat33 / u_xlat22;
    u_xlat22 = u_xlat22 + u_xlat2.z;
    u_xlat16_8.x = abs(u_xlat22) + _HSV_Vector.x;
    u_xlat16_19.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat16_19.x>=(-u_xlat16_19.x));
#else
    u_xlatb22.x = u_xlat16_19.x>=(-u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb22.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_19.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat16_19.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat22 = u_xlat2.x + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat22;
    u_xlat16_8.x = u_xlat11.x * _HSV_Vector.y;
    u_xlat11.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat16_8.xyz = u_xlat11.xyz * _HSV_Vector.zzz;
    u_xlat16_41 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_41 = u_xlat16_41 + (-_SaturateWeights.y);
    u_xlat16_9.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_9.xy = vec2(1.0, 1.0) / u_xlat16_9.xy;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_41 * -2.0 + 3.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_41) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat11.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_8.x = _RampColorRotator * 0.0174532924;
    u_xlat16_10.x = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_10.y = u_xlat16_8.x;
    u_xlat11.x = dot(u_xlat11.xy, u_xlat16_10.xy);
    u_xlat11.x = u_xlat11.x + 0.5;
    u_xlat16_8.x = u_xlat11.x + (-_SaturateWeights.z);
    u_xlat16_8.x = u_xlat16_9.y * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_19.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_8.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_9;
mediump vec2 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_19;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb22.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb22.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat11.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat11.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat11.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat11.x * u_xlat22 + -0.330299497;
    u_xlat11.x = u_xlat11.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat11.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
    u_xlatb26 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat22 = u_xlatb26 ? u_xlat22 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat22;
    u_xlatb11 = u_xlat4.y<(-u_xlat4.y);
    u_xlat11.x = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat11.x + u_xlat0.x;
    u_xlat11.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb11 = u_xlat11.x<(-u_xlat11.x);
    u_xlat22 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb22.x = u_xlat22>=(-u_xlat22);
    u_xlatb11 = u_xlatb22.x && u_xlatb11;
    u_xlat0.x = (u_xlatb11) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat11.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat11.x = fract(u_xlat11.x);
    u_xlat22 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat11.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat11.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat11.x = u_xlat11.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat11.x);
    u_xlatb11 = 0.5<_RectArcUVOn;
    u_xlat11.xy = (bool(u_xlatb11)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb22.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat11.xy = u_xlat11.xy + _RectTilingAndOffset.zw;
    u_xlat11.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat11.xy;
    u_xlat26.xy = u_xlat11.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat26.xy);
    u_xlat11.xy = (-u_xlat11.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat11.xy = vec2(_RepeatX, _RepeatY) * u_xlat11.xy + u_xlat26.xy;
    u_xlat11.xy = u_xlat11.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat11.xy = abs(u_xlat11.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat33 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat26.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat33 = min(u_xlat33, u_xlat26.x);
    u_xlat11.xy = vec2(u_xlat33) + u_xlat11.xy;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = (-u_xlat33) + u_xlat11.x;
    u_xlat11.x = u_xlat11.x / abs(_RectMask_WHFrSf.w);
    u_xlat22 = (-u_xlat11.x) + 1.0;
    u_xlatb33 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat11.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat11.x) + u_xlat0.x;
    u_xlat11.x = (-u_xlat11.x) + _AcrMaskSmooth;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat11.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat11.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat11.x;
    u_xlat5.x = sin(u_xlat11.x);
    u_xlat6 = cos(u_xlat11.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat11.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat11.xy);
    u_xlatb11 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb11 = u_xlat10_1.x>=u_xlat2.x;
    u_xlat11.x = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat11.xxxx * u_xlat3 + u_xlat2;
    u_xlat11.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.x;
    u_xlat22 = u_xlat11.x * 6.0 + 1.00000001e-10;
    u_xlat33 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat22 = u_xlat33 / u_xlat22;
    u_xlat22 = u_xlat22 + u_xlat2.z;
    u_xlat16_8.x = abs(u_xlat22) + _HSV_Vector.x;
    u_xlat16_19.x = u_xlat16_8.x * 360.0;
    u_xlatb22.x = u_xlat16_19.x>=(-u_xlat16_19.x);
    u_xlat16_19.xy = (u_xlatb22.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_19.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat16_19.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat22 = u_xlat2.x + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat22;
    u_xlat16_8.x = u_xlat11.x * _HSV_Vector.y;
    u_xlat11.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat16_8.xyz = u_xlat11.xyz * _HSV_Vector.zzz;
    u_xlat16_41 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_41 = u_xlat16_41 + (-_SaturateWeights.y);
    u_xlat16_9.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_9.xy = vec2(1.0, 1.0) / u_xlat16_9.xy;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_41 * -2.0 + 3.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_41) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat11.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_8.x = _RampColorRotator * 0.0174532924;
    u_xlat16_10.x = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_10.y = u_xlat16_8.x;
    u_xlat11.x = dot(u_xlat11.xy, u_xlat16_10.xy);
    u_xlat11.x = u_xlat11.x + 0.5;
    u_xlat16_8.x = u_xlat11.x + (-_SaturateWeights.z);
    u_xlat16_8.x = u_xlat16_9.y * u_xlat16_8.x;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_19.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_19.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_8.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_9;
mediump vec2 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_19;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb22.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb22.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat11.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat11.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat11.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat11.x * u_xlat22 + -0.330299497;
    u_xlat11.x = u_xlat11.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat11.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
    u_xlatb26 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat22 = u_xlatb26 ? u_xlat22 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat22;
    u_xlatb11 = u_xlat4.y<(-u_xlat4.y);
    u_xlat11.x = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat11.x + u_xlat0.x;
    u_xlat11.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb11 = u_xlat11.x<(-u_xlat11.x);
    u_xlat22 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb22.x = u_xlat22>=(-u_xlat22);
    u_xlatb11 = u_xlatb22.x && u_xlatb11;
    u_xlat0.x = (u_xlatb11) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat11.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat11.x = fract(u_xlat11.x);
    u_xlat22 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat11.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat11.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat11.x = u_xlat11.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat11.x);
    u_xlatb11 = 0.5<_RectArcUVOn;
    u_xlat11.xy = (bool(u_xlatb11)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb22.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat11.xy = u_xlat11.xy + _RectTilingAndOffset.zw;
    u_xlat11.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat11.xy;
    u_xlat26.xy = u_xlat11.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat26.xy);
    u_xlat11.xy = (-u_xlat11.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat11.xy = vec2(_RepeatX, _RepeatY) * u_xlat11.xy + u_xlat26.xy;
    u_xlat11.xy = u_xlat11.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat11.xy = abs(u_xlat11.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat33 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat26.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat33 = min(u_xlat33, u_xlat26.x);
    u_xlat11.xy = vec2(u_xlat33) + u_xlat11.xy;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = (-u_xlat33) + u_xlat11.x;
    u_xlat11.x = u_xlat11.x / abs(_RectMask_WHFrSf.w);
    u_xlat22 = (-u_xlat11.x) + 1.0;
    u_xlatb33 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat11.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat11.x) + u_xlat0.x;
    u_xlat11.x = (-u_xlat11.x) + _AcrMaskSmooth;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat11.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat11.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat11.x;
    u_xlat5.x = sin(u_xlat11.x);
    u_xlat6 = cos(u_xlat11.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat11.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat11.xy);
    u_xlatb11 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb11 = u_xlat10_1.x>=u_xlat2.x;
    u_xlat11.x = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat11.xxxx * u_xlat3 + u_xlat2;
    u_xlat11.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.x;
    u_xlat22 = u_xlat11.x * 6.0 + 1.00000001e-10;
    u_xlat33 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat22 = u_xlat33 / u_xlat22;
    u_xlat22 = u_xlat22 + u_xlat2.z;
    u_xlat16_8.x = abs(u_xlat22) + _HSV_Vector.x;
    u_xlat16_19.x = u_xlat16_8.x * 360.0;
    u_xlatb22.x = u_xlat16_19.x>=(-u_xlat16_19.x);
    u_xlat16_19.xy = (u_xlatb22.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_19.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat16_19.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat22 = u_xlat2.x + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat22;
    u_xlat16_8.x = u_xlat11.x * _HSV_Vector.y;
    u_xlat11.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat16_8.xyz = u_xlat11.xyz * _HSV_Vector.zzz;
    u_xlat16_41 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_41 = u_xlat16_41 + (-_SaturateWeights.y);
    u_xlat16_9.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_9.xy = vec2(1.0, 1.0) / u_xlat16_9.xy;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_41 * -2.0 + 3.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_41) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat11.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_8.x = _RampColorRotator * 0.0174532924;
    u_xlat16_10.x = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_10.y = u_xlat16_8.x;
    u_xlat11.x = dot(u_xlat11.xy, u_xlat16_10.xy);
    u_xlat11.x = u_xlat11.x + 0.5;
    u_xlat16_8.x = u_xlat11.x + (-_SaturateWeights.z);
    u_xlat16_8.x = u_xlat16_9.y * u_xlat16_8.x;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_19.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_19.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_8.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb10.x = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat10.x = u_xlatb10.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat10.x<(-u_xlat10.x));
#else
    u_xlatb10.x = u_xlat10.x<(-u_xlat10.x);
#endif
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat20>=(-u_xlat20));
#else
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
#endif
    u_xlatb10.x = u_xlatb20.x && u_xlatb10.x;
    u_xlat0.x = (u_xlatb10.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(0.5<_RectArcUVOn);
#else
    u_xlatb10.x = 0.5<_RectArcUVOn;
#endif
    u_xlat10.xy = (u_xlatb10.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _RectTilingAndOffset.zw;
    u_xlat10.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat10.xy;
    u_xlat24.xy = u_xlat10.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat24.xy);
    u_xlat10.xy = (-u_xlat10.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat10.xy = vec2(_RepeatX, _RepeatY) * u_xlat10.xy + u_xlat24.xy;
    u_xlat10.xy = u_xlat10.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat10.xy = abs(u_xlat10.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat34 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24.x = min(u_xlat34, u_xlat24.x);
    u_xlat10.xy = u_xlat10.xy + u_xlat24.xx;
    u_xlat10.xy = max(u_xlat10.xy, vec2(0.0, 0.0));
    u_xlat10.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = (-u_xlat24.x) + u_xlat10.x;
    u_xlat10.x = u_xlat10.x / abs(_RectMask_WHFrSf.w);
    u_xlat20 = (-u_xlat10.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb24) ? u_xlat20 : u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb10.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb10.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb10.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb10.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb10.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat16_30 = texture(_NoiseTex, u_xlat4.xy).y;
    u_xlat30 = (-u_xlat16_30) + 1.0;
    u_xlat30 = u_xlat30 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat16_4 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat30) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb10.x = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb10.x) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb10.x = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat10.x = u_xlatb10.x ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat16_17.x>=(-u_xlat16_17.x));
#else
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
#endif
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb10.x = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat10.x = u_xlatb10.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat10.x<(-u_xlat10.x));
#else
    u_xlatb10.x = u_xlat10.x<(-u_xlat10.x);
#endif
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat20>=(-u_xlat20));
#else
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
#endif
    u_xlatb10.x = u_xlatb20.x && u_xlatb10.x;
    u_xlat0.x = (u_xlatb10.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(0.5<_RectArcUVOn);
#else
    u_xlatb10.x = 0.5<_RectArcUVOn;
#endif
    u_xlat10.xy = (u_xlatb10.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _RectTilingAndOffset.zw;
    u_xlat10.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat10.xy;
    u_xlat24.xy = u_xlat10.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat24.xy);
    u_xlat10.xy = (-u_xlat10.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat10.xy = vec2(_RepeatX, _RepeatY) * u_xlat10.xy + u_xlat24.xy;
    u_xlat10.xy = u_xlat10.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat10.xy = abs(u_xlat10.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat34 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24.x = min(u_xlat34, u_xlat24.x);
    u_xlat10.xy = u_xlat10.xy + u_xlat24.xx;
    u_xlat10.xy = max(u_xlat10.xy, vec2(0.0, 0.0));
    u_xlat10.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = (-u_xlat24.x) + u_xlat10.x;
    u_xlat10.x = u_xlat10.x / abs(_RectMask_WHFrSf.w);
    u_xlat20 = (-u_xlat10.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb24) ? u_xlat20 : u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb10.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb10.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb10.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb10.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb10.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat16_30 = texture(_NoiseTex, u_xlat4.xy).y;
    u_xlat30 = (-u_xlat16_30) + 1.0;
    u_xlat30 = u_xlat30 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat16_4 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat30) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb10.x = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb10.x) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb10.x = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat10.x = u_xlatb10.x ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat16_17.x>=(-u_xlat16_17.x));
#else
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
#endif
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat30;
lowp float u_xlat10_30;
float u_xlat34;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
    u_xlatb10.x = u_xlat4.y<(-u_xlat4.y);
    u_xlat10.x = u_xlatb10.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb10.x = u_xlat10.x<(-u_xlat10.x);
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
    u_xlatb10.x = u_xlatb20.x && u_xlatb10.x;
    u_xlat0.x = (u_xlatb10.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlatb10.x = 0.5<_RectArcUVOn;
    u_xlat10.xy = (u_xlatb10.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _RectTilingAndOffset.zw;
    u_xlat10.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat10.xy;
    u_xlat24.xy = u_xlat10.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat24.xy);
    u_xlat10.xy = (-u_xlat10.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat10.xy = vec2(_RepeatX, _RepeatY) * u_xlat10.xy + u_xlat24.xy;
    u_xlat10.xy = u_xlat10.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat10.xy = abs(u_xlat10.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat34 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24.x = min(u_xlat34, u_xlat24.x);
    u_xlat10.xy = u_xlat10.xy + u_xlat24.xx;
    u_xlat10.xy = max(u_xlat10.xy, vec2(0.0, 0.0));
    u_xlat10.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = (-u_xlat24.x) + u_xlat10.x;
    u_xlat10.x = u_xlat10.x / abs(_RectMask_WHFrSf.w);
    u_xlat20 = (-u_xlat10.x) + 1.0;
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1.x = (u_xlatb24) ? u_xlat20 : u_xlat10.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb10.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb10.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb10.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb10.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb10.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat10_30 = texture2D(_NoiseTex, u_xlat4.xy).y;
    u_xlat30 = (-u_xlat10_30) + 1.0;
    u_xlat30 = u_xlat30 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat10_4 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat10_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat30) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlatb10.x = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb10.x) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb10.x = u_xlat10_1.x>=u_xlat2.x;
    u_xlat10.x = u_xlatb10.x ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat30;
lowp float u_xlat10_30;
float u_xlat34;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
    u_xlatb10.x = u_xlat4.y<(-u_xlat4.y);
    u_xlat10.x = u_xlatb10.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb10.x = u_xlat10.x<(-u_xlat10.x);
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
    u_xlatb10.x = u_xlatb20.x && u_xlatb10.x;
    u_xlat0.x = (u_xlatb10.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlatb10.x = 0.5<_RectArcUVOn;
    u_xlat10.xy = (u_xlatb10.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _RectTilingAndOffset.zw;
    u_xlat10.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat10.xy;
    u_xlat24.xy = u_xlat10.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat24.xy);
    u_xlat10.xy = (-u_xlat10.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat10.xy = vec2(_RepeatX, _RepeatY) * u_xlat10.xy + u_xlat24.xy;
    u_xlat10.xy = u_xlat10.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat10.xy = abs(u_xlat10.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat34 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24.x = min(u_xlat34, u_xlat24.x);
    u_xlat10.xy = u_xlat10.xy + u_xlat24.xx;
    u_xlat10.xy = max(u_xlat10.xy, vec2(0.0, 0.0));
    u_xlat10.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = (-u_xlat24.x) + u_xlat10.x;
    u_xlat10.x = u_xlat10.x / abs(_RectMask_WHFrSf.w);
    u_xlat20 = (-u_xlat10.x) + 1.0;
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1.x = (u_xlatb24) ? u_xlat20 : u_xlat10.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb10.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb10.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb10.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb10.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb10.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat10_30 = texture2D(_NoiseTex, u_xlat4.xy).y;
    u_xlat30 = (-u_xlat10_30) + 1.0;
    u_xlat30 = u_xlat30 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat10_4 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat10_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat30) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlatb10.x = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb10.x) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb10.x = u_xlat10_1.x>=u_xlat2.x;
    u_xlat10.x = u_xlatb10.x ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    SV_Target0.w = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
mediump vec2 u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
bool u_xlatb18;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb7 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat7.x = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7.x<(-u_xlat7.x));
#else
    u_xlatb7 = u_xlat7.x<(-u_xlat7.x);
#endif
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat14>=(-u_xlat14));
#else
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
#endif
    u_xlatb7 = u_xlatb14.x && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat21 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat21 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat21;
    u_xlat4.x = sin(u_xlat21);
    u_xlat5 = cos(u_xlat21);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat16_2 = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xy = min(max(u_xlat16_9.xy, 0.0), 1.0);
#else
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
#endif
    u_xlat16_9.x = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    SV_Target0.w = u_xlat16_9.x * u_xlat16_2;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
mediump vec2 u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
bool u_xlatb18;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb7 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat7.x = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7.x<(-u_xlat7.x));
#else
    u_xlatb7 = u_xlat7.x<(-u_xlat7.x);
#endif
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat14>=(-u_xlat14));
#else
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
#endif
    u_xlatb7 = u_xlatb14.x && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat21 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat21 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat21;
    u_xlat4.x = sin(u_xlat21);
    u_xlat5 = cos(u_xlat21);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat16_2 = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xy = min(max(u_xlat16_9.xy, 0.0), 1.0);
#else
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
#endif
    u_xlat16_9.x = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    SV_Target0.w = u_xlat16_9.x * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
mediump vec2 u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
bool u_xlatb18;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
    u_xlatb7 = u_xlat4.y<(-u_xlat4.y);
    u_xlat7.x = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb7 = u_xlat7.x<(-u_xlat7.x);
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
    u_xlatb7 = u_xlatb14.x && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat21 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat21 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat21;
    u_xlat4.x = sin(u_xlat21);
    u_xlat5 = cos(u_xlat21);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat16_2 = u_xlat0.x * u_xlat1.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
    u_xlat16_9.x = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    SV_Target0.w = u_xlat16_9.x * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bool u_xlatb7;
mediump vec2 u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
bool u_xlatb18;
float u_xlat21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
    u_xlatb7 = u_xlat4.y<(-u_xlat4.y);
    u_xlat7.x = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb7 = u_xlat7.x<(-u_xlat7.x);
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
    u_xlatb7 = u_xlatb14.x && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat21 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat21 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat21;
    u_xlat4.x = sin(u_xlat21);
    u_xlat5 = cos(u_xlat21);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat16_2 = u_xlat0.x * u_xlat1.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
    u_xlat16_9.x = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    SV_Target0.w = u_xlat16_9.x * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb16.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb16.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat8.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat16 = u_xlat8.x * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat8.x * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat8.x * u_xlat16 + -0.330299497;
    u_xlat8.x = u_xlat8.x * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat8.x * u_xlat0.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb20 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat16 = u_xlatb20 ? u_xlat16 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb8 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat8.x = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat8.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<(-u_xlat8.x));
#else
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
#endif
    u_xlat16 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(u_xlat16>=(-u_xlat16));
#else
    u_xlatb16.x = u_xlat16>=(-u_xlat16);
#endif
    u_xlatb8 = u_xlatb16.x && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat8.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat16 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat16 + u_xlat8.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat8.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat8.x = u_xlat8.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat8.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_RectArcUVOn);
#else
    u_xlatb8 = 0.5<_RectArcUVOn;
#endif
    u_xlat8.xy = (bool(u_xlatb8)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb16.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat8.xy + _RectTilingAndOffset.zw;
    u_xlat8.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat8.xy;
    u_xlat20.xy = u_xlat8.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat20.xy);
    u_xlat8.xy = (-u_xlat8.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat8.xy = vec2(_RepeatX, _RepeatY) * u_xlat8.xy + u_xlat20.xy;
    u_xlat8.xy = u_xlat8.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat8.xy = abs(u_xlat8.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat20.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24 = min(u_xlat24, u_xlat20.x);
    u_xlat8.xy = vec2(u_xlat24) + u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat24) + u_xlat8.x;
    u_xlat8.x = u_xlat8.x / abs(_RectMask_WHFrSf.w);
    u_xlat16 = (-u_xlat8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb24) ? u_xlat16 : u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + _AcrMaskSmooth;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat8.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat8.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat8.x;
    u_xlat5.x = sin(u_xlat8.x);
    u_xlat6 = cos(u_xlat8.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat8.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat8.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_10.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xy = min(max(u_xlat16_10.xy, 0.0), 1.0);
#else
    u_xlat16_10.xy = clamp(u_xlat16_10.xy, 0.0, 1.0);
#endif
    u_xlat16_10.x = max(u_xlat16_10.y, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    SV_Target0.w = u_xlat16_10.x * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb16.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb16.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat8.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat16 = u_xlat8.x * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat8.x * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat8.x * u_xlat16 + -0.330299497;
    u_xlat8.x = u_xlat8.x * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat8.x * u_xlat0.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb20 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat16 = u_xlatb20 ? u_xlat16 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb8 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat8.x = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat8.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<(-u_xlat8.x));
#else
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
#endif
    u_xlat16 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(u_xlat16>=(-u_xlat16));
#else
    u_xlatb16.x = u_xlat16>=(-u_xlat16);
#endif
    u_xlatb8 = u_xlatb16.x && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat8.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat16 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat16 + u_xlat8.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat8.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat8.x = u_xlat8.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat8.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_RectArcUVOn);
#else
    u_xlatb8 = 0.5<_RectArcUVOn;
#endif
    u_xlat8.xy = (bool(u_xlatb8)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb16.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat8.xy + _RectTilingAndOffset.zw;
    u_xlat8.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat8.xy;
    u_xlat20.xy = u_xlat8.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat20.xy);
    u_xlat8.xy = (-u_xlat8.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat8.xy = vec2(_RepeatX, _RepeatY) * u_xlat8.xy + u_xlat20.xy;
    u_xlat8.xy = u_xlat8.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat8.xy = abs(u_xlat8.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat20.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24 = min(u_xlat24, u_xlat20.x);
    u_xlat8.xy = vec2(u_xlat24) + u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat24) + u_xlat8.x;
    u_xlat8.x = u_xlat8.x / abs(_RectMask_WHFrSf.w);
    u_xlat16 = (-u_xlat8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb24) ? u_xlat16 : u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat8.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + _AcrMaskSmooth;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat8.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat8.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat8.x;
    u_xlat5.x = sin(u_xlat8.x);
    u_xlat6 = cos(u_xlat8.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat8.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat8.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_10.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xy = min(max(u_xlat16_10.xy, 0.0), 1.0);
#else
    u_xlat16_10.xy = clamp(u_xlat16_10.xy, 0.0, 1.0);
#endif
    u_xlat16_10.x = max(u_xlat16_10.y, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    SV_Target0.w = u_xlat16_10.x * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb16.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb16.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat8.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat16 = u_xlat8.x * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat8.x * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat8.x * u_xlat16 + -0.330299497;
    u_xlat8.x = u_xlat8.x * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat8.x * u_xlat0.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb20 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat16 = u_xlatb20 ? u_xlat16 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16;
    u_xlatb8 = u_xlat4.y<(-u_xlat4.y);
    u_xlat8.x = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat8.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
    u_xlat16 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb16.x = u_xlat16>=(-u_xlat16);
    u_xlatb8 = u_xlatb16.x && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat8.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat16 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat16 + u_xlat8.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat8.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat8.x = u_xlat8.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat8.x);
    u_xlatb8 = 0.5<_RectArcUVOn;
    u_xlat8.xy = (bool(u_xlatb8)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb16.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat8.xy + _RectTilingAndOffset.zw;
    u_xlat8.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat8.xy;
    u_xlat20.xy = u_xlat8.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat20.xy);
    u_xlat8.xy = (-u_xlat8.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat8.xy = vec2(_RepeatX, _RepeatY) * u_xlat8.xy + u_xlat20.xy;
    u_xlat8.xy = u_xlat8.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat8.xy = abs(u_xlat8.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat20.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24 = min(u_xlat24, u_xlat20.x);
    u_xlat8.xy = vec2(u_xlat24) + u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat24) + u_xlat8.x;
    u_xlat8.x = u_xlat8.x / abs(_RectMask_WHFrSf.w);
    u_xlat16 = (-u_xlat8.x) + 1.0;
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1 = (u_xlatb24) ? u_xlat16 : u_xlat8.x;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat8.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + _AcrMaskSmooth;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat16_1 * u_xlat0.x;
    u_xlat8.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat8.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat8.x;
    u_xlat5.x = sin(u_xlat8.x);
    u_xlat6 = cos(u_xlat8.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat8.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat0.x * u_xlat1.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_10.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_10.xy = clamp(u_xlat16_10.xy, 0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_10.y, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    SV_Target0.w = u_xlat16_10.x * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
vec2 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat16;
bvec2 u_xlatb16;
vec2 u_xlat20;
bool u_xlatb20;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb16.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb16.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2 = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat8.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat16 = u_xlat8.x * 0.0208350997 + -0.0851330012;
    u_xlat16 = u_xlat8.x * u_xlat16 + 0.180141002;
    u_xlat16 = u_xlat8.x * u_xlat16 + -0.330299497;
    u_xlat8.x = u_xlat8.x * u_xlat16 + 0.999866009;
    u_xlat16 = u_xlat8.x * u_xlat0.x;
    u_xlat16 = u_xlat16 * -2.0 + 1.57079637;
    u_xlatb20 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat16 = u_xlatb20 ? u_xlat16 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat8.x + u_xlat16;
    u_xlatb8 = u_xlat4.y<(-u_xlat4.y);
    u_xlat8.x = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat8.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb8 = u_xlat8.x<(-u_xlat8.x);
    u_xlat16 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb16.x = u_xlat16>=(-u_xlat16);
    u_xlatb8 = u_xlatb16.x && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat8.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat8.x = fract(u_xlat8.x);
    u_xlat16 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat16 + u_xlat8.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat8.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat8.x = u_xlat8.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat8.x);
    u_xlatb8 = 0.5<_RectArcUVOn;
    u_xlat8.xy = (bool(u_xlatb8)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb16.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat8.xy + _RectTilingAndOffset.zw;
    u_xlat8.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat8.xy;
    u_xlat20.xy = u_xlat8.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat20.xy);
    u_xlat8.xy = (-u_xlat8.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat8.xy = vec2(_RepeatX, _RepeatY) * u_xlat8.xy + u_xlat20.xy;
    u_xlat8.xy = u_xlat8.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat8.xy = abs(u_xlat8.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat20.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24 = min(u_xlat24, u_xlat20.x);
    u_xlat8.xy = vec2(u_xlat24) + u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(0.0, 0.0));
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat24) + u_xlat8.x;
    u_xlat8.x = u_xlat8.x / abs(_RectMask_WHFrSf.w);
    u_xlat16 = (-u_xlat8.x) + 1.0;
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1 = (u_xlatb24) ? u_xlat16 : u_xlat8.x;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat8.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat8.x = (-u_xlat8.x) + _AcrMaskSmooth;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat16_1 * u_xlat0.x;
    u_xlat8.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat8.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat8.x;
    u_xlat5.x = sin(u_xlat8.x);
    u_xlat6 = cos(u_xlat8.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat8.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat0.x * u_xlat1.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_10.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_10.xy = clamp(u_xlat16_10.xy, 0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_10.y, u_xlat16_10.x);
    u_xlat16_10.x = (-u_xlat16_10.x) + 1.0;
    SV_Target0.w = u_xlat16_10.x * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bvec2 u_xlatb7;
mediump vec2 u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb7.x = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat7.x = u_xlatb7.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(u_xlat7.x<(-u_xlat7.x));
#else
    u_xlatb7.x = u_xlat7.x<(-u_xlat7.x);
#endif
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat14>=(-u_xlat14));
#else
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
#endif
    u_xlatb7.x = u_xlatb14.x && u_xlatb7.x;
    u_xlat0.x = (u_xlatb7.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(0.5<_RectArcUVOn);
#else
    u_xlatb7.x = 0.5<_RectArcUVOn;
#endif
    u_xlat7.xy = (u_xlatb7.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _RectTilingAndOffset.zw;
    u_xlat7.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat7.xy;
    u_xlat18.xy = u_xlat7.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat18.xy);
    u_xlat7.xy = (-u_xlat7.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat7.xy = vec2(_RepeatX, _RepeatY) * u_xlat7.xy + u_xlat18.xy;
    u_xlat7.xy = u_xlat7.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat7.xy = abs(u_xlat7.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat18.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat25 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat18.x = min(u_xlat25, u_xlat18.x);
    u_xlat7.xy = u_xlat7.xy + u_xlat18.xx;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat18.x) + u_xlat7.x;
    u_xlat7.x = u_xlat7.x / abs(_RectMask_WHFrSf.w);
    u_xlat14 = (-u_xlat7.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb18 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb18) ? u_xlat14 : u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb7.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb7.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb7.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb7.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).y;
    u_xlat21 = (-u_xlat16_21) + 1.0;
    u_xlat21 = u_xlat21 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat16_4 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xy = min(max(u_xlat16_9.xy, 0.0), 1.0);
#else
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
#endif
    u_xlat16_9.x = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    SV_Target0.w = u_xlat16_9.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bvec2 u_xlatb7;
mediump vec2 u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb7.x = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat7.x = u_xlatb7.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(u_xlat7.x<(-u_xlat7.x));
#else
    u_xlatb7.x = u_xlat7.x<(-u_xlat7.x);
#endif
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat14>=(-u_xlat14));
#else
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
#endif
    u_xlatb7.x = u_xlatb14.x && u_xlatb7.x;
    u_xlat0.x = (u_xlatb7.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(0.5<_RectArcUVOn);
#else
    u_xlatb7.x = 0.5<_RectArcUVOn;
#endif
    u_xlat7.xy = (u_xlatb7.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _RectTilingAndOffset.zw;
    u_xlat7.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat7.xy;
    u_xlat18.xy = u_xlat7.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat18.xy);
    u_xlat7.xy = (-u_xlat7.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat7.xy = vec2(_RepeatX, _RepeatY) * u_xlat7.xy + u_xlat18.xy;
    u_xlat7.xy = u_xlat7.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat7.xy = abs(u_xlat7.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat18.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat25 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat18.x = min(u_xlat25, u_xlat18.x);
    u_xlat7.xy = u_xlat7.xy + u_xlat18.xx;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat18.x) + u_xlat7.x;
    u_xlat7.x = u_xlat7.x / abs(_RectMask_WHFrSf.w);
    u_xlat14 = (-u_xlat7.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb18 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb18) ? u_xlat14 : u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb7.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb7.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb7.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb7.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).y;
    u_xlat21 = (-u_xlat16_21) + 1.0;
    u_xlat21 = u_xlat21 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat16_4 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xy = min(max(u_xlat16_9.xy, 0.0), 1.0);
#else
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
#endif
    u_xlat16_9.x = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    SV_Target0.w = u_xlat16_9.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bvec2 u_xlatb7;
mediump vec2 u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
    u_xlatb7.x = u_xlat4.y<(-u_xlat4.y);
    u_xlat7.x = u_xlatb7.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb7.x = u_xlat7.x<(-u_xlat7.x);
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
    u_xlatb7.x = u_xlatb14.x && u_xlatb7.x;
    u_xlat0.x = (u_xlatb7.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlatb7.x = 0.5<_RectArcUVOn;
    u_xlat7.xy = (u_xlatb7.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _RectTilingAndOffset.zw;
    u_xlat7.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat7.xy;
    u_xlat18.xy = u_xlat7.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat18.xy);
    u_xlat7.xy = (-u_xlat7.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat7.xy = vec2(_RepeatX, _RepeatY) * u_xlat7.xy + u_xlat18.xy;
    u_xlat7.xy = u_xlat7.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat7.xy = abs(u_xlat7.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat18.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat25 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat18.x = min(u_xlat25, u_xlat18.x);
    u_xlat7.xy = u_xlat7.xy + u_xlat18.xx;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat18.x) + u_xlat7.x;
    u_xlat7.x = u_xlat7.x / abs(_RectMask_WHFrSf.w);
    u_xlat14 = (-u_xlat7.x) + 1.0;
    u_xlatb18 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1 = (u_xlatb18) ? u_xlat14 : u_xlat7.x;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat16_1 * u_xlat0.x;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb7.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb7.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb7.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb7.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).y;
    u_xlat21 = (-u_xlat10_21) + 1.0;
    u_xlat21 = u_xlat21 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat10_4 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat10_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2.x = u_xlat0.x * u_xlat1.w;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
    u_xlat16_9.x = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    SV_Target0.w = u_xlat16_9.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
bvec2 u_xlatb7;
mediump vec2 u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat21;
lowp float u_xlat10_21;
float u_xlat25;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1 = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1);
    u_xlat16_1 = sin(u_xlat16_1);
    u_xlat16_3.z = u_xlat16_1;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat14 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat14 = u_xlat7.x * u_xlat14 + 0.180141002;
    u_xlat14 = u_xlat7.x * u_xlat14 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat14 + 0.999866009;
    u_xlat14 = u_xlat7.x * u_xlat0.x;
    u_xlat14 = u_xlat14 * -2.0 + 1.57079637;
    u_xlatb18 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14 = u_xlatb18 ? u_xlat14 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7.x + u_xlat14;
    u_xlatb7.x = u_xlat4.y<(-u_xlat4.y);
    u_xlat7.x = u_xlatb7.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7.x + u_xlat0.x;
    u_xlat7.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb7.x = u_xlat7.x<(-u_xlat7.x);
    u_xlat14 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb14.x = u_xlat14>=(-u_xlat14);
    u_xlatb7.x = u_xlatb14.x && u_xlatb7.x;
    u_xlat0.x = (u_xlatb7.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat7.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat14 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat14 + u_xlat7.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat7.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat7.x = u_xlat7.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat7.x);
    u_xlatb7.x = 0.5<_RectArcUVOn;
    u_xlat7.xy = (u_xlatb7.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _RectTilingAndOffset.zw;
    u_xlat7.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat7.xy;
    u_xlat18.xy = u_xlat7.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat18.xy);
    u_xlat7.xy = (-u_xlat7.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat7.xy = vec2(_RepeatX, _RepeatY) * u_xlat7.xy + u_xlat18.xy;
    u_xlat7.xy = u_xlat7.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat7.xy = abs(u_xlat7.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat18.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat25 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat18.x = min(u_xlat25, u_xlat18.x);
    u_xlat7.xy = u_xlat7.xy + u_xlat18.xx;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat18.x) + u_xlat7.x;
    u_xlat7.x = u_xlat7.x / abs(_RectMask_WHFrSf.w);
    u_xlat14 = (-u_xlat7.x) + 1.0;
    u_xlatb18 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1 = (u_xlatb18) ? u_xlat14 : u_xlat7.x;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat7.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat0.x;
    u_xlat7.x = (-u_xlat7.x) + _AcrMaskSmooth;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat16_1 * u_xlat0.x;
    u_xlatb7.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb7.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb7.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb7.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb7.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat7.xy = (u_xlatb14.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy + _DiffuseArcXYVxVy.xy;
    u_xlat7.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat7.xy;
    u_xlat7.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).y;
    u_xlat21 = (-u_xlat10_21) + 1.0;
    u_xlat21 = u_xlat21 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat10_4 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat10_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat7.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat7.xy, u_xlat6.yz);
    u_xlat7.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat7.xy = u_xlat7.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2.x = u_xlat0.x * u_xlat1.w;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_9.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
    u_xlat16_9.x = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_9.x) + 1.0;
    SV_Target0.w = u_xlat16_9.x * u_xlat16_2.x;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb10 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat10.x = u_xlatb10 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10.x<(-u_xlat10.x));
#else
    u_xlatb10 = u_xlat10.x<(-u_xlat10.x);
#endif
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat20>=(-u_xlat20));
#else
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
#endif
    u_xlatb10 = u_xlatb20.x && u_xlatb10;
    u_xlat0.x = (u_xlatb10) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat30 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat30;
    u_xlat4.x = sin(u_xlat30);
    u_xlat5 = cos(u_xlat30);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb10 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb10 = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat16_17.x>=(-u_xlat16_17.x));
#else
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
#endif
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat16_7.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_17.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_17.xy = u_xlat16_17.xy + u_xlat16_17.xy;
    u_xlat16_17.xy = abs(u_xlat16_17.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xy = min(max(u_xlat16_17.xy, 0.0), 1.0);
#else
    u_xlat16_17.xy = clamp(u_xlat16_17.xy, 0.0, 1.0);
#endif
    u_xlat16_17.x = max(u_xlat16_17.y, u_xlat16_17.x);
    u_xlat16_17.x = (-u_xlat16_17.x) + 1.0;
    SV_Target0.w = u_xlat16_17.x * u_xlat16_7.x;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb10 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat10.x = u_xlatb10 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10.x<(-u_xlat10.x));
#else
    u_xlatb10 = u_xlat10.x<(-u_xlat10.x);
#endif
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat20>=(-u_xlat20));
#else
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
#endif
    u_xlatb10 = u_xlatb20.x && u_xlatb10;
    u_xlat0.x = (u_xlatb10) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat30 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat30;
    u_xlat4.x = sin(u_xlat30);
    u_xlat5 = cos(u_xlat30);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb10 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb10 = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat16_17.x>=(-u_xlat16_17.x));
#else
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
#endif
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat16_7.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_17.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_17.xy = u_xlat16_17.xy + u_xlat16_17.xy;
    u_xlat16_17.xy = abs(u_xlat16_17.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xy = min(max(u_xlat16_17.xy, 0.0), 1.0);
#else
    u_xlat16_17.xy = clamp(u_xlat16_17.xy, 0.0, 1.0);
#endif
    u_xlat16_17.x = max(u_xlat16_17.y, u_xlat16_17.x);
    u_xlat16_17.x = (-u_xlat16_17.x) + 1.0;
    SV_Target0.w = u_xlat16_17.x * u_xlat16_7.x;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
    u_xlatb10 = u_xlat4.y<(-u_xlat4.y);
    u_xlat10.x = u_xlatb10 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb10 = u_xlat10.x<(-u_xlat10.x);
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
    u_xlatb10 = u_xlatb20.x && u_xlatb10;
    u_xlat0.x = (u_xlatb10) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat30 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat30;
    u_xlat4.x = sin(u_xlat30);
    u_xlat5 = cos(u_xlat30);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlatb10 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb10 = u_xlat10_1.x>=u_xlat2.x;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat16_7.x = u_xlat0.x * u_xlat1.w;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_17.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_17.xy = u_xlat16_17.xy + u_xlat16_17.xy;
    u_xlat16_17.xy = abs(u_xlat16_17.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_17.xy = clamp(u_xlat16_17.xy, 0.0, 1.0);
    u_xlat16_17.x = max(u_xlat16_17.y, u_xlat16_17.x);
    u_xlat16_17.x = (-u_xlat16_17.x) + 1.0;
    SV_Target0.w = u_xlat16_17.x * u_xlat16_7.x;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
    u_xlatb10 = u_xlat4.y<(-u_xlat4.y);
    u_xlat10.x = u_xlatb10 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb10 = u_xlat10.x<(-u_xlat10.x);
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
    u_xlatb10 = u_xlatb20.x && u_xlatb10;
    u_xlat0.x = (u_xlatb10) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat30 = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat30;
    u_xlat4.x = sin(u_xlat30);
    u_xlat5 = cos(u_xlat30);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlatb10 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb10 = u_xlat10_1.x>=u_xlat2.x;
    u_xlat10.x = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat16_7.x = u_xlat0.x * u_xlat1.w;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_17.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_17.xy = u_xlat16_17.xy + u_xlat16_17.xy;
    u_xlat16_17.xy = abs(u_xlat16_17.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_17.xy = clamp(u_xlat16_17.xy, 0.0, 1.0);
    u_xlat16_17.x = max(u_xlat16_17.y, u_xlat16_17.x);
    u_xlat16_17.x = (-u_xlat16_17.x) + 1.0;
    SV_Target0.w = u_xlat16_17.x * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_9;
mediump vec2 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_19;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb22.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb22.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat11.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat11.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat11.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat11.x * u_xlat22 + -0.330299497;
    u_xlat11.x = u_xlat11.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat11.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb26 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat22 = u_xlatb26 ? u_xlat22 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb11 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat11.x = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat11.x + u_xlat0.x;
    u_xlat11.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x<(-u_xlat11.x));
#else
    u_xlatb11 = u_xlat11.x<(-u_xlat11.x);
#endif
    u_xlat22 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22.x = u_xlat22>=(-u_xlat22);
#endif
    u_xlatb11 = u_xlatb22.x && u_xlatb11;
    u_xlat0.x = (u_xlatb11) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat11.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat11.x = fract(u_xlat11.x);
    u_xlat22 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat11.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat11.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat11.x = u_xlat11.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(0.5<_RectArcUVOn);
#else
    u_xlatb11 = 0.5<_RectArcUVOn;
#endif
    u_xlat11.xy = (bool(u_xlatb11)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb22.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat11.xy = u_xlat11.xy + _RectTilingAndOffset.zw;
    u_xlat11.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat11.xy;
    u_xlat26.xy = u_xlat11.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat26.xy);
    u_xlat11.xy = (-u_xlat11.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat11.xy = vec2(_RepeatX, _RepeatY) * u_xlat11.xy + u_xlat26.xy;
    u_xlat11.xy = u_xlat11.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat11.xy = abs(u_xlat11.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat33 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat26.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat33 = min(u_xlat33, u_xlat26.x);
    u_xlat11.xy = vec2(u_xlat33) + u_xlat11.xy;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = (-u_xlat33) + u_xlat11.x;
    u_xlat11.x = u_xlat11.x / abs(_RectMask_WHFrSf.w);
    u_xlat22 = (-u_xlat11.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb33 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat11.x) + u_xlat0.x;
    u_xlat11.x = (-u_xlat11.x) + _AcrMaskSmooth;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat11.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat11.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat11.x;
    u_xlat5.x = sin(u_xlat11.x);
    u_xlat6 = cos(u_xlat11.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat11.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat11.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb11 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb11 = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat11.x = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat11.xxxx * u_xlat3 + u_xlat2;
    u_xlat11.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.x;
    u_xlat22 = u_xlat11.x * 6.0 + 1.00000001e-10;
    u_xlat33 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat22 = u_xlat33 / u_xlat22;
    u_xlat22 = u_xlat22 + u_xlat2.z;
    u_xlat16_8.x = abs(u_xlat22) + _HSV_Vector.x;
    u_xlat16_19.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat16_19.x>=(-u_xlat16_19.x));
#else
    u_xlatb22.x = u_xlat16_19.x>=(-u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb22.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_19.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat16_19.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat22 = u_xlat2.x + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat22;
    u_xlat16_8.x = u_xlat11.x * _HSV_Vector.y;
    u_xlat11.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat16_8.xyz = u_xlat11.xyz * _HSV_Vector.zzz;
    u_xlat16_41 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_41 = u_xlat16_41 + (-_SaturateWeights.y);
    u_xlat16_9.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_9.xy = vec2(1.0, 1.0) / u_xlat16_9.xy;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_41 * -2.0 + 3.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_41) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat11.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_8.x = _RampColorRotator * 0.0174532924;
    u_xlat16_10.x = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_10.y = u_xlat16_8.x;
    u_xlat11.x = dot(u_xlat11.xy, u_xlat16_10.xy);
    u_xlat11.x = u_xlat11.x + 0.5;
    u_xlat16_8.x = u_xlat11.x + (-_SaturateWeights.z);
    u_xlat16_8.x = u_xlat16_9.y * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_19.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_8.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_8.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_19.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_19.xy = u_xlat16_19.xy + u_xlat16_19.xy;
    u_xlat16_19.xy = abs(u_xlat16_19.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.xy = min(max(u_xlat16_19.xy, 0.0), 1.0);
#else
    u_xlat16_19.xy = clamp(u_xlat16_19.xy, 0.0, 1.0);
#endif
    u_xlat16_19.x = max(u_xlat16_19.y, u_xlat16_19.x);
    u_xlat16_19.x = (-u_xlat16_19.x) + 1.0;
    SV_Target0.w = u_xlat16_19.x * u_xlat16_8.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_9;
mediump vec2 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_19;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb22.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb22.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat11.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat11.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat11.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat11.x * u_xlat22 + -0.330299497;
    u_xlat11.x = u_xlat11.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat11.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb26 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat22 = u_xlatb26 ? u_xlat22 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb11 = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat11.x = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat11.x + u_xlat0.x;
    u_xlat11.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat11.x<(-u_xlat11.x));
#else
    u_xlatb11 = u_xlat11.x<(-u_xlat11.x);
#endif
    u_xlat22 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22.x = u_xlat22>=(-u_xlat22);
#endif
    u_xlatb11 = u_xlatb22.x && u_xlatb11;
    u_xlat0.x = (u_xlatb11) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat11.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat11.x = fract(u_xlat11.x);
    u_xlat22 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat11.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat11.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat11.x = u_xlat11.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat11.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(0.5<_RectArcUVOn);
#else
    u_xlatb11 = 0.5<_RectArcUVOn;
#endif
    u_xlat11.xy = (bool(u_xlatb11)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb22.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat11.xy = u_xlat11.xy + _RectTilingAndOffset.zw;
    u_xlat11.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat11.xy;
    u_xlat26.xy = u_xlat11.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat26.xy);
    u_xlat11.xy = (-u_xlat11.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat11.xy = vec2(_RepeatX, _RepeatY) * u_xlat11.xy + u_xlat26.xy;
    u_xlat11.xy = u_xlat11.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat11.xy = abs(u_xlat11.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat33 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat26.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat33 = min(u_xlat33, u_xlat26.x);
    u_xlat11.xy = vec2(u_xlat33) + u_xlat11.xy;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = (-u_xlat33) + u_xlat11.x;
    u_xlat11.x = u_xlat11.x / abs(_RectMask_WHFrSf.w);
    u_xlat22 = (-u_xlat11.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb33 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat11.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat11.x) + u_xlat0.x;
    u_xlat11.x = (-u_xlat11.x) + _AcrMaskSmooth;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat11.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat11.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat11.x;
    u_xlat5.x = sin(u_xlat11.x);
    u_xlat6 = cos(u_xlat11.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat11.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat11.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb11 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb11 = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat11.x = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat11.xxxx * u_xlat3 + u_xlat2;
    u_xlat11.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.x;
    u_xlat22 = u_xlat11.x * 6.0 + 1.00000001e-10;
    u_xlat33 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat22 = u_xlat33 / u_xlat22;
    u_xlat22 = u_xlat22 + u_xlat2.z;
    u_xlat16_8.x = abs(u_xlat22) + _HSV_Vector.x;
    u_xlat16_19.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22.x = !!(u_xlat16_19.x>=(-u_xlat16_19.x));
#else
    u_xlatb22.x = u_xlat16_19.x>=(-u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb22.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_19.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat16_19.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat22 = u_xlat2.x + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat22;
    u_xlat16_8.x = u_xlat11.x * _HSV_Vector.y;
    u_xlat11.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat16_8.xyz = u_xlat11.xyz * _HSV_Vector.zzz;
    u_xlat16_41 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_41 = u_xlat16_41 + (-_SaturateWeights.y);
    u_xlat16_9.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_9.xy = vec2(1.0, 1.0) / u_xlat16_9.xy;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41 = min(max(u_xlat16_41, 0.0), 1.0);
#else
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_41 * -2.0 + 3.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_41) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat11.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_8.x = _RampColorRotator * 0.0174532924;
    u_xlat16_10.x = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_10.y = u_xlat16_8.x;
    u_xlat11.x = dot(u_xlat11.xy, u_xlat16_10.xy);
    u_xlat11.x = u_xlat11.x + 0.5;
    u_xlat16_8.x = u_xlat11.x + (-_SaturateWeights.z);
    u_xlat16_8.x = u_xlat16_9.y * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_19.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_8.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_8.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_19.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_19.xy = u_xlat16_19.xy + u_xlat16_19.xy;
    u_xlat16_19.xy = abs(u_xlat16_19.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.xy = min(max(u_xlat16_19.xy, 0.0), 1.0);
#else
    u_xlat16_19.xy = clamp(u_xlat16_19.xy, 0.0, 1.0);
#endif
    u_xlat16_19.x = max(u_xlat16_19.y, u_xlat16_19.x);
    u_xlat16_19.x = (-u_xlat16_19.x) + 1.0;
    SV_Target0.w = u_xlat16_19.x * u_xlat16_8.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_9;
mediump vec2 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_19;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb22.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb22.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat11.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat11.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat11.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat11.x * u_xlat22 + -0.330299497;
    u_xlat11.x = u_xlat11.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat11.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
    u_xlatb26 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat22 = u_xlatb26 ? u_xlat22 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat22;
    u_xlatb11 = u_xlat4.y<(-u_xlat4.y);
    u_xlat11.x = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat11.x + u_xlat0.x;
    u_xlat11.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb11 = u_xlat11.x<(-u_xlat11.x);
    u_xlat22 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb22.x = u_xlat22>=(-u_xlat22);
    u_xlatb11 = u_xlatb22.x && u_xlatb11;
    u_xlat0.x = (u_xlatb11) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat11.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat11.x = fract(u_xlat11.x);
    u_xlat22 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat11.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat11.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat11.x = u_xlat11.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat11.x);
    u_xlatb11 = 0.5<_RectArcUVOn;
    u_xlat11.xy = (bool(u_xlatb11)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb22.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat11.xy = u_xlat11.xy + _RectTilingAndOffset.zw;
    u_xlat11.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat11.xy;
    u_xlat26.xy = u_xlat11.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat26.xy);
    u_xlat11.xy = (-u_xlat11.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat11.xy = vec2(_RepeatX, _RepeatY) * u_xlat11.xy + u_xlat26.xy;
    u_xlat11.xy = u_xlat11.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat11.xy = abs(u_xlat11.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat33 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat26.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat33 = min(u_xlat33, u_xlat26.x);
    u_xlat11.xy = vec2(u_xlat33) + u_xlat11.xy;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = (-u_xlat33) + u_xlat11.x;
    u_xlat11.x = u_xlat11.x / abs(_RectMask_WHFrSf.w);
    u_xlat22 = (-u_xlat11.x) + 1.0;
    u_xlatb33 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat11.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat11.x) + u_xlat0.x;
    u_xlat11.x = (-u_xlat11.x) + _AcrMaskSmooth;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat11.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat11.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat11.x;
    u_xlat5.x = sin(u_xlat11.x);
    u_xlat6 = cos(u_xlat11.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat11.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat11.xy);
    u_xlatb11 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb11 = u_xlat10_1.x>=u_xlat2.x;
    u_xlat11.x = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat11.xxxx * u_xlat3 + u_xlat2;
    u_xlat11.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.x;
    u_xlat22 = u_xlat11.x * 6.0 + 1.00000001e-10;
    u_xlat33 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat22 = u_xlat33 / u_xlat22;
    u_xlat22 = u_xlat22 + u_xlat2.z;
    u_xlat16_8.x = abs(u_xlat22) + _HSV_Vector.x;
    u_xlat16_19.x = u_xlat16_8.x * 360.0;
    u_xlatb22.x = u_xlat16_19.x>=(-u_xlat16_19.x);
    u_xlat16_19.xy = (u_xlatb22.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_19.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat16_19.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat22 = u_xlat2.x + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat22;
    u_xlat16_8.x = u_xlat11.x * _HSV_Vector.y;
    u_xlat11.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat16_8.xyz = u_xlat11.xyz * _HSV_Vector.zzz;
    u_xlat16_41 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_41 = u_xlat16_41 + (-_SaturateWeights.y);
    u_xlat16_9.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_9.xy = vec2(1.0, 1.0) / u_xlat16_9.xy;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_41 * -2.0 + 3.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_41) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat11.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_8.x = _RampColorRotator * 0.0174532924;
    u_xlat16_10.x = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_10.y = u_xlat16_8.x;
    u_xlat11.x = dot(u_xlat11.xy, u_xlat16_10.xy);
    u_xlat11.x = u_xlat11.x + 0.5;
    u_xlat16_8.x = u_xlat11.x + (-_SaturateWeights.z);
    u_xlat16_8.x = u_xlat16_9.y * u_xlat16_8.x;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_19.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_19.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_8.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_8.x = u_xlat0.x * u_xlat1.w;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_19.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_19.xy = u_xlat16_19.xy + u_xlat16_19.xy;
    u_xlat16_19.xy = abs(u_xlat16_19.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_19.xy = clamp(u_xlat16_19.xy, 0.0, 1.0);
    u_xlat16_19.x = max(u_xlat16_19.y, u_xlat16_19.x);
    u_xlat16_19.x = (-u_xlat16_19.x) + 1.0;
    SV_Target0.w = u_xlat16_19.x * u_xlat16_8.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
float u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_9;
mediump vec2 u_xlat16_10;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_19;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat26;
bool u_xlatb26;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb22.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb22.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat11.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat11.x * 0.0208350997 + -0.0851330012;
    u_xlat22 = u_xlat11.x * u_xlat22 + 0.180141002;
    u_xlat22 = u_xlat11.x * u_xlat22 + -0.330299497;
    u_xlat11.x = u_xlat11.x * u_xlat22 + 0.999866009;
    u_xlat22 = u_xlat11.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * -2.0 + 1.57079637;
    u_xlatb26 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat22 = u_xlatb26 ? u_xlat22 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat11.x + u_xlat22;
    u_xlatb11 = u_xlat4.y<(-u_xlat4.y);
    u_xlat11.x = u_xlatb11 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat11.x + u_xlat0.x;
    u_xlat11.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb11 = u_xlat11.x<(-u_xlat11.x);
    u_xlat22 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb22.x = u_xlat22>=(-u_xlat22);
    u_xlatb11 = u_xlatb22.x && u_xlatb11;
    u_xlat0.x = (u_xlatb11) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat11.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat11.x = fract(u_xlat11.x);
    u_xlat22 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat22 + u_xlat11.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat11.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat11.x = u_xlat11.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat11.x);
    u_xlatb11 = 0.5<_RectArcUVOn;
    u_xlat11.xy = (bool(u_xlatb11)) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = (u_xlatb22.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = u_xlat4.xy + _DiffuseArcXYVxVy.xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat11.xy = u_xlat11.xy + _RectTilingAndOffset.zw;
    u_xlat11.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat11.xy;
    u_xlat26.xy = u_xlat11.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat26.xy);
    u_xlat11.xy = (-u_xlat11.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat11.xy = vec2(_RepeatX, _RepeatY) * u_xlat11.xy + u_xlat26.xy;
    u_xlat11.xy = u_xlat11.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat11.xy = abs(u_xlat11.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat33 = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat26.x = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat33 = min(u_xlat33, u_xlat26.x);
    u_xlat11.xy = vec2(u_xlat33) + u_xlat11.xy;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = (-u_xlat33) + u_xlat11.x;
    u_xlat11.x = u_xlat11.x / abs(_RectMask_WHFrSf.w);
    u_xlat22 = (-u_xlat11.x) + 1.0;
    u_xlatb33 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat11.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat11.x) + u_xlat0.x;
    u_xlat11.x = (-u_xlat11.x) + _AcrMaskSmooth;
    u_xlat11.x = float(1.0) / u_xlat11.x;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlat11.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat11.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat11.x;
    u_xlat5.x = sin(u_xlat11.x);
    u_xlat6 = cos(u_xlat11.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat5.y = dot(u_xlat4.xy, u_xlat7.xy);
    u_xlat5.x = dot(u_xlat4.xy, u_xlat7.yz);
    u_xlat11.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _DiffuseArcTilingRoaRov.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat11.xy);
    u_xlatb11 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb11 = u_xlat10_1.x>=u_xlat2.x;
    u_xlat11.x = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat11.xxxx * u_xlat3 + u_xlat2;
    u_xlat11.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat11.x = (-u_xlat11.x) + u_xlat2.x;
    u_xlat22 = u_xlat11.x * 6.0 + 1.00000001e-10;
    u_xlat33 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat22 = u_xlat33 / u_xlat22;
    u_xlat22 = u_xlat22 + u_xlat2.z;
    u_xlat16_8.x = abs(u_xlat22) + _HSV_Vector.x;
    u_xlat16_19.x = u_xlat16_8.x * 360.0;
    u_xlatb22.x = u_xlat16_19.x>=(-u_xlat16_19.x);
    u_xlat16_19.xy = (u_xlatb22.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_19.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat4.xyz = u_xlat16_19.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat22 = u_xlat2.x + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat22;
    u_xlat16_8.x = u_xlat11.x * _HSV_Vector.y;
    u_xlat11.xyz = u_xlat16_8.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat16_8.xyz = u_xlat11.xyz * _HSV_Vector.zzz;
    u_xlat16_41 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_41 = u_xlat16_41 + (-_SaturateWeights.y);
    u_xlat16_9.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_9.xy = vec2(1.0, 1.0) / u_xlat16_9.xy;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_41 * -2.0 + 3.0;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_41;
    u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_41) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat11.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_8.x = _RampColorRotator * 0.0174532924;
    u_xlat16_10.x = cos(u_xlat16_8.x);
    u_xlat16_8.x = sin(u_xlat16_8.x);
    u_xlat16_10.y = u_xlat16_8.x;
    u_xlat11.x = dot(u_xlat11.xy, u_xlat16_10.xy);
    u_xlat11.x = u_xlat11.x + 0.5;
    u_xlat16_8.x = u_xlat11.x + (-_SaturateWeights.z);
    u_xlat16_8.x = u_xlat16_9.y * u_xlat16_8.x;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_19.x = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_19.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_8.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_8.x = u_xlat0.x * u_xlat1.w;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_19.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_19.xy = u_xlat16_19.xy + u_xlat16_19.xy;
    u_xlat16_19.xy = abs(u_xlat16_19.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_19.xy = clamp(u_xlat16_19.xy, 0.0, 1.0);
    u_xlat16_19.x = max(u_xlat16_19.y, u_xlat16_19.x);
    u_xlat16_19.x = (-u_xlat16_19.x) + 1.0;
    SV_Target0.w = u_xlat16_19.x * u_xlat16_8.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb10.x = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat10.x = u_xlatb10.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat10.x<(-u_xlat10.x));
#else
    u_xlatb10.x = u_xlat10.x<(-u_xlat10.x);
#endif
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat20>=(-u_xlat20));
#else
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
#endif
    u_xlatb10.x = u_xlatb20.x && u_xlatb10.x;
    u_xlat0.x = (u_xlatb10.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(0.5<_RectArcUVOn);
#else
    u_xlatb10.x = 0.5<_RectArcUVOn;
#endif
    u_xlat10.xy = (u_xlatb10.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _RectTilingAndOffset.zw;
    u_xlat10.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat10.xy;
    u_xlat24.xy = u_xlat10.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat24.xy);
    u_xlat10.xy = (-u_xlat10.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat10.xy = vec2(_RepeatX, _RepeatY) * u_xlat10.xy + u_xlat24.xy;
    u_xlat10.xy = u_xlat10.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat10.xy = abs(u_xlat10.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat34 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24.x = min(u_xlat34, u_xlat24.x);
    u_xlat10.xy = u_xlat10.xy + u_xlat24.xx;
    u_xlat10.xy = max(u_xlat10.xy, vec2(0.0, 0.0));
    u_xlat10.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = (-u_xlat24.x) + u_xlat10.x;
    u_xlat10.x = u_xlat10.x / abs(_RectMask_WHFrSf.w);
    u_xlat20 = (-u_xlat10.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb24) ? u_xlat20 : u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb10.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb10.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb10.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb10.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb10.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat16_30 = texture(_NoiseTex, u_xlat4.xy).y;
    u_xlat30 = (-u_xlat16_30) + 1.0;
    u_xlat30 = u_xlat30 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat16_4 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat30) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb10.x = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb10.x) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb10.x = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat10.x = u_xlatb10.x ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat16_17.x>=(-u_xlat16_17.x));
#else
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
#endif
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_7.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_17.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_17.xy = u_xlat16_17.xy + u_xlat16_17.xy;
    u_xlat16_17.xy = abs(u_xlat16_17.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xy = min(max(u_xlat16_17.xy, 0.0), 1.0);
#else
    u_xlat16_17.xy = clamp(u_xlat16_17.xy, 0.0, 1.0);
#endif
    u_xlat16_17.x = max(u_xlat16_17.y, u_xlat16_17.x);
    u_xlat16_17.x = (-u_xlat16_17.x) + 1.0;
    SV_Target0.w = u_xlat16_17.x * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat4.y<(-u_xlat4.y));
#else
    u_xlatb10.x = u_xlat4.y<(-u_xlat4.y);
#endif
    u_xlat10.x = u_xlatb10.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat10.x<(-u_xlat10.x));
#else
    u_xlatb10.x = u_xlat10.x<(-u_xlat10.x);
#endif
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat20>=(-u_xlat20));
#else
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
#endif
    u_xlatb10.x = u_xlatb20.x && u_xlatb10.x;
    u_xlat0.x = (u_xlatb10.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(0.5<_RectArcUVOn);
#else
    u_xlatb10.x = 0.5<_RectArcUVOn;
#endif
    u_xlat10.xy = (u_xlatb10.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _RectTilingAndOffset.zw;
    u_xlat10.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat10.xy;
    u_xlat24.xy = u_xlat10.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat24.xy);
    u_xlat10.xy = (-u_xlat10.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat10.xy = vec2(_RepeatX, _RepeatY) * u_xlat10.xy + u_xlat24.xy;
    u_xlat10.xy = u_xlat10.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat10.xy = abs(u_xlat10.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat34 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24.x = min(u_xlat34, u_xlat24.x);
    u_xlat10.xy = u_xlat10.xy + u_xlat24.xx;
    u_xlat10.xy = max(u_xlat10.xy, vec2(0.0, 0.0));
    u_xlat10.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = (-u_xlat24.x) + u_xlat10.x;
    u_xlat10.x = u_xlat10.x / abs(_RectMask_WHFrSf.w);
    u_xlat20 = (-u_xlat10.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_RectMask_WHFrSf.w>=0.0);
#else
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
#endif
    u_xlat16_1.x = (u_xlatb24) ? u_xlat20 : u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb10.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb10.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb10.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb10.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb10.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat16_30 = texture(_NoiseTex, u_xlat4.xy).y;
    u_xlat30 = (-u_xlat16_30) + 1.0;
    u_xlat30 = u_xlat30 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat16_4 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat30) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
    u_xlatb10.x = u_xlat16_1.y>=u_xlat16_1.z;
#endif
    u_xlat16_2.x = (u_xlatb10.x) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat16_1.zy;
    u_xlat4.xy = u_xlat16_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10.x = !!(u_xlat16_1.x>=u_xlat2.x);
#else
    u_xlatb10.x = u_xlat16_1.x>=u_xlat2.x;
#endif
    u_xlat10.x = u_xlatb10.x ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat16_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20.x = !!(u_xlat16_17.x>=(-u_xlat16_17.x));
#else
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
#endif
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat16_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_7.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_17.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_17.xy = u_xlat16_17.xy + u_xlat16_17.xy;
    u_xlat16_17.xy = abs(u_xlat16_17.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xy = min(max(u_xlat16_17.xy, 0.0), 1.0);
#else
    u_xlat16_17.xy = clamp(u_xlat16_17.xy, 0.0, 1.0);
#endif
    u_xlat16_17.x = max(u_xlat16_17.y, u_xlat16_17.x);
    u_xlat16_17.x = (-u_xlat16_17.x) + 1.0;
    SV_Target0.w = u_xlat16_17.x * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat30;
lowp float u_xlat10_30;
float u_xlat34;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
    u_xlatb10.x = u_xlat4.y<(-u_xlat4.y);
    u_xlat10.x = u_xlatb10.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb10.x = u_xlat10.x<(-u_xlat10.x);
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
    u_xlatb10.x = u_xlatb20.x && u_xlatb10.x;
    u_xlat0.x = (u_xlatb10.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlatb10.x = 0.5<_RectArcUVOn;
    u_xlat10.xy = (u_xlatb10.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _RectTilingAndOffset.zw;
    u_xlat10.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat10.xy;
    u_xlat24.xy = u_xlat10.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat24.xy);
    u_xlat10.xy = (-u_xlat10.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat10.xy = vec2(_RepeatX, _RepeatY) * u_xlat10.xy + u_xlat24.xy;
    u_xlat10.xy = u_xlat10.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat10.xy = abs(u_xlat10.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat34 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24.x = min(u_xlat34, u_xlat24.x);
    u_xlat10.xy = u_xlat10.xy + u_xlat24.xx;
    u_xlat10.xy = max(u_xlat10.xy, vec2(0.0, 0.0));
    u_xlat10.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = (-u_xlat24.x) + u_xlat10.x;
    u_xlat10.x = u_xlat10.x / abs(_RectMask_WHFrSf.w);
    u_xlat20 = (-u_xlat10.x) + 1.0;
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1.x = (u_xlatb24) ? u_xlat20 : u_xlat10.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb10.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb10.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb10.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb10.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb10.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat10_30 = texture2D(_NoiseTex, u_xlat4.xy).y;
    u_xlat30 = (-u_xlat10_30) + 1.0;
    u_xlat30 = u_xlat30 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat10_4 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat10_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat30) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlatb10.x = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb10.x) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb10.x = u_xlat10_1.x>=u_xlat2.x;
    u_xlat10.x = u_xlatb10.x ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_7.x = u_xlat0.x * u_xlat1.w;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_17.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_17.xy = u_xlat16_17.xy + u_xlat16_17.xy;
    u_xlat16_17.xy = abs(u_xlat16_17.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_17.xy = clamp(u_xlat16_17.xy, 0.0, 1.0);
    u_xlat16_17.x = max(u_xlat16_17.y, u_xlat16_17.x);
    u_xlat16_17.x = (-u_xlat16_17.x) + 1.0;
    SV_Target0.w = u_xlat16_17.x * u_xlat16_7.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Custom;
uniform 	vec4 _DiffuseArcTilingRoaRov;
uniform 	float _DiffuseArcUVOn;
uniform 	float _ScreenUVOn;
uniform 	vec4 _ArcTilingAndOffset;
uniform 	float _ArcUVRotateAngle;
uniform 	float _ArcPolarRadialScale;
uniform 	float _ArcRadialPower;
uniform 	int _ArcCounts;
uniform 	mediump float _ArcPolarV_RotateSpeed;
uniform 	float _ArcPolarV_Radian;
uniform 	vec4 _DiffuseArcXYVxVy;
uniform 	vec4 _NoiseAnchorVxVy;
uniform 	float _ArcNoise;
uniform 	float _ArcMask;
uniform 	mediump vec4 _MaskTiOf;
uniform 	vec4 _NoiseScaleAndOffset;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	float _RampColorRotator;
uniform 	vec4 _DiffuseColor;
uniform 	float _AcrMaskSmooth;
uniform 	float _ArcMaskScale;
uniform 	vec4 _RectMask_WHFrSf;
uniform 	float _RectArcUVOn;
uniform 	vec4 _RectTilingAndOffset;
uniform 	mediump float _RepeatX;
uniform 	mediump float _RepeatY;
uniform 	vec4 _RectMask_XYRoaRov;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec2 u_xlat16_8;
mediump vec2 u_xlat16_9;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_17;
float u_xlat20;
bvec2 u_xlatb20;
vec2 u_xlat24;
bool u_xlatb24;
float u_xlat30;
lowp float u_xlat10_30;
float u_xlat34;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlatb20.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_ScreenUVOn, _DiffuseArcUVOn, _ScreenUVOn, _DiffuseArcUVOn)).xy;
    u_xlat0.xy = (u_xlatb20.x) ? u_xlat0.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _ArcTilingAndOffset.zw;
    u_xlat0.xy = u_xlat0.xy * _ArcTilingAndOffset.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _ArcUVRotateAngle * 0.0174532924;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat16_3.z = u_xlat16_1.x;
    u_xlat16_3.y = u_xlat16_2.x;
    u_xlat16_3.x = (-u_xlat16_1.x);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat16_3.xy);
    u_xlat4.x = dot(u_xlat0.xy, u_xlat16_3.yz);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat10.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat20 = u_xlat10.x * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat10.x * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat10.x * u_xlat20 + -0.330299497;
    u_xlat10.x = u_xlat10.x * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat10.x * u_xlat0.x;
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat20 = u_xlatb24 ? u_xlat20 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat10.x + u_xlat20;
    u_xlatb10.x = u_xlat4.y<(-u_xlat4.y);
    u_xlat10.x = u_xlatb10.x ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat10.x + u_xlat0.x;
    u_xlat10.x = min(u_xlat4.y, u_xlat4.x);
    u_xlatb10.x = u_xlat10.x<(-u_xlat10.x);
    u_xlat20 = max(u_xlat4.y, u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = dot(u_xlat4.xx, vec2(vec2(_ArcPolarRadialScale, _ArcPolarRadialScale)));
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _ArcRadialPower;
    u_xlat4.y = exp2(u_xlat4.x);
    u_xlatb20.x = u_xlat20>=(-u_xlat20);
    u_xlatb10.x = u_xlatb20.x && u_xlatb10.x;
    u_xlat0.x = (u_xlatb10.x) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.159154937;
    u_xlat10.x = _Time.y * _ArcPolarV_RotateSpeed;
    u_xlat10.x = fract(u_xlat10.x);
    u_xlat20 = float(_ArcCounts);
    u_xlat0.x = u_xlat0.x * u_xlat20 + u_xlat10.x;
    u_xlat0.y = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.xy = (-u_xlat4.yy) + u_xlat0.xy;
    u_xlat0.x = _ArcPolarV_Radian * u_xlat0.x + u_xlat4.y;
    u_xlat0.x = u_xlat0.x / _ArcPolarV_Radian;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = abs(u_xlat0.x) + _ArcMaskScale;
    u_xlat10.x = _ArcPolarV_Radian * u_xlat0.y + u_xlat4.y;
    u_xlat10.x = u_xlat10.x / _ArcPolarV_Radian;
    u_xlat4.x = fract(u_xlat10.x);
    u_xlatb10.x = 0.5<_RectArcUVOn;
    u_xlat10.xy = (u_xlatb10.x) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _RectTilingAndOffset.zw;
    u_xlat10.xy = vs_TEXCOORD1.zw * vec2(_Custom) + u_xlat10.xy;
    u_xlat24.xy = u_xlat10.xy * _RectTilingAndOffset.xy;
    u_xlat5.xy = fract(u_xlat24.xy);
    u_xlat10.xy = (-u_xlat10.xy) * _RectTilingAndOffset.xy + u_xlat5.xy;
    u_xlat10.xy = vec2(_RepeatX, _RepeatY) * u_xlat10.xy + u_xlat24.xy;
    u_xlat10.xy = u_xlat10.xy + (-_RectMask_XYRoaRov.xy);
    u_xlat10.xy = abs(u_xlat10.xy) + (-_RectMask_WHFrSf.xy);
    u_xlat24.x = min(_RectMask_WHFrSf.y, _RectMask_WHFrSf.x);
    u_xlat34 = abs(_RectMask_WHFrSf.z) * 0.5;
    u_xlat24.x = min(u_xlat34, u_xlat24.x);
    u_xlat10.xy = u_xlat10.xy + u_xlat24.xx;
    u_xlat10.xy = max(u_xlat10.xy, vec2(0.0, 0.0));
    u_xlat10.x = dot(u_xlat10.xy, u_xlat10.xy);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = (-u_xlat24.x) + u_xlat10.x;
    u_xlat10.x = u_xlat10.x / abs(_RectMask_WHFrSf.w);
    u_xlat20 = (-u_xlat10.x) + 1.0;
    u_xlatb24 = _RectMask_WHFrSf.w>=0.0;
    u_xlat16_1.x = (u_xlatb24) ? u_xlat20 : u_xlat10.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat10.x = (-_AcrMaskSmooth) + 1.0;
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat10.x = (-u_xlat10.x) + _AcrMaskSmooth;
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x;
    u_xlatb10.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), vec4(_ArcMask, _ArcNoise, _ArcMask, _ArcMask)).xy;
    u_xlat1.x = (u_xlatb10.x) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.y = (u_xlatb10.x) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat1.z = (u_xlatb10.y) ? u_xlat4.x : vs_TEXCOORD0.x;
    u_xlat1.w = (u_xlatb10.y) ? u_xlat4.y : vs_TEXCOORD0.y;
    u_xlat10.xy = (u_xlatb20.y) ? u_xlat4.xy : vs_TEXCOORD0.xy;
    u_xlat10.xy = u_xlat10.xy + _DiffuseArcXYVxVy.xy;
    u_xlat10.xy = vs_TEXCOORD1.xy * vec2(_Custom) + u_xlat10.xy;
    u_xlat10.xy = _DiffuseArcXYVxVy.zw * _Time.yy + u_xlat10.xy;
    u_xlat10.xy = u_xlat10.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat1.xy * _MaskTiOf.xy + _MaskTiOf.zw;
    u_xlat4.xy = u_xlat1.zw * _NoiseScaleAndOffset.xy + _NoiseScaleAndOffset.zw;
    u_xlat4.xy = vs_TEXCOORD2.zw * vec2(_Custom) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _NoiseAnchorVxVy.zw + u_xlat4.xy;
    u_xlat10_30 = texture2D(_NoiseTex, u_xlat4.xy).y;
    u_xlat30 = (-u_xlat10_30) + 1.0;
    u_xlat30 = u_xlat30 + (-_NoiseOffset);
    u_xlat4.xy = vs_TEXCOORD2.xy * vec2(_Custom) + u_xlat16_2.xy;
    u_xlat10_4 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat0.x = u_xlat0.x * u_xlat10_4;
    u_xlat4.x = _Time.y * _DiffuseArcTilingRoaRov.w;
    u_xlat4.x = _DiffuseArcTilingRoaRov.z * 0.0174532924 + u_xlat4.x;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat6.z = u_xlat4.x;
    u_xlat6.y = u_xlat5.x;
    u_xlat6.x = (-u_xlat4.x);
    u_xlat4.y = dot(u_xlat10.xy, u_xlat6.xy);
    u_xlat4.x = dot(u_xlat10.xy, u_xlat6.yz);
    u_xlat10.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy + (-_NoiseAnchorVxVy.xy);
    u_xlat4.xy = vec2(u_xlat30) * u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_NoisePower, _NoisePower));
    u_xlat10.xy = u_xlat10.xy * _DiffuseArcTilingRoaRov.xy + u_xlat4.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlatb10.x = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat16_2.x = (u_xlatb10.x) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat10_1.zy;
    u_xlat4.xy = u_xlat10_1.yz + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat16_2.xxxx * u_xlat4.xywz + u_xlat3.xywz;
    u_xlatb10.x = u_xlat10_1.x>=u_xlat2.x;
    u_xlat10.x = u_xlatb10.x ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat10_1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat10.xxxx * u_xlat3 + u_xlat2;
    u_xlat10.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat10.x = (-u_xlat10.x) + u_xlat2.x;
    u_xlat20 = u_xlat10.x * 6.0 + 1.00000001e-10;
    u_xlat30 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat20 = u_xlat30 / u_xlat20;
    u_xlat20 = u_xlat20 + u_xlat2.z;
    u_xlat16_7.x = abs(u_xlat20) + _HSV_Vector.x;
    u_xlat16_17.x = u_xlat16_7.x * 360.0;
    u_xlatb20.x = u_xlat16_17.x>=(-u_xlat16_17.x);
    u_xlat16_17.xy = (u_xlatb20.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_17.y * u_xlat16_7.x;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat4.xyz = u_xlat16_17.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat20 = u_xlat2.x + 1.00000001e-10;
    u_xlat10.x = u_xlat10.x / u_xlat20;
    u_xlat16_7.x = u_xlat10.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_7.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat2.xxx;
    u_xlat16_7.xyz = u_xlat10.xyz * _HSV_Vector.zzz;
    u_xlat16_37 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_37 = u_xlat16_37 + (-_SaturateWeights.y);
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_8.x;
    u_xlat16_2 = _BrightColor + (-_DarkColor);
    u_xlat16_2 = vec4(u_xlat16_37) * u_xlat16_2 + _DarkColor;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_7.xyz;
    u_xlat16_3.w = u_xlat10_1.w * u_xlat16_2.w;
    u_xlat10.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_7.x = _RampColorRotator * 0.0174532924;
    u_xlat16_9.x = cos(u_xlat16_7.x);
    u_xlat16_7.x = sin(u_xlat16_7.x);
    u_xlat16_9.y = u_xlat16_7.x;
    u_xlat10.x = dot(u_xlat10.xy, u_xlat16_9.xy);
    u_xlat10.x = u_xlat10.x + 0.5;
    u_xlat16_7.x = u_xlat10.x + (-_SaturateWeights.z);
    u_xlat16_7.x = u_xlat16_8.y * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_17.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_17.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = u_xlat16_7.xxxx * u_xlat16_1 + _LeftColor;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_3;
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_7.x = u_xlat0.x * u_xlat1.w;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_17.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_17.xy = u_xlat16_17.xy + u_xlat16_17.xy;
    u_xlat16_17.xy = abs(u_xlat16_17.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_17.xy = clamp(u_xlat16_17.xy, 0.0, 1.0);
    u_xlat16_17.x = max(u_xlat16_17.y, u_xlat16_17.x);
    u_xlat16_17.x = (-u_xlat16_17.x) + 1.0;
    SV_Target0.w = u_xlat16_17.x * u_xlat16_7.x;
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
Local Keywords { "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
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
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
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
Local Keywords { "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_USE_RECTMASK" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_USE_RECTMASK" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.VX_ArcPolarVGUI"
}