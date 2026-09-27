//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NPR/Hero_NprV2_Face_ScreenEf" {
Properties {

[Header(Point Light___________________________________________________________________________________________________________________________)] [Space(20)] [Toggle] _pointLightOn ("点光源开关", Float) = 0.0

_pointLightPos ("点光源位置", Vector) = (312.249,312.761,0.9,0)

_pointLightRange ("点光源范围", Float) = 1.0

_pointLightAtten ("点光源衰减", Range(1, 8)) = 1.0

_pointLightColor ("点光源颜色", Color) = (1,1,1,1)

[Header(BaseTexture)] [Space(10)] _MainTex ("RGB:Albedo,A:不受光照的Mask 0为不需要光照", 2D) = "white" { }

_LightMapTex ("R:sdf前,G:外描边宽度,B:sdf中;A:sdf后", 2D) = "white" { }

_RampTex ("RampTex", 2D) = "white" { }

_RampDifLerpValue ("Ramp纹理叠加主纹理强弱", Range(0, 1)) = 0.10000000149011612

[Header(Gradation)] [Space(10)] _ShadowThreshold ("明暗偏移阈值,默认是0一般不用动", Range(-1, 1)) = 0.0

_ShadowFeather ("阴影边缘的平滑(会乘法线的a通道)", Range(0.01, 0.49)) = 0.009999999776482582

_LightAreaColor ("受光面灯光颜色", Color) = (1,1,1,1)

_DarkColor ("背光面灯光颜色", Color) = (0.5,0.5,0.5,1)

[Header(Hair Shadow)] [Space(10)] _HairShadowDistaceX ("刘海投影X方向偏移", Float) = 0.009999999776482582

_HairShadowDistaceY ("刘海投影Y方向偏移", Float) = 0.009999999776482582

_HairShadowLightMix ("刘海投影受灯光方向影响强弱", Range(0, 1)) = 0.30000001192092896

[Header(Rim)] [Space(10)] _RimWidth ("边缘光粗细", Float) = 1.0

_RimCol ("边缘光颜色", Color) = (1,1,1,1)

_depthSubThreshold ("DepthSubThreshold", Float) = 0.5

_depthRimOffset ("边缘光偏移", Vector) = (0,0,0,0)

_ColorScaleByLightDir ("边缘光颜色受灯光亮暗强弱影响", Range(0.001, 5)) = 1.0

_WidthEffectByLightDir ("边缘光粗细受灯光亮暗强弱影响", Range(0, 1)) = 0.0

[Header(InsideLine)] _InSideLine ("InSideOnline", 2D) = "white" { }

_InSideLine_Width ("InSideOnline_Width", Float) = 0.10000000149011612

[Header(Outline)] [Space(10)] _Outline_Width ("外描边宽度", Float) = 0.019999999552965164

_Outline_Color ("外描边颜色", Color) = (0.5,0.5,0.5,1)

_Outline_Offset_X ("Outline_Offset_X 一般不用动", Float) = 0.0

_Outline_Offset_Y ("Outline_Offset_Y一般不用动", Float) = 0.0

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

[Header(Other)] [Space(10)] _boneRight ("勿动,脸部骨骼朝右方向矢量", Vector) = (0,0,1,0)

_boneForward ("勿动,脸部骨骼朝前方向矢量", Vector) = (0,1,0,0)

}
SubShader {
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" }
  GpuProgramID 51507
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec3 _boneForward;
uniform 	mediump vec3 _boneRight;
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
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD10;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
bool u_xlatb9;
mediump float u_xlat16_11;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_15;
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
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_3 = dot(u_xlat1.xyz, _boneRight.xyz);
    u_xlat16_7 = dot(u_xlat1.xyz, _boneForward.xyz);
    u_xlat16_11 = max(abs(u_xlat16_7), abs(u_xlat16_3));
    u_xlat16_11 = float(1.0) / u_xlat16_11;
    u_xlat16_15 = min(abs(u_xlat16_7), abs(u_xlat16_3));
    u_xlat16_11 = u_xlat16_11 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_11 * u_xlat16_11;
    u_xlat1.x = u_xlat16_15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + -0.330299497;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + 0.999866009;
    u_xlat5 = u_xlat1.x * u_xlat16_11;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(abs(u_xlat16_7)<abs(u_xlat16_3));
#else
    u_xlatb9 = abs(u_xlat16_7)<abs(u_xlat16_3);
#endif
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat1.x = u_xlat16_11 * u_xlat1.x + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_7<(-u_xlat16_7));
#else
    u_xlatb5 = u_xlat16_7<(-u_xlat16_7);
#endif
    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat16_11 = min(u_xlat16_7, u_xlat16_3);
    u_xlat16_3 = max(u_xlat16_7, u_xlat16_3);
    vs_TEXCOORD4 = u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_3>=(-u_xlat16_3));
#else
    u_xlatb5 = u_xlat16_3>=(-u_xlat16_3);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_11<(-u_xlat16_11));
#else
    u_xlatb9 = u_xlat16_11<(-u_xlat16_11);
#endif
    u_xlatb5 = u_xlatb5 && u_xlatb9;
    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.x<0.0);
#else
    u_xlatb5 = u_xlat1.x<0.0;
#endif
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat16_2.zw = min(abs(u_xlat1.xx), vec2(1.0, 1.0));
    u_xlat1.xz = in_TEXCOORD0.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_2.xy = (bool(u_xlatb5)) ? u_xlat1.xz : in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat16_2;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_3 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(vec2(_STAR_DISSOLVE_USE_UV4, _STAR_DISSOLVE_USE_UV4));
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_3) + u_xlat0.xy;
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
uniform 	mediump float _enableHairShadow;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump float _HairShadowDistaceX;
uniform 	mediump float _HairShadowDistaceY;
uniform 	mediump float _HairShadowLightMix;
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
UNITY_LOCATION(4) uniform mediump sampler2D _CharacterHairShadowTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _StarTex;
UNITY_LOCATION(7) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(8) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump float vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD10;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
float u_xlat14;
vec2 u_xlat24;
vec2 u_xlat26;
mediump vec2 u_xlat16_30;
float u_xlat36;
mediump float u_xlat16_36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat43;
float u_xlat44;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<vs_TEXCOORD4);
#else
    u_xlatb0 = 0.0<vs_TEXCOORD4;
#endif
    u_xlat16_12.xyz = texture(_LightMapTex, vs_TEXCOORD1.xy).xzw;
    u_xlat16_1.x = (-u_xlat16_12.y) + u_xlat16_12.z;
    u_xlat16_1.x = abs(vs_TEXCOORD4) * u_xlat16_1.x + u_xlat16_12.y;
    u_xlat16_1.x = (u_xlatb0) ? u_xlat16_12.x : u_xlat16_1.x;
    u_xlat0.x = vs_TEXCOORD1.z + _ShadowThreshold;
    u_xlat12 = u_xlat0.x + (-_ShadowFeather);
    u_xlat0.x = u_xlat0.x + _ShadowFeather;
    u_xlat0.x = (-u_xlat12) + u_xlat0.x;
    u_xlat12 = (-u_xlat12) + u_xlat16_1.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat12 = vs_TEXCOORD7.z / vs_TEXCOORD7.w;
    u_xlat12 = u_xlat12 * 0.5 + 0.5;
    u_xlat12 = _ZBufferParams.z * u_xlat12 + _ZBufferParams.w;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat12 = u_xlat12 + 0.00999999978;
    u_xlat24.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat2.xyz = u_xlat24.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat24.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat24.xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat24.xy;
    u_xlat24.xy = u_xlat24.xy * vec2(0.0199999996, 0.0199999996);
    u_xlat2.x = _HairShadowLightMix * u_xlat24.x + _HairShadowDistaceX;
    u_xlat2.y = _HairShadowLightMix * u_xlat24.y + _HairShadowDistaceY;
    u_xlat24.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat26.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.xy = u_xlat2.xy * u_xlat24.xx + u_xlat26.xy;
    u_xlat16_36 = texture(_CharacterHairShadowTexture, u_xlat2.xy).x;
    u_xlat36 = _ZBufferParams.z * u_xlat16_36 + _ZBufferParams.w;
    u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat36>=u_xlat12);
#else
    u_xlatb12 = u_xlat36>=u_xlat12;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_enableHairShadow));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_enableHairShadow);
#endif
    u_xlat12 = (u_xlatb36) ? u_xlat12 : 1.0;
    u_xlat16_1.x = min(u_xlat0.x, u_xlat12);
    u_xlat16_1.y = 0.96875;
    u_xlat16_0.xyw = texture(_RampTex, u_xlat16_1.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_0.xyw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_0.xyw * u_xlat16_13.xyz;
    u_xlat16_3.x = (-_USE3UV_ON) + 1.0;
    u_xlat0.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat16_3.xx + u_xlat0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * _InSideLineColor.xyz;
    u_xlat16_0.x = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_40 = u_xlat16_0.x + -1.0;
    u_xlat16_40 = _InSideLineStrength * u_xlat16_40 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = u_xlat16_5.xyz * vec3(u_xlat16_40) + (-u_xlat0.xxx);
    u_xlat16_5.x = (-_InSideLineSaturation) + 1.0;
    u_xlat16_5.x = u_xlat16_40 * u_xlat16_5.x + _InSideLineSaturation;
    u_xlat16_40 = (-u_xlat16_40) + 1.0;
    u_xlat0.xyw = u_xlat16_5.xxx * u_xlat7.xyz + u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyw * vec3(u_xlat16_40) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_13.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_13.xyz * _LightAreaColor.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * _DarkColor.xyz;
    u_xlat16_5.w = u_xlat16_3.w * _LightAreaColor.w;
    u_xlat16_6.w = u_xlat16_3.w * _DarkColor.w;
    u_xlat5 = u_xlat16_5 + (-u_xlat16_6);
    u_xlat1 = u_xlat16_1.xxxx * u_xlat5 + u_xlat16_6;
    u_xlat0.xyw = (-u_xlat16_4.xyz) + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyw = u_xlat16_3.www * u_xlat0.xyw + u_xlat16_4.xyz;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat7.xy = u_xlat26.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat7.xy;
    u_xlat16_2.x = texture(_StarTex, u_xlat2.xy).w;
    u_xlat16_4.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat2.xy = u_xlat16_4.xx * vec2(_WarpIntensity) + u_xlat26.xy;
    u_xlat2.xy = u_xlat2.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat16_7.xyz = texture(_StarTex, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat7.xyz;
    u_xlat16_2.xy = texture(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat43 = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat43 = (-u_xlat2.y) * u_xlat2.y + u_xlat43;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat8.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat8.xyz = u_xlat8.xxx * vs_TEXCOORD5.xyz;
    u_xlat44 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat44) * vs_TEXCOORD3.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.zxy;
    u_xlat10.xyz = u_xlat9.yzx * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat2.yyy * u_xlat10.xyz;
    u_xlat8.xyz = u_xlat2.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat8.xyz = vec3(u_xlat43) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat14 = u_xlat2.x * _StarFresnelSmooth;
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _StarFresnelSmooth;
    u_xlat16_40 = max(_StarFresnelIntensity, 0.0);
    u_xlat14 = u_xlat14 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat14) * _StarFresnelColor.xyz;
    u_xlat16_40 = max(_StarRimIntensity, 0.0);
    u_xlat2.x = u_xlat2.x * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat2.xxx * _StarRimColor.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _StarColor.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat0.xyw) + u_xlat16_4.xyz;
    u_xlat2.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_2.x = texture(_ChangColorDissolveTex, u_xlat2.xy).x;
    u_xlat14 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat14 = u_xlat14 * 2.0 + -0.0599999987;
    u_xlat2.x = u_xlat14 * _ChangColorShrink + u_xlat16_2.x;
    u_xlat16_40 = u_xlat2.x + -0.100000001;
    u_xlat16_6.x = u_xlat2.x + u_xlat2.x;
    u_xlat16_6.x = u_xlat16_6.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _ChangEdgeColor.xyz;
    u_xlat16_40 = u_xlat16_40 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_42 = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_42;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_40);
    u_xlat16_2.x = texture(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat16_4.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlat0.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat0.xy;
    u_xlat16_40 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_6.xy = u_xlat0.xy * vec2(u_xlat16_40);
    u_xlat7.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat2.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat2.xy;
    u_xlat16_40 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_30.xy = u_xlat2.xy * vec2(u_xlat16_40);
    u_xlat16_11.xy = (-u_xlat0.xy) + u_xlat2.xy;
    u_xlat16_11.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_11.xy + u_xlat0.xy;
    u_xlat16_40 = dot(u_xlat16_6.xy, u_xlat16_30.xy);
    u_xlat16_40 = u_xlat16_40 * 0.5 + 0.5;
    u_xlat16_40 = log2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * _ColorScaleByLightDir;
    u_xlat16_40 = exp2(u_xlat16_40);
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_6.x = dot(u_xlat16_11.xy, u_xlat16_11.xy);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xy = u_xlat16_6.xx * u_xlat16_11.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(_RimWidth);
    u_xlat0.xy = u_xlat16_6.xy * u_xlat24.xx + u_xlat26.xy;
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
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_40 = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_40 = u_xlat0.x / u_xlat16_40;
    u_xlat16_6.x = u_xlat0.x + 9.99999975e-05;
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_6.x * _pointLightAtten;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _pointLightColor.xyz;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_40 = u_xlat16_40 + -0.800000012;
    u_xlat16_40 = u_xlat16_40 * 5.00000048;
    u_xlat16_40 = max(u_xlat16_40, 0.0);
    u_xlat16_42 = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = (-u_xlat16_42) * u_xlat16_40 + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_4.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec3 _boneForward;
uniform 	mediump vec3 _boneRight;
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
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump float vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD10;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
bool u_xlatb9;
mediump float u_xlat16_11;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_15;
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
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_3 = dot(u_xlat1.xyz, _boneRight.xyz);
    u_xlat16_7 = dot(u_xlat1.xyz, _boneForward.xyz);
    u_xlat16_11 = max(abs(u_xlat16_7), abs(u_xlat16_3));
    u_xlat16_11 = float(1.0) / u_xlat16_11;
    u_xlat16_15 = min(abs(u_xlat16_7), abs(u_xlat16_3));
    u_xlat16_11 = u_xlat16_11 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_11 * u_xlat16_11;
    u_xlat1.x = u_xlat16_15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + -0.330299497;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + 0.999866009;
    u_xlat5 = u_xlat1.x * u_xlat16_11;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(abs(u_xlat16_7)<abs(u_xlat16_3));
#else
    u_xlatb9 = abs(u_xlat16_7)<abs(u_xlat16_3);
#endif
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat1.x = u_xlat16_11 * u_xlat1.x + u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_7<(-u_xlat16_7));
#else
    u_xlatb5 = u_xlat16_7<(-u_xlat16_7);
#endif
    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat16_11 = min(u_xlat16_7, u_xlat16_3);
    u_xlat16_3 = max(u_xlat16_7, u_xlat16_3);
    vs_TEXCOORD4 = u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_3>=(-u_xlat16_3));
#else
    u_xlatb5 = u_xlat16_3>=(-u_xlat16_3);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_11<(-u_xlat16_11));
#else
    u_xlatb9 = u_xlat16_11<(-u_xlat16_11);
#endif
    u_xlatb5 = u_xlatb5 && u_xlatb9;
    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.x<0.0);
#else
    u_xlatb5 = u_xlat1.x<0.0;
#endif
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat16_2.zw = min(abs(u_xlat1.xx), vec2(1.0, 1.0));
    u_xlat1.xz = in_TEXCOORD0.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_2.xy = (bool(u_xlatb5)) ? u_xlat1.xz : in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat16_2;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_3 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(vec2(_STAR_DISSOLVE_USE_UV4, _STAR_DISSOLVE_USE_UV4));
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_3) + u_xlat0.xy;
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
uniform 	mediump float _enableHairShadow;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump float _HairShadowDistaceX;
uniform 	mediump float _HairShadowDistaceY;
uniform 	mediump float _HairShadowLightMix;
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
UNITY_LOCATION(4) uniform mediump sampler2D _CharacterHairShadowTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _StarTex;
UNITY_LOCATION(7) uniform mediump sampler2D _ChangColorDissolveTex;
UNITY_LOCATION(8) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in mediump float vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD10;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
float u_xlat14;
vec2 u_xlat24;
vec2 u_xlat26;
mediump vec2 u_xlat16_30;
float u_xlat36;
mediump float u_xlat16_36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat43;
float u_xlat44;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<vs_TEXCOORD4);
#else
    u_xlatb0 = 0.0<vs_TEXCOORD4;
#endif
    u_xlat16_12.xyz = texture(_LightMapTex, vs_TEXCOORD1.xy).xzw;
    u_xlat16_1.x = (-u_xlat16_12.y) + u_xlat16_12.z;
    u_xlat16_1.x = abs(vs_TEXCOORD4) * u_xlat16_1.x + u_xlat16_12.y;
    u_xlat16_1.x = (u_xlatb0) ? u_xlat16_12.x : u_xlat16_1.x;
    u_xlat0.x = vs_TEXCOORD1.z + _ShadowThreshold;
    u_xlat12 = u_xlat0.x + (-_ShadowFeather);
    u_xlat0.x = u_xlat0.x + _ShadowFeather;
    u_xlat0.x = (-u_xlat12) + u_xlat0.x;
    u_xlat12 = (-u_xlat12) + u_xlat16_1.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat12 = vs_TEXCOORD7.z / vs_TEXCOORD7.w;
    u_xlat12 = u_xlat12 * 0.5 + 0.5;
    u_xlat12 = _ZBufferParams.z * u_xlat12 + _ZBufferParams.w;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat12 = u_xlat12 + 0.00999999978;
    u_xlat24.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat2.xyz = u_xlat24.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat24.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat24.xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat24.xy;
    u_xlat24.xy = u_xlat24.xy * vec2(0.0199999996, 0.0199999996);
    u_xlat2.x = _HairShadowLightMix * u_xlat24.x + _HairShadowDistaceX;
    u_xlat2.y = _HairShadowLightMix * u_xlat24.y + _HairShadowDistaceY;
    u_xlat24.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat26.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.xy = u_xlat2.xy * u_xlat24.xx + u_xlat26.xy;
    u_xlat16_36 = texture(_CharacterHairShadowTexture, u_xlat2.xy).x;
    u_xlat36 = _ZBufferParams.z * u_xlat16_36 + _ZBufferParams.w;
    u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat36>=u_xlat12);
#else
    u_xlatb12 = u_xlat36>=u_xlat12;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_enableHairShadow));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_enableHairShadow);
#endif
    u_xlat12 = (u_xlatb36) ? u_xlat12 : 1.0;
    u_xlat16_1.x = min(u_xlat0.x, u_xlat12);
    u_xlat16_1.y = 0.96875;
    u_xlat16_0.xyw = texture(_RampTex, u_xlat16_1.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_0.xyw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_0.xyw * u_xlat16_13.xyz;
    u_xlat16_3.x = (-_USE3UV_ON) + 1.0;
    u_xlat0.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat16_3.xx + u_xlat0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * _InSideLineColor.xyz;
    u_xlat16_0.x = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_40 = u_xlat16_0.x + -1.0;
    u_xlat16_40 = _InSideLineStrength * u_xlat16_40 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = u_xlat16_5.xyz * vec3(u_xlat16_40) + (-u_xlat0.xxx);
    u_xlat16_5.x = (-_InSideLineSaturation) + 1.0;
    u_xlat16_5.x = u_xlat16_40 * u_xlat16_5.x + _InSideLineSaturation;
    u_xlat16_40 = (-u_xlat16_40) + 1.0;
    u_xlat0.xyw = u_xlat16_5.xxx * u_xlat7.xyz + u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyw * vec3(u_xlat16_40) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_13.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_13.xyz * _LightAreaColor.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * _DarkColor.xyz;
    u_xlat16_5.w = u_xlat16_3.w * _LightAreaColor.w;
    u_xlat16_6.w = u_xlat16_3.w * _DarkColor.w;
    u_xlat5 = u_xlat16_5 + (-u_xlat16_6);
    u_xlat1 = u_xlat16_1.xxxx * u_xlat5 + u_xlat16_6;
    u_xlat0.xyw = (-u_xlat16_4.xyz) + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyw = u_xlat16_3.www * u_xlat0.xyw + u_xlat16_4.xyz;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat7.xy = u_xlat26.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat7.xy;
    u_xlat16_2.x = texture(_StarTex, u_xlat2.xy).w;
    u_xlat16_4.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat2.xy = u_xlat16_4.xx * vec2(_WarpIntensity) + u_xlat26.xy;
    u_xlat2.xy = u_xlat2.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat16_7.xyz = texture(_StarTex, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = log2(u_xlat16_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat7.xyz;
    u_xlat16_2.xy = texture(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat43 = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat43 = (-u_xlat2.y) * u_xlat2.y + u_xlat43;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat8.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat8.xyz = u_xlat8.xxx * vs_TEXCOORD5.xyz;
    u_xlat44 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat44) * vs_TEXCOORD3.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.zxy;
    u_xlat10.xyz = u_xlat9.yzx * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat2.yyy * u_xlat10.xyz;
    u_xlat8.xyz = u_xlat2.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat8.xyz = vec3(u_xlat43) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat14 = u_xlat2.x * _StarFresnelSmooth;
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _StarFresnelSmooth;
    u_xlat16_40 = max(_StarFresnelIntensity, 0.0);
    u_xlat14 = u_xlat14 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat14) * _StarFresnelColor.xyz;
    u_xlat16_40 = max(_StarRimIntensity, 0.0);
    u_xlat2.x = u_xlat2.x * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat2.xxx * _StarRimColor.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _StarColor.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat0.xyw) + u_xlat16_4.xyz;
    u_xlat2.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat16_2.x = texture(_ChangColorDissolveTex, u_xlat2.xy).x;
    u_xlat14 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat14 = u_xlat14 * 2.0 + -0.0599999987;
    u_xlat2.x = u_xlat14 * _ChangColorShrink + u_xlat16_2.x;
    u_xlat16_40 = u_xlat2.x + -0.100000001;
    u_xlat16_6.x = u_xlat2.x + u_xlat2.x;
    u_xlat16_6.x = u_xlat16_6.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _ChangEdgeColor.xyz;
    u_xlat16_40 = u_xlat16_40 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_42 = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_42;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_40);
    u_xlat16_2.x = texture(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat16_4.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlat0.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat0.xy;
    u_xlat16_40 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_6.xy = u_xlat0.xy * vec2(u_xlat16_40);
    u_xlat7.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat2.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat2.xy;
    u_xlat16_40 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_30.xy = u_xlat2.xy * vec2(u_xlat16_40);
    u_xlat16_11.xy = (-u_xlat0.xy) + u_xlat2.xy;
    u_xlat16_11.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_11.xy + u_xlat0.xy;
    u_xlat16_40 = dot(u_xlat16_6.xy, u_xlat16_30.xy);
    u_xlat16_40 = u_xlat16_40 * 0.5 + 0.5;
    u_xlat16_40 = log2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * _ColorScaleByLightDir;
    u_xlat16_40 = exp2(u_xlat16_40);
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_6.x = dot(u_xlat16_11.xy, u_xlat16_11.xy);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xy = u_xlat16_6.xx * u_xlat16_11.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(_RimWidth);
    u_xlat0.xy = u_xlat16_6.xy * u_xlat24.xx + u_xlat26.xy;
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
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_40 = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_40 = u_xlat0.x / u_xlat16_40;
    u_xlat16_6.x = u_xlat0.x + 9.99999975e-05;
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_6.x * _pointLightAtten;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _pointLightColor.xyz;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_40 = u_xlat16_40 + -0.800000012;
    u_xlat16_40 = u_xlat16_40 * 5.00000048;
    u_xlat16_40 = max(u_xlat16_40, 0.0);
    u_xlat16_42 = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = (-u_xlat16_42) * u_xlat16_40 + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_4.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec3 _boneForward;
uniform 	mediump vec3 _boneRight;
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
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
bool u_xlatb9;
mediump float u_xlat16_11;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_15;
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
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_3 = dot(u_xlat1.xyz, _boneRight.xyz);
    u_xlat16_7 = dot(u_xlat1.xyz, _boneForward.xyz);
    u_xlat16_11 = max(abs(u_xlat16_7), abs(u_xlat16_3));
    u_xlat16_11 = float(1.0) / u_xlat16_11;
    u_xlat16_15 = min(abs(u_xlat16_7), abs(u_xlat16_3));
    u_xlat16_11 = u_xlat16_11 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_11 * u_xlat16_11;
    u_xlat1.x = u_xlat16_15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + -0.330299497;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + 0.999866009;
    u_xlat5 = u_xlat1.x * u_xlat16_11;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat16_7)<abs(u_xlat16_3);
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat1.x = u_xlat16_11 * u_xlat1.x + u_xlat5;
    u_xlatb5 = u_xlat16_7<(-u_xlat16_7);
    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat16_11 = min(u_xlat16_7, u_xlat16_3);
    u_xlat16_3 = max(u_xlat16_7, u_xlat16_3);
    vs_TEXCOORD4 = u_xlat16_7;
    u_xlatb5 = u_xlat16_3>=(-u_xlat16_3);
    u_xlatb9 = u_xlat16_11<(-u_xlat16_11);
    u_xlatb5 = u_xlatb5 && u_xlatb9;
    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlatb5 = u_xlat1.x<0.0;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat16_2.zw = min(abs(u_xlat1.xx), vec2(1.0, 1.0));
    u_xlat1.xz = in_TEXCOORD0.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_2.xy = (bool(u_xlatb5)) ? u_xlat1.xz : in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat16_2;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_3 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(vec2(_STAR_DISSOLVE_USE_UV4, _STAR_DISSOLVE_USE_UV4));
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_3) + u_xlat0.xy;
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
uniform 	mediump float _enableHairShadow;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump float _HairShadowDistaceX;
uniform 	mediump float _HairShadowDistaceY;
uniform 	mediump float _HairShadowLightMix;
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
uniform lowp sampler2D _CharacterHairShadowTexture;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _StarTex;
uniform lowp sampler2D _ChangColorDissolveTex;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
lowp vec2 u_xlat10_2;
mediump float u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat12;
lowp vec3 u_xlat10_12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
float u_xlat14;
vec2 u_xlat24;
vec2 u_xlat26;
mediump vec2 u_xlat16_30;
float u_xlat36;
lowp float u_xlat10_36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat43;
float u_xlat44;
void main()
{
    u_xlatb0 = 0.0<vs_TEXCOORD4;
    u_xlat10_12.xyz = texture2D(_LightMapTex, vs_TEXCOORD1.xy).xzw;
    u_xlat16_1.x = (-u_xlat10_12.y) + u_xlat10_12.z;
    u_xlat16_1.x = abs(vs_TEXCOORD4) * u_xlat16_1.x + u_xlat10_12.y;
    u_xlat16_1.x = (u_xlatb0) ? u_xlat10_12.x : u_xlat16_1.x;
    u_xlat0.x = vs_TEXCOORD1.z + _ShadowThreshold;
    u_xlat12 = u_xlat0.x + (-_ShadowFeather);
    u_xlat0.x = u_xlat0.x + _ShadowFeather;
    u_xlat0.x = (-u_xlat12) + u_xlat0.x;
    u_xlat12 = (-u_xlat12) + u_xlat16_1.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat12 = vs_TEXCOORD7.z / vs_TEXCOORD7.w;
    u_xlat12 = u_xlat12 * 0.5 + 0.5;
    u_xlat12 = _ZBufferParams.z * u_xlat12 + _ZBufferParams.w;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat12 = u_xlat12 + 0.00999999978;
    u_xlat24.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat2.xyz = u_xlat24.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat24.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat24.xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat24.xy;
    u_xlat24.xy = u_xlat24.xy * vec2(0.0199999996, 0.0199999996);
    u_xlat2.x = _HairShadowLightMix * u_xlat24.x + _HairShadowDistaceX;
    u_xlat2.y = _HairShadowLightMix * u_xlat24.y + _HairShadowDistaceY;
    u_xlat24.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat26.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.xy = u_xlat2.xy * u_xlat24.xx + u_xlat26.xy;
    u_xlat10_36 = texture2D(_CharacterHairShadowTexture, u_xlat2.xy).x;
    u_xlat36 = _ZBufferParams.z * u_xlat10_36 + _ZBufferParams.w;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlatb12 = u_xlat36>=u_xlat12;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_enableHairShadow);
    u_xlat12 = (u_xlatb36) ? u_xlat12 : 1.0;
    u_xlat16_1.x = min(u_xlat0.x, u_xlat12);
    u_xlat16_1.y = 0.96875;
    u_xlat10_0.xyw = texture2D(_RampTex, u_xlat16_1.xy).xyz;
    u_xlat16_13.xyz = u_xlat10_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_0.xyw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat10_0.xyw * u_xlat16_13.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat0.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * _InSideLineColor.xyz;
    u_xlat10_0.x = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_40 = u_xlat10_0.x + -1.0;
    u_xlat16_40 = _InSideLineStrength * u_xlat16_40 + 1.0;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = u_xlat16_5.xyz * vec3(u_xlat16_40) + (-u_xlat0.xxx);
    u_xlat16_5.x = (-_InSideLineSaturation) + 1.0;
    u_xlat16_5.x = u_xlat16_40 * u_xlat16_5.x + _InSideLineSaturation;
    u_xlat16_40 = (-u_xlat16_40) + 1.0;
    u_xlat0.xyw = u_xlat16_5.xxx * u_xlat7.xyz + u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyw * vec3(u_xlat16_40) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_13.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_13.xyz * _LightAreaColor.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * _DarkColor.xyz;
    u_xlat16_5.w = u_xlat10_3.w * _LightAreaColor.w;
    u_xlat16_6.w = u_xlat10_3.w * _DarkColor.w;
    u_xlat5 = u_xlat16_5 + (-u_xlat16_6);
    u_xlat1 = u_xlat16_1.xxxx * u_xlat5 + u_xlat16_6;
    u_xlat0.xyw = (-u_xlat16_4.xyz) + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyw = u_xlat10_3.www * u_xlat0.xyw + u_xlat16_4.xyz;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat7.xy = u_xlat26.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat7.xy;
    u_xlat10_2.x = texture2D(_StarTex, u_xlat2.xy).w;
    u_xlat16_4.x = u_xlat10_2.x * 2.0 + -1.0;
    u_xlat2.xy = u_xlat16_4.xx * vec2(_WarpIntensity) + u_xlat26.xy;
    u_xlat2.xy = u_xlat2.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat10_7.xyz = texture2D(_StarTex, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = log2(u_xlat10_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat7.xyz;
    u_xlat10_2.xy = texture2D(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat43 = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat43 = (-u_xlat2.y) * u_xlat2.y + u_xlat43;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat8.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat8.xyz = u_xlat8.xxx * vs_TEXCOORD5.xyz;
    u_xlat44 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat44) * vs_TEXCOORD3.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.zxy;
    u_xlat10.xyz = u_xlat9.yzx * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat2.yyy * u_xlat10.xyz;
    u_xlat8.xyz = u_xlat2.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat8.xyz = vec3(u_xlat43) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat7.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat14 = u_xlat2.x * _StarFresnelSmooth;
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _StarFresnelSmooth;
    u_xlat16_40 = max(_StarFresnelIntensity, 0.0);
    u_xlat14 = u_xlat14 * u_xlat16_40;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat14) * _StarFresnelColor.xyz;
    u_xlat16_40 = max(_StarRimIntensity, 0.0);
    u_xlat2.x = u_xlat2.x * u_xlat16_40;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat2.xxx * _StarRimColor.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _StarColor.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat0.xyw) + u_xlat16_4.xyz;
    u_xlat2.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat10_2.x = texture2D(_ChangColorDissolveTex, u_xlat2.xy).x;
    u_xlat14 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat14 = u_xlat14 * 2.0 + -0.0599999987;
    u_xlat2.x = u_xlat14 * _ChangColorShrink + u_xlat10_2.x;
    u_xlat16_40 = u_xlat2.x + -0.100000001;
    u_xlat16_6.x = u_xlat2.x + u_xlat2.x;
    u_xlat16_6.x = u_xlat16_6.x * _ChangColorRange + (-_ChangColorRange);
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _ChangEdgeColor.xyz;
    u_xlat16_40 = u_xlat16_40 * 2.5;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_42 = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_42;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_40);
    u_xlat10_2.x = texture2D(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat16_4.xyz = u_xlat10_2.xxx * u_xlat16_4.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlat0.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat0.xy;
    u_xlat16_40 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_6.xy = u_xlat0.xy * vec2(u_xlat16_40);
    u_xlat7.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat2.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat2.xy;
    u_xlat16_40 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_30.xy = u_xlat2.xy * vec2(u_xlat16_40);
    u_xlat16_11.xy = (-u_xlat0.xy) + u_xlat2.xy;
    u_xlat16_11.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_11.xy + u_xlat0.xy;
    u_xlat16_40 = dot(u_xlat16_6.xy, u_xlat16_30.xy);
    u_xlat16_40 = u_xlat16_40 * 0.5 + 0.5;
    u_xlat16_40 = log2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * _ColorScaleByLightDir;
    u_xlat16_40 = exp2(u_xlat16_40);
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_6.x = dot(u_xlat16_11.xy, u_xlat16_11.xy);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xy = u_xlat16_6.xx * u_xlat16_11.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(_RimWidth);
    u_xlat0.xy = u_xlat16_6.xy * u_xlat24.xx + u_xlat26.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_40 = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_40 = u_xlat0.x / u_xlat16_40;
    u_xlat16_6.x = u_xlat0.x + 9.99999975e-05;
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_6.x * _pointLightAtten;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _pointLightColor.xyz;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_40 = u_xlat16_40 + -0.800000012;
    u_xlat16_40 = u_xlat16_40 * 5.00000048;
    u_xlat16_40 = max(u_xlat16_40, 0.0);
    u_xlat16_42 = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = (-u_xlat16_42) * u_xlat16_40 + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlatb0 = 0.5<_pointLightOn;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_4.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec3 _boneForward;
uniform 	mediump vec3 _boneRight;
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
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat5;
bool u_xlatb5;
mediump float u_xlat16_7;
bool u_xlatb9;
mediump float u_xlat16_11;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_15;
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
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat16_3 = dot(u_xlat1.xyz, _boneRight.xyz);
    u_xlat16_7 = dot(u_xlat1.xyz, _boneForward.xyz);
    u_xlat16_11 = max(abs(u_xlat16_7), abs(u_xlat16_3));
    u_xlat16_11 = float(1.0) / u_xlat16_11;
    u_xlat16_15 = min(abs(u_xlat16_7), abs(u_xlat16_3));
    u_xlat16_11 = u_xlat16_11 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_11 * u_xlat16_11;
    u_xlat1.x = u_xlat16_15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + -0.330299497;
    u_xlat1.x = u_xlat16_15 * u_xlat1.x + 0.999866009;
    u_xlat5 = u_xlat1.x * u_xlat16_11;
    u_xlat5 = u_xlat5 * -2.0 + 1.57079637;
    u_xlatb9 = abs(u_xlat16_7)<abs(u_xlat16_3);
    u_xlat5 = u_xlatb9 ? u_xlat5 : float(0.0);
    u_xlat1.x = u_xlat16_11 * u_xlat1.x + u_xlat5;
    u_xlatb5 = u_xlat16_7<(-u_xlat16_7);
    u_xlat5 = u_xlatb5 ? -3.14159274 : float(0.0);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat16_11 = min(u_xlat16_7, u_xlat16_3);
    u_xlat16_3 = max(u_xlat16_7, u_xlat16_3);
    vs_TEXCOORD4 = u_xlat16_7;
    u_xlatb5 = u_xlat16_3>=(-u_xlat16_3);
    u_xlatb9 = u_xlat16_11<(-u_xlat16_11);
    u_xlatb5 = u_xlatb5 && u_xlatb9;
    u_xlat1.x = (u_xlatb5) ? (-u_xlat1.x) : u_xlat1.x;
    u_xlatb5 = u_xlat1.x<0.0;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat16_2.zw = min(abs(u_xlat1.xx), vec2(1.0, 1.0));
    u_xlat1.xz = in_TEXCOORD0.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_2.xy = (bool(u_xlatb5)) ? u_xlat1.xz : in_TEXCOORD0.xy;
    vs_TEXCOORD1 = u_xlat16_2;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_3 = (-_STAR_DISSOLVE_USE_UV4) + 1.0;
    u_xlat0.xy = in_TEXCOORD3.xy * vec2(vec2(_STAR_DISSOLVE_USE_UV4, _STAR_DISSOLVE_USE_UV4));
    vs_TEXCOORD10.xy = in_TEXCOORD2.xy * vec2(u_xlat16_3) + u_xlat0.xy;
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
uniform 	mediump float _enableHairShadow;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump float _HairShadowDistaceX;
uniform 	mediump float _HairShadowDistaceY;
uniform 	mediump float _HairShadowLightMix;
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
uniform lowp sampler2D _CharacterHairShadowTexture;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _StarTex;
uniform lowp sampler2D _ChangColorDissolveTex;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump float vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD10;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
lowp vec2 u_xlat10_2;
mediump float u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat12;
lowp vec3 u_xlat10_12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
float u_xlat14;
vec2 u_xlat24;
vec2 u_xlat26;
mediump vec2 u_xlat16_30;
float u_xlat36;
lowp float u_xlat10_36;
bool u_xlatb36;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
float u_xlat43;
float u_xlat44;
void main()
{
    u_xlatb0 = 0.0<vs_TEXCOORD4;
    u_xlat10_12.xyz = texture2D(_LightMapTex, vs_TEXCOORD1.xy).xzw;
    u_xlat16_1.x = (-u_xlat10_12.y) + u_xlat10_12.z;
    u_xlat16_1.x = abs(vs_TEXCOORD4) * u_xlat16_1.x + u_xlat10_12.y;
    u_xlat16_1.x = (u_xlatb0) ? u_xlat10_12.x : u_xlat16_1.x;
    u_xlat0.x = vs_TEXCOORD1.z + _ShadowThreshold;
    u_xlat12 = u_xlat0.x + (-_ShadowFeather);
    u_xlat0.x = u_xlat0.x + _ShadowFeather;
    u_xlat0.x = (-u_xlat12) + u_xlat0.x;
    u_xlat12 = (-u_xlat12) + u_xlat16_1.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12;
    u_xlat12 = vs_TEXCOORD7.z / vs_TEXCOORD7.w;
    u_xlat12 = u_xlat12 * 0.5 + 0.5;
    u_xlat12 = _ZBufferParams.z * u_xlat12 + _ZBufferParams.w;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat12 = u_xlat12 + 0.00999999978;
    u_xlat24.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat24.x = inversesqrt(u_xlat24.x);
    u_xlat2.xyz = u_xlat24.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat24.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat24.xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat24.xy;
    u_xlat24.xy = u_xlat24.xy * vec2(0.0199999996, 0.0199999996);
    u_xlat2.x = _HairShadowLightMix * u_xlat24.x + _HairShadowDistaceX;
    u_xlat2.y = _HairShadowLightMix * u_xlat24.y + _HairShadowDistaceY;
    u_xlat24.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat26.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.xy = u_xlat2.xy * u_xlat24.xx + u_xlat26.xy;
    u_xlat10_36 = texture2D(_CharacterHairShadowTexture, u_xlat2.xy).x;
    u_xlat36 = _ZBufferParams.z * u_xlat10_36 + _ZBufferParams.w;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlatb12 = u_xlat36>=u_xlat12;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_enableHairShadow);
    u_xlat12 = (u_xlatb36) ? u_xlat12 : 1.0;
    u_xlat16_1.x = min(u_xlat0.x, u_xlat12);
    u_xlat16_1.y = 0.96875;
    u_xlat10_0.xyw = texture2D(_RampTex, u_xlat16_1.xy).xyz;
    u_xlat16_13.xyz = u_xlat10_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_0.xyw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat10_0.xyw * u_xlat16_13.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat0.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * _InSideLineColor.xyz;
    u_xlat10_0.x = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_40 = u_xlat10_0.x + -1.0;
    u_xlat16_40 = _InSideLineStrength * u_xlat16_40 + 1.0;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat7.xyz = u_xlat16_5.xyz * vec3(u_xlat16_40) + (-u_xlat0.xxx);
    u_xlat16_5.x = (-_InSideLineSaturation) + 1.0;
    u_xlat16_5.x = u_xlat16_40 * u_xlat16_5.x + _InSideLineSaturation;
    u_xlat16_40 = (-u_xlat16_40) + 1.0;
    u_xlat0.xyw = u_xlat16_5.xxx * u_xlat7.xyz + u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyw * vec3(u_xlat16_40) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = vec3(u_xlat16_40) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_4.xyz + (-u_xlat16_4.xyz);
    u_xlat16_13.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_13.xyz * _LightAreaColor.xyz;
    u_xlat16_6.xyz = u_xlat16_13.xyz * _DarkColor.xyz;
    u_xlat16_5.w = u_xlat10_3.w * _LightAreaColor.w;
    u_xlat16_6.w = u_xlat10_3.w * _DarkColor.w;
    u_xlat5 = u_xlat16_5 + (-u_xlat16_6);
    u_xlat1 = u_xlat16_1.xxxx * u_xlat5 + u_xlat16_6;
    u_xlat0.xyw = (-u_xlat16_4.xyz) + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyw = u_xlat10_3.www * u_xlat0.xyw + u_xlat16_4.xyz;
    u_xlat2.xy = _Time.yy * _WarpDirSpeed.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat7.xy = u_xlat26.xy * _WarpMapOffset.xy + _WarpMapOffset.zw;
    u_xlat2.xy = u_xlat2.xy + u_xlat7.xy;
    u_xlat10_2.x = texture2D(_StarTex, u_xlat2.xy).w;
    u_xlat16_4.x = u_xlat10_2.x * 2.0 + -1.0;
    u_xlat2.xy = u_xlat16_4.xx * vec2(_WarpIntensity) + u_xlat26.xy;
    u_xlat2.xy = u_xlat2.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat10_7.xyz = texture2D(_StarTex, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = log2(u_xlat10_7.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(2.20000005, 2.20000005, 2.20000005);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat7.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat7.xyz = u_xlat2.xxx * u_xlat7.xyz;
    u_xlat10_2.xy = texture2D(_NormalTex, vs_TEXCOORD0.xy).xy;
    u_xlat2.xy = u_xlat10_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat43 = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat43 = (-u_xlat2.y) * u_xlat2.y + u_xlat43;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat8.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat8.xyz = u_xlat8.xxx * vs_TEXCOORD5.xyz;
    u_xlat44 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat44) * vs_TEXCOORD3.xyz;
    u_xlat10.xyz = u_xlat8.yzx * u_xlat9.zxy;
    u_xlat10.xyz = u_xlat9.yzx * u_xlat8.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat2.yyy * u_xlat10.xyz;
    u_xlat8.xyz = u_xlat2.xxx * u_xlat8.xyz + u_xlat10.xyz;
    u_xlat8.xyz = vec3(u_xlat43) * u_xlat9.xyz + u_xlat8.xyz;
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat7.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat14 = u_xlat2.x * _StarFresnelSmooth;
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _StarRimSmooth;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _StarFresnelSmooth;
    u_xlat16_40 = max(_StarFresnelIntensity, 0.0);
    u_xlat14 = u_xlat14 * u_xlat16_40;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat14) * _StarFresnelColor.xyz;
    u_xlat16_40 = max(_StarRimIntensity, 0.0);
    u_xlat2.x = u_xlat2.x * u_xlat16_40;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat2.xxx * _StarRimColor.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _StarColor.xyz + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat0.xyw) + u_xlat16_4.xyz;
    u_xlat2.xy = vs_TEXCOORD10.xy * _ChangColorDissolveTex_ST.xy + _ChangColorDissolveTex_ST.zw;
    u_xlat10_2.x = texture2D(_ChangColorDissolveTex, u_xlat2.xy).x;
    u_xlat14 = vs_TEXCOORD10.x + _ChangColorAmount;
    u_xlat14 = u_xlat14 * 2.0 + -0.0599999987;
    u_xlat2.x = u_xlat14 * _ChangColorShrink + u_xlat10_2.x;
    u_xlat16_40 = u_xlat2.x + -0.100000001;
    u_xlat16_6.x = u_xlat2.x + u_xlat2.x;
    u_xlat16_6.x = u_xlat16_6.x * _ChangColorRange + (-_ChangColorRange);
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _ChangEdgeColor.xyz;
    u_xlat16_40 = u_xlat16_40 * 2.5;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_42 = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_42;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_40);
    u_xlat10_2.x = texture2D(_ChangColorDissolveTex, vs_TEXCOORD0.xy).y;
    u_xlat16_4.xyz = u_xlat10_2.xxx * u_xlat16_4.xyz + u_xlat0.xyw;
    u_xlat16_4.xyz = u_xlat16_6.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlat0.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat0.xy;
    u_xlat16_40 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_6.xy = u_xlat0.xy * vec2(u_xlat16_40);
    u_xlat7.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat2.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat2.xy;
    u_xlat16_40 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_40 = inversesqrt(u_xlat16_40);
    u_xlat16_30.xy = u_xlat2.xy * vec2(u_xlat16_40);
    u_xlat16_11.xy = (-u_xlat0.xy) + u_xlat2.xy;
    u_xlat16_11.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_11.xy + u_xlat0.xy;
    u_xlat16_40 = dot(u_xlat16_6.xy, u_xlat16_30.xy);
    u_xlat16_40 = u_xlat16_40 * 0.5 + 0.5;
    u_xlat16_40 = log2(u_xlat16_40);
    u_xlat16_40 = u_xlat16_40 * _ColorScaleByLightDir;
    u_xlat16_40 = exp2(u_xlat16_40);
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_6.x = dot(u_xlat16_11.xy, u_xlat16_11.xy);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xy = u_xlat16_6.xx * u_xlat16_11.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(_RimWidth);
    u_xlat0.xy = u_xlat16_6.xy * u_xlat24.xx + u_xlat26.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = log2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_4.xyz = exp2(u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_40 = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_40 = u_xlat0.x / u_xlat16_40;
    u_xlat16_6.x = u_xlat0.x + 9.99999975e-05;
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_6.x * _pointLightAtten;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * _pointLightColor.xyz;
    u_xlat16_40 = min(u_xlat16_40, 1.0);
    u_xlat16_40 = u_xlat16_40 + -0.800000012;
    u_xlat16_40 = u_xlat16_40 * 5.00000048;
    u_xlat16_40 = max(u_xlat16_40, 0.0);
    u_xlat16_42 = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = (-u_xlat16_42) * u_xlat16_40 + 1.0;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_40) + u_xlat16_4.xyz;
    u_xlatb0 = 0.5<_pointLightOn;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_4.xyz;
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
 Pass {
 Name "VisibleFaceStencil"
 ZTest Equal
 ZWrite Off
  GpuProgramID 118906
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
in highp vec4 in_POSITION0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
in highp vec4 in_POSITION0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "SHADOWSUPPORT" = "true" }
  GpuProgramID 180364
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
  GpuProgramID 232894
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