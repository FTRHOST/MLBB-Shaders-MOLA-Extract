//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NPR/Hero_NprV2_Hair_ScreenEf" {
Properties {

[Header(Point Light___________________________________________________________________________________________________________________________)] [Space(20)] [Toggle] _pointLightOn ("点光源开关", Float) = 0.0

_pointLightPos ("点光源位置", Vector) = (312.249,312.761,0.9,0)

_pointLightRange ("点光源范围", Float) = 1.0

_pointLightAtten ("点光源衰减", Range(1, 8)) = 1.0

_pointLightColor ("点光源颜色", Color) = (1,1,1,1)

[Header(BaseTexture)] [Space(10)] [Toggle(_USE3UV_ON)] _USE3UV_ON ("基础色贴图切换3U", Float) = 0.0

_MainTex ("基础色贴图, A:发束形体细节", 2D) = "white" { }

_LightMapTex ("FunctionMap,R:透明度,G:外描边粗细,B:自发光反向遮罩", 2D) = "white" { }

_EmisstionColor ("自发光颜色", Color) = (0,0,0,0)

_EmisstionParams ("x:亮度最大值,y:亮度最小,z:呼吸速度", Vector) = (1,1,0,0)

_RampTex ("RampTex", 2D) = "white" { }

_RampRowsCount ("Ramp行数,需要设置正确", Range(3, 16)) = 5.0

_RampDifLerpValue ("Ramp纹理叠加主纹理强弱", Range(0, 1)) = 0.10000000149011612

[Header(Gradation)] [Space(10)] _ShadowThreshold ("阴影偏移阈值,默认是0一般不用动", Range(-1, 1)) = 0.0

_ShadowFeather ("阴影边缘的平滑", Range(0.01, 2.99)) = 0.009999999776482582

_LightAreaColor ("受光面灯光颜色", Color) = (1,1,1,1)

_DarkColor ("背光面灯光颜色", Color) = (0.5,0.5,0.5,1)

[Header(HairLine)] [Space(10)] _HairLineTex ("头发线条贴图", 2D) = "white" { }

_HairLineColor ("头发线条颜色", Color) = (1,1,1,1)

_LineSaturation ("暗线饱和度", Range(0, 10)) = 1.5

_HairLineStrength ("头发线条强度", Range(0, 1)) = 1.0

[Header(Anisotropic)] [Space(10)] _AnisotropicTex ("各向异性贴图", 2D) = "white" { }

_AnisotropicMask ("各向异性遮罩", 2D) = "white" { }

_AnisotropicStrength ("各向异性强度", Float) = 1.0

_AnisotropicOffset ("各向异性偏移", Float) = 0.0

_AnisotropicRange ("各向异性范围", Range(0, 1000)) = 400.0

[Header(Specular)] [Space(10)] [Toggle(_USE3UV_ON)] _USE_SPECULAR_RAMP_ON ("启用高光Ramp贴图", Float) = 0.0

_SpecularRamp ("高光Ramp贴图", 2D) = "white" { }

_SpeColor ("高光颜色", Color) = (1,1,1,1)

_HairSelfShadowLerp ("头发动态自阴影强弱(LightMap纹理g通道)", Range(0, 1)) = 0.0

_HairSelfShadowPow ("头发动态自阴影范围", Range(0, 24)) = 3.0

[Header(Rim)] [Space(10)] _rimHairMaskTex ("头发边缘光遮罩 R", 2D) = "white" { }

_rimHairMaskStrength ("头发边缘光遮罩强度", Range(0, 1)) = 1.0

_RimWidth ("边缘光粗细", Float) = 1.0

_RimCol ("边缘光颜色", Color) = (1,1,1,1)

_depthSubThreshold ("DepthSubThreshold", Float) = 0.5

_depthRimOffset ("边缘光偏移", Vector) = (0,0,0,0)

_ColorScaleByLightDir ("边缘光颜色受灯光亮暗强弱影响", Range(0.001, 5)) = 1.0

_WidthEffectByLightDir ("边缘光粗细受灯光亮暗强弱影响", Range(0, 1)) = 0.0

[Header(InsideLine)] _InSideLine ("内描边贴图", 2D) = "white" { }

_InSideLineColor ("内描边颜色", Color) = (1,1,1,1)

_InSideLineSaturation ("内描边饱和度", Range(0, 20)) = 1.5

_InSideLineStrength ("内描边强度", Range(0, 2)) = 1.0

[Header(Outline)] [Space(10)] _Outline_Width ("外描边宽度", Float) = 0.019999999552965164

_Outline_Color ("外描边颜色", Color) = (0.5,0.5,0.5,1)

_Outline_Offset_X ("外描边X轴偏移", Float) = 0.0

_Outline_Offset_Y ("外描边Y轴偏移", Float) = 0.0

[Header(LiuGuang___________________________________________________________________________________________________________________________)] [Space(20)] [Toggle(_LG_ON)] _LG_ON ("流光开关(UV3)", Float) = 0.0

[Toggle] _useUv3 ("使用UV3作为流光UV,关闭则为UV1", Float) = 1.0

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 1.0

_U_LG ("U向流动速度", Float) = 0.0

_V_LG ("V向流动速度", Float) = 0.0

[Header(Star___________________________________________________________________________________________________________________________)] [Space(20)] _StarTex ("RGB:星空纹理; A:星空扭曲纹理", 2D) = "white" { }

_StarColor ("星空颜色", Color) = (1,1,1,1)

_WarpMapOffset ("扭曲纹理Tilling和Offset", Vector) = (1,1,0,0)

_WarpDirSpeed ("扭曲流动方向速度", Vector) = (1,0,0,0)

_WarpIntensity ("扭曲强度", Range(-1, 1)) = 1.0

_StarFresnelIntensity ("菲涅尔强度", Float) = 1.0

_StarFresnelSmooth ("菲涅尔范围", Range(0, 30)) = 1.5

_StarFresnelColor ("菲涅尔颜色", Color) = (1,1,1,1)

_StarRimIntensity ("边缘光强度", Float) = 1.0

_StarRimSmooth ("边缘光范围", Range(0, 30)) = 1.5

_StarRimColor ("边缘光颜色", Color) = (1,1,1,1)

[Header(ChangStar___________________________________________________________________________________________________________________________)] [Space(20)] _ChangColorDissolveTex ("R:换装边缘扰动纹理; G:换装遮罩纹理", 2D) = "white" { }

_ChangEdgeColor ("换装边缘颜色", Color) = (1,1,1,1)

_ChangColorShrink ("换装边缘压缩", Float) = 4.0

_ChangColorRange ("换装边缘范围", Float) = 1.0

_ChangColorAmount ("换装进度", Range(-2, 2)) = -2.0

_faceFrontX ("faceFrontX", Float) = 0.0

_faceFrontY ("faceFrontY", Float) = 0.0

_faceFrontZ ("faceFrontZ", Float) = -1.0

_faceUpX ("faceUpX", Float) = 0.0

_faceUpY ("faceUpY", Float) = 1.0

_faceUpZ ("faceUpZ", Float) = 0.0

}
SubShader {
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" }
  GpuProgramID 42872
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _STAR_DISSOLVE_USE_UV4;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in highp vec2 in_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD10;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(_STAR_DISSOLVE_USE_UV4);
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_2) + u_xlat0.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _rimHairMaskStrength;
uniform 	mediump float _USE_SPECULAR_RAMP_ON;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AnisotropicMask_ST;
uniform 	mediump float _AnisotropicStrength;
uniform 	mediump float _AnisotropicOffset;
uniform 	mediump float _AnisotropicRange;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump vec4 _HairLineTex_ST;
uniform 	mediump vec4 _HairLineColor;
uniform 	mediump float _LineSaturation;
uniform 	mediump float _HairLineStrength;
uniform 	vec4 _StarTex_ST;
uniform 	mediump vec4 _StarColor;
uniform 	vec4 _WarpMapOffset;
uniform 	vec2 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _StarFresnelColor;
uniform 	mediump float _StarFresnelIntensity;
uniform 	mediump float _StarFresnelSmooth;
uniform 	mediump vec4 _StarRimColor;
uniform 	mediump float _StarRimIntensity;
uniform 	mediump float _StarRimSmooth;
uniform 	vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(5) uniform mediump sampler2D _HairLineTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairLineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _AnisotropicMask;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SpecularRamp;
UNITY_LOCATION(10) uniform mediump sampler2D _StarTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(13) uniform mediump sampler2D _rimHairMaskTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD10;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
float u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_20;
vec2 u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
vec2 u_xlat22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_30;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_32;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = (-_InSideLineSaturation) + 1.0;
    u_xlat16_1 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_10.x = u_xlat16_1 + -1.0;
    u_xlat16_10.x = _InSideLineStrength * u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_10.x * u_xlat16_0.x + _InSideLineSaturation;
    u_xlat16_20 = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_20) + u_xlat1.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _InSideLineColor.xyz;
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_4.xyz;
    u_xlat21.x = dot(u_xlat16_5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat16_10.xxx + (-u_xlat21.xxx);
    u_xlat2.xyz = u_xlat16_0.xxx * u_xlat2.xyz + u_xlat21.xxx;
    u_xlat16_0.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat2.xyz * u_xlat16_0.xxx + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz + u_xlat16_3.xyz;
    u_xlat16_30 = 1.5 / _RampRowsCount;
    u_xlat16_3.y = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0350000001<u_xlat16_2.w);
#else
    u_xlatb21 = 0.0350000001<u_xlat16_2.w;
#endif
    u_xlat16_30 = log2(u_xlat16_2.w);
    u_xlat16_30 = u_xlat16_30 * _HairSelfShadowPow;
    u_xlat16_30 = exp2(u_xlat16_30);
    u_xlat16_23.x = _ShadowThreshold + 0.5;
    u_xlat16_33 = u_xlat16_23.x + _ShadowFeather;
    u_xlat16_23.x = u_xlat16_23.x + (-_ShadowFeather);
    u_xlat16_33 = (-u_xlat16_23.x) + u_xlat16_33;
    u_xlat16_33 = float(1.0) / u_xlat16_33;
    u_xlat31 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * _WorldSpaceLightPos0.xyz;
    u_xlat31 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat6.xyz = vec3(u_xlat31) * vs_TEXCOORD3.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 0.5 + 0.5;
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_4.x);
    u_xlat16_30 = _HairSelfShadowLerp * u_xlat16_30 + u_xlat16_4.x;
    u_xlat16_30 = (-u_xlat16_23.x) + u_xlat16_30;
    u_xlat16_30 = u_xlat16_33 * u_xlat16_30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_23.x;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_3.x = (u_xlatb21) ? u_xlat16_30 : 0.0;
    u_xlat16_7.xyz = texture(_RampTex, u_xlat16_3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_7.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_0.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat16_0.xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _LightAreaColor.xyz + (-u_xlat16_13.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * _EmisstionColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_13.xyz;
    u_xlat16_21 = texture(_HairLineMask, vs_TEXCOORD0.xy).x;
    u_xlat7.xy = vs_TEXCOORD0.xy * _HairLineTex_ST.xy + _HairLineTex_ST.zw;
    u_xlat16_31 = texture(_HairLineTex, u_xlat7.xy).x;
    u_xlat16_30 = u_xlat16_21 * u_xlat16_31;
    u_xlat16_33 = (-u_xlat16_31) * u_xlat16_21 + 1.0;
    u_xlat16_30 = _HairLineStrength * (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat21.x = dot(u_xlat16_4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + (-u_xlat21.xxx);
    u_xlat16_3.x = (-_LineSaturation) + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_3.x + _LineSaturation;
    u_xlat7.xyz = vec3(u_xlat16_30) * u_xlat7.xyz + u_xlat21.xxx;
    u_xlat16_3.xyz = vec3(u_xlat16_31) * _HairLineColor.xyz;
    u_xlat16_3.xyz = u_xlat7.xyz * u_xlat16_3.xyz + (-u_xlat7.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_31) * u_xlat16_3.xyz + u_xlat7.xyz;
    u_xlat21.xy = vs_TEXCOORD9.xy * _AnisotropicMask_ST.xy + _AnisotropicMask_ST.zw;
    u_xlat16_21 = texture(_AnisotropicMask, u_xlat21.xy).x;
    u_xlat21.x = u_xlat16_33 * u_xlat16_21;
    u_xlat31 = dot(vs_TEXCOORD5.xyz, u_xlat6.xyz);
    u_xlat7.xyz = (-u_xlat6.yzx) * vec3(u_xlat31) + vs_TEXCOORD5.yzx;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat7.xyz = vec3(u_xlat31) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vs_TEXCOORD5.www;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat8.xy = vs_TEXCOORD0.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_32 = texture(_AnisotropicTex, u_xlat8.xy).x;
    u_xlat32 = u_xlat16_32 * 2.0 + -1.0;
    u_xlat32 = u_xlat32 * _AnisotropicStrength + _AnisotropicOffset;
    u_xlat8.xyz = vec3(u_xlat32) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat31) + u_xlat8.xyz;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat7.xyz = vec3(u_xlat31) * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = u_xlat8.xyz * vec3(u_xlat31) + u_xlat2.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * u_xlat8.xyz;
    u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat31 = (-u_xlat31) * u_xlat31 + 1.0;
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = max(u_xlat31, 9.99999975e-05);
    u_xlat31 = log2(u_xlat31);
    u_xlat16_30 = max(_AnisotropicRange, 9.99999975e-05);
    u_xlat31 = u_xlat31 * u_xlat16_30;
    u_xlat31 = exp2(u_xlat31);
    u_xlat2.x = u_xlat21.x * u_xlat31;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.y = 0.5;
    u_xlat16_12.xyz = texture(_SpecularRamp, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = (-u_xlat2.xxx) + u_xlat16_12.xyz;
    u_xlat16_30 = _USE_SPECULAR_RAMP_ON;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = vec3(u_xlat16_30) * u_xlat16_4.xyz + u_xlat2.xxx;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z) + u_xlat16_3.xyz;
    u_xlat21.x = _Time.y * _EmisstionParams.z;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * 0.5 + 0.5;
    u_xlat31 = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat21.x = u_xlat21.x * u_xlat31 + _EmisstionParams.x;
    u_xlat16_31 = texture(_LightMapTex, u_xlat1.xy).z;
    u_xlat16_1 = texture(_rimHairMaskTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 + -1.0;
    u_xlat1.x = _rimHairMaskStrength * u_xlat1.x + 1.0;
    u_xlat11.x = (-u_xlat16_31) + 1.0;
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat2.xyz * u_xlat21.xxx + u_xlat16_3.xyz;
    u_xlat2.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD5.xyz;
    u_xlat7.xyz = u_xlat2.yzx * u_xlat6.zxy;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vs_TEXCOORD5.www;
    u_xlat16_9.xy = texture(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat9.yyy;
    u_xlat2.xyz = u_xlat9.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat32 = (-u_xlat9.x) * u_xlat9.x + 1.0;
    u_xlat32 = (-u_xlat9.y) * u_xlat9.y + u_xlat32;
    u_xlat32 = sqrt(u_xlat32);
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat12 = u_xlat2.x * _StarFresnelSmooth;
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _StarFresnelSmooth;
    u_xlat16_0.x = max(_StarFresnelIntensity, 0.0);
    u_xlat12 = u_xlat16_0.x * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = vec3(u_xlat12) * _StarFresnelColor.xyz;
    u_xlat16_30 = max(_StarRimIntensity, 0.0);
    u_xlat2.x = u_xlat16_30 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat2.xxx * _StarRimColor.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat22.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat7.xy = u_xlat22.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat7.xy;
    u_xlat16_2.x = texture(_StarTex, u_xlat2.xy).w;
    u_xlat16_30 = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat2.xy = vec2(u_xlat16_30) * vec2(_WarpIntensity) + u_xlat22.xy;
    u_xlat2.xy = u_xlat2.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat16_7.xyz = texture(_StarTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_0.xyz = u_xlat16_3.xyz * _StarColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = (-u_xlat11.xyz) + u_xlat16_0.xyz;
    u_xlat2.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_2.x = texture(_ChangColorDissolveTex, u_xlat2.xy).x;
    u_xlat12 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat12 = u_xlat12 * 2.0 + -0.0599999987;
    u_xlat2.x = u_xlat12 * _ChangColorShrink + u_xlat16_2.x;
    u_xlat16_30 = u_xlat2.x + -0.100000001;
    u_xlat16_3.x = u_xlat2.x + u_xlat2.x;
    u_xlat16_3.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _ChangEdgeColor.xyz;
    u_xlat16_30 = u_xlat16_30 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_33;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_30);
    u_xlat16_2.x = texture(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat16_0.xyz = u_xlat16_2.xxx * u_xlat16_0.xyz + u_xlat11.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlat11.xy = u_xlat6.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat11.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat6.xx + u_xlat11.xy;
    u_xlat11.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat6.zz + u_xlat11.xy;
    u_xlat6.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat6.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat2.xy = u_xlat6.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat6.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat6.zz + u_xlat2.xy;
    u_xlat16_3.xy = (-u_xlat11.xy) + u_xlat2.xy;
    u_xlat16_3.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_3.xy + u_xlat11.xy;
    u_xlat16_30 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xy = vec2(u_xlat16_30) * u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_RimWidth);
    u_xlat31 = float(1.0) / vs_TEXCOORD7.w;
    u_xlat22.xy = u_xlat16_3.xy * vec2(u_xlat31) + u_xlat22.xy;
    u_xlat31 = texture(_CameraDepthTexture, u_xlat22.xy).x;
    u_xlat31 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31>=_depthSubThreshold);
#else
    u_xlatb31 = u_xlat31>=_depthSubThreshold;
#endif
    u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat31;
    u_xlat6.xyz = u_xlat1.xxx * _RimCol.xyz;
    u_xlat16_30 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xy = vec2(u_xlat16_30) * u_xlat11.xy;
    u_xlat16_30 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_23.xy = vec2(u_xlat16_30) * u_xlat2.xy;
    u_xlat16_30 = dot(u_xlat16_3.xy, u_xlat16_23.xy);
    u_xlat16_30 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_30 = log2(u_xlat16_30);
    u_xlat16_30 = u_xlat16_30 * _ColorScaleByLightDir;
    u_xlat16_30 = exp2(u_xlat16_30);
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_0.xyz = u_xlat6.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat16_30 = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_30 = u_xlat1.x / u_xlat16_30;
    u_xlat16_3.x = u_xlat1.x + 9.99999975e-05;
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _pointLightAtten;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _pointLightColor.xyz;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_30 = u_xlat16_30 + -0.800000012;
    u_xlat16_30 = u_xlat16_30 * 5.00000048;
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_33 = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = (-u_xlat16_33) * u_xlat16_30 + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_pointLightOn);
#else
    u_xlatb1 = 0.5<_pointLightOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    u_xlat16_1 = texture(_LightMapTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat16_1 * _LightAreaColor.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _STAR_DISSOLVE_USE_UV4;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in highp vec2 in_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD10;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(_STAR_DISSOLVE_USE_UV4);
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_2) + u_xlat0.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _rimHairMaskStrength;
uniform 	mediump float _USE_SPECULAR_RAMP_ON;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AnisotropicMask_ST;
uniform 	mediump float _AnisotropicStrength;
uniform 	mediump float _AnisotropicOffset;
uniform 	mediump float _AnisotropicRange;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump vec4 _HairLineTex_ST;
uniform 	mediump vec4 _HairLineColor;
uniform 	mediump float _LineSaturation;
uniform 	mediump float _HairLineStrength;
uniform 	vec4 _StarTex_ST;
uniform 	mediump vec4 _StarColor;
uniform 	vec4 _WarpMapOffset;
uniform 	vec2 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _StarFresnelColor;
uniform 	mediump float _StarFresnelIntensity;
uniform 	mediump float _StarFresnelSmooth;
uniform 	mediump vec4 _StarRimColor;
uniform 	mediump float _StarRimIntensity;
uniform 	mediump float _StarRimSmooth;
uniform 	vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(5) uniform mediump sampler2D _HairLineTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairLineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _AnisotropicMask;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SpecularRamp;
UNITY_LOCATION(10) uniform mediump sampler2D _StarTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(12) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(13) uniform mediump sampler2D _rimHairMaskTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD10;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec2 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
float u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_20;
vec2 u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
vec2 u_xlat22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_30;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
float u_xlat32;
mediump float u_xlat16_32;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = (-_InSideLineSaturation) + 1.0;
    u_xlat16_1 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_10.x = u_xlat16_1 + -1.0;
    u_xlat16_10.x = _InSideLineStrength * u_xlat16_10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_10.x * u_xlat16_0.x + _InSideLineSaturation;
    u_xlat16_20 = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_20) + u_xlat1.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _InSideLineColor.xyz;
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_4.xyz;
    u_xlat21.x = dot(u_xlat16_5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat16_10.xxx + (-u_xlat21.xxx);
    u_xlat2.xyz = u_xlat16_0.xxx * u_xlat2.xyz + u_xlat21.xxx;
    u_xlat16_0.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat2.xyz * u_xlat16_0.xxx + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz + u_xlat16_3.xyz;
    u_xlat16_30 = 1.5 / _RampRowsCount;
    u_xlat16_3.y = (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0350000001<u_xlat16_2.w);
#else
    u_xlatb21 = 0.0350000001<u_xlat16_2.w;
#endif
    u_xlat16_30 = log2(u_xlat16_2.w);
    u_xlat16_30 = u_xlat16_30 * _HairSelfShadowPow;
    u_xlat16_30 = exp2(u_xlat16_30);
    u_xlat16_23.x = _ShadowThreshold + 0.5;
    u_xlat16_33 = u_xlat16_23.x + _ShadowFeather;
    u_xlat16_23.x = u_xlat16_23.x + (-_ShadowFeather);
    u_xlat16_33 = (-u_xlat16_23.x) + u_xlat16_33;
    u_xlat16_33 = float(1.0) / u_xlat16_33;
    u_xlat31 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * _WorldSpaceLightPos0.xyz;
    u_xlat31 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat6.xyz = vec3(u_xlat31) * vs_TEXCOORD3.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 0.5 + 0.5;
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_4.x);
    u_xlat16_30 = _HairSelfShadowLerp * u_xlat16_30 + u_xlat16_4.x;
    u_xlat16_30 = (-u_xlat16_23.x) + u_xlat16_30;
    u_xlat16_30 = u_xlat16_33 * u_xlat16_30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_23.x;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_3.x = (u_xlatb21) ? u_xlat16_30 : 0.0;
    u_xlat16_7.xyz = texture(_RampTex, u_xlat16_3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_7.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_0.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat16_0.xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _LightAreaColor.xyz + (-u_xlat16_13.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * _EmisstionColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_13.xyz;
    u_xlat16_21 = texture(_HairLineMask, vs_TEXCOORD0.xy).x;
    u_xlat7.xy = vs_TEXCOORD0.xy * _HairLineTex_ST.xy + _HairLineTex_ST.zw;
    u_xlat16_31 = texture(_HairLineTex, u_xlat7.xy).x;
    u_xlat16_30 = u_xlat16_21 * u_xlat16_31;
    u_xlat16_33 = (-u_xlat16_31) * u_xlat16_21 + 1.0;
    u_xlat16_30 = _HairLineStrength * (-u_xlat16_30) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat21.x = dot(u_xlat16_4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + (-u_xlat21.xxx);
    u_xlat16_3.x = (-_LineSaturation) + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_3.x + _LineSaturation;
    u_xlat7.xyz = vec3(u_xlat16_30) * u_xlat7.xyz + u_xlat21.xxx;
    u_xlat16_3.xyz = vec3(u_xlat16_31) * _HairLineColor.xyz;
    u_xlat16_3.xyz = u_xlat7.xyz * u_xlat16_3.xyz + (-u_xlat7.xyz);
    u_xlat16_3.xyz = vec3(u_xlat16_31) * u_xlat16_3.xyz + u_xlat7.xyz;
    u_xlat21.xy = vs_TEXCOORD9.xy * _AnisotropicMask_ST.xy + _AnisotropicMask_ST.zw;
    u_xlat16_21 = texture(_AnisotropicMask, u_xlat21.xy).x;
    u_xlat21.x = u_xlat16_33 * u_xlat16_21;
    u_xlat31 = dot(vs_TEXCOORD5.xyz, u_xlat6.xyz);
    u_xlat7.xyz = (-u_xlat6.yzx) * vec3(u_xlat31) + vs_TEXCOORD5.yzx;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat7.xyz = vec3(u_xlat31) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vs_TEXCOORD5.www;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat8.xy = vs_TEXCOORD0.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_32 = texture(_AnisotropicTex, u_xlat8.xy).x;
    u_xlat32 = u_xlat16_32 * 2.0 + -1.0;
    u_xlat32 = u_xlat32 * _AnisotropicStrength + _AnisotropicOffset;
    u_xlat8.xyz = vec3(u_xlat32) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat31) + u_xlat8.xyz;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat7.xyz = vec3(u_xlat31) * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = u_xlat8.xyz * vec3(u_xlat31) + u_xlat2.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * u_xlat8.xyz;
    u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat31 = (-u_xlat31) * u_xlat31 + 1.0;
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = max(u_xlat31, 9.99999975e-05);
    u_xlat31 = log2(u_xlat31);
    u_xlat16_30 = max(_AnisotropicRange, 9.99999975e-05);
    u_xlat31 = u_xlat31 * u_xlat16_30;
    u_xlat31 = exp2(u_xlat31);
    u_xlat2.x = u_xlat21.x * u_xlat31;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.y = 0.5;
    u_xlat16_12.xyz = texture(_SpecularRamp, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = (-u_xlat2.xxx) + u_xlat16_12.xyz;
    u_xlat16_30 = _USE_SPECULAR_RAMP_ON;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = vec3(u_xlat16_30) * u_xlat16_4.xyz + u_xlat2.xxx;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z) + u_xlat16_3.xyz;
    u_xlat21.x = _Time.y * _EmisstionParams.z;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * 0.5 + 0.5;
    u_xlat31 = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat21.x = u_xlat21.x * u_xlat31 + _EmisstionParams.x;
    u_xlat16_31 = texture(_LightMapTex, u_xlat1.xy).z;
    u_xlat16_1 = texture(_rimHairMaskTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 + -1.0;
    u_xlat1.x = _rimHairMaskStrength * u_xlat1.x + 1.0;
    u_xlat11.x = (-u_xlat16_31) + 1.0;
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat2.xyz * u_xlat21.xxx + u_xlat16_3.xyz;
    u_xlat2.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD5.xyz;
    u_xlat7.xyz = u_xlat2.yzx * u_xlat6.zxy;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vs_TEXCOORD5.www;
    u_xlat16_9.xy = texture(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat9.yyy;
    u_xlat2.xyz = u_xlat9.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat32 = (-u_xlat9.x) * u_xlat9.x + 1.0;
    u_xlat32 = (-u_xlat9.y) * u_xlat9.y + u_xlat32;
    u_xlat32 = sqrt(u_xlat32);
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat12 = u_xlat2.x * _StarFresnelSmooth;
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _StarFresnelSmooth;
    u_xlat16_0.x = max(_StarFresnelIntensity, 0.0);
    u_xlat12 = u_xlat16_0.x * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = vec3(u_xlat12) * _StarFresnelColor.xyz;
    u_xlat16_30 = max(_StarRimIntensity, 0.0);
    u_xlat2.x = u_xlat16_30 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = u_xlat2.xxx * _StarRimColor.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat22.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat7.xy = u_xlat22.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat7.xy;
    u_xlat16_2.x = texture(_StarTex, u_xlat2.xy).w;
    u_xlat16_30 = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat2.xy = vec2(u_xlat16_30) * vec2(_WarpIntensity) + u_xlat22.xy;
    u_xlat2.xy = u_xlat2.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat16_7.xyz = texture(_StarTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_0.xyz = u_xlat16_3.xyz * _StarColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = (-u_xlat11.xyz) + u_xlat16_0.xyz;
    u_xlat2.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_2.x = texture(_ChangColorDissolveTex, u_xlat2.xy).x;
    u_xlat12 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat12 = u_xlat12 * 2.0 + -0.0599999987;
    u_xlat2.x = u_xlat12 * _ChangColorShrink + u_xlat16_2.x;
    u_xlat16_30 = u_xlat2.x + -0.100000001;
    u_xlat16_3.x = u_xlat2.x + u_xlat2.x;
    u_xlat16_3.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _ChangEdgeColor.xyz;
    u_xlat16_30 = u_xlat16_30 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_33 = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_33;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_30);
    u_xlat16_2.x = texture(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat16_0.xyz = u_xlat16_2.xxx * u_xlat16_0.xyz + u_xlat11.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlat11.xy = u_xlat6.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat11.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat6.xx + u_xlat11.xy;
    u_xlat11.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat6.zz + u_xlat11.xy;
    u_xlat6.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat6.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat2.xy = u_xlat6.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat6.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat6.zz + u_xlat2.xy;
    u_xlat16_3.xy = (-u_xlat11.xy) + u_xlat2.xy;
    u_xlat16_3.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_3.xy + u_xlat11.xy;
    u_xlat16_30 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xy = vec2(u_xlat16_30) * u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_RimWidth);
    u_xlat31 = float(1.0) / vs_TEXCOORD7.w;
    u_xlat22.xy = u_xlat16_3.xy * vec2(u_xlat31) + u_xlat22.xy;
    u_xlat31 = texture(_CameraDepthTexture, u_xlat22.xy).x;
    u_xlat31 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat31>=_depthSubThreshold);
#else
    u_xlatb31 = u_xlat31>=_depthSubThreshold;
#endif
    u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat31;
    u_xlat6.xyz = u_xlat1.xxx * _RimCol.xyz;
    u_xlat16_30 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xy = vec2(u_xlat16_30) * u_xlat11.xy;
    u_xlat16_30 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_23.xy = vec2(u_xlat16_30) * u_xlat2.xy;
    u_xlat16_30 = dot(u_xlat16_3.xy, u_xlat16_23.xy);
    u_xlat16_30 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_30 = log2(u_xlat16_30);
    u_xlat16_30 = u_xlat16_30 * _ColorScaleByLightDir;
    u_xlat16_30 = exp2(u_xlat16_30);
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_0.xyz = u_xlat6.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat16_30 = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_30 = u_xlat1.x / u_xlat16_30;
    u_xlat16_3.x = u_xlat1.x + 9.99999975e-05;
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _pointLightAtten;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _pointLightColor.xyz;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_30 = u_xlat16_30 + -0.800000012;
    u_xlat16_30 = u_xlat16_30 * 5.00000048;
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_33 = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = (-u_xlat16_33) * u_xlat16_30 + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_pointLightOn);
#else
    u_xlatb1 = 0.5<_pointLightOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    u_xlat16_1 = texture(_LightMapTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat16_1 * _LightAreaColor.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _STAR_DISSOLVE_USE_UV4;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec2 in_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(_STAR_DISSOLVE_USE_UV4);
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_2) + u_xlat0.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _rimHairMaskStrength;
uniform 	mediump float _USE_SPECULAR_RAMP_ON;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AnisotropicMask_ST;
uniform 	mediump float _AnisotropicStrength;
uniform 	mediump float _AnisotropicOffset;
uniform 	mediump float _AnisotropicRange;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump vec4 _HairLineTex_ST;
uniform 	mediump vec4 _HairLineColor;
uniform 	mediump float _LineSaturation;
uniform 	mediump float _HairLineStrength;
uniform 	vec4 _StarTex_ST;
uniform 	mediump vec4 _StarColor;
uniform 	vec4 _WarpMapOffset;
uniform 	vec2 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _StarFresnelColor;
uniform 	mediump float _StarFresnelIntensity;
uniform 	mediump float _StarFresnelSmooth;
uniform 	mediump vec4 _StarRimColor;
uniform 	mediump float _StarRimIntensity;
uniform 	mediump float _StarRimSmooth;
uniform 	vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _HairLineTex;
uniform lowp sampler2D _HairLineMask;
uniform lowp sampler2D _AnisotropicMask;
uniform lowp sampler2D _AnisotropicTex;
uniform lowp sampler2D _SpecularRamp;
uniform lowp sampler2D _StarTex;
uniform lowp sampler2D _ChangColorDissolveTex;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _rimHairMaskTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec2 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
float u_xlat12;
lowp vec3 u_xlat10_12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_20;
vec2 u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
vec2 u_xlat22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_30;
float u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
lowp float u_xlat10_32;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = (-_InSideLineSaturation) + 1.0;
    u_xlat10_1 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_10.x = u_xlat10_1 + -1.0;
    u_xlat16_10.x = _InSideLineStrength * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_0.x = u_xlat16_10.x * u_xlat16_0.x + _InSideLineSaturation;
    u_xlat16_20 = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_20) + u_xlat1.xy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _InSideLineColor.xyz;
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_4.xyz;
    u_xlat21.x = dot(u_xlat16_5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat16_10.xxx + (-u_xlat21.xxx);
    u_xlat2.xyz = u_xlat16_0.xxx * u_xlat2.xyz + u_xlat21.xxx;
    u_xlat16_0.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat2.xyz * u_xlat16_0.xxx + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz + u_xlat16_3.xyz;
    u_xlat16_30 = 1.5 / _RampRowsCount;
    u_xlat16_3.y = (-u_xlat16_30) + 1.0;
    u_xlatb21 = 0.0350000001<u_xlat10_2.w;
    u_xlat16_30 = log2(u_xlat10_2.w);
    u_xlat16_30 = u_xlat16_30 * _HairSelfShadowPow;
    u_xlat16_30 = exp2(u_xlat16_30);
    u_xlat16_23.x = _ShadowThreshold + 0.5;
    u_xlat16_33 = u_xlat16_23.x + _ShadowFeather;
    u_xlat16_23.x = u_xlat16_23.x + (-_ShadowFeather);
    u_xlat16_33 = (-u_xlat16_23.x) + u_xlat16_33;
    u_xlat16_33 = float(1.0) / u_xlat16_33;
    u_xlat31 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * _WorldSpaceLightPos0.xyz;
    u_xlat31 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat6.xyz = vec3(u_xlat31) * vs_TEXCOORD3.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 0.5 + 0.5;
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_4.x);
    u_xlat16_30 = _HairSelfShadowLerp * u_xlat16_30 + u_xlat16_4.x;
    u_xlat16_30 = (-u_xlat16_23.x) + u_xlat16_30;
    u_xlat16_30 = u_xlat16_33 * u_xlat16_30;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_23.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_23.x;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_3.x = (u_xlatb21) ? u_xlat16_30 : 0.0;
    u_xlat10_7.xyz = texture2D(_RampTex, u_xlat16_3.xy).xyz;
    u_xlat16_13.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat10_7.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_0.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat16_0.xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _LightAreaColor.xyz + (-u_xlat16_13.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * _EmisstionColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_13.xyz;
    u_xlat10_21 = texture2D(_HairLineMask, vs_TEXCOORD0.xy).x;
    u_xlat7.xy = vs_TEXCOORD0.xy * _HairLineTex_ST.xy + _HairLineTex_ST.zw;
    u_xlat10_31 = texture2D(_HairLineTex, u_xlat7.xy).x;
    u_xlat16_30 = u_xlat10_21 * u_xlat10_31;
    u_xlat16_33 = (-u_xlat10_31) * u_xlat10_21 + 1.0;
    u_xlat16_30 = _HairLineStrength * (-u_xlat16_30) + 1.0;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat21.x = dot(u_xlat16_4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + (-u_xlat21.xxx);
    u_xlat16_3.x = (-_LineSaturation) + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_3.x + _LineSaturation;
    u_xlat7.xyz = vec3(u_xlat16_30) * u_xlat7.xyz + u_xlat21.xxx;
    u_xlat16_3.xyz = vec3(u_xlat10_31) * _HairLineColor.xyz;
    u_xlat16_3.xyz = u_xlat7.xyz * u_xlat16_3.xyz + (-u_xlat7.xyz);
    u_xlat16_3.xyz = vec3(u_xlat10_31) * u_xlat16_3.xyz + u_xlat7.xyz;
    u_xlat21.xy = vs_TEXCOORD9.xy * _AnisotropicMask_ST.xy + _AnisotropicMask_ST.zw;
    u_xlat10_21 = texture2D(_AnisotropicMask, u_xlat21.xy).x;
    u_xlat21.x = u_xlat16_33 * u_xlat10_21;
    u_xlat31 = dot(vs_TEXCOORD5.xyz, u_xlat6.xyz);
    u_xlat7.xyz = (-u_xlat6.yzx) * vec3(u_xlat31) + vs_TEXCOORD5.yzx;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat7.xyz = vec3(u_xlat31) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vs_TEXCOORD5.www;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat8.xy = vs_TEXCOORD0.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat10_32 = texture2D(_AnisotropicTex, u_xlat8.xy).x;
    u_xlat32 = u_xlat10_32 * 2.0 + -1.0;
    u_xlat32 = u_xlat32 * _AnisotropicStrength + _AnisotropicOffset;
    u_xlat8.xyz = vec3(u_xlat32) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat31) + u_xlat8.xyz;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat7.xyz = vec3(u_xlat31) * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = u_xlat8.xyz * vec3(u_xlat31) + u_xlat2.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * u_xlat8.xyz;
    u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat31 = (-u_xlat31) * u_xlat31 + 1.0;
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = max(u_xlat31, 9.99999975e-05);
    u_xlat31 = log2(u_xlat31);
    u_xlat16_30 = max(_AnisotropicRange, 9.99999975e-05);
    u_xlat31 = u_xlat31 * u_xlat16_30;
    u_xlat31 = exp2(u_xlat31);
    u_xlat2.x = u_xlat21.x * u_xlat31;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.y = 0.5;
    u_xlat10_12.xyz = texture2D(_SpecularRamp, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = (-u_xlat2.xxx) + u_xlat10_12.xyz;
    u_xlat16_30 = _USE_SPECULAR_RAMP_ON;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_30) * u_xlat16_4.xyz + u_xlat2.xxx;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z) + u_xlat16_3.xyz;
    u_xlat21.x = _Time.y * _EmisstionParams.z;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * 0.5 + 0.5;
    u_xlat31 = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat21.x = u_xlat21.x * u_xlat31 + _EmisstionParams.x;
    u_xlat10_31 = texture2D(_LightMapTex, u_xlat1.xy).z;
    u_xlat10_1 = texture2D(_rimHairMaskTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1 + -1.0;
    u_xlat1.x = _rimHairMaskStrength * u_xlat1.x + 1.0;
    u_xlat11.x = (-u_xlat10_31) + 1.0;
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat2.xyz * u_xlat21.xxx + u_xlat16_3.xyz;
    u_xlat2.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD5.xyz;
    u_xlat7.xyz = u_xlat2.yzx * u_xlat6.zxy;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vs_TEXCOORD5.www;
    u_xlat10_9.xy = texture2D(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat9.yyy;
    u_xlat2.xyz = u_xlat9.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat32 = (-u_xlat9.x) * u_xlat9.x + 1.0;
    u_xlat32 = (-u_xlat9.y) * u_xlat9.y + u_xlat32;
    u_xlat32 = sqrt(u_xlat32);
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat12 = u_xlat2.x * _StarFresnelSmooth;
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _StarFresnelSmooth;
    u_xlat16_0.x = max(_StarFresnelIntensity, 0.0);
    u_xlat12 = u_xlat16_0.x * u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_0.xyz = vec3(u_xlat12) * _StarFresnelColor.xyz;
    u_xlat16_30 = max(_StarRimIntensity, 0.0);
    u_xlat2.x = u_xlat16_30 * u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat2.xxx * _StarRimColor.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat22.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat7.xy = u_xlat22.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat7.xy;
    u_xlat10_2.x = texture2D(_StarTex, u_xlat2.xy).w;
    u_xlat16_30 = u_xlat10_2.x * 2.0 + -1.0;
    u_xlat2.xy = vec2(u_xlat16_30) * vec2(_WarpIntensity) + u_xlat22.xy;
    u_xlat2.xy = u_xlat2.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat10_7.xyz = texture2D(_StarTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = log2(u_xlat10_7.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_0.xyz = u_xlat16_3.xyz * _StarColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = (-u_xlat11.xyz) + u_xlat16_0.xyz;
    u_xlat2.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat10_2.x = texture2D(_ChangColorDissolveTex, u_xlat2.xy).x;
    u_xlat12 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat12 = u_xlat12 * 2.0 + -0.0599999987;
    u_xlat2.x = u_xlat12 * _ChangColorShrink + u_xlat10_2.x;
    u_xlat16_30 = u_xlat2.x + -0.100000001;
    u_xlat16_3.x = u_xlat2.x + u_xlat2.x;
    u_xlat16_3.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _ChangEdgeColor.xyz;
    u_xlat16_30 = u_xlat16_30 * 2.5;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_33 = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_33;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_30);
    u_xlat10_2.x = texture2D(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat16_0.xyz = u_xlat10_2.xxx * u_xlat16_0.xyz + u_xlat11.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlat11.xy = u_xlat6.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat11.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat6.xx + u_xlat11.xy;
    u_xlat11.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat6.zz + u_xlat11.xy;
    u_xlat6.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat6.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat2.xy = u_xlat6.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat6.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat6.zz + u_xlat2.xy;
    u_xlat16_3.xy = (-u_xlat11.xy) + u_xlat2.xy;
    u_xlat16_3.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_3.xy + u_xlat11.xy;
    u_xlat16_30 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xy = vec2(u_xlat16_30) * u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_RimWidth);
    u_xlat31 = float(1.0) / vs_TEXCOORD7.w;
    u_xlat22.xy = u_xlat16_3.xy * vec2(u_xlat31) + u_xlat22.xy;
    u_xlat31 = texture2D(_CameraDepthTexture, u_xlat22.xy).x;
    u_xlat31 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 + (-vs_TEXCOORD2.w);
    u_xlatb31 = u_xlat31>=_depthSubThreshold;
    u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat31;
    u_xlat6.xyz = u_xlat1.xxx * _RimCol.xyz;
    u_xlat16_30 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xy = vec2(u_xlat16_30) * u_xlat11.xy;
    u_xlat16_30 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_23.xy = vec2(u_xlat16_30) * u_xlat2.xy;
    u_xlat16_30 = dot(u_xlat16_3.xy, u_xlat16_23.xy);
    u_xlat16_30 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_30 = log2(u_xlat16_30);
    u_xlat16_30 = u_xlat16_30 * _ColorScaleByLightDir;
    u_xlat16_30 = exp2(u_xlat16_30);
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_0.xyz = u_xlat6.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat16_30 = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_30 = u_xlat1.x / u_xlat16_30;
    u_xlat16_3.x = u_xlat1.x + 9.99999975e-05;
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _pointLightAtten;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _pointLightColor.xyz;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_30 = u_xlat16_30 + -0.800000012;
    u_xlat16_30 = u_xlat16_30 * 5.00000048;
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_33 = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = (-u_xlat16_33) * u_xlat16_30 + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlatb1 = 0.5<_pointLightOn;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    u_xlat10_1 = texture2D(_LightMapTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat10_1 * _LightAreaColor.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _STAR_DISSOLVE_USE_UV4;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec2 in_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(_STAR_DISSOLVE_USE_UV4);
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_2) + u_xlat0.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _rimHairMaskStrength;
uniform 	mediump float _USE_SPECULAR_RAMP_ON;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AnisotropicMask_ST;
uniform 	mediump float _AnisotropicStrength;
uniform 	mediump float _AnisotropicOffset;
uniform 	mediump float _AnisotropicRange;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump vec4 _HairLineTex_ST;
uniform 	mediump vec4 _HairLineColor;
uniform 	mediump float _LineSaturation;
uniform 	mediump float _HairLineStrength;
uniform 	vec4 _StarTex_ST;
uniform 	mediump vec4 _StarColor;
uniform 	vec4 _WarpMapOffset;
uniform 	vec2 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _StarFresnelColor;
uniform 	mediump float _StarFresnelIntensity;
uniform 	mediump float _StarFresnelSmooth;
uniform 	mediump vec4 _StarRimColor;
uniform 	mediump float _StarRimIntensity;
uniform 	mediump float _StarRimSmooth;
uniform 	vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _HairLineTex;
uniform lowp sampler2D _HairLineMask;
uniform lowp sampler2D _AnisotropicMask;
uniform lowp sampler2D _AnisotropicTex;
uniform lowp sampler2D _SpecularRamp;
uniform lowp sampler2D _StarTex;
uniform lowp sampler2D _ChangColorDissolveTex;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _rimHairMaskTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec2 u_xlat9;
lowp vec2 u_xlat10_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
float u_xlat12;
lowp vec3 u_xlat10_12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_20;
vec2 u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
vec2 u_xlat22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_30;
float u_xlat31;
lowp float u_xlat10_31;
bool u_xlatb31;
float u_xlat32;
lowp float u_xlat10_32;
mediump float u_xlat16_33;
void main()
{
    u_xlat16_0.x = (-_InSideLineSaturation) + 1.0;
    u_xlat10_1 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_10.x = u_xlat10_1 + -1.0;
    u_xlat16_10.x = _InSideLineStrength * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_0.x = u_xlat16_10.x * u_xlat16_0.x + _InSideLineSaturation;
    u_xlat16_20 = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_20) + u_xlat1.xy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _InSideLineColor.xyz;
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_4.xyz;
    u_xlat21.x = dot(u_xlat16_5.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat16_10.xxx + (-u_xlat21.xxx);
    u_xlat2.xyz = u_xlat16_0.xxx * u_xlat2.xyz + u_xlat21.xxx;
    u_xlat16_0.x = (-u_xlat16_10.x) + 1.0;
    u_xlat16_10.xyz = u_xlat2.xyz * u_xlat16_0.xxx + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_10.xyz + u_xlat16_3.xyz;
    u_xlat16_30 = 1.5 / _RampRowsCount;
    u_xlat16_3.y = (-u_xlat16_30) + 1.0;
    u_xlatb21 = 0.0350000001<u_xlat10_2.w;
    u_xlat16_30 = log2(u_xlat10_2.w);
    u_xlat16_30 = u_xlat16_30 * _HairSelfShadowPow;
    u_xlat16_30 = exp2(u_xlat16_30);
    u_xlat16_23.x = _ShadowThreshold + 0.5;
    u_xlat16_33 = u_xlat16_23.x + _ShadowFeather;
    u_xlat16_23.x = u_xlat16_23.x + (-_ShadowFeather);
    u_xlat16_33 = (-u_xlat16_23.x) + u_xlat16_33;
    u_xlat16_33 = float(1.0) / u_xlat16_33;
    u_xlat31 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * _WorldSpaceLightPos0.xyz;
    u_xlat31 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat6.xyz = vec3(u_xlat31) * vs_TEXCOORD3.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 0.5 + 0.5;
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_4.x);
    u_xlat16_30 = _HairSelfShadowLerp * u_xlat16_30 + u_xlat16_4.x;
    u_xlat16_30 = (-u_xlat16_23.x) + u_xlat16_30;
    u_xlat16_30 = u_xlat16_33 * u_xlat16_30;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_23.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_23.x;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_3.x = (u_xlatb21) ? u_xlat16_30 : 0.0;
    u_xlat10_7.xyz = texture2D(_RampTex, u_xlat16_3.xy).xyz;
    u_xlat16_13.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat10_7.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_0.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat16_0.xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyz * _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * _LightAreaColor.xyz + (-u_xlat16_13.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * _EmisstionColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_13.xyz;
    u_xlat10_21 = texture2D(_HairLineMask, vs_TEXCOORD0.xy).x;
    u_xlat7.xy = vs_TEXCOORD0.xy * _HairLineTex_ST.xy + _HairLineTex_ST.zw;
    u_xlat10_31 = texture2D(_HairLineTex, u_xlat7.xy).x;
    u_xlat16_30 = u_xlat10_21 * u_xlat10_31;
    u_xlat16_33 = (-u_xlat10_31) * u_xlat10_21 + 1.0;
    u_xlat16_30 = _HairLineStrength * (-u_xlat16_30) + 1.0;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat21.x = dot(u_xlat16_4.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + (-u_xlat21.xxx);
    u_xlat16_3.x = (-_LineSaturation) + 1.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_3.x + _LineSaturation;
    u_xlat7.xyz = vec3(u_xlat16_30) * u_xlat7.xyz + u_xlat21.xxx;
    u_xlat16_3.xyz = vec3(u_xlat10_31) * _HairLineColor.xyz;
    u_xlat16_3.xyz = u_xlat7.xyz * u_xlat16_3.xyz + (-u_xlat7.xyz);
    u_xlat16_3.xyz = vec3(u_xlat10_31) * u_xlat16_3.xyz + u_xlat7.xyz;
    u_xlat21.xy = vs_TEXCOORD9.xy * _AnisotropicMask_ST.xy + _AnisotropicMask_ST.zw;
    u_xlat10_21 = texture2D(_AnisotropicMask, u_xlat21.xy).x;
    u_xlat21.x = u_xlat16_33 * u_xlat10_21;
    u_xlat31 = dot(vs_TEXCOORD5.xyz, u_xlat6.xyz);
    u_xlat7.xyz = (-u_xlat6.yzx) * vec3(u_xlat31) + vs_TEXCOORD5.yzx;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat7.xyz = vec3(u_xlat31) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vs_TEXCOORD5.www;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat8.xy = vs_TEXCOORD0.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat10_32 = texture2D(_AnisotropicTex, u_xlat8.xy).x;
    u_xlat32 = u_xlat10_32 * 2.0 + -1.0;
    u_xlat32 = u_xlat32 * _AnisotropicStrength + _AnisotropicOffset;
    u_xlat8.xyz = vec3(u_xlat32) * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat31) + u_xlat8.xyz;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat7.xyz = vec3(u_xlat31) * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = u_xlat8.xyz * vec3(u_xlat31) + u_xlat2.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * u_xlat8.xyz;
    u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat31 = dot(u_xlat7.xyz, u_xlat2.xyz);
    u_xlat31 = (-u_xlat31) * u_xlat31 + 1.0;
    u_xlat31 = max(u_xlat31, 0.0);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = max(u_xlat31, 9.99999975e-05);
    u_xlat31 = log2(u_xlat31);
    u_xlat16_30 = max(_AnisotropicRange, 9.99999975e-05);
    u_xlat31 = u_xlat31 * u_xlat16_30;
    u_xlat31 = exp2(u_xlat31);
    u_xlat2.x = u_xlat21.x * u_xlat31;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.y = 0.5;
    u_xlat10_12.xyz = texture2D(_SpecularRamp, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = (-u_xlat2.xxx) + u_xlat10_12.xyz;
    u_xlat16_30 = _USE_SPECULAR_RAMP_ON;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_30) * u_xlat16_4.xyz + u_xlat2.xxx;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z) + u_xlat16_3.xyz;
    u_xlat21.x = _Time.y * _EmisstionParams.z;
    u_xlat21.x = sin(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * 0.5 + 0.5;
    u_xlat31 = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat21.x = u_xlat21.x * u_xlat31 + _EmisstionParams.x;
    u_xlat10_31 = texture2D(_LightMapTex, u_xlat1.xy).z;
    u_xlat10_1 = texture2D(_rimHairMaskTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1 + -1.0;
    u_xlat1.x = _rimHairMaskStrength * u_xlat1.x + 1.0;
    u_xlat11.x = (-u_xlat10_31) + 1.0;
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat2.xyz * u_xlat21.xxx + u_xlat16_3.xyz;
    u_xlat2.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * vs_TEXCOORD5.xyz;
    u_xlat7.xyz = u_xlat2.yzx * u_xlat6.zxy;
    u_xlat7.xyz = u_xlat6.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vs_TEXCOORD5.www;
    u_xlat10_9.xy = texture2D(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat9.xy = u_xlat10_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat9.yyy;
    u_xlat2.xyz = u_xlat9.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat32 = (-u_xlat9.x) * u_xlat9.x + 1.0;
    u_xlat32 = (-u_xlat9.y) * u_xlat9.y + u_xlat32;
    u_xlat32 = sqrt(u_xlat32);
    u_xlat2.xyz = vec3(u_xlat32) * u_xlat6.xyz + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat12 = u_xlat2.x * _StarFresnelSmooth;
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _StarFresnelSmooth;
    u_xlat16_0.x = max(_StarFresnelIntensity, 0.0);
    u_xlat12 = u_xlat16_0.x * u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_0.xyz = vec3(u_xlat12) * _StarFresnelColor.xyz;
    u_xlat16_30 = max(_StarRimIntensity, 0.0);
    u_xlat2.x = u_xlat16_30 * u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_0.xyz = u_xlat2.xxx * _StarRimColor.xyz + u_xlat16_0.xyz;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat22.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat7.xy = u_xlat22.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat7.xy;
    u_xlat10_2.x = texture2D(_StarTex, u_xlat2.xy).w;
    u_xlat16_30 = u_xlat10_2.x * 2.0 + -1.0;
    u_xlat2.xy = vec2(u_xlat16_30) * vec2(_WarpIntensity) + u_xlat22.xy;
    u_xlat2.xy = u_xlat2.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat10_7.xyz = texture2D(_StarTex, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = log2(u_xlat10_7.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_0.xyz = u_xlat16_3.xyz * _StarColor.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = (-u_xlat11.xyz) + u_xlat16_0.xyz;
    u_xlat2.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat10_2.x = texture2D(_ChangColorDissolveTex, u_xlat2.xy).x;
    u_xlat12 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat12 = u_xlat12 * 2.0 + -0.0599999987;
    u_xlat2.x = u_xlat12 * _ChangColorShrink + u_xlat10_2.x;
    u_xlat16_30 = u_xlat2.x + -0.100000001;
    u_xlat16_3.x = u_xlat2.x + u_xlat2.x;
    u_xlat16_3.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _ChangEdgeColor.xyz;
    u_xlat16_30 = u_xlat16_30 * 2.5;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_33 = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_33;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_30);
    u_xlat10_2.x = texture2D(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat16_0.xyz = u_xlat10_2.xxx * u_xlat16_0.xyz + u_xlat11.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlat11.xy = u_xlat6.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat11.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat6.xx + u_xlat11.xy;
    u_xlat11.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat6.zz + u_xlat11.xy;
    u_xlat6.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat6.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat2.xy = u_xlat6.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat6.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat6.zz + u_xlat2.xy;
    u_xlat16_3.xy = (-u_xlat11.xy) + u_xlat2.xy;
    u_xlat16_3.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_3.xy + u_xlat11.xy;
    u_xlat16_30 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xy = vec2(u_xlat16_30) * u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_RimWidth);
    u_xlat31 = float(1.0) / vs_TEXCOORD7.w;
    u_xlat22.xy = u_xlat16_3.xy * vec2(u_xlat31) + u_xlat22.xy;
    u_xlat31 = texture2D(_CameraDepthTexture, u_xlat22.xy).x;
    u_xlat31 = _ZBufferParams.z * u_xlat31 + _ZBufferParams.w;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat31 = u_xlat31 + (-vs_TEXCOORD2.w);
    u_xlatb31 = u_xlat31>=_depthSubThreshold;
    u_xlat31 = u_xlatb31 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat1.x * u_xlat31;
    u_xlat6.xyz = u_xlat1.xxx * _RimCol.xyz;
    u_xlat16_30 = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xy = vec2(u_xlat16_30) * u_xlat11.xy;
    u_xlat16_30 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_23.xy = vec2(u_xlat16_30) * u_xlat2.xy;
    u_xlat16_30 = dot(u_xlat16_3.xy, u_xlat16_23.xy);
    u_xlat16_30 = u_xlat16_30 * 0.5 + 0.5;
    u_xlat16_30 = log2(u_xlat16_30);
    u_xlat16_30 = u_xlat16_30 * _ColorScaleByLightDir;
    u_xlat16_30 = exp2(u_xlat16_30);
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_0.xyz = u_xlat6.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat16_30 = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_30 = u_xlat1.x / u_xlat16_30;
    u_xlat16_3.x = u_xlat1.x + 9.99999975e-05;
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _pointLightAtten;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _pointLightColor.xyz;
    u_xlat16_30 = min(u_xlat16_30, 1.0);
    u_xlat16_30 = u_xlat16_30 + -0.800000012;
    u_xlat16_30 = u_xlat16_30 * 5.00000048;
    u_xlat16_30 = max(u_xlat16_30, 0.0);
    u_xlat16_33 = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = (-u_xlat16_33) * u_xlat16_30 + 1.0;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(u_xlat16_30) + u_xlat16_0.xyz;
    u_xlatb1 = 0.5<_pointLightOn;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    u_xlat10_1 = texture2D(_LightMapTex, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat10_1 * _LightAreaColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _STAR_DISSOLVE_USE_UV4;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in highp vec2 in_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
out highp vec2 vs_TEXCOORD10;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(_STAR_DISSOLVE_USE_UV4);
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_2) + u_xlat0.xy;
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _rimHairMaskStrength;
uniform 	mediump float _USE_SPECULAR_RAMP_ON;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AnisotropicMask_ST;
uniform 	mediump float _AnisotropicStrength;
uniform 	mediump float _AnisotropicOffset;
uniform 	mediump float _AnisotropicRange;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump vec4 _HairLineTex_ST;
uniform 	mediump vec4 _HairLineColor;
uniform 	mediump float _LineSaturation;
uniform 	mediump float _HairLineStrength;
uniform 	mediump float _useUv3;
uniform 	mediump float _useMaskUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform 	vec4 _StarTex_ST;
uniform 	mediump vec4 _StarColor;
uniform 	vec4 _WarpMapOffset;
uniform 	vec2 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _StarFresnelColor;
uniform 	mediump float _StarFresnelIntensity;
uniform 	mediump float _StarFresnelSmooth;
uniform 	mediump vec4 _StarRimColor;
uniform 	mediump float _StarRimIntensity;
uniform 	mediump float _StarRimSmooth;
uniform 	vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(5) uniform mediump sampler2D _HairLineTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairLineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _AnisotropicMask;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SpecularRamp;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(12) uniform mediump sampler2D _StarTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(15) uniform mediump sampler2D _rimHairMaskTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
in highp vec2 vs_TEXCOORD10;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
vec3 u_xlat14;
mediump vec3 u_xlat16_18;
vec2 u_xlat22;
vec2 u_xlat23;
mediump float u_xlat16_23;
vec2 u_xlat27;
mediump vec2 u_xlat16_27;
mediump vec2 u_xlat16_29;
float u_xlat33;
mediump float u_xlat16_33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_34;
mediump float u_xlat16_35;
float u_xlat36;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat5.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat5.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat5.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat5.xy);
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_34 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_39 = u_xlat16_34 + -1.0;
    u_xlat16_39 = _InSideLineStrength * u_xlat16_39 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_6.xyz * _InSideLineColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz;
    u_xlat34 = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_40 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_40 = u_xlat16_39 * u_xlat16_40 + _InSideLineSaturation;
    u_xlat9.xyz = u_xlat16_7.xyz * vec3(u_xlat16_39) + (-vec3(u_xlat34));
    u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz + vec3(u_xlat34);
    u_xlat16_39 = (-u_xlat16_39) + 1.0;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat16_39) + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_34 = texture(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_35 = texture(_LightMapTex, u_xlat5.xy).z;
    u_xlat16_27.xy = texture(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat27.xy = u_xlat16_27.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat36 = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat36 = (-u_xlat27.y) * u_xlat27.y + u_xlat36;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat0.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat27.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat27.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat0.xyz + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat16_39 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.0350000001<u_xlat16_4.w);
#else
    u_xlatb33 = 0.0350000001<u_xlat16_4.w;
#endif
    u_xlat16_7.x = log2(u_xlat16_4.w);
    u_xlat16_7.x = u_xlat16_7.x * _HairSelfShadowPow;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_39) + u_xlat16_7.x;
    u_xlat16_39 = _HairSelfShadowLerp * u_xlat16_7.x + u_xlat16_39;
    u_xlat16_7.x = _ShadowThreshold + 0.5;
    u_xlat16_18.x = u_xlat16_7.x + (-_ShadowFeather);
    u_xlat16_7.x = u_xlat16_7.x + _ShadowFeather;
    u_xlat16_7.x = (-u_xlat16_18.x) + u_xlat16_7.x;
    u_xlat16_39 = u_xlat16_39 + (-u_xlat16_18.x);
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_39 * -2.0 + 3.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_7.x;
    u_xlat16_39 = min(u_xlat16_39, 1.0);
    u_xlat16_7.x = (u_xlatb33) ? u_xlat16_39 : 0.0;
    u_xlat16_39 = 1.5 / _RampRowsCount;
    u_xlat16_7.y = (-u_xlat16_39) + 1.0;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat16_7.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(_RampDifLerpValue) * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_18.xyz = u_xlat16_6.xyz * _DarkColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * _LightAreaColor.xyz + (-u_xlat16_18.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + u_xlat16_18.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _HairLineTex_ST.xy + _HairLineTex_ST.zw;
    u_xlat16_33 = texture(_HairLineTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_HairLineMask, vs_TEXCOORD0.xy).x;
    u_xlat16_39 = u_xlat16_33 * u_xlat16_3.x;
    u_xlat16_40 = (-u_xlat16_33) * u_xlat16_3.x + 1.0;
    u_xlat16_39 = _HairLineStrength * (-u_xlat16_39) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz;
    u_xlat3.x = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_8.x = (-_LineSaturation) + 1.0;
    u_xlat16_8.x = u_xlat16_39 * u_xlat16_8.x + _LineSaturation;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat16_39) + (-u_xlat3.xxx);
    u_xlat3.xyz = u_xlat16_8.xxx * u_xlat14.xyz + u_xlat3.xxx;
    u_xlat16_7.xyz = vec3(u_xlat16_33) * _HairLineColor.xyz;
    u_xlat16_7.xyz = u_xlat3.xyz * u_xlat16_7.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD9.xy * _AnisotropicMask_ST.xy + _AnisotropicMask_ST.zw;
    u_xlat16_33 = texture(_AnisotropicMask, u_xlat3.xy).x;
    u_xlat3.xy = vs_TEXCOORD0.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_3.x = texture(_AnisotropicTex, u_xlat3.xy).x;
    u_xlat3.x = u_xlat16_3.x * 2.0 + -1.0;
    u_xlat14.x = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat14.xyz = (-u_xlat0.yzx) * u_xlat14.xxx + vs_TEXCOORD5.yzx;
    u_xlat27.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat14.xyz = u_xlat14.xyz * u_xlat27.xxx;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat0.yzx * u_xlat14.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat14.xyz * vs_TEXCOORD5.www;
    u_xlat27.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat3.x = u_xlat3.x * _AnisotropicStrength + _AnisotropicOffset;
    u_xlat10.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.xyz = u_xlat14.xyz * u_xlat27.xxx + u_xlat10.xyz;
    u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
    u_xlat16_39 = max(_AnisotropicRange, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_39;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat33 = u_xlat16_40 * u_xlat16_33;
    u_xlat1.x = u_xlat33 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.y = 0.5;
    u_xlat16_3.xyz = texture(_SpecularRamp, u_xlat1.xy).xyz;
    u_xlat16_39 = _USE_SPECULAR_RAMP_ON;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = (-u_xlat1.xxx) + u_xlat16_3.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz + u_xlat1.xxx;
    u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z) + u_xlat16_7.xyz;
    SV_Target0.w = u_xlat16_34 * _LightAreaColor.w;
    u_xlat33 = _Time.y * _EmisstionParams.z;
    u_xlat33 = sin(u_xlat33);
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat33 = u_xlat33 * u_xlat1.x + _EmisstionParams.x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EmisstionColor.xyz;
    u_xlat1.x = (-u_xlat16_35) + 1.0;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat16_7.xyz;
    u_xlatb3 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_useUv3, _useUv3, _useMaskUv3, _useMaskUv3));
    u_xlat3.x = (u_xlatb3.x) ? vs_VAR_LIUUV0.x : vs_TEXCOORD0.x;
    u_xlat3.y = (u_xlatb3.y) ? vs_VAR_LIUUV0.y : vs_TEXCOORD0.y;
    u_xlat3.z = (u_xlatb3.z) ? vs_VAR_LIUUV0.x : vs_TEXCOORD0.x;
    u_xlat3.w = (u_xlatb3.w) ? vs_VAR_LIUUV0.y : vs_TEXCOORD0.y;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_10.xyz = texture(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat16_33 = texture(_LG_Tex, u_xlat3.zw).w;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(_LG_Intensity);
    u_xlat16_6.xyz = vec3(u_xlat16_33) * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2));
#else
    u_xlatb33 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
#endif
    if(u_xlatb33){
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32));
#else
        u_xlatb33 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
#endif
        u_xlat1.xy = (bool(u_xlatb33)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat23.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat1.xy;
        u_xlat23.xy = u_xlat23.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_3.xyz = texture(_LG_Tex2, u_xlat23.xy).xyz;
        u_xlat16_33 = texture(_LG_Tex2, u_xlat1.xy).w;
        u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(_LG_Intensity2);
        u_xlat16_7.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz;
        u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_6.xyz;
    }
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat33 = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat23.xy = u_xlat1.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat23.xy = u_xlat23.xy + u_xlat2.xy;
    u_xlat16_23 = texture(_StarTex, u_xlat23.xy).w;
    u_xlat16_39 = u_xlat16_23 * 2.0 + -1.0;
    u_xlat23.xy = vec2(u_xlat16_39) * vec2(_WarpIntensity) + u_xlat1.xy;
    u_xlat23.xy = u_xlat23.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat16_2.xyz = texture(_StarTex, u_xlat23.xy).xyz;
    u_xlat16_7.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_7.xyz = exp2(u_xlat16_7.xyz);
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = log2(u_xlat33);
    u_xlat23.x = u_xlat33 * _StarFresnelSmooth;
    u_xlat23.x = exp2(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _StarFresnelSmooth;
    u_xlat16_39 = max(_StarFresnelIntensity, 0.0);
    u_xlat23.x = u_xlat23.x * u_xlat16_39;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat23.xxx * _StarFresnelColor.xyz;
    u_xlat33 = u_xlat33 * _StarRimSmooth;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = u_xlat33 * _StarRimSmooth;
    u_xlat16_39 = max(_StarRimIntensity, 0.0);
    u_xlat33 = u_xlat33 * u_xlat16_39;
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat33) * _StarRimColor.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _StarColor.xyz + u_xlat16_8.xyz;
    u_xlat16_33 = texture(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat23.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_23 = texture(_ChangColorDissolveTex, u_xlat23.xy).x;
    u_xlat34 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat34 = u_xlat34 * 2.0 + -0.0599999987;
    u_xlat23.x = u_xlat34 * _ChangColorShrink + u_xlat16_23;
    u_xlat16_39 = u_xlat23.x + u_xlat23.x;
    u_xlat16_39 = u_xlat16_39 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat23.x + -0.100000001;
    u_xlat16_40 = u_xlat16_40 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_8.x;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_39 = (-u_xlat16_39) + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * _ChangEdgeColor.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat16_40);
    u_xlat16_6.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_40) + u_xlat16_6.xyz;
    u_xlat2.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat11.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat11.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat22.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat22.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat22.xy;
    u_xlat22.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat22.xy;
    u_xlat16_39 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_7.xy = u_xlat0.xy * vec2(u_xlat16_39);
    u_xlat16_39 = dot(u_xlat22.xy, u_xlat22.xy);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_29.xy = u_xlat22.xy * vec2(u_xlat16_39);
    u_xlat16_39 = dot(u_xlat16_7.xy, u_xlat16_29.xy);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * _ColorScaleByLightDir;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = min(u_xlat16_39, 1.0);
    u_xlat16_7.xy = (-u_xlat0.xy) + u_xlat22.xy;
    u_xlat16_7.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_7.xy + u_xlat0.xy;
    u_xlat16_29.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
    u_xlat16_29.x = inversesqrt(u_xlat16_29.x);
    u_xlat16_7.xy = u_xlat16_29.xx * u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_7.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_11 = texture(_rimHairMaskTex, u_xlat5.xy).x;
    u_xlat11.x = u_xlat16_11 + -1.0;
    u_xlat11.x = _rimHairMaskStrength * u_xlat11.x + 1.0;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * vec3(u_xlat16_39) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat11.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_39 = u_xlat11.x + 9.99999975e-05;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * _pointLightAtten;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = float(1.0) / u_xlat16_39;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat11.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_18.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_18.x) * u_xlat16_7.x + 1.0;
    u_xlat16_18.xyz = vec3(u_xlat16_39) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xyz * u_xlat16_7.xxx + u_xlat16_6.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _STAR_DISSOLVE_USE_UV4;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in highp vec2 in_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
out highp vec2 vs_TEXCOORD10;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(_STAR_DISSOLVE_USE_UV4);
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_2) + u_xlat0.xy;
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _rimHairMaskStrength;
uniform 	mediump float _USE_SPECULAR_RAMP_ON;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AnisotropicMask_ST;
uniform 	mediump float _AnisotropicStrength;
uniform 	mediump float _AnisotropicOffset;
uniform 	mediump float _AnisotropicRange;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump vec4 _HairLineTex_ST;
uniform 	mediump vec4 _HairLineColor;
uniform 	mediump float _LineSaturation;
uniform 	mediump float _HairLineStrength;
uniform 	mediump float _useUv3;
uniform 	mediump float _useMaskUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform 	vec4 _StarTex_ST;
uniform 	mediump vec4 _StarColor;
uniform 	vec4 _WarpMapOffset;
uniform 	vec2 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _StarFresnelColor;
uniform 	mediump float _StarFresnelIntensity;
uniform 	mediump float _StarFresnelSmooth;
uniform 	mediump vec4 _StarRimColor;
uniform 	mediump float _StarRimIntensity;
uniform 	mediump float _StarRimSmooth;
uniform 	vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(5) uniform mediump sampler2D _HairLineTex;
UNITY_LOCATION(6) uniform mediump sampler2D _HairLineMask;
UNITY_LOCATION(7) uniform mediump sampler2D _AnisotropicMask;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SpecularRamp;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(12) uniform mediump sampler2D _StarTex;
UNITY_LOCATION(13) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(14) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(15) uniform mediump sampler2D _rimHairMaskTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
in highp vec2 vs_TEXCOORD10;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec4 u_xlatb3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump float u_xlat16_11;
vec3 u_xlat14;
mediump vec3 u_xlat16_18;
vec2 u_xlat22;
vec2 u_xlat23;
mediump float u_xlat16_23;
vec2 u_xlat27;
mediump vec2 u_xlat16_27;
mediump vec2 u_xlat16_29;
float u_xlat33;
mediump float u_xlat16_33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_34;
mediump float u_xlat16_35;
float u_xlat36;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat5.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat5.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat5.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat5.xy);
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_34 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_39 = u_xlat16_34 + -1.0;
    u_xlat16_39 = _InSideLineStrength * u_xlat16_39 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_6.xyz * _InSideLineColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz;
    u_xlat34 = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_40 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_40 = u_xlat16_39 * u_xlat16_40 + _InSideLineSaturation;
    u_xlat9.xyz = u_xlat16_7.xyz * vec3(u_xlat16_39) + (-vec3(u_xlat34));
    u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz + vec3(u_xlat34);
    u_xlat16_39 = (-u_xlat16_39) + 1.0;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat16_39) + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_34 = texture(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_35 = texture(_LightMapTex, u_xlat5.xy).z;
    u_xlat16_27.xy = texture(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat27.xy = u_xlat16_27.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat36 = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat36 = (-u_xlat27.y) * u_xlat27.y + u_xlat36;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat0.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat27.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat27.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat0.xyz + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat16_39 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.0350000001<u_xlat16_4.w);
#else
    u_xlatb33 = 0.0350000001<u_xlat16_4.w;
#endif
    u_xlat16_7.x = log2(u_xlat16_4.w);
    u_xlat16_7.x = u_xlat16_7.x * _HairSelfShadowPow;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_39) + u_xlat16_7.x;
    u_xlat16_39 = _HairSelfShadowLerp * u_xlat16_7.x + u_xlat16_39;
    u_xlat16_7.x = _ShadowThreshold + 0.5;
    u_xlat16_18.x = u_xlat16_7.x + (-_ShadowFeather);
    u_xlat16_7.x = u_xlat16_7.x + _ShadowFeather;
    u_xlat16_7.x = (-u_xlat16_18.x) + u_xlat16_7.x;
    u_xlat16_39 = u_xlat16_39 + (-u_xlat16_18.x);
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_39 * -2.0 + 3.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_7.x;
    u_xlat16_39 = min(u_xlat16_39, 1.0);
    u_xlat16_7.x = (u_xlatb33) ? u_xlat16_39 : 0.0;
    u_xlat16_39 = 1.5 / _RampRowsCount;
    u_xlat16_7.y = (-u_xlat16_39) + 1.0;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat16_7.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_3.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(_RampDifLerpValue) * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_18.xyz = u_xlat16_6.xyz * _DarkColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * _LightAreaColor.xyz + (-u_xlat16_18.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + u_xlat16_18.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _HairLineTex_ST.xy + _HairLineTex_ST.zw;
    u_xlat16_33 = texture(_HairLineTex, u_xlat3.xy).x;
    u_xlat16_3.x = texture(_HairLineMask, vs_TEXCOORD0.xy).x;
    u_xlat16_39 = u_xlat16_33 * u_xlat16_3.x;
    u_xlat16_40 = (-u_xlat16_33) * u_xlat16_3.x + 1.0;
    u_xlat16_39 = _HairLineStrength * (-u_xlat16_39) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz;
    u_xlat3.x = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_8.x = (-_LineSaturation) + 1.0;
    u_xlat16_8.x = u_xlat16_39 * u_xlat16_8.x + _LineSaturation;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat16_39) + (-u_xlat3.xxx);
    u_xlat3.xyz = u_xlat16_8.xxx * u_xlat14.xyz + u_xlat3.xxx;
    u_xlat16_7.xyz = vec3(u_xlat16_33) * _HairLineColor.xyz;
    u_xlat16_7.xyz = u_xlat3.xyz * u_xlat16_7.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD9.xy * _AnisotropicMask_ST.xy + _AnisotropicMask_ST.zw;
    u_xlat16_33 = texture(_AnisotropicMask, u_xlat3.xy).x;
    u_xlat3.xy = vs_TEXCOORD0.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat16_3.x = texture(_AnisotropicTex, u_xlat3.xy).x;
    u_xlat3.x = u_xlat16_3.x * 2.0 + -1.0;
    u_xlat14.x = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat14.xyz = (-u_xlat0.yzx) * u_xlat14.xxx + vs_TEXCOORD5.yzx;
    u_xlat27.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat14.xyz = u_xlat14.xyz * u_xlat27.xxx;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat0.yzx * u_xlat14.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat14.xyz * vs_TEXCOORD5.www;
    u_xlat27.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat3.x = u_xlat3.x * _AnisotropicStrength + _AnisotropicOffset;
    u_xlat10.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.xyz = u_xlat14.xyz * u_xlat27.xxx + u_xlat10.xyz;
    u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
    u_xlat16_39 = max(_AnisotropicRange, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_39;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat33 = u_xlat16_40 * u_xlat16_33;
    u_xlat1.x = u_xlat33 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.y = 0.5;
    u_xlat16_3.xyz = texture(_SpecularRamp, u_xlat1.xy).xyz;
    u_xlat16_39 = _USE_SPECULAR_RAMP_ON;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = (-u_xlat1.xxx) + u_xlat16_3.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz + u_xlat1.xxx;
    u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z) + u_xlat16_7.xyz;
    SV_Target0.w = u_xlat16_34 * _LightAreaColor.w;
    u_xlat33 = _Time.y * _EmisstionParams.z;
    u_xlat33 = sin(u_xlat33);
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat33 = u_xlat33 * u_xlat1.x + _EmisstionParams.x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EmisstionColor.xyz;
    u_xlat1.x = (-u_xlat16_35) + 1.0;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat16_7.xyz;
    u_xlatb3 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_useUv3, _useUv3, _useMaskUv3, _useMaskUv3));
    u_xlat3.x = (u_xlatb3.x) ? vs_VAR_LIUUV0.x : vs_TEXCOORD0.x;
    u_xlat3.y = (u_xlatb3.y) ? vs_VAR_LIUUV0.y : vs_TEXCOORD0.y;
    u_xlat3.z = (u_xlatb3.z) ? vs_VAR_LIUUV0.x : vs_TEXCOORD0.x;
    u_xlat3.w = (u_xlatb3.w) ? vs_VAR_LIUUV0.y : vs_TEXCOORD0.y;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_10.xyz = texture(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat16_33 = texture(_LG_Tex, u_xlat3.zw).w;
    u_xlat16_6.xyz = u_xlat16_10.xyz * vec3(_LG_Intensity);
    u_xlat16_6.xyz = vec3(u_xlat16_33) * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2));
#else
    u_xlatb33 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
#endif
    if(u_xlatb33){
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32));
#else
        u_xlatb33 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
#endif
        u_xlat1.xy = (bool(u_xlatb33)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat23.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat1.xy;
        u_xlat23.xy = u_xlat23.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_3.xyz = texture(_LG_Tex2, u_xlat23.xy).xyz;
        u_xlat16_33 = texture(_LG_Tex2, u_xlat1.xy).w;
        u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(_LG_Intensity2);
        u_xlat16_7.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz;
        u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_6.xyz;
    }
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat33 = dot(u_xlat9.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat23.xy = u_xlat1.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat23.xy = u_xlat23.xy + u_xlat2.xy;
    u_xlat16_23 = texture(_StarTex, u_xlat23.xy).w;
    u_xlat16_39 = u_xlat16_23 * 2.0 + -1.0;
    u_xlat23.xy = vec2(u_xlat16_39) * vec2(_WarpIntensity) + u_xlat1.xy;
    u_xlat23.xy = u_xlat23.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat16_2.xyz = texture(_StarTex, u_xlat23.xy).xyz;
    u_xlat16_7.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_7.xyz = exp2(u_xlat16_7.xyz);
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = log2(u_xlat33);
    u_xlat23.x = u_xlat33 * _StarFresnelSmooth;
    u_xlat23.x = exp2(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _StarFresnelSmooth;
    u_xlat16_39 = max(_StarFresnelIntensity, 0.0);
    u_xlat23.x = u_xlat23.x * u_xlat16_39;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat23.xxx * _StarFresnelColor.xyz;
    u_xlat33 = u_xlat33 * _StarRimSmooth;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = u_xlat33 * _StarRimSmooth;
    u_xlat16_39 = max(_StarRimIntensity, 0.0);
    u_xlat33 = u_xlat33 * u_xlat16_39;
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = vec3(u_xlat33) * _StarRimColor.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _StarColor.xyz + u_xlat16_8.xyz;
    u_xlat16_33 = texture(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat23.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_23 = texture(_ChangColorDissolveTex, u_xlat23.xy).x;
    u_xlat34 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat34 = u_xlat34 * 2.0 + -0.0599999987;
    u_xlat23.x = u_xlat34 * _ChangColorShrink + u_xlat16_23;
    u_xlat16_39 = u_xlat23.x + u_xlat23.x;
    u_xlat16_39 = u_xlat16_39 * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat23.x + -0.100000001;
    u_xlat16_40 = u_xlat16_40 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_8.x;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_39 = (-u_xlat16_39) + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * _ChangEdgeColor.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat16_40);
    u_xlat16_6.xyz = vec3(u_xlat16_33) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_40) + u_xlat16_6.xyz;
    u_xlat2.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat11.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat11.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat22.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat22.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat22.xy;
    u_xlat22.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat22.xy;
    u_xlat16_39 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_7.xy = u_xlat0.xy * vec2(u_xlat16_39);
    u_xlat16_39 = dot(u_xlat22.xy, u_xlat22.xy);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_29.xy = u_xlat22.xy * vec2(u_xlat16_39);
    u_xlat16_39 = dot(u_xlat16_7.xy, u_xlat16_29.xy);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * _ColorScaleByLightDir;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = min(u_xlat16_39, 1.0);
    u_xlat16_7.xy = (-u_xlat0.xy) + u_xlat22.xy;
    u_xlat16_7.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_7.xy + u_xlat0.xy;
    u_xlat16_29.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
    u_xlat16_29.x = inversesqrt(u_xlat16_29.x);
    u_xlat16_7.xy = u_xlat16_29.xx * u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_7.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_11 = texture(_rimHairMaskTex, u_xlat5.xy).x;
    u_xlat11.x = u_xlat16_11 + -1.0;
    u_xlat11.x = _rimHairMaskStrength * u_xlat11.x + 1.0;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * vec3(u_xlat16_39) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat11.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat11.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_39 = u_xlat11.x + 9.99999975e-05;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * _pointLightAtten;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = float(1.0) / u_xlat16_39;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat11.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_18.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_18.x) * u_xlat16_7.x + 1.0;
    u_xlat16_18.xyz = vec3(u_xlat16_39) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xyz * u_xlat16_7.xxx + u_xlat16_6.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _STAR_DISSOLVE_USE_UV4;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec2 in_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(_STAR_DISSOLVE_USE_UV4);
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_2) + u_xlat0.xy;
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _rimHairMaskStrength;
uniform 	mediump float _USE_SPECULAR_RAMP_ON;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AnisotropicMask_ST;
uniform 	mediump float _AnisotropicStrength;
uniform 	mediump float _AnisotropicOffset;
uniform 	mediump float _AnisotropicRange;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump vec4 _HairLineTex_ST;
uniform 	mediump vec4 _HairLineColor;
uniform 	mediump float _LineSaturation;
uniform 	mediump float _HairLineStrength;
uniform 	mediump float _useUv3;
uniform 	mediump float _useMaskUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform 	vec4 _StarTex_ST;
uniform 	mediump vec4 _StarColor;
uniform 	vec4 _WarpMapOffset;
uniform 	vec2 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _StarFresnelColor;
uniform 	mediump float _StarFresnelIntensity;
uniform 	mediump float _StarFresnelSmooth;
uniform 	mediump vec4 _StarRimColor;
uniform 	mediump float _StarRimIntensity;
uniform 	mediump float _StarRimSmooth;
uniform 	vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _HairLineTex;
uniform lowp sampler2D _HairLineMask;
uniform lowp sampler2D _AnisotropicMask;
uniform lowp sampler2D _AnisotropicTex;
uniform lowp sampler2D _SpecularRamp;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Tex2;
uniform lowp sampler2D _StarTex;
uniform lowp sampler2D _ChangColorDissolveTex;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _rimHairMaskTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bvec4 u_xlatb3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
vec3 u_xlat11;
lowp float u_xlat10_11;
vec3 u_xlat14;
mediump vec3 u_xlat16_18;
vec2 u_xlat22;
vec2 u_xlat23;
lowp float u_xlat10_23;
vec2 u_xlat27;
lowp vec2 u_xlat10_27;
mediump vec2 u_xlat16_29;
float u_xlat33;
lowp float u_xlat10_33;
bool u_xlatb33;
float u_xlat34;
lowp float u_xlat10_34;
lowp float u_xlat10_35;
float u_xlat36;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat16_4 = (-_USE3UV_ON) + 1.0;
    u_xlat5.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat5.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_4) + u_xlat5.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat5.xy);
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat10_34 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_39 = u_xlat10_34 + -1.0;
    u_xlat16_39 = _InSideLineStrength * u_xlat16_39 + 1.0;
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _InSideLineColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz;
    u_xlat34 = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_40 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_40 = u_xlat16_39 * u_xlat16_40 + _InSideLineSaturation;
    u_xlat9.xyz = u_xlat16_7.xyz * vec3(u_xlat16_39) + (-vec3(u_xlat34));
    u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz + vec3(u_xlat34);
    u_xlat16_39 = (-u_xlat16_39) + 1.0;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat16_39) + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat10_34 = texture2D(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat10_35 = texture2D(_LightMapTex, u_xlat5.xy).z;
    u_xlat10_27.xy = texture2D(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat27.xy = u_xlat10_27.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat36 = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat36 = (-u_xlat27.y) * u_xlat27.y + u_xlat36;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat0.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat27.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat27.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat0.xyz + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat16_39 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlatb33 = 0.0350000001<u_xlat10_4.w;
    u_xlat16_7.x = log2(u_xlat10_4.w);
    u_xlat16_7.x = u_xlat16_7.x * _HairSelfShadowPow;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_39) + u_xlat16_7.x;
    u_xlat16_39 = _HairSelfShadowLerp * u_xlat16_7.x + u_xlat16_39;
    u_xlat16_7.x = _ShadowThreshold + 0.5;
    u_xlat16_18.x = u_xlat16_7.x + (-_ShadowFeather);
    u_xlat16_7.x = u_xlat16_7.x + _ShadowFeather;
    u_xlat16_7.x = (-u_xlat16_18.x) + u_xlat16_7.x;
    u_xlat16_39 = u_xlat16_39 + (-u_xlat16_18.x);
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_7.x;
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_39 * -2.0 + 3.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_7.x;
    u_xlat16_39 = min(u_xlat16_39, 1.0);
    u_xlat16_7.x = (u_xlatb33) ? u_xlat16_39 : 0.0;
    u_xlat16_39 = 1.5 / _RampRowsCount;
    u_xlat16_7.y = (-u_xlat16_39) + 1.0;
    u_xlat10_3.xyz = texture2D(_RampTex, u_xlat16_7.xy).xyz;
    u_xlat16_18.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat10_3.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat10_3.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(_RampDifLerpValue) * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_18.xyz = u_xlat16_6.xyz * _DarkColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * _LightAreaColor.xyz + (-u_xlat16_18.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + u_xlat16_18.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _HairLineTex_ST.xy + _HairLineTex_ST.zw;
    u_xlat10_33 = texture2D(_HairLineTex, u_xlat3.xy).x;
    u_xlat10_3.x = texture2D(_HairLineMask, vs_TEXCOORD0.xy).x;
    u_xlat16_39 = u_xlat10_33 * u_xlat10_3.x;
    u_xlat16_40 = (-u_xlat10_33) * u_xlat10_3.x + 1.0;
    u_xlat16_39 = _HairLineStrength * (-u_xlat16_39) + 1.0;
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz;
    u_xlat3.x = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_8.x = (-_LineSaturation) + 1.0;
    u_xlat16_8.x = u_xlat16_39 * u_xlat16_8.x + _LineSaturation;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat16_39) + (-u_xlat3.xxx);
    u_xlat3.xyz = u_xlat16_8.xxx * u_xlat14.xyz + u_xlat3.xxx;
    u_xlat16_7.xyz = vec3(u_xlat10_33) * _HairLineColor.xyz;
    u_xlat16_7.xyz = u_xlat3.xyz * u_xlat16_7.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = vec3(u_xlat10_33) * u_xlat16_7.xyz + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD9.xy * _AnisotropicMask_ST.xy + _AnisotropicMask_ST.zw;
    u_xlat10_33 = texture2D(_AnisotropicMask, u_xlat3.xy).x;
    u_xlat3.xy = vs_TEXCOORD0.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat10_3.x = texture2D(_AnisotropicTex, u_xlat3.xy).x;
    u_xlat3.x = u_xlat10_3.x * 2.0 + -1.0;
    u_xlat14.x = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat14.xyz = (-u_xlat0.yzx) * u_xlat14.xxx + vs_TEXCOORD5.yzx;
    u_xlat27.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat14.xyz = u_xlat14.xyz * u_xlat27.xxx;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat0.yzx * u_xlat14.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat14.xyz * vs_TEXCOORD5.www;
    u_xlat27.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat3.x = u_xlat3.x * _AnisotropicStrength + _AnisotropicOffset;
    u_xlat10.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.xyz = u_xlat14.xyz * u_xlat27.xxx + u_xlat10.xyz;
    u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
    u_xlat16_39 = max(_AnisotropicRange, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_39;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat33 = u_xlat16_40 * u_xlat10_33;
    u_xlat1.x = u_xlat33 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.y = 0.5;
    u_xlat10_3.xyz = texture2D(_SpecularRamp, u_xlat1.xy).xyz;
    u_xlat16_39 = _USE_SPECULAR_RAMP_ON;
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_8.xyz = (-u_xlat1.xxx) + u_xlat10_3.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz + u_xlat1.xxx;
    u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z) + u_xlat16_7.xyz;
    SV_Target0.w = u_xlat10_34 * _LightAreaColor.w;
    u_xlat33 = _Time.y * _EmisstionParams.z;
    u_xlat33 = sin(u_xlat33);
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat33 = u_xlat33 * u_xlat1.x + _EmisstionParams.x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EmisstionColor.xyz;
    u_xlat1.x = (-u_xlat10_35) + 1.0;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat16_7.xyz;
    u_xlatb3 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_useUv3, _useUv3, _useMaskUv3, _useMaskUv3));
    u_xlat3.x = (u_xlatb3.x) ? vs_VAR_LIUUV0.x : vs_TEXCOORD0.x;
    u_xlat3.y = (u_xlatb3.y) ? vs_VAR_LIUUV0.y : vs_TEXCOORD0.y;
    u_xlat3.z = (u_xlatb3.z) ? vs_VAR_LIUUV0.x : vs_TEXCOORD0.x;
    u_xlat3.w = (u_xlatb3.w) ? vs_VAR_LIUUV0.y : vs_TEXCOORD0.y;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_10.xyz = texture2D(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat10_33 = texture2D(_LG_Tex, u_xlat3.zw).w;
    u_xlat16_6.xyz = u_xlat10_10.xyz * vec3(_LG_Intensity);
    u_xlat16_6.xyz = vec3(u_xlat10_33) * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat1.xyz;
    u_xlatb33 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb33){
        u_xlatb33 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat1.xy = (bool(u_xlatb33)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat23.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat1.xy;
        u_xlat23.xy = u_xlat23.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_3.xyz = texture2D(_LG_Tex2, u_xlat23.xy).xyz;
        u_xlat10_33 = texture2D(_LG_Tex2, u_xlat1.xy).w;
        u_xlat16_7.xyz = u_xlat10_3.xyz * vec3(_LG_Intensity2);
        u_xlat16_7.xyz = vec3(u_xlat10_33) * u_xlat16_7.xyz;
        u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_6.xyz;
    }
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat33 = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
    u_xlat23.xy = u_xlat1.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat23.xy = u_xlat23.xy + u_xlat2.xy;
    u_xlat10_23 = texture2D(_StarTex, u_xlat23.xy).w;
    u_xlat16_39 = u_xlat10_23 * 2.0 + -1.0;
    u_xlat23.xy = vec2(u_xlat16_39) * vec2(_WarpIntensity) + u_xlat1.xy;
    u_xlat23.xy = u_xlat23.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_StarTex, u_xlat23.xy).xyz;
    u_xlat16_7.xyz = log2(u_xlat10_2.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_7.xyz = exp2(u_xlat16_7.xyz);
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = log2(u_xlat33);
    u_xlat23.x = u_xlat33 * _StarFresnelSmooth;
    u_xlat23.x = exp2(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _StarFresnelSmooth;
    u_xlat16_39 = max(_StarFresnelIntensity, 0.0);
    u_xlat23.x = u_xlat23.x * u_xlat16_39;
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat23.xxx * _StarFresnelColor.xyz;
    u_xlat33 = u_xlat33 * _StarRimSmooth;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = u_xlat33 * _StarRimSmooth;
    u_xlat16_39 = max(_StarRimIntensity, 0.0);
    u_xlat33 = u_xlat33 * u_xlat16_39;
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
    u_xlat16_8.xyz = vec3(u_xlat33) * _StarRimColor.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _StarColor.xyz + u_xlat16_8.xyz;
    u_xlat10_33 = texture2D(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat23.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat10_23 = texture2D(_ChangColorDissolveTex, u_xlat23.xy).x;
    u_xlat34 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat34 = u_xlat34 * 2.0 + -0.0599999987;
    u_xlat23.x = u_xlat34 * _ChangColorShrink + u_xlat10_23;
    u_xlat16_39 = u_xlat23.x + u_xlat23.x;
    u_xlat16_39 = u_xlat16_39 * _ChangColorRange + (-_ChangColorRange);
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_40 = u_xlat23.x + -0.100000001;
    u_xlat16_40 = u_xlat16_40 * 2.5;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_8.x;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_39 = (-u_xlat16_39) + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * _ChangEdgeColor.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat16_40);
    u_xlat16_6.xyz = vec3(u_xlat10_33) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_40) + u_xlat16_6.xyz;
    u_xlat2.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat11.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat11.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat22.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat22.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat22.xy;
    u_xlat22.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat22.xy;
    u_xlat16_39 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_7.xy = u_xlat0.xy * vec2(u_xlat16_39);
    u_xlat16_39 = dot(u_xlat22.xy, u_xlat22.xy);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_29.xy = u_xlat22.xy * vec2(u_xlat16_39);
    u_xlat16_39 = dot(u_xlat16_7.xy, u_xlat16_29.xy);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * _ColorScaleByLightDir;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = min(u_xlat16_39, 1.0);
    u_xlat16_7.xy = (-u_xlat0.xy) + u_xlat22.xy;
    u_xlat16_7.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_7.xy + u_xlat0.xy;
    u_xlat16_29.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
    u_xlat16_29.x = inversesqrt(u_xlat16_29.x);
    u_xlat16_7.xy = u_xlat16_29.xx * u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_7.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat10_11 = texture2D(_rimHairMaskTex, u_xlat5.xy).x;
    u_xlat11.x = u_xlat10_11 + -1.0;
    u_xlat11.x = _rimHairMaskStrength * u_xlat11.x + 1.0;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * vec3(u_xlat16_39) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat11.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat11.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_39 = u_xlat11.x + 9.99999975e-05;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * _pointLightAtten;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = float(1.0) / u_xlat16_39;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat11.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_18.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_18.x) * u_xlat16_7.x + 1.0;
    u_xlat16_18.xyz = vec3(u_xlat16_39) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xyz * u_xlat16_7.xxx + u_xlat16_6.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _STAR_DISSOLVE_USE_UV4;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec2 in_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(_STAR_DISSOLVE_USE_UV4);
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_2) + u_xlat0.xy;
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _rimHairMaskStrength;
uniform 	mediump float _USE_SPECULAR_RAMP_ON;
uniform 	mediump vec4 _AnisotropicTex_ST;
uniform 	mediump vec4 _AnisotropicMask_ST;
uniform 	mediump float _AnisotropicStrength;
uniform 	mediump float _AnisotropicOffset;
uniform 	mediump float _AnisotropicRange;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump vec4 _HairLineTex_ST;
uniform 	mediump vec4 _HairLineColor;
uniform 	mediump float _LineSaturation;
uniform 	mediump float _HairLineStrength;
uniform 	mediump float _useUv3;
uniform 	mediump float _useMaskUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform 	vec4 _StarTex_ST;
uniform 	mediump vec4 _StarColor;
uniform 	vec4 _WarpMapOffset;
uniform 	vec2 _WarpDirSpeed;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _StarFresnelColor;
uniform 	mediump float _StarFresnelIntensity;
uniform 	mediump float _StarFresnelSmooth;
uniform 	mediump vec4 _StarRimColor;
uniform 	mediump float _StarRimIntensity;
uniform 	mediump float _StarRimSmooth;
uniform 	vec4 _ChangColorDissolveTex_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	mediump float _ChangColorShrink;
uniform 	mediump float _ChangColorRange;
uniform 	mediump float _ChangColorAmount;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _HairLineTex;
uniform lowp sampler2D _HairLineMask;
uniform lowp sampler2D _AnisotropicMask;
uniform lowp sampler2D _AnisotropicTex;
uniform lowp sampler2D _SpecularRamp;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Tex2;
uniform lowp sampler2D _StarTex;
uniform lowp sampler2D _ChangColorDissolveTex;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _rimHairMaskTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bvec4 u_xlatb3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
vec3 u_xlat11;
lowp float u_xlat10_11;
vec3 u_xlat14;
mediump vec3 u_xlat16_18;
vec2 u_xlat22;
vec2 u_xlat23;
lowp float u_xlat10_23;
vec2 u_xlat27;
lowp vec2 u_xlat10_27;
mediump vec2 u_xlat16_29;
float u_xlat33;
lowp float u_xlat10_33;
bool u_xlatb33;
float u_xlat34;
lowp float u_xlat10_34;
lowp float u_xlat10_35;
float u_xlat36;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat34 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * _WorldSpaceLightPos0.xyz;
    u_xlat16_4 = (-_USE3UV_ON) + 1.0;
    u_xlat5.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat5.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_4) + u_xlat5.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat5.xy);
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat10_34 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_39 = u_xlat10_34 + -1.0;
    u_xlat16_39 = _InSideLineStrength * u_xlat16_39 + 1.0;
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_6.xyz * _InSideLineColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz;
    u_xlat34 = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_40 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_40 = u_xlat16_39 * u_xlat16_40 + _InSideLineSaturation;
    u_xlat9.xyz = u_xlat16_7.xyz * vec3(u_xlat16_39) + (-vec3(u_xlat34));
    u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz + vec3(u_xlat34);
    u_xlat16_39 = (-u_xlat16_39) + 1.0;
    u_xlat16_7.xyz = u_xlat9.xyz * vec3(u_xlat16_39) + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat10_34 = texture2D(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat10_35 = texture2D(_LightMapTex, u_xlat5.xy).z;
    u_xlat10_27.xy = texture2D(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat27.xy = u_xlat10_27.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat36 = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat36 = (-u_xlat27.y) * u_xlat27.y + u_xlat36;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat0.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat27.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat27.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat0.xyz + u_xlat9.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat16_39 = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlatb33 = 0.0350000001<u_xlat10_4.w;
    u_xlat16_7.x = log2(u_xlat10_4.w);
    u_xlat16_7.x = u_xlat16_7.x * _HairSelfShadowPow;
    u_xlat16_7.x = exp2(u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_39) + u_xlat16_7.x;
    u_xlat16_39 = _HairSelfShadowLerp * u_xlat16_7.x + u_xlat16_39;
    u_xlat16_7.x = _ShadowThreshold + 0.5;
    u_xlat16_18.x = u_xlat16_7.x + (-_ShadowFeather);
    u_xlat16_7.x = u_xlat16_7.x + _ShadowFeather;
    u_xlat16_7.x = (-u_xlat16_18.x) + u_xlat16_7.x;
    u_xlat16_39 = u_xlat16_39 + (-u_xlat16_18.x);
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_7.x;
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_39 * -2.0 + 3.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_7.x;
    u_xlat16_39 = min(u_xlat16_39, 1.0);
    u_xlat16_7.x = (u_xlatb33) ? u_xlat16_39 : 0.0;
    u_xlat16_39 = 1.5 / _RampRowsCount;
    u_xlat16_7.y = (-u_xlat16_39) + 1.0;
    u_xlat10_3.xyz = texture2D(_RampTex, u_xlat16_7.xy).xyz;
    u_xlat16_18.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat10_3.xyz * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat10_3.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = vec3(_RampDifLerpValue) * u_xlat16_18.xyz + u_xlat16_6.xyz;
    u_xlat16_18.xyz = u_xlat16_6.xyz * _DarkColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * _LightAreaColor.xyz + (-u_xlat16_18.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + u_xlat16_18.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _HairLineTex_ST.xy + _HairLineTex_ST.zw;
    u_xlat10_33 = texture2D(_HairLineTex, u_xlat3.xy).x;
    u_xlat10_3.x = texture2D(_HairLineMask, vs_TEXCOORD0.xy).x;
    u_xlat16_39 = u_xlat10_33 * u_xlat10_3.x;
    u_xlat16_40 = (-u_xlat10_33) * u_xlat10_3.x + 1.0;
    u_xlat16_39 = _HairLineStrength * (-u_xlat16_39) + 1.0;
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_7.xyz;
    u_xlat3.x = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_8.x = (-_LineSaturation) + 1.0;
    u_xlat16_8.x = u_xlat16_39 * u_xlat16_8.x + _LineSaturation;
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat16_39) + (-u_xlat3.xxx);
    u_xlat3.xyz = u_xlat16_8.xxx * u_xlat14.xyz + u_xlat3.xxx;
    u_xlat16_7.xyz = vec3(u_xlat10_33) * _HairLineColor.xyz;
    u_xlat16_7.xyz = u_xlat3.xyz * u_xlat16_7.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = vec3(u_xlat10_33) * u_xlat16_7.xyz + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD9.xy * _AnisotropicMask_ST.xy + _AnisotropicMask_ST.zw;
    u_xlat10_33 = texture2D(_AnisotropicMask, u_xlat3.xy).x;
    u_xlat3.xy = vs_TEXCOORD0.xy * _AnisotropicTex_ST.xy + _AnisotropicTex_ST.zw;
    u_xlat10_3.x = texture2D(_AnisotropicTex, u_xlat3.xy).x;
    u_xlat3.x = u_xlat10_3.x * 2.0 + -1.0;
    u_xlat14.x = dot(vs_TEXCOORD5.xyz, u_xlat0.xyz);
    u_xlat14.xyz = (-u_xlat0.yzx) * u_xlat14.xxx + vs_TEXCOORD5.yzx;
    u_xlat27.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat14.xyz = u_xlat14.xyz * u_xlat27.xxx;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat14.xyz;
    u_xlat14.xyz = u_xlat0.yzx * u_xlat14.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat14.xyz * vs_TEXCOORD5.www;
    u_xlat27.x = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat3.x = u_xlat3.x * _AnisotropicStrength + _AnisotropicOffset;
    u_xlat10.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.xyz = u_xlat14.xyz * u_xlat27.xxx + u_xlat10.xyz;
    u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
    u_xlat16_39 = max(_AnisotropicRange, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_39;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat33 = u_xlat16_40 * u_xlat10_33;
    u_xlat1.x = u_xlat33 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.y = 0.5;
    u_xlat10_3.xyz = texture2D(_SpecularRamp, u_xlat1.xy).xyz;
    u_xlat16_39 = _USE_SPECULAR_RAMP_ON;
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_8.xyz = (-u_xlat1.xxx) + u_xlat10_3.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * u_xlat16_8.xyz + u_xlat1.xxx;
    u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z) + u_xlat16_7.xyz;
    SV_Target0.w = u_xlat10_34 * _LightAreaColor.w;
    u_xlat33 = _Time.y * _EmisstionParams.z;
    u_xlat33 = sin(u_xlat33);
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat33 = u_xlat33 * u_xlat1.x + _EmisstionParams.x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _EmisstionColor.xyz;
    u_xlat1.x = (-u_xlat10_35) + 1.0;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat33) + u_xlat16_7.xyz;
    u_xlatb3 = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_useUv3, _useUv3, _useMaskUv3, _useMaskUv3));
    u_xlat3.x = (u_xlatb3.x) ? vs_VAR_LIUUV0.x : vs_TEXCOORD0.x;
    u_xlat3.y = (u_xlatb3.y) ? vs_VAR_LIUUV0.y : vs_TEXCOORD0.y;
    u_xlat3.z = (u_xlatb3.z) ? vs_VAR_LIUUV0.x : vs_TEXCOORD0.x;
    u_xlat3.w = (u_xlatb3.w) ? vs_VAR_LIUUV0.y : vs_TEXCOORD0.y;
    u_xlat3.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_10.xyz = texture2D(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat10_33 = texture2D(_LG_Tex, u_xlat3.zw).w;
    u_xlat16_6.xyz = u_xlat10_10.xyz * vec3(_LG_Intensity);
    u_xlat16_6.xyz = vec3(u_xlat10_33) * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat1.xyz;
    u_xlatb33 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb33){
        u_xlatb33 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat1.xy = (bool(u_xlatb33)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat23.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat1.xy;
        u_xlat23.xy = u_xlat23.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_3.xyz = texture2D(_LG_Tex2, u_xlat23.xy).xyz;
        u_xlat10_33 = texture2D(_LG_Tex2, u_xlat1.xy).w;
        u_xlat16_7.xyz = u_xlat10_3.xyz * vec3(_LG_Intensity2);
        u_xlat16_7.xyz = vec3(u_xlat10_33) * u_xlat16_7.xyz;
        u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_6.xyz;
    }
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat33 = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
    u_xlat23.xy = u_xlat1.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat23.xy = u_xlat23.xy + u_xlat2.xy;
    u_xlat10_23 = texture2D(_StarTex, u_xlat23.xy).w;
    u_xlat16_39 = u_xlat10_23 * 2.0 + -1.0;
    u_xlat23.xy = vec2(u_xlat16_39) * vec2(_WarpIntensity) + u_xlat1.xy;
    u_xlat23.xy = u_xlat23.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_StarTex, u_xlat23.xy).xyz;
    u_xlat16_7.xyz = log2(u_xlat10_2.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_7.xyz = exp2(u_xlat16_7.xyz);
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = log2(u_xlat33);
    u_xlat23.x = u_xlat33 * _StarFresnelSmooth;
    u_xlat23.x = exp2(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _StarFresnelSmooth;
    u_xlat16_39 = max(_StarFresnelIntensity, 0.0);
    u_xlat23.x = u_xlat23.x * u_xlat16_39;
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat23.xxx * _StarFresnelColor.xyz;
    u_xlat33 = u_xlat33 * _StarRimSmooth;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = u_xlat33 * _StarRimSmooth;
    u_xlat16_39 = max(_StarRimIntensity, 0.0);
    u_xlat33 = u_xlat33 * u_xlat16_39;
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
    u_xlat16_8.xyz = vec3(u_xlat33) * _StarRimColor.xyz + u_xlat16_8.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _StarColor.xyz + u_xlat16_8.xyz;
    u_xlat10_33 = texture2D(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat23.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat10_23 = texture2D(_ChangColorDissolveTex, u_xlat23.xy).x;
    u_xlat34 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat34 = u_xlat34 * 2.0 + -0.0599999987;
    u_xlat23.x = u_xlat34 * _ChangColorShrink + u_xlat10_23;
    u_xlat16_39 = u_xlat23.x + u_xlat23.x;
    u_xlat16_39 = u_xlat16_39 * _ChangColorRange + (-_ChangColorRange);
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
    u_xlat16_40 = u_xlat23.x + -0.100000001;
    u_xlat16_40 = u_xlat16_40 * 2.5;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_8.x;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_39 = (-u_xlat16_39) + 1.0;
    u_xlat16_8.xyz = vec3(u_xlat16_39) * _ChangEdgeColor.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat16_40);
    u_xlat16_6.xyz = vec3(u_xlat10_33) * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_40) + u_xlat16_6.xyz;
    u_xlat2.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat11.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat11.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat22.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat22.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat22.xy;
    u_xlat22.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat22.xy;
    u_xlat16_39 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_7.xy = u_xlat0.xy * vec2(u_xlat16_39);
    u_xlat16_39 = dot(u_xlat22.xy, u_xlat22.xy);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_29.xy = u_xlat22.xy * vec2(u_xlat16_39);
    u_xlat16_39 = dot(u_xlat16_7.xy, u_xlat16_29.xy);
    u_xlat16_39 = u_xlat16_39 * 0.5 + 0.5;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * _ColorScaleByLightDir;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = min(u_xlat16_39, 1.0);
    u_xlat16_7.xy = (-u_xlat0.xy) + u_xlat22.xy;
    u_xlat16_7.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_7.xy + u_xlat0.xy;
    u_xlat16_29.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
    u_xlat16_29.x = inversesqrt(u_xlat16_29.x);
    u_xlat16_7.xy = u_xlat16_29.xx * u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_7.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat10_11 = texture2D(_rimHairMaskTex, u_xlat5.xy).x;
    u_xlat11.x = u_xlat10_11 + -1.0;
    u_xlat11.x = _rimHairMaskStrength * u_xlat11.x + 1.0;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * vec3(u_xlat16_39) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat11.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat11.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_39 = u_xlat11.x + 9.99999975e-05;
    u_xlat16_39 = log2(u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * _pointLightAtten;
    u_xlat16_39 = exp2(u_xlat16_39);
    u_xlat16_39 = float(1.0) / u_xlat16_39;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat11.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_18.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_18.x) * u_xlat16_7.x + 1.0;
    u_xlat16_18.xyz = vec3(u_xlat16_39) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xyz * u_xlat16_7.xxx + u_xlat16_6.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
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
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "SHADOWSUPPORT" = "true" }
  GpuProgramID 119663
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
 Pass {
 Name "Outline"
 Cull Front
  GpuProgramID 158258
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _Outline_Width;
uniform lowp sampler2D _LightMapTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat2.xy = in_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat2.xy = in_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat2.xy;
    u_xlat12 = texture2DLod(_LightMapTex, u_xlat2.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _USE3UV_ON;
uniform 	mediump vec4 _Outline_Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
void main()
{
    u_xlat16_0 = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_0) + u_xlat1.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat1.xy);
    SV_Target0 = u_xlat10_0 * _Outline_Color;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _Outline_Width;
uniform lowp sampler2D _LightMapTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat2.xy = in_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat2.xy = in_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat2.xy;
    u_xlat12 = texture2DLod(_LightMapTex, u_xlat2.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _USE3UV_ON;
uniform 	mediump vec4 _Outline_Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
void main()
{
    u_xlat16_0 = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_0) + u_xlat1.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat1.xy);
    SV_Target0 = u_xlat10_0 * _Outline_Color;
    return;
}

#endif
"
}
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _Outline_Width;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMapTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat2.xy = in_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat2.xy = in_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat2.xy;
    u_xlat12 = textureLod(_LightMapTex, u_xlat2.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _USE3UV_ON;
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
void main()
{
    u_xlat16_0.x = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * u_xlat16_0.xx + u_xlat1.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    SV_Target0 = u_xlat16_0 * _Outline_Color;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _Outline_Width;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMapTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat2.xy = in_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat2.xy = in_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat2.xy;
    u_xlat12 = textureLod(_LightMapTex, u_xlat2.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _USE3UV_ON;
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
void main()
{
    u_xlat16_0.x = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * u_xlat16_0.xx + u_xlat1.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    SV_Target0 = u_xlat16_0 * _Outline_Color;
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
}
}
}
}