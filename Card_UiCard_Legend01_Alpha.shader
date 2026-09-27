//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Card/UiCard_Legend01_Alpha" {
Properties {

[Toggle(_UIPARALLAX_OFF)] _parallaxOn ("ui parallax off", Float) = 0.0

_BGTex ("_BGTex", 2D) = "black" { }

_BG_Color ("BG_Color", Color) = (0,0,0,0)

_Main_Scale ("Main_Scale", Float) = 0.0

_MainTex ("_MainTex", 2D) = "white" { }

_AniMask ("_AniMask", 2D) = "black" { }

_AniLength_Intensity_Speed ("AniLength_Intensity_Speed", Vector) = (0.1,0.1,1,1)

_AniLength2_Intensity_Speed ("AniLength2_Intensity_Speed", Vector) = (0.1,0.1,1,1)

_Noise_Tiling_Offest ("Noise_Tiling_Offest", Vector) = (1,1,0,0)

_Noise_Power_U ("Noise_Power_U", Range(-2, 2)) = 0.5176470875740051

_Noise_Power_V ("Noise_Power_V", Range(-2, 2)) = 0.23529410362243652

_Noise_Speed_U ("Noise_Speed_U", Float) = 0.0

_Noise_Speed_V ("Noise_Speed_V", Float) = 0.0

_Noise_Rotation ("Noise_Rotation", Float) = 0.0

_Noise_Rotation_Speed ("Noise_Rotation_Speed", Float) = 0.0

_Saoguang ("Saoguang", 2D) = "white" { }

_Saoguang_Tiling_Offest ("Saoguang_Tiling_Offest", Vector) = (1,1,0,0)

_Saoguang_Color ("Saoguang_Color", Color) = (1,1,1,1)

_Saoguang_Intensity ("Saoguang_Intensity", Float) = 1.0

_Saoguang_RatatorCenter2 ("旋转中心_流速xy", Vector) = (0,0,0,0)

_Saoguang_RatatorIntensity2 ("扫光图旋转角度", Float) = 0.0

_RotSpeed2 ("旋转速度", Float) = 0.0

_Saoguang_Jiange2 ("扫光间隔", Float) = 1.0

_Liuguang_Mask ("Liuguang_Mask", 2D) = "white" { }

_Liuguang_2 ("Liuguang_2", 2D) = "black" { }

_Liuguang2_Color ("Liuguang2_Color", Color) = (1,1,1,1)

_Liuguang2_Intensity ("Liuguang2_Intensity", Float) = 1.0

_Liuguang2_R_TilingOffset ("Liuguang2_R_TilingOffset", Vector) = (1,1,0,0)

_Liuguang2_R_SpeedX ("Liuguang2_R_SpeedX", Float) = 0.0

_Liuguang2_R_SpeedY ("Liuguang2_R_SpeedY", Float) = 0.0

_Liuguang2_R_Rotation ("Liuguang2_R_Rotation", Float) = 0.0

_Liuguang2_G_Rotation_Speed ("Liuguang2_G_Rotation_Speed", Float) = 0.0

_Liuguang2_G_TilingOffset ("Liuguang2_G_TilingOffset", Vector) = (1,1,0,0)

_Liuguang2_G_SpeedX ("Liuguang2_G_SpeedX", Float) = 0.0

_Liuguang2_G_SpeedY ("Liuguang2_G_SpeedY", Float) = 0.0

_Liuguang2_G_Rotation ("Liuguang2_G_Rotation", Float) = 0.0

_Liuguang2_R_Rotation_Speed ("Liuguang2_R_Rotation_Speed", Float) = 0.0

_Liuguang_3 ("Liuguang_3", 2D) = "black" { }

_Liuguang3_Color ("Liuguang3_Color", Color) = (1,1,1,1)

_Liuguang3_Intensity ("Liuguang3_Intensity", Float) = 1.0

_Liuguang3_R_TilingOffset ("Liuguang3_R_TilingOffset", Vector) = (1,1,0,0)

_Liuguang3_R_Power_U ("流光R扭曲通道强度U", Range(-2, 2)) = 0.0

_Liuguang3_R_Power_V ("流光R扭曲通道强度V", Range(-2, 2)) = 0.0

_Liuguang3_R_SpeedX ("Liuguang3_R_SpeedX", Float) = 0.0

_Liuguang3_R_SpeedY ("Liuguang3_R_SpeedY", Float) = 0.0

_Liuguang3_R_Rotation ("Liuguang3_R_Rotation", Float) = 0.0

_Liuguang3_R_Rotation_Speed ("Liuguang3_R_Rotation_Speed", Float) = 0.0

_Liuguang3_G_TilingOffset ("Liuguang3_G_TilingOffset", Vector) = (1,1,0,0)

_Liuguang3_G_SpeedX ("Liuguang3_G_SpeedX", Float) = 0.0

_Liuguang3_G_SpeedY ("Liuguang3_G_SpeedY", Float) = 0.0

_Liuguang3_G_Rotation ("Liuguang3_G_Rotation", Float) = 0.0

_Liuguang3_G_Rotation_Speed ("Liuguang3_G_Rotation_Speed", Float) = 0.0

_Liuguang_4 ("Liuguang_4", 2D) = "black" { }

_Liuguang4_Color ("Liuguang4_Color", Color) = (1,1,1,1)

_Liuguang4_Intensity ("Liuguang4_Intensity", Float) = 1.0

_Liuguang4_R_TilingOffset ("Liuguang4_R_TilingOffset", Vector) = (1,1,0,0)

_Liuguang4_R_SpeedX ("Liuguang4_R_SpeedX", Float) = 0.0

_Liuguang4_R_SpeedY ("Liuguang4_R_SpeedY", Float) = 0.0

_Liuguang4_R_Rotation ("Liuguang4_R_Rotation", Float) = 0.0

_Liuguang4_R_Rotation_Speed ("Liuguang4_R_Rotation_Speed", Float) = 0.0

_Liuguang4_G_TilingOffset ("Liuguang4_G_TilingOffset", Vector) = (1,1,0,0)

_Liuguang4_G_SpeedX ("Liuguang4_G_SpeedX", Float) = 0.0

_Liuguang4_G_SpeedY ("Liuguang4_G_SpeedY", Float) = 0.0

_Liuguang4_G_Rotation ("Liuguang4_G_Rotation", Float) = 0.0

_Liuguang4_G_Rotation_Speed ("Liuguang4_G_Rotation_Speed", Float) = 0.0

_useBGAlpha ("使用背景Alpha", Float) = 1.0

_RNoise_GMask_BNoise ("RNoise_GMask_BNoise", 2D) = "white" { }

_Noise_TilingOffset ("Noise_TilingOffset", Vector) = (1,1,0,0)

_Noise_Intensity ("Noise_Intensity", Float) = 1.0

_Noise_Color1 ("Noise_Color1", Color) = (1,1,1,0)

_Noise_Color2 ("Noise_Color2", Color) = (1,1,1,1)

_Noise_Jianbian1 ("Noise_Jianbian1", Range(0, 0.5)) = 0.4449836015701294

_Noise_Jianbian2 ("Noise_Jianbian2", Range(0.5, 1)) = 1.0

_Noise_SpeedU ("Noise_SpeedU", Float) = 0.0

_Noise_SpeedV ("Noise_SpeedV", Float) = 0.0

_Noise_Mask_Jianbian ("Noise_Mask_Jianbian", Float) = 0.17000000178813934

_Noise_Mask_High ("Noise_Mask_High", Float) = 0.3199999928474426

_Noise_Rotate ("Noise_Rotate", Float) = 0.0

_Noise_Mask_Rotate ("Noise_Mask_Rotate", Float) = 0.0

_Mask_TilingOffset ("Mask_TilingOffset", Vector) = (1,1,0,0)

_Mask_Power_U ("Mask扭曲U", Range(-2, 2)) = 0.0

_Mask_Power_V ("Mask扭曲V", Range(-2, 2)) = 0.0

_Mask_SpeedU ("Mask_SpeedU", Float) = 0.0

_Mask_SpeedV ("Mask_SpeedV", Float) = 0.0

_Mask_Rotation ("Mask_Rotation", Float) = 0.0

_Mask_Rotation_Speed ("Mask_Rotation_Speed", Float) = 0.0

[Toggle] _UseCardMask ("UseMask", Float) = 1.0

_texcoord ("", 2D) = "white" { }

[Header(Clip)] [Space(20)] _PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

_Mask ("Mask", 2D) = "white" { }

_EdgeSoftness ("EdgeSoftness", Range(0.01, 10)) = 3.0

_Color ("Main Color", Color) = (1,1,1,1)

[Header(Depth Channel in _AniMask.r)] [Space(20)] _CameraZChannel ("camera z", Range(-3, 3)) = -1.0

[Toggle] _Anima ("Animation", Float) = 0.0

_AnimaStr ("AnimaStr", Range(0, 1)) = 1.0

_AnimaStrXY ("AnimaStrXY", Vector) = (1,0,0,0)

_AnimaSpeed ("AnimaSpeed", Range(0, 5)) = 1.0

_ParallaxStrength ("Parallax Strength", Range(0, 157.1)) = 1.0

_ParallaxBias ("Parallax Bias", Range(0, 3)) = 1.0

_ParallaxDepthOffset ("ParallaxDepthOffset", Range(0, 1)) = 0.5

}
SubShader {
 LOD 100
 Tags { "RenderType" = "Transparent" }
 Pass {
 Name "Unlit"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Transparent" }
 ZWrite Off
  GpuProgramID 1289
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _Anima;
uniform 	float _AnimaStr;
uniform 	vec2 _AnimaStrXY;
uniform 	float _CameraZChannel;
uniform 	float _AnimaSpeed;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_VAR_TANGENTVIEWDIR0;
vec4 u_xlat0;
bool u_xlatb0;
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
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = _Time.y * _AnimaSpeed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * _AnimaStr;
    u_xlat0.x = u_xlat0.x * _AnimaStr;
    u_xlat1.xy = u_xlat0.yx * _AnimaStrXY.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Anima);
#else
    u_xlatb0 = 0.5<_Anima;
#endif
    u_xlat0.xy = bool(u_xlatb0) ? u_xlat1.xy : vec2(0.0, 0.0);
    vs_VAR_TANGENTVIEWDIR0.xy = (-u_xlat0.xy);
    vs_VAR_TANGENTVIEWDIR0.z = _CameraZChannel;
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	float _ParallaxStrength;
uniform 	float _ParallaxBias;
uniform 	float _ParallaxDepthOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AniMask;
UNITY_LOCATION(1) uniform mediump sampler2D _RNoise_GMask_BNoise;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Saoguang;
UNITY_LOCATION(5) uniform mediump sampler2D _Liuguang_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Liuguang_2;
UNITY_LOCATION(7) uniform mediump sampler2D _Liuguang_3;
UNITY_LOCATION(8) uniform mediump sampler2D _Liuguang_4;
UNITY_LOCATION(9) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_VAR_TANGENTVIEWDIR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
mediump float u_xlat16_11;
vec2 u_xlat13;
mediump float u_xlat16_13;
vec2 u_xlat14;
mediump float u_xlat16_14;
vec2 u_xlat15;
vec2 u_xlat22;
mediump float u_xlat16_22;
vec2 u_xlat23;
vec2 u_xlat24;
vec2 u_xlat25;
mediump vec2 u_xlat16_32;
float u_xlat33;
mediump float u_xlat16_33;
float u_xlat34;
void main()
{
    u_xlat0.x = dot(vs_VAR_TANGENTVIEWDIR0.xyz, vs_VAR_TANGENTVIEWDIR0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xy = u_xlat0.xx * vs_VAR_TANGENTVIEWDIR0.xy;
    u_xlat0.x = vs_VAR_TANGENTVIEWDIR0.z * u_xlat0.x + _ParallaxBias;
    u_xlat0.xy = u_xlat11.xy / u_xlat0.xx;
    u_xlat16_22 = texture(_AniMask, vs_TEXCOORD0.xy).x;
    u_xlat22.x = u_xlat16_22 + (-_ParallaxDepthOffset);
    u_xlat22.x = u_xlat22.x * _ParallaxStrength;
    u_xlat0.xy = u_xlat0.xy * u_xlat22.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat1.x = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat22.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat22.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat22.xy;
    u_xlat16_22 = texture(_RNoise_GMask_BNoise, u_xlat22.xy).z;
    u_xlat16_1.xy = texture(_AniMask, u_xlat0.xy).xz;
    u_xlat22.xy = vec2(u_xlat16_22) * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat23.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat34 = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat23.x = sin(u_xlat23.x);
    u_xlat2.xy = u_xlat23.xx * _AniLength_Intensity_Speed.xy;
    u_xlat23.x = sin(u_xlat34);
    u_xlat23.xy = u_xlat23.xx * _AniLength2_Intensity_Speed.xy;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat2.xy + u_xlat23.xy;
    u_xlat2.xy = u_xlat16_1.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat0.xy = u_xlat22.xy * u_xlat16_1.yy + u_xlat0.xy;
    u_xlat0.xy = u_xlat1.xz + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_22 = texture(_BGTex, u_xlat0.xy).w;
    u_xlat33 = (-u_xlat16_22) + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat16_2.xyz = texture(_BGTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _BG_Color.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_22) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat22.x = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat22.x);
    u_xlat4.x = cos(u_xlat22.x);
    u_xlat2.xy = u_xlat2.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat2.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat22.x = _Time.y * 0.300000012;
    u_xlat24.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat2.xy = u_xlat22.xx * u_xlat24.xy + u_xlat2.xy;
    u_xlat24.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat2.xy = u_xlat2.xy / u_xlat24.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat24.xy * u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_Saoguang, u_xlat2.xy);
    u_xlat16_22 = texture(_AniMask, u_xlat0.xy).y;
    u_xlat2 = u_xlat16_2.wwww * u_xlat16_2;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat3.w = _Saoguang_Color.w;
    u_xlat3 = u_xlat3 * _Saoguang_Color;
    u_xlat2.x = _Saoguang_Color.w;
    u_xlat2 = u_xlat2.xxxw * u_xlat3;
    u_xlat2 = u_xlat2 * vec4(_Saoguang_Intensity);
    u_xlat3.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat14.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat4.x = dot(u_xlat14.xy, u_xlat5.yz);
    u_xlat4.y = dot(u_xlat14.xy, u_xlat5.xy);
    u_xlat3.xw = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat3.xw = _Noise_TilingOffset.xy * u_xlat3.xw + _Noise_TilingOffset.zw;
    u_xlat3.xw = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat3.xw;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat14.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat14.xy, u_xlat6.xy);
        u_xlat14.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat14.xy = _Mask_TilingOffset.xy * u_xlat14.xy + _Mask_TilingOffset.zw;
        u_xlat14.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat14.xy;
        u_xlat16_14 = texture(_RNoise_GMask_BNoise, u_xlat14.xy).y;
        u_xlat14.x = u_xlat16_14 * _Mask_Power_U;
    } else {
        u_xlat14.x = 1.0;
    }
    u_xlat3.xy = u_xlat14.xx + u_xlat3.xw;
    u_xlat16_3.x = texture(_RNoise_GMask_BNoise, u_xlat3.xy).x;
    u_xlat14.x = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat3.x = u_xlat16_3.x + (-_Noise_Jianbian1);
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat3.x = u_xlat14.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat14.x;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat14.x = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat14.x);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat25.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat14.x));
    u_xlat14.x = dot(u_xlat25.xy, u_xlat7.xy);
    u_xlat14.x = u_xlat14.x + 0.5;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat25.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat14.x = u_xlat25.x * u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat25.x;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat5 = u_xlat14.xxxx * u_xlat5;
    u_xlat3 = u_xlat3.xxxx * u_xlat5;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat5 = vec4(u_xlat33) * u_xlat3;
    u_xlat16_3 = (u_xlatb4.y) ? u_xlat5 : u_xlat3;
    u_xlat33 = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat4.x = sin(u_xlat33);
    u_xlat5.x = cos(u_xlat33);
    u_xlat15.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat6.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang2_R_TilingOffset.xy * u_xlat4.xw + _Liuguang2_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat4.xw;
    u_xlat33 = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = sin(u_xlat33);
    u_xlat6.x = cos(u_xlat33);
    u_xlat7.x = (-u_xlat5.x);
    u_xlat7.y = u_xlat6.x;
    u_xlat7.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat16_0.xyw = texture(_Liuguang_Mask, u_xlat0.xy).xyz;
    u_xlat6 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat4.xw).x;
    u_xlat6 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat5.xy).y;
    u_xlat4.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7.x = (-u_xlat4.x);
    u_xlat7.y = u_xlat5.x;
    u_xlat7.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang3_R_TilingOffset.xy * u_xlat4.xw + _Liuguang3_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat7.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_G_TilingOffset.xy * u_xlat5.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat5.xy;
    u_xlat7.x = _Liuguang3_Intensity;
    u_xlat7.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang3_Color;
    u_xlat7 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat16_0.yyyy * u_xlat7;
    u_xlat16_11 = texture(_Liuguang_3, u_xlat4.xw).x;
    u_xlat4.xw = vec2(u_xlat16_11) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat5.xy;
    u_xlat16_11 = texture(_Liuguang_3, u_xlat4.xw).y;
    u_xlat4.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat8.x = (-u_xlat4.x);
    u_xlat8.y = u_xlat5.x;
    u_xlat8.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang4_R_TilingOffset.xy * u_xlat4.xw + _Liuguang4_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat8.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat9.x = (-u_xlat5.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat9.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat9.xy);
    u_xlat15.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat15.xy = _Liuguang4_G_TilingOffset.xy * u_xlat15.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat15.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat15.xy;
    u_xlat5.x = _Liuguang4_Intensity;
    u_xlat5.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat5.xxxw * _Liuguang4_Color;
    u_xlat5 = u_xlat5.wwwx * u_xlat8;
    u_xlat5 = u_xlat16_0.wwww * u_xlat5;
    u_xlat16_33 = texture(_Liuguang_4, u_xlat4.xw).x;
    u_xlat5 = vec4(u_xlat16_33) * u_xlat5;
    u_xlat16_33 = texture(_Liuguang_4, u_xlat15.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat2 * vec4(u_xlat16_22) + u_xlat1;
    u_xlat16_1 = u_xlat16_3 + u_xlat16_1;
    u_xlat16_1 = u_xlat6 * u_xlat16_0.xxxx + u_xlat16_1;
    u_xlat16_1 = u_xlat7 * vec4(u_xlat16_11) + u_xlat16_1;
    u_xlat16_0 = u_xlat5 * vec4(u_xlat16_33) + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelRect.zw;
    u_xlat16_10.xy = u_xlat16_10.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat4.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat16_13 = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat16_13;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _Anima;
uniform 	float _AnimaStr;
uniform 	vec2 _AnimaStrXY;
uniform 	float _CameraZChannel;
uniform 	float _AnimaSpeed;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_VAR_TANGENTVIEWDIR0;
vec4 u_xlat0;
bool u_xlatb0;
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
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = _Time.y * _AnimaSpeed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * _AnimaStr;
    u_xlat0.x = u_xlat0.x * _AnimaStr;
    u_xlat1.xy = u_xlat0.yx * _AnimaStrXY.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Anima);
#else
    u_xlatb0 = 0.5<_Anima;
#endif
    u_xlat0.xy = bool(u_xlatb0) ? u_xlat1.xy : vec2(0.0, 0.0);
    vs_VAR_TANGENTVIEWDIR0.xy = (-u_xlat0.xy);
    vs_VAR_TANGENTVIEWDIR0.z = _CameraZChannel;
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	float _ParallaxStrength;
uniform 	float _ParallaxBias;
uniform 	float _ParallaxDepthOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AniMask;
UNITY_LOCATION(1) uniform mediump sampler2D _RNoise_GMask_BNoise;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Saoguang;
UNITY_LOCATION(5) uniform mediump sampler2D _Liuguang_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Liuguang_2;
UNITY_LOCATION(7) uniform mediump sampler2D _Liuguang_3;
UNITY_LOCATION(8) uniform mediump sampler2D _Liuguang_4;
UNITY_LOCATION(9) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_VAR_TANGENTVIEWDIR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
mediump float u_xlat16_11;
vec2 u_xlat13;
mediump float u_xlat16_13;
vec2 u_xlat14;
mediump float u_xlat16_14;
vec2 u_xlat15;
vec2 u_xlat22;
mediump float u_xlat16_22;
vec2 u_xlat23;
vec2 u_xlat24;
vec2 u_xlat25;
mediump vec2 u_xlat16_32;
float u_xlat33;
mediump float u_xlat16_33;
float u_xlat34;
void main()
{
    u_xlat0.x = dot(vs_VAR_TANGENTVIEWDIR0.xyz, vs_VAR_TANGENTVIEWDIR0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xy = u_xlat0.xx * vs_VAR_TANGENTVIEWDIR0.xy;
    u_xlat0.x = vs_VAR_TANGENTVIEWDIR0.z * u_xlat0.x + _ParallaxBias;
    u_xlat0.xy = u_xlat11.xy / u_xlat0.xx;
    u_xlat16_22 = texture(_AniMask, vs_TEXCOORD0.xy).x;
    u_xlat22.x = u_xlat16_22 + (-_ParallaxDepthOffset);
    u_xlat22.x = u_xlat22.x * _ParallaxStrength;
    u_xlat0.xy = u_xlat0.xy * u_xlat22.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat1.x = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat22.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat22.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat22.xy;
    u_xlat16_22 = texture(_RNoise_GMask_BNoise, u_xlat22.xy).z;
    u_xlat16_1.xy = texture(_AniMask, u_xlat0.xy).xz;
    u_xlat22.xy = vec2(u_xlat16_22) * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat23.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat34 = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat23.x = sin(u_xlat23.x);
    u_xlat2.xy = u_xlat23.xx * _AniLength_Intensity_Speed.xy;
    u_xlat23.x = sin(u_xlat34);
    u_xlat23.xy = u_xlat23.xx * _AniLength2_Intensity_Speed.xy;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat2.xy + u_xlat23.xy;
    u_xlat2.xy = u_xlat16_1.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat0.xy = u_xlat22.xy * u_xlat16_1.yy + u_xlat0.xy;
    u_xlat0.xy = u_xlat1.xz + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_22 = texture(_BGTex, u_xlat0.xy).w;
    u_xlat33 = (-u_xlat16_22) + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat16_2.xyz = texture(_BGTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _BG_Color.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_22) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat22.x = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat22.x);
    u_xlat4.x = cos(u_xlat22.x);
    u_xlat2.xy = u_xlat2.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat2.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat22.x = _Time.y * 0.300000012;
    u_xlat24.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat2.xy = u_xlat22.xx * u_xlat24.xy + u_xlat2.xy;
    u_xlat24.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat2.xy = u_xlat2.xy / u_xlat24.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat24.xy * u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_Saoguang, u_xlat2.xy);
    u_xlat16_22 = texture(_AniMask, u_xlat0.xy).y;
    u_xlat2 = u_xlat16_2.wwww * u_xlat16_2;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat3.w = _Saoguang_Color.w;
    u_xlat3 = u_xlat3 * _Saoguang_Color;
    u_xlat2.x = _Saoguang_Color.w;
    u_xlat2 = u_xlat2.xxxw * u_xlat3;
    u_xlat2 = u_xlat2 * vec4(_Saoguang_Intensity);
    u_xlat3.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat14.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat4.x = dot(u_xlat14.xy, u_xlat5.yz);
    u_xlat4.y = dot(u_xlat14.xy, u_xlat5.xy);
    u_xlat3.xw = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat3.xw = _Noise_TilingOffset.xy * u_xlat3.xw + _Noise_TilingOffset.zw;
    u_xlat3.xw = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat3.xw;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat14.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat14.xy, u_xlat6.xy);
        u_xlat14.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat14.xy = _Mask_TilingOffset.xy * u_xlat14.xy + _Mask_TilingOffset.zw;
        u_xlat14.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat14.xy;
        u_xlat16_14 = texture(_RNoise_GMask_BNoise, u_xlat14.xy).y;
        u_xlat14.x = u_xlat16_14 * _Mask_Power_U;
    } else {
        u_xlat14.x = 1.0;
    }
    u_xlat3.xy = u_xlat14.xx + u_xlat3.xw;
    u_xlat16_3.x = texture(_RNoise_GMask_BNoise, u_xlat3.xy).x;
    u_xlat14.x = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat3.x = u_xlat16_3.x + (-_Noise_Jianbian1);
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat3.x = u_xlat14.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat14.x;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat14.x = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat14.x);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat25.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat14.x));
    u_xlat14.x = dot(u_xlat25.xy, u_xlat7.xy);
    u_xlat14.x = u_xlat14.x + 0.5;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat25.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat14.x = u_xlat25.x * u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat25.x;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat5 = u_xlat14.xxxx * u_xlat5;
    u_xlat3 = u_xlat3.xxxx * u_xlat5;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat5 = vec4(u_xlat33) * u_xlat3;
    u_xlat16_3 = (u_xlatb4.y) ? u_xlat5 : u_xlat3;
    u_xlat33 = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat4.x = sin(u_xlat33);
    u_xlat5.x = cos(u_xlat33);
    u_xlat15.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat6.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang2_R_TilingOffset.xy * u_xlat4.xw + _Liuguang2_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat4.xw;
    u_xlat33 = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = sin(u_xlat33);
    u_xlat6.x = cos(u_xlat33);
    u_xlat7.x = (-u_xlat5.x);
    u_xlat7.y = u_xlat6.x;
    u_xlat7.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat16_0.xyw = texture(_Liuguang_Mask, u_xlat0.xy).xyz;
    u_xlat6 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat4.xw).x;
    u_xlat6 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat5.xy).y;
    u_xlat4.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7.x = (-u_xlat4.x);
    u_xlat7.y = u_xlat5.x;
    u_xlat7.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang3_R_TilingOffset.xy * u_xlat4.xw + _Liuguang3_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat7.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_G_TilingOffset.xy * u_xlat5.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat5.xy;
    u_xlat7.x = _Liuguang3_Intensity;
    u_xlat7.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang3_Color;
    u_xlat7 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat16_0.yyyy * u_xlat7;
    u_xlat16_11 = texture(_Liuguang_3, u_xlat4.xw).x;
    u_xlat4.xw = vec2(u_xlat16_11) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat5.xy;
    u_xlat16_11 = texture(_Liuguang_3, u_xlat4.xw).y;
    u_xlat4.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat8.x = (-u_xlat4.x);
    u_xlat8.y = u_xlat5.x;
    u_xlat8.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang4_R_TilingOffset.xy * u_xlat4.xw + _Liuguang4_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat8.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat9.x = (-u_xlat5.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat9.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat9.xy);
    u_xlat15.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat15.xy = _Liuguang4_G_TilingOffset.xy * u_xlat15.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat15.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat15.xy;
    u_xlat5.x = _Liuguang4_Intensity;
    u_xlat5.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat5.xxxw * _Liuguang4_Color;
    u_xlat5 = u_xlat5.wwwx * u_xlat8;
    u_xlat5 = u_xlat16_0.wwww * u_xlat5;
    u_xlat16_33 = texture(_Liuguang_4, u_xlat4.xw).x;
    u_xlat5 = vec4(u_xlat16_33) * u_xlat5;
    u_xlat16_33 = texture(_Liuguang_4, u_xlat15.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat2 * vec4(u_xlat16_22) + u_xlat1;
    u_xlat16_1 = u_xlat16_3 + u_xlat16_1;
    u_xlat16_1 = u_xlat6 * u_xlat16_0.xxxx + u_xlat16_1;
    u_xlat16_1 = u_xlat7 * vec4(u_xlat16_11) + u_xlat16_1;
    u_xlat16_0 = u_xlat5 * vec4(u_xlat16_33) + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelRect.zw;
    u_xlat16_10.xy = u_xlat16_10.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat4.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat16_13 = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat16_13;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _Anima;
uniform 	float _AnimaStr;
uniform 	vec2 _AnimaStrXY;
uniform 	float _CameraZChannel;
uniform 	float _AnimaSpeed;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_VAR_TANGENTVIEWDIR0;
vec4 u_xlat0;
bool u_xlatb0;
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
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = _Time.y * _AnimaSpeed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * _AnimaStr;
    u_xlat0.x = u_xlat0.x * _AnimaStr;
    u_xlat1.xy = u_xlat0.yx * _AnimaStrXY.xy;
    u_xlatb0 = 0.5<_Anima;
    u_xlat0.xy = bool(u_xlatb0) ? u_xlat1.xy : vec2(0.0, 0.0);
    vs_VAR_TANGENTVIEWDIR0.xy = (-u_xlat0.xy);
    vs_VAR_TANGENTVIEWDIR0.z = _CameraZChannel;
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	float _ParallaxStrength;
uniform 	float _ParallaxBias;
uniform 	float _ParallaxDepthOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _AniMask;
uniform lowp sampler2D _RNoise_GMask_BNoise;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BGTex;
uniform lowp sampler2D _Saoguang;
uniform lowp sampler2D _Liuguang_Mask;
uniform lowp sampler2D _Liuguang_2;
uniform lowp sampler2D _Liuguang_3;
uniform lowp sampler2D _Liuguang_4;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_VAR_TANGENTVIEWDIR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp float u_xlat10_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
lowp float u_xlat10_11;
vec2 u_xlat13;
lowp float u_xlat10_13;
vec2 u_xlat14;
lowp float u_xlat10_14;
vec2 u_xlat15;
vec2 u_xlat22;
lowp float u_xlat10_22;
vec2 u_xlat23;
vec2 u_xlat24;
vec2 u_xlat25;
mediump vec2 u_xlat16_32;
float u_xlat33;
lowp float u_xlat10_33;
float u_xlat34;
void main()
{
    u_xlat0.x = dot(vs_VAR_TANGENTVIEWDIR0.xyz, vs_VAR_TANGENTVIEWDIR0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xy = u_xlat0.xx * vs_VAR_TANGENTVIEWDIR0.xy;
    u_xlat0.x = vs_VAR_TANGENTVIEWDIR0.z * u_xlat0.x + _ParallaxBias;
    u_xlat0.xy = u_xlat11.xy / u_xlat0.xx;
    u_xlat10_22 = texture2D(_AniMask, vs_TEXCOORD0.xy).x;
    u_xlat22.x = u_xlat10_22 + (-_ParallaxDepthOffset);
    u_xlat22.x = u_xlat22.x * _ParallaxStrength;
    u_xlat0.xy = u_xlat0.xy * u_xlat22.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat1.x = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat22.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat22.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat22.xy;
    u_xlat10_22 = texture2D(_RNoise_GMask_BNoise, u_xlat22.xy).z;
    u_xlat10_1.xy = texture2D(_AniMask, u_xlat0.xy).xz;
    u_xlat22.xy = vec2(u_xlat10_22) * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat23.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat34 = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat23.x = sin(u_xlat23.x);
    u_xlat2.xy = u_xlat23.xx * _AniLength_Intensity_Speed.xy;
    u_xlat23.x = sin(u_xlat34);
    u_xlat23.xy = u_xlat23.xx * _AniLength2_Intensity_Speed.xy;
    u_xlat1.xz = u_xlat10_1.xx * u_xlat2.xy + u_xlat23.xy;
    u_xlat2.xy = u_xlat10_1.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat0.xy = u_xlat22.xy * u_xlat10_1.yy + u_xlat0.xy;
    u_xlat0.xy = u_xlat1.xz + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_22 = texture2D(_BGTex, u_xlat0.xy).w;
    u_xlat33 = (-u_xlat10_22) + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_BGTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _BG_Color.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat10_22) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat22.x = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat22.x);
    u_xlat4.x = cos(u_xlat22.x);
    u_xlat2.xy = u_xlat2.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat2.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat22.x = _Time.y * 0.300000012;
    u_xlat24.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat2.xy = u_xlat22.xx * u_xlat24.xy + u_xlat2.xy;
    u_xlat24.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat2.xy = u_xlat2.xy / u_xlat24.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat24.xy * u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_Saoguang, u_xlat2.xy);
    u_xlat10_22 = texture2D(_AniMask, u_xlat0.xy).y;
    u_xlat2 = u_xlat10_2.wwww * u_xlat10_2;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat3.w = _Saoguang_Color.w;
    u_xlat3 = u_xlat3 * _Saoguang_Color;
    u_xlat2.x = _Saoguang_Color.w;
    u_xlat2 = u_xlat2.xxxw * u_xlat3;
    u_xlat2 = u_xlat2 * vec4(_Saoguang_Intensity);
    u_xlat3.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat14.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat4.x = dot(u_xlat14.xy, u_xlat5.yz);
    u_xlat4.y = dot(u_xlat14.xy, u_xlat5.xy);
    u_xlat3.xw = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat3.xw = _Noise_TilingOffset.xy * u_xlat3.xw + _Noise_TilingOffset.zw;
    u_xlat3.xw = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat3.xw;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat14.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat14.xy, u_xlat6.xy);
        u_xlat14.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat14.xy = _Mask_TilingOffset.xy * u_xlat14.xy + _Mask_TilingOffset.zw;
        u_xlat14.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat14.xy;
        u_xlat10_14 = texture2D(_RNoise_GMask_BNoise, u_xlat14.xy).y;
        u_xlat14.x = u_xlat10_14 * _Mask_Power_U;
    } else {
        u_xlat14.x = 1.0;
    }
    u_xlat3.xy = u_xlat14.xx + u_xlat3.xw;
    u_xlat10_3 = texture2D(_RNoise_GMask_BNoise, u_xlat3.xy).x;
    u_xlat14.x = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat3.x = u_xlat10_3 + (-_Noise_Jianbian1);
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat3.x = u_xlat14.x * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat14.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat14.x;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat14.x = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat14.x);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat25.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat14.x));
    u_xlat14.x = dot(u_xlat25.xy, u_xlat7.xy);
    u_xlat14.x = u_xlat14.x + 0.5;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat25.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat14.x = u_xlat25.x * u_xlat14.x;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat25.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat25.x;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat5 = u_xlat14.xxxx * u_xlat5;
    u_xlat3 = u_xlat3.xxxx * u_xlat5;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat5 = vec4(u_xlat33) * u_xlat3;
    u_xlat16_3 = (u_xlatb4.y) ? u_xlat5 : u_xlat3;
    u_xlat33 = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat4.x = sin(u_xlat33);
    u_xlat5.x = cos(u_xlat33);
    u_xlat15.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat6.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang2_R_TilingOffset.xy * u_xlat4.xw + _Liuguang2_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat4.xw;
    u_xlat33 = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = sin(u_xlat33);
    u_xlat6.x = cos(u_xlat33);
    u_xlat7.x = (-u_xlat5.x);
    u_xlat7.y = u_xlat6.x;
    u_xlat7.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat10_0.xyw = texture2D(_Liuguang_Mask, u_xlat0.xy).xyz;
    u_xlat6 = u_xlat10_0.xxxx * u_xlat6;
    u_xlat10_0.x = texture2D(_Liuguang_2, u_xlat4.xw).x;
    u_xlat6 = u_xlat10_0.xxxx * u_xlat6;
    u_xlat10_0.x = texture2D(_Liuguang_2, u_xlat5.xy).y;
    u_xlat4.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7.x = (-u_xlat4.x);
    u_xlat7.y = u_xlat5.x;
    u_xlat7.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang3_R_TilingOffset.xy * u_xlat4.xw + _Liuguang3_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat7.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_G_TilingOffset.xy * u_xlat5.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat5.xy;
    u_xlat7.x = _Liuguang3_Intensity;
    u_xlat7.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang3_Color;
    u_xlat7 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat10_0.yyyy * u_xlat7;
    u_xlat10_11 = texture2D(_Liuguang_3, u_xlat4.xw).x;
    u_xlat4.xw = vec2(u_xlat10_11) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat5.xy;
    u_xlat10_11 = texture2D(_Liuguang_3, u_xlat4.xw).y;
    u_xlat4.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat8.x = (-u_xlat4.x);
    u_xlat8.y = u_xlat5.x;
    u_xlat8.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang4_R_TilingOffset.xy * u_xlat4.xw + _Liuguang4_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat8.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat9.x = (-u_xlat5.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat9.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat9.xy);
    u_xlat15.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat15.xy = _Liuguang4_G_TilingOffset.xy * u_xlat15.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat15.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat15.xy;
    u_xlat5.x = _Liuguang4_Intensity;
    u_xlat5.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat5.xxxw * _Liuguang4_Color;
    u_xlat5 = u_xlat5.wwwx * u_xlat8;
    u_xlat5 = u_xlat10_0.wwww * u_xlat5;
    u_xlat10_33 = texture2D(_Liuguang_4, u_xlat4.xw).x;
    u_xlat5 = vec4(u_xlat10_33) * u_xlat5;
    u_xlat10_33 = texture2D(_Liuguang_4, u_xlat15.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat2 * vec4(u_xlat10_22) + u_xlat1;
    u_xlat16_1 = u_xlat16_3 + u_xlat16_1;
    u_xlat16_1 = u_xlat6 * u_xlat10_0.xxxx + u_xlat16_1;
    u_xlat16_1 = u_xlat7 * vec4(u_xlat10_11) + u_xlat16_1;
    u_xlat16_0 = u_xlat5 * vec4(u_xlat10_33) + u_xlat16_1;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelRect.zw;
    u_xlat16_10.xy = u_xlat16_10.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat4.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat10_13 = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat10_13;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _Anima;
uniform 	float _AnimaStr;
uniform 	vec2 _AnimaStrXY;
uniform 	float _CameraZChannel;
uniform 	float _AnimaSpeed;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_VAR_TANGENTVIEWDIR0;
vec4 u_xlat0;
bool u_xlatb0;
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
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = _Time.y * _AnimaSpeed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * _AnimaStr;
    u_xlat0.x = u_xlat0.x * _AnimaStr;
    u_xlat1.xy = u_xlat0.yx * _AnimaStrXY.xy;
    u_xlatb0 = 0.5<_Anima;
    u_xlat0.xy = bool(u_xlatb0) ? u_xlat1.xy : vec2(0.0, 0.0);
    vs_VAR_TANGENTVIEWDIR0.xy = (-u_xlat0.xy);
    vs_VAR_TANGENTVIEWDIR0.z = _CameraZChannel;
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	float _ParallaxStrength;
uniform 	float _ParallaxBias;
uniform 	float _ParallaxDepthOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _AniMask;
uniform lowp sampler2D _RNoise_GMask_BNoise;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BGTex;
uniform lowp sampler2D _Saoguang;
uniform lowp sampler2D _Liuguang_Mask;
uniform lowp sampler2D _Liuguang_2;
uniform lowp sampler2D _Liuguang_3;
uniform lowp sampler2D _Liuguang_4;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_VAR_TANGENTVIEWDIR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp float u_xlat10_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
lowp float u_xlat10_11;
vec2 u_xlat13;
lowp float u_xlat10_13;
vec2 u_xlat14;
lowp float u_xlat10_14;
vec2 u_xlat15;
vec2 u_xlat22;
lowp float u_xlat10_22;
vec2 u_xlat23;
vec2 u_xlat24;
vec2 u_xlat25;
mediump vec2 u_xlat16_32;
float u_xlat33;
lowp float u_xlat10_33;
float u_xlat34;
void main()
{
    u_xlat0.x = dot(vs_VAR_TANGENTVIEWDIR0.xyz, vs_VAR_TANGENTVIEWDIR0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xy = u_xlat0.xx * vs_VAR_TANGENTVIEWDIR0.xy;
    u_xlat0.x = vs_VAR_TANGENTVIEWDIR0.z * u_xlat0.x + _ParallaxBias;
    u_xlat0.xy = u_xlat11.xy / u_xlat0.xx;
    u_xlat10_22 = texture2D(_AniMask, vs_TEXCOORD0.xy).x;
    u_xlat22.x = u_xlat10_22 + (-_ParallaxDepthOffset);
    u_xlat22.x = u_xlat22.x * _ParallaxStrength;
    u_xlat0.xy = u_xlat0.xy * u_xlat22.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat1.x = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat22.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat22.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat22.xy;
    u_xlat10_22 = texture2D(_RNoise_GMask_BNoise, u_xlat22.xy).z;
    u_xlat10_1.xy = texture2D(_AniMask, u_xlat0.xy).xz;
    u_xlat22.xy = vec2(u_xlat10_22) * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat23.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat34 = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat23.x = sin(u_xlat23.x);
    u_xlat2.xy = u_xlat23.xx * _AniLength_Intensity_Speed.xy;
    u_xlat23.x = sin(u_xlat34);
    u_xlat23.xy = u_xlat23.xx * _AniLength2_Intensity_Speed.xy;
    u_xlat1.xz = u_xlat10_1.xx * u_xlat2.xy + u_xlat23.xy;
    u_xlat2.xy = u_xlat10_1.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat0.xy = u_xlat22.xy * u_xlat10_1.yy + u_xlat0.xy;
    u_xlat0.xy = u_xlat1.xz + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_22 = texture2D(_BGTex, u_xlat0.xy).w;
    u_xlat33 = (-u_xlat10_22) + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_BGTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _BG_Color.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat10_22) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat22.x = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat22.x);
    u_xlat4.x = cos(u_xlat22.x);
    u_xlat2.xy = u_xlat2.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat2.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat22.x = _Time.y * 0.300000012;
    u_xlat24.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat2.xy = u_xlat22.xx * u_xlat24.xy + u_xlat2.xy;
    u_xlat24.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat2.xy = u_xlat2.xy / u_xlat24.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat24.xy * u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_Saoguang, u_xlat2.xy);
    u_xlat10_22 = texture2D(_AniMask, u_xlat0.xy).y;
    u_xlat2 = u_xlat10_2.wwww * u_xlat10_2;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat3.w = _Saoguang_Color.w;
    u_xlat3 = u_xlat3 * _Saoguang_Color;
    u_xlat2.x = _Saoguang_Color.w;
    u_xlat2 = u_xlat2.xxxw * u_xlat3;
    u_xlat2 = u_xlat2 * vec4(_Saoguang_Intensity);
    u_xlat3.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat14.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat4.x = dot(u_xlat14.xy, u_xlat5.yz);
    u_xlat4.y = dot(u_xlat14.xy, u_xlat5.xy);
    u_xlat3.xw = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat3.xw = _Noise_TilingOffset.xy * u_xlat3.xw + _Noise_TilingOffset.zw;
    u_xlat3.xw = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat3.xw;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat14.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat14.xy, u_xlat6.xy);
        u_xlat14.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat14.xy = _Mask_TilingOffset.xy * u_xlat14.xy + _Mask_TilingOffset.zw;
        u_xlat14.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat14.xy;
        u_xlat10_14 = texture2D(_RNoise_GMask_BNoise, u_xlat14.xy).y;
        u_xlat14.x = u_xlat10_14 * _Mask_Power_U;
    } else {
        u_xlat14.x = 1.0;
    }
    u_xlat3.xy = u_xlat14.xx + u_xlat3.xw;
    u_xlat10_3 = texture2D(_RNoise_GMask_BNoise, u_xlat3.xy).x;
    u_xlat14.x = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat3.x = u_xlat10_3 + (-_Noise_Jianbian1);
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat3.x = u_xlat14.x * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat14.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat14.x;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat14.x = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat14.x);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat25.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat14.x));
    u_xlat14.x = dot(u_xlat25.xy, u_xlat7.xy);
    u_xlat14.x = u_xlat14.x + 0.5;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat25.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat14.x = u_xlat25.x * u_xlat14.x;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat25.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat25.x;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat5 = u_xlat14.xxxx * u_xlat5;
    u_xlat3 = u_xlat3.xxxx * u_xlat5;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat5 = vec4(u_xlat33) * u_xlat3;
    u_xlat16_3 = (u_xlatb4.y) ? u_xlat5 : u_xlat3;
    u_xlat33 = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat4.x = sin(u_xlat33);
    u_xlat5.x = cos(u_xlat33);
    u_xlat15.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat6.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang2_R_TilingOffset.xy * u_xlat4.xw + _Liuguang2_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat4.xw;
    u_xlat33 = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = sin(u_xlat33);
    u_xlat6.x = cos(u_xlat33);
    u_xlat7.x = (-u_xlat5.x);
    u_xlat7.y = u_xlat6.x;
    u_xlat7.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat10_0.xyw = texture2D(_Liuguang_Mask, u_xlat0.xy).xyz;
    u_xlat6 = u_xlat10_0.xxxx * u_xlat6;
    u_xlat10_0.x = texture2D(_Liuguang_2, u_xlat4.xw).x;
    u_xlat6 = u_xlat10_0.xxxx * u_xlat6;
    u_xlat10_0.x = texture2D(_Liuguang_2, u_xlat5.xy).y;
    u_xlat4.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7.x = (-u_xlat4.x);
    u_xlat7.y = u_xlat5.x;
    u_xlat7.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang3_R_TilingOffset.xy * u_xlat4.xw + _Liuguang3_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat7.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_G_TilingOffset.xy * u_xlat5.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat5.xy;
    u_xlat7.x = _Liuguang3_Intensity;
    u_xlat7.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang3_Color;
    u_xlat7 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat10_0.yyyy * u_xlat7;
    u_xlat10_11 = texture2D(_Liuguang_3, u_xlat4.xw).x;
    u_xlat4.xw = vec2(u_xlat10_11) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat5.xy;
    u_xlat10_11 = texture2D(_Liuguang_3, u_xlat4.xw).y;
    u_xlat4.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat8.x = (-u_xlat4.x);
    u_xlat8.y = u_xlat5.x;
    u_xlat8.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang4_R_TilingOffset.xy * u_xlat4.xw + _Liuguang4_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat8.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat9.x = (-u_xlat5.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat9.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat9.xy);
    u_xlat15.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat15.xy = _Liuguang4_G_TilingOffset.xy * u_xlat15.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat15.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat15.xy;
    u_xlat5.x = _Liuguang4_Intensity;
    u_xlat5.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat5.xxxw * _Liuguang4_Color;
    u_xlat5 = u_xlat5.wwwx * u_xlat8;
    u_xlat5 = u_xlat10_0.wwww * u_xlat5;
    u_xlat10_33 = texture2D(_Liuguang_4, u_xlat4.xw).x;
    u_xlat5 = vec4(u_xlat10_33) * u_xlat5;
    u_xlat10_33 = texture2D(_Liuguang_4, u_xlat15.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat2 * vec4(u_xlat10_22) + u_xlat1;
    u_xlat16_1 = u_xlat16_3 + u_xlat16_1;
    u_xlat16_1 = u_xlat6 * u_xlat10_0.xxxx + u_xlat16_1;
    u_xlat16_1 = u_xlat7 * vec4(u_xlat10_11) + u_xlat16_1;
    u_xlat16_0 = u_xlat5 * vec4(u_xlat10_33) + u_xlat16_1;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelRect.zw;
    u_xlat16_10.xy = u_xlat16_10.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat4.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat10_13 = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat10_13;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _Anima;
uniform 	float _AnimaStr;
uniform 	vec2 _AnimaStrXY;
uniform 	float _CameraZChannel;
uniform 	float _AnimaSpeed;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_VAR_TANGENTVIEWDIR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = _Time.y * _AnimaSpeed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * _AnimaStr;
    u_xlat0.x = u_xlat0.x * _AnimaStr;
    u_xlat1.xy = u_xlat0.yx * _AnimaStrXY.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Anima);
#else
    u_xlatb0 = 0.5<_Anima;
#endif
    u_xlat0.xy = bool(u_xlatb0) ? u_xlat1.xy : vec2(0.0, 0.0);
    vs_VAR_TANGENTVIEWDIR0.xy = (-u_xlat0.xy);
    vs_VAR_TANGENTVIEWDIR0.z = _CameraZChannel;
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	float _ParallaxStrength;
uniform 	float _ParallaxBias;
uniform 	float _ParallaxDepthOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AniMask;
UNITY_LOCATION(1) uniform mediump sampler2D _RNoise_GMask_BNoise;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Saoguang;
UNITY_LOCATION(5) uniform mediump sampler2D _Liuguang_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Liuguang_2;
UNITY_LOCATION(7) uniform mediump sampler2D _Liuguang_3;
UNITY_LOCATION(8) uniform mediump sampler2D _Liuguang_4;
UNITY_LOCATION(9) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_VAR_TANGENTVIEWDIR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
mediump float u_xlat16_11;
vec2 u_xlat13;
mediump float u_xlat16_13;
vec2 u_xlat14;
mediump float u_xlat16_14;
vec2 u_xlat15;
vec2 u_xlat22;
mediump float u_xlat16_22;
vec2 u_xlat23;
vec2 u_xlat24;
vec2 u_xlat25;
mediump vec2 u_xlat16_32;
float u_xlat33;
mediump float u_xlat16_33;
float u_xlat34;
void main()
{
    u_xlat0.x = dot(vs_VAR_TANGENTVIEWDIR0.xyz, vs_VAR_TANGENTVIEWDIR0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xy = u_xlat0.xx * vs_VAR_TANGENTVIEWDIR0.xy;
    u_xlat0.x = vs_VAR_TANGENTVIEWDIR0.z * u_xlat0.x + _ParallaxBias;
    u_xlat0.xy = u_xlat11.xy / u_xlat0.xx;
    u_xlat16_22 = texture(_AniMask, vs_TEXCOORD0.xy).x;
    u_xlat22.x = u_xlat16_22 + (-_ParallaxDepthOffset);
    u_xlat22.x = u_xlat22.x * _ParallaxStrength;
    u_xlat0.xy = u_xlat0.xy * u_xlat22.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat1.x = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat22.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat22.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat22.xy;
    u_xlat16_22 = texture(_RNoise_GMask_BNoise, u_xlat22.xy).z;
    u_xlat16_1.xy = texture(_AniMask, u_xlat0.xy).xz;
    u_xlat22.xy = vec2(u_xlat16_22) * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat23.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat34 = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat23.x = sin(u_xlat23.x);
    u_xlat2.xy = u_xlat23.xx * _AniLength_Intensity_Speed.xy;
    u_xlat23.x = sin(u_xlat34);
    u_xlat23.xy = u_xlat23.xx * _AniLength2_Intensity_Speed.xy;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat2.xy + u_xlat23.xy;
    u_xlat2.xy = u_xlat16_1.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat0.xy = u_xlat22.xy * u_xlat16_1.yy + u_xlat0.xy;
    u_xlat0.xy = u_xlat1.xz + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_22 = texture(_BGTex, u_xlat0.xy).w;
    u_xlat33 = (-u_xlat16_22) + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat16_2.xyz = texture(_BGTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _BG_Color.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_22) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat22.x = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat22.x);
    u_xlat4.x = cos(u_xlat22.x);
    u_xlat2.xy = u_xlat2.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat2.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat22.x = _Time.y * 0.300000012;
    u_xlat24.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat2.xy = u_xlat22.xx * u_xlat24.xy + u_xlat2.xy;
    u_xlat24.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat2.xy = u_xlat2.xy / u_xlat24.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat24.xy * u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_Saoguang, u_xlat2.xy);
    u_xlat16_22 = texture(_AniMask, u_xlat0.xy).y;
    u_xlat2 = u_xlat16_2.wwww * u_xlat16_2;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat3.w = _Saoguang_Color.w;
    u_xlat3 = u_xlat3 * _Saoguang_Color;
    u_xlat2.x = _Saoguang_Color.w;
    u_xlat2 = u_xlat2.xxxw * u_xlat3;
    u_xlat2 = u_xlat2 * vec4(_Saoguang_Intensity);
    u_xlat3.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat14.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat4.x = dot(u_xlat14.xy, u_xlat5.yz);
    u_xlat4.y = dot(u_xlat14.xy, u_xlat5.xy);
    u_xlat3.xw = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat3.xw = _Noise_TilingOffset.xy * u_xlat3.xw + _Noise_TilingOffset.zw;
    u_xlat3.xw = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat3.xw;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat14.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat14.xy, u_xlat6.xy);
        u_xlat14.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat14.xy = _Mask_TilingOffset.xy * u_xlat14.xy + _Mask_TilingOffset.zw;
        u_xlat14.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat14.xy;
        u_xlat16_14 = texture(_RNoise_GMask_BNoise, u_xlat14.xy).y;
        u_xlat14.x = u_xlat16_14 * _Mask_Power_U;
    } else {
        u_xlat14.x = 1.0;
    }
    u_xlat3.xy = u_xlat14.xx + u_xlat3.xw;
    u_xlat16_3.x = texture(_RNoise_GMask_BNoise, u_xlat3.xy).x;
    u_xlat14.x = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat3.x = u_xlat16_3.x + (-_Noise_Jianbian1);
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat3.x = u_xlat14.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat14.x;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat14.x = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat14.x);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat25.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat14.x));
    u_xlat14.x = dot(u_xlat25.xy, u_xlat7.xy);
    u_xlat14.x = u_xlat14.x + 0.5;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat25.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat14.x = u_xlat25.x * u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat25.x;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat5 = u_xlat14.xxxx * u_xlat5;
    u_xlat3 = u_xlat3.xxxx * u_xlat5;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat5 = vec4(u_xlat33) * u_xlat3;
    u_xlat16_3 = (u_xlatb4.y) ? u_xlat5 : u_xlat3;
    u_xlat33 = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat4.x = sin(u_xlat33);
    u_xlat5.x = cos(u_xlat33);
    u_xlat15.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat6.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang2_R_TilingOffset.xy * u_xlat4.xw + _Liuguang2_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat4.xw;
    u_xlat33 = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = sin(u_xlat33);
    u_xlat6.x = cos(u_xlat33);
    u_xlat7.x = (-u_xlat5.x);
    u_xlat7.y = u_xlat6.x;
    u_xlat7.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat16_0.xyw = texture(_Liuguang_Mask, u_xlat0.xy).xyz;
    u_xlat6 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat4.xw).x;
    u_xlat6 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat5.xy).y;
    u_xlat4.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7.x = (-u_xlat4.x);
    u_xlat7.y = u_xlat5.x;
    u_xlat7.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang3_R_TilingOffset.xy * u_xlat4.xw + _Liuguang3_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat7.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_G_TilingOffset.xy * u_xlat5.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat5.xy;
    u_xlat7.x = _Liuguang3_Intensity;
    u_xlat7.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang3_Color;
    u_xlat7 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat16_0.yyyy * u_xlat7;
    u_xlat16_11 = texture(_Liuguang_3, u_xlat4.xw).x;
    u_xlat4.xw = vec2(u_xlat16_11) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat5.xy;
    u_xlat16_11 = texture(_Liuguang_3, u_xlat4.xw).y;
    u_xlat4.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat8.x = (-u_xlat4.x);
    u_xlat8.y = u_xlat5.x;
    u_xlat8.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang4_R_TilingOffset.xy * u_xlat4.xw + _Liuguang4_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat8.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat9.x = (-u_xlat5.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat9.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat9.xy);
    u_xlat15.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat15.xy = _Liuguang4_G_TilingOffset.xy * u_xlat15.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat15.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat15.xy;
    u_xlat5.x = _Liuguang4_Intensity;
    u_xlat5.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat5.xxxw * _Liuguang4_Color;
    u_xlat5 = u_xlat5.wwwx * u_xlat8;
    u_xlat5 = u_xlat16_0.wwww * u_xlat5;
    u_xlat16_33 = texture(_Liuguang_4, u_xlat4.xw).x;
    u_xlat5 = vec4(u_xlat16_33) * u_xlat5;
    u_xlat16_33 = texture(_Liuguang_4, u_xlat15.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat2 * vec4(u_xlat16_22) + u_xlat1;
    u_xlat16_1 = u_xlat16_3 + u_xlat16_1;
    u_xlat16_1 = u_xlat6 * u_xlat16_0.xxxx + u_xlat16_1;
    u_xlat16_1 = u_xlat7 * vec4(u_xlat16_11) + u_xlat16_1;
    u_xlat16_0 = u_xlat5 * vec4(u_xlat16_33) + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat4.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat16_13 = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat16_13;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _Anima;
uniform 	float _AnimaStr;
uniform 	vec2 _AnimaStrXY;
uniform 	float _CameraZChannel;
uniform 	float _AnimaSpeed;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_VAR_TANGENTVIEWDIR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = _Time.y * _AnimaSpeed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * _AnimaStr;
    u_xlat0.x = u_xlat0.x * _AnimaStr;
    u_xlat1.xy = u_xlat0.yx * _AnimaStrXY.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Anima);
#else
    u_xlatb0 = 0.5<_Anima;
#endif
    u_xlat0.xy = bool(u_xlatb0) ? u_xlat1.xy : vec2(0.0, 0.0);
    vs_VAR_TANGENTVIEWDIR0.xy = (-u_xlat0.xy);
    vs_VAR_TANGENTVIEWDIR0.z = _CameraZChannel;
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	float _ParallaxStrength;
uniform 	float _ParallaxBias;
uniform 	float _ParallaxDepthOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AniMask;
UNITY_LOCATION(1) uniform mediump sampler2D _RNoise_GMask_BNoise;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Saoguang;
UNITY_LOCATION(5) uniform mediump sampler2D _Liuguang_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Liuguang_2;
UNITY_LOCATION(7) uniform mediump sampler2D _Liuguang_3;
UNITY_LOCATION(8) uniform mediump sampler2D _Liuguang_4;
UNITY_LOCATION(9) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_VAR_TANGENTVIEWDIR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
mediump float u_xlat16_11;
vec2 u_xlat13;
mediump float u_xlat16_13;
vec2 u_xlat14;
mediump float u_xlat16_14;
vec2 u_xlat15;
vec2 u_xlat22;
mediump float u_xlat16_22;
vec2 u_xlat23;
vec2 u_xlat24;
vec2 u_xlat25;
mediump vec2 u_xlat16_32;
float u_xlat33;
mediump float u_xlat16_33;
float u_xlat34;
void main()
{
    u_xlat0.x = dot(vs_VAR_TANGENTVIEWDIR0.xyz, vs_VAR_TANGENTVIEWDIR0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xy = u_xlat0.xx * vs_VAR_TANGENTVIEWDIR0.xy;
    u_xlat0.x = vs_VAR_TANGENTVIEWDIR0.z * u_xlat0.x + _ParallaxBias;
    u_xlat0.xy = u_xlat11.xy / u_xlat0.xx;
    u_xlat16_22 = texture(_AniMask, vs_TEXCOORD0.xy).x;
    u_xlat22.x = u_xlat16_22 + (-_ParallaxDepthOffset);
    u_xlat22.x = u_xlat22.x * _ParallaxStrength;
    u_xlat0.xy = u_xlat0.xy * u_xlat22.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat1.x = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat22.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat22.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat22.xy;
    u_xlat16_22 = texture(_RNoise_GMask_BNoise, u_xlat22.xy).z;
    u_xlat16_1.xy = texture(_AniMask, u_xlat0.xy).xz;
    u_xlat22.xy = vec2(u_xlat16_22) * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat23.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat34 = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat23.x = sin(u_xlat23.x);
    u_xlat2.xy = u_xlat23.xx * _AniLength_Intensity_Speed.xy;
    u_xlat23.x = sin(u_xlat34);
    u_xlat23.xy = u_xlat23.xx * _AniLength2_Intensity_Speed.xy;
    u_xlat1.xz = u_xlat16_1.xx * u_xlat2.xy + u_xlat23.xy;
    u_xlat2.xy = u_xlat16_1.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat0.xy = u_xlat22.xy * u_xlat16_1.yy + u_xlat0.xy;
    u_xlat0.xy = u_xlat1.xz + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_22 = texture(_BGTex, u_xlat0.xy).w;
    u_xlat33 = (-u_xlat16_22) + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat16_2.xyz = texture(_BGTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _BG_Color.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_22) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat22.x = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat22.x);
    u_xlat4.x = cos(u_xlat22.x);
    u_xlat2.xy = u_xlat2.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat2.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat22.x = _Time.y * 0.300000012;
    u_xlat24.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat2.xy = u_xlat22.xx * u_xlat24.xy + u_xlat2.xy;
    u_xlat24.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat2.xy = u_xlat2.xy / u_xlat24.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat24.xy * u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat16_2 = texture(_Saoguang, u_xlat2.xy);
    u_xlat16_22 = texture(_AniMask, u_xlat0.xy).y;
    u_xlat2 = u_xlat16_2.wwww * u_xlat16_2;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat3.w = _Saoguang_Color.w;
    u_xlat3 = u_xlat3 * _Saoguang_Color;
    u_xlat2.x = _Saoguang_Color.w;
    u_xlat2 = u_xlat2.xxxw * u_xlat3;
    u_xlat2 = u_xlat2 * vec4(_Saoguang_Intensity);
    u_xlat3.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat14.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat4.x = dot(u_xlat14.xy, u_xlat5.yz);
    u_xlat4.y = dot(u_xlat14.xy, u_xlat5.xy);
    u_xlat3.xw = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat3.xw = _Noise_TilingOffset.xy * u_xlat3.xw + _Noise_TilingOffset.zw;
    u_xlat3.xw = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat3.xw;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat14.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat14.xy, u_xlat6.xy);
        u_xlat14.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat14.xy = _Mask_TilingOffset.xy * u_xlat14.xy + _Mask_TilingOffset.zw;
        u_xlat14.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat14.xy;
        u_xlat16_14 = texture(_RNoise_GMask_BNoise, u_xlat14.xy).y;
        u_xlat14.x = u_xlat16_14 * _Mask_Power_U;
    } else {
        u_xlat14.x = 1.0;
    }
    u_xlat3.xy = u_xlat14.xx + u_xlat3.xw;
    u_xlat16_3.x = texture(_RNoise_GMask_BNoise, u_xlat3.xy).x;
    u_xlat14.x = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat3.x = u_xlat16_3.x + (-_Noise_Jianbian1);
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat3.x = u_xlat14.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat14.x;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat14.x = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat14.x);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat25.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat14.x));
    u_xlat14.x = dot(u_xlat25.xy, u_xlat7.xy);
    u_xlat14.x = u_xlat14.x + 0.5;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat25.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat14.x = u_xlat25.x * u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat25.x;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat5 = u_xlat14.xxxx * u_xlat5;
    u_xlat3 = u_xlat3.xxxx * u_xlat5;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat5 = vec4(u_xlat33) * u_xlat3;
    u_xlat16_3 = (u_xlatb4.y) ? u_xlat5 : u_xlat3;
    u_xlat33 = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat4.x = sin(u_xlat33);
    u_xlat5.x = cos(u_xlat33);
    u_xlat15.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat6.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang2_R_TilingOffset.xy * u_xlat4.xw + _Liuguang2_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat4.xw;
    u_xlat33 = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = sin(u_xlat33);
    u_xlat6.x = cos(u_xlat33);
    u_xlat7.x = (-u_xlat5.x);
    u_xlat7.y = u_xlat6.x;
    u_xlat7.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat16_0.xyw = texture(_Liuguang_Mask, u_xlat0.xy).xyz;
    u_xlat6 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat4.xw).x;
    u_xlat6 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat5.xy).y;
    u_xlat4.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7.x = (-u_xlat4.x);
    u_xlat7.y = u_xlat5.x;
    u_xlat7.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang3_R_TilingOffset.xy * u_xlat4.xw + _Liuguang3_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat7.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_G_TilingOffset.xy * u_xlat5.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat5.xy;
    u_xlat7.x = _Liuguang3_Intensity;
    u_xlat7.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang3_Color;
    u_xlat7 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat16_0.yyyy * u_xlat7;
    u_xlat16_11 = texture(_Liuguang_3, u_xlat4.xw).x;
    u_xlat4.xw = vec2(u_xlat16_11) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat5.xy;
    u_xlat16_11 = texture(_Liuguang_3, u_xlat4.xw).y;
    u_xlat4.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat8.x = (-u_xlat4.x);
    u_xlat8.y = u_xlat5.x;
    u_xlat8.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang4_R_TilingOffset.xy * u_xlat4.xw + _Liuguang4_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat8.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat9.x = (-u_xlat5.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat9.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat9.xy);
    u_xlat15.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat15.xy = _Liuguang4_G_TilingOffset.xy * u_xlat15.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat15.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat15.xy;
    u_xlat5.x = _Liuguang4_Intensity;
    u_xlat5.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat5.xxxw * _Liuguang4_Color;
    u_xlat5 = u_xlat5.wwwx * u_xlat8;
    u_xlat5 = u_xlat16_0.wwww * u_xlat5;
    u_xlat16_33 = texture(_Liuguang_4, u_xlat4.xw).x;
    u_xlat5 = vec4(u_xlat16_33) * u_xlat5;
    u_xlat16_33 = texture(_Liuguang_4, u_xlat15.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat2 * vec4(u_xlat16_22) + u_xlat1;
    u_xlat16_1 = u_xlat16_3 + u_xlat16_1;
    u_xlat16_1 = u_xlat6 * u_xlat16_0.xxxx + u_xlat16_1;
    u_xlat16_1 = u_xlat7 * vec4(u_xlat16_11) + u_xlat16_1;
    u_xlat16_0 = u_xlat5 * vec4(u_xlat16_33) + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat4.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat16_13 = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat16_13;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _Anima;
uniform 	float _AnimaStr;
uniform 	vec2 _AnimaStrXY;
uniform 	float _CameraZChannel;
uniform 	float _AnimaSpeed;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_VAR_TANGENTVIEWDIR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = _Time.y * _AnimaSpeed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * _AnimaStr;
    u_xlat0.x = u_xlat0.x * _AnimaStr;
    u_xlat1.xy = u_xlat0.yx * _AnimaStrXY.xy;
    u_xlatb0 = 0.5<_Anima;
    u_xlat0.xy = bool(u_xlatb0) ? u_xlat1.xy : vec2(0.0, 0.0);
    vs_VAR_TANGENTVIEWDIR0.xy = (-u_xlat0.xy);
    vs_VAR_TANGENTVIEWDIR0.z = _CameraZChannel;
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	float _ParallaxStrength;
uniform 	float _ParallaxBias;
uniform 	float _ParallaxDepthOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _AniMask;
uniform lowp sampler2D _RNoise_GMask_BNoise;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BGTex;
uniform lowp sampler2D _Saoguang;
uniform lowp sampler2D _Liuguang_Mask;
uniform lowp sampler2D _Liuguang_2;
uniform lowp sampler2D _Liuguang_3;
uniform lowp sampler2D _Liuguang_4;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_VAR_TANGENTVIEWDIR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp float u_xlat10_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
lowp float u_xlat10_11;
vec2 u_xlat13;
lowp float u_xlat10_13;
vec2 u_xlat14;
lowp float u_xlat10_14;
vec2 u_xlat15;
vec2 u_xlat22;
lowp float u_xlat10_22;
vec2 u_xlat23;
vec2 u_xlat24;
vec2 u_xlat25;
mediump vec2 u_xlat16_32;
float u_xlat33;
lowp float u_xlat10_33;
float u_xlat34;
void main()
{
    u_xlat0.x = dot(vs_VAR_TANGENTVIEWDIR0.xyz, vs_VAR_TANGENTVIEWDIR0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xy = u_xlat0.xx * vs_VAR_TANGENTVIEWDIR0.xy;
    u_xlat0.x = vs_VAR_TANGENTVIEWDIR0.z * u_xlat0.x + _ParallaxBias;
    u_xlat0.xy = u_xlat11.xy / u_xlat0.xx;
    u_xlat10_22 = texture2D(_AniMask, vs_TEXCOORD0.xy).x;
    u_xlat22.x = u_xlat10_22 + (-_ParallaxDepthOffset);
    u_xlat22.x = u_xlat22.x * _ParallaxStrength;
    u_xlat0.xy = u_xlat0.xy * u_xlat22.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat1.x = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat22.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat22.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat22.xy;
    u_xlat10_22 = texture2D(_RNoise_GMask_BNoise, u_xlat22.xy).z;
    u_xlat10_1.xy = texture2D(_AniMask, u_xlat0.xy).xz;
    u_xlat22.xy = vec2(u_xlat10_22) * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat23.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat34 = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat23.x = sin(u_xlat23.x);
    u_xlat2.xy = u_xlat23.xx * _AniLength_Intensity_Speed.xy;
    u_xlat23.x = sin(u_xlat34);
    u_xlat23.xy = u_xlat23.xx * _AniLength2_Intensity_Speed.xy;
    u_xlat1.xz = u_xlat10_1.xx * u_xlat2.xy + u_xlat23.xy;
    u_xlat2.xy = u_xlat10_1.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat0.xy = u_xlat22.xy * u_xlat10_1.yy + u_xlat0.xy;
    u_xlat0.xy = u_xlat1.xz + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_22 = texture2D(_BGTex, u_xlat0.xy).w;
    u_xlat33 = (-u_xlat10_22) + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_BGTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _BG_Color.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat10_22) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat22.x = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat22.x);
    u_xlat4.x = cos(u_xlat22.x);
    u_xlat2.xy = u_xlat2.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat2.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat22.x = _Time.y * 0.300000012;
    u_xlat24.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat2.xy = u_xlat22.xx * u_xlat24.xy + u_xlat2.xy;
    u_xlat24.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat2.xy = u_xlat2.xy / u_xlat24.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat24.xy * u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_Saoguang, u_xlat2.xy);
    u_xlat10_22 = texture2D(_AniMask, u_xlat0.xy).y;
    u_xlat2 = u_xlat10_2.wwww * u_xlat10_2;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat3.w = _Saoguang_Color.w;
    u_xlat3 = u_xlat3 * _Saoguang_Color;
    u_xlat2.x = _Saoguang_Color.w;
    u_xlat2 = u_xlat2.xxxw * u_xlat3;
    u_xlat2 = u_xlat2 * vec4(_Saoguang_Intensity);
    u_xlat3.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat14.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat4.x = dot(u_xlat14.xy, u_xlat5.yz);
    u_xlat4.y = dot(u_xlat14.xy, u_xlat5.xy);
    u_xlat3.xw = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat3.xw = _Noise_TilingOffset.xy * u_xlat3.xw + _Noise_TilingOffset.zw;
    u_xlat3.xw = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat3.xw;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat14.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat14.xy, u_xlat6.xy);
        u_xlat14.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat14.xy = _Mask_TilingOffset.xy * u_xlat14.xy + _Mask_TilingOffset.zw;
        u_xlat14.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat14.xy;
        u_xlat10_14 = texture2D(_RNoise_GMask_BNoise, u_xlat14.xy).y;
        u_xlat14.x = u_xlat10_14 * _Mask_Power_U;
    } else {
        u_xlat14.x = 1.0;
    }
    u_xlat3.xy = u_xlat14.xx + u_xlat3.xw;
    u_xlat10_3 = texture2D(_RNoise_GMask_BNoise, u_xlat3.xy).x;
    u_xlat14.x = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat3.x = u_xlat10_3 + (-_Noise_Jianbian1);
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat3.x = u_xlat14.x * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat14.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat14.x;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat14.x = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat14.x);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat25.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat14.x));
    u_xlat14.x = dot(u_xlat25.xy, u_xlat7.xy);
    u_xlat14.x = u_xlat14.x + 0.5;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat25.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat14.x = u_xlat25.x * u_xlat14.x;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat25.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat25.x;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat5 = u_xlat14.xxxx * u_xlat5;
    u_xlat3 = u_xlat3.xxxx * u_xlat5;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat5 = vec4(u_xlat33) * u_xlat3;
    u_xlat16_3 = (u_xlatb4.y) ? u_xlat5 : u_xlat3;
    u_xlat33 = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat4.x = sin(u_xlat33);
    u_xlat5.x = cos(u_xlat33);
    u_xlat15.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat6.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang2_R_TilingOffset.xy * u_xlat4.xw + _Liuguang2_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat4.xw;
    u_xlat33 = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = sin(u_xlat33);
    u_xlat6.x = cos(u_xlat33);
    u_xlat7.x = (-u_xlat5.x);
    u_xlat7.y = u_xlat6.x;
    u_xlat7.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat10_0.xyw = texture2D(_Liuguang_Mask, u_xlat0.xy).xyz;
    u_xlat6 = u_xlat10_0.xxxx * u_xlat6;
    u_xlat10_0.x = texture2D(_Liuguang_2, u_xlat4.xw).x;
    u_xlat6 = u_xlat10_0.xxxx * u_xlat6;
    u_xlat10_0.x = texture2D(_Liuguang_2, u_xlat5.xy).y;
    u_xlat4.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7.x = (-u_xlat4.x);
    u_xlat7.y = u_xlat5.x;
    u_xlat7.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang3_R_TilingOffset.xy * u_xlat4.xw + _Liuguang3_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat7.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_G_TilingOffset.xy * u_xlat5.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat5.xy;
    u_xlat7.x = _Liuguang3_Intensity;
    u_xlat7.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang3_Color;
    u_xlat7 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat10_0.yyyy * u_xlat7;
    u_xlat10_11 = texture2D(_Liuguang_3, u_xlat4.xw).x;
    u_xlat4.xw = vec2(u_xlat10_11) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat5.xy;
    u_xlat10_11 = texture2D(_Liuguang_3, u_xlat4.xw).y;
    u_xlat4.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat8.x = (-u_xlat4.x);
    u_xlat8.y = u_xlat5.x;
    u_xlat8.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang4_R_TilingOffset.xy * u_xlat4.xw + _Liuguang4_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat8.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat9.x = (-u_xlat5.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat9.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat9.xy);
    u_xlat15.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat15.xy = _Liuguang4_G_TilingOffset.xy * u_xlat15.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat15.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat15.xy;
    u_xlat5.x = _Liuguang4_Intensity;
    u_xlat5.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat5.xxxw * _Liuguang4_Color;
    u_xlat5 = u_xlat5.wwwx * u_xlat8;
    u_xlat5 = u_xlat10_0.wwww * u_xlat5;
    u_xlat10_33 = texture2D(_Liuguang_4, u_xlat4.xw).x;
    u_xlat5 = vec4(u_xlat10_33) * u_xlat5;
    u_xlat10_33 = texture2D(_Liuguang_4, u_xlat15.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat2 * vec4(u_xlat10_22) + u_xlat1;
    u_xlat16_1 = u_xlat16_3 + u_xlat16_1;
    u_xlat16_1 = u_xlat6 * u_xlat10_0.xxxx + u_xlat16_1;
    u_xlat16_1 = u_xlat7 * vec4(u_xlat10_11) + u_xlat16_1;
    u_xlat16_0 = u_xlat5 * vec4(u_xlat10_33) + u_xlat16_1;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat4.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat10_13 = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat10_13;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _Anima;
uniform 	float _AnimaStr;
uniform 	vec2 _AnimaStrXY;
uniform 	float _CameraZChannel;
uniform 	float _AnimaSpeed;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_VAR_TANGENTVIEWDIR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = _Time.y * _AnimaSpeed;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.y = u_xlat1.x * _AnimaStr;
    u_xlat0.x = u_xlat0.x * _AnimaStr;
    u_xlat1.xy = u_xlat0.yx * _AnimaStrXY.xy;
    u_xlatb0 = 0.5<_Anima;
    u_xlat0.xy = bool(u_xlatb0) ? u_xlat1.xy : vec2(0.0, 0.0);
    vs_VAR_TANGENTVIEWDIR0.xy = (-u_xlat0.xy);
    vs_VAR_TANGENTVIEWDIR0.z = _CameraZChannel;
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	float _ParallaxStrength;
uniform 	float _ParallaxBias;
uniform 	float _ParallaxDepthOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _AniMask;
uniform lowp sampler2D _RNoise_GMask_BNoise;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BGTex;
uniform lowp sampler2D _Saoguang;
uniform lowp sampler2D _Liuguang_Mask;
uniform lowp sampler2D _Liuguang_2;
uniform lowp sampler2D _Liuguang_3;
uniform lowp sampler2D _Liuguang_4;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_VAR_TANGENTVIEWDIR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp float u_xlat10_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
lowp float u_xlat10_11;
vec2 u_xlat13;
lowp float u_xlat10_13;
vec2 u_xlat14;
lowp float u_xlat10_14;
vec2 u_xlat15;
vec2 u_xlat22;
lowp float u_xlat10_22;
vec2 u_xlat23;
vec2 u_xlat24;
vec2 u_xlat25;
mediump vec2 u_xlat16_32;
float u_xlat33;
lowp float u_xlat10_33;
float u_xlat34;
void main()
{
    u_xlat0.x = dot(vs_VAR_TANGENTVIEWDIR0.xyz, vs_VAR_TANGENTVIEWDIR0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xy = u_xlat0.xx * vs_VAR_TANGENTVIEWDIR0.xy;
    u_xlat0.x = vs_VAR_TANGENTVIEWDIR0.z * u_xlat0.x + _ParallaxBias;
    u_xlat0.xy = u_xlat11.xy / u_xlat0.xx;
    u_xlat10_22 = texture2D(_AniMask, vs_TEXCOORD0.xy).x;
    u_xlat22.x = u_xlat10_22 + (-_ParallaxDepthOffset);
    u_xlat22.x = u_xlat22.x * _ParallaxStrength;
    u_xlat0.xy = u_xlat0.xy * u_xlat22.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat1.x = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat22.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat22.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat22.xy, u_xlat3.xy);
    u_xlat22.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat22.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat22.xy;
    u_xlat10_22 = texture2D(_RNoise_GMask_BNoise, u_xlat22.xy).z;
    u_xlat10_1.xy = texture2D(_AniMask, u_xlat0.xy).xz;
    u_xlat22.xy = vec2(u_xlat10_22) * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat23.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat34 = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat23.x = sin(u_xlat23.x);
    u_xlat2.xy = u_xlat23.xx * _AniLength_Intensity_Speed.xy;
    u_xlat23.x = sin(u_xlat34);
    u_xlat23.xy = u_xlat23.xx * _AniLength2_Intensity_Speed.xy;
    u_xlat1.xz = u_xlat10_1.xx * u_xlat2.xy + u_xlat23.xy;
    u_xlat2.xy = u_xlat10_1.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat0.xy = u_xlat22.xy * u_xlat10_1.yy + u_xlat0.xy;
    u_xlat0.xy = u_xlat1.xz + u_xlat0.xy;
    u_xlat0.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_22 = texture2D(_BGTex, u_xlat0.xy).w;
    u_xlat33 = (-u_xlat10_22) + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_BGTex, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _BG_Color.xyz;
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat10_22) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat22.x = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat22.x);
    u_xlat4.x = cos(u_xlat22.x);
    u_xlat2.xy = u_xlat2.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat2.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat22.x = _Time.y * 0.300000012;
    u_xlat24.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat2.xy = u_xlat22.xx * u_xlat24.xy + u_xlat2.xy;
    u_xlat24.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat2.xy = u_xlat2.xy / u_xlat24.xy;
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat24.xy * u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat10_2 = texture2D(_Saoguang, u_xlat2.xy);
    u_xlat10_22 = texture2D(_AniMask, u_xlat0.xy).y;
    u_xlat2 = u_xlat10_2.wwww * u_xlat10_2;
    u_xlat3.xyz = u_xlat2.xyz;
    u_xlat3.w = _Saoguang_Color.w;
    u_xlat3 = u_xlat3 * _Saoguang_Color;
    u_xlat2.x = _Saoguang_Color.w;
    u_xlat2 = u_xlat2.xxxw * u_xlat3;
    u_xlat2 = u_xlat2 * vec4(_Saoguang_Intensity);
    u_xlat3.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat14.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat4.x = dot(u_xlat14.xy, u_xlat5.yz);
    u_xlat4.y = dot(u_xlat14.xy, u_xlat5.xy);
    u_xlat3.xw = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat3.xw = _Noise_TilingOffset.xy * u_xlat3.xw + _Noise_TilingOffset.zw;
    u_xlat3.xw = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat3.xw;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat14.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat14.xy, u_xlat6.xy);
        u_xlat14.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat14.xy = _Mask_TilingOffset.xy * u_xlat14.xy + _Mask_TilingOffset.zw;
        u_xlat14.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat14.xy;
        u_xlat10_14 = texture2D(_RNoise_GMask_BNoise, u_xlat14.xy).y;
        u_xlat14.x = u_xlat10_14 * _Mask_Power_U;
    } else {
        u_xlat14.x = 1.0;
    }
    u_xlat3.xy = u_xlat14.xx + u_xlat3.xw;
    u_xlat10_3 = texture2D(_RNoise_GMask_BNoise, u_xlat3.xy).x;
    u_xlat14.x = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat3.x = u_xlat10_3 + (-_Noise_Jianbian1);
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat3.x = u_xlat14.x * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat14.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat14.x;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat14.x = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat14.x);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat25.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat14.x));
    u_xlat14.x = dot(u_xlat25.xy, u_xlat7.xy);
    u_xlat14.x = u_xlat14.x + 0.5;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat25.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat14.x = u_xlat25.x * u_xlat14.x;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat25.x = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat25.x;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat5 = u_xlat14.xxxx * u_xlat5;
    u_xlat3 = u_xlat3.xxxx * u_xlat5;
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat5 = vec4(u_xlat33) * u_xlat3;
    u_xlat16_3 = (u_xlatb4.y) ? u_xlat5 : u_xlat3;
    u_xlat33 = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat4.x = sin(u_xlat33);
    u_xlat5.x = cos(u_xlat33);
    u_xlat15.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat6.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang2_R_TilingOffset.xy * u_xlat4.xw + _Liuguang2_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat4.xw;
    u_xlat33 = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = sin(u_xlat33);
    u_xlat6.x = cos(u_xlat33);
    u_xlat7.x = (-u_xlat5.x);
    u_xlat7.y = u_xlat6.x;
    u_xlat7.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat10_0.xyw = texture2D(_Liuguang_Mask, u_xlat0.xy).xyz;
    u_xlat6 = u_xlat10_0.xxxx * u_xlat6;
    u_xlat10_0.x = texture2D(_Liuguang_2, u_xlat4.xw).x;
    u_xlat6 = u_xlat10_0.xxxx * u_xlat6;
    u_xlat10_0.x = texture2D(_Liuguang_2, u_xlat5.xy).y;
    u_xlat4.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat7.x = (-u_xlat4.x);
    u_xlat7.y = u_xlat5.x;
    u_xlat7.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat7.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat7.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang3_R_TilingOffset.xy * u_xlat4.xw + _Liuguang3_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat7.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_G_TilingOffset.xy * u_xlat5.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat5.xy;
    u_xlat7.x = _Liuguang3_Intensity;
    u_xlat7.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang3_Color;
    u_xlat7 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat10_0.yyyy * u_xlat7;
    u_xlat10_11 = texture2D(_Liuguang_3, u_xlat4.xw).x;
    u_xlat4.xw = vec2(u_xlat10_11) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat5.xy;
    u_xlat10_11 = texture2D(_Liuguang_3, u_xlat4.xw).y;
    u_xlat4.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat5.x = cos(u_xlat4.x);
    u_xlat4.x = sin(u_xlat4.x);
    u_xlat8.x = (-u_xlat4.x);
    u_xlat8.y = u_xlat5.x;
    u_xlat8.z = u_xlat4.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat8.xy);
    u_xlat4.xw = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat4.xw = _Liuguang4_R_TilingOffset.xy * u_xlat4.xw + _Liuguang4_R_TilingOffset.zw;
    u_xlat4.xw = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat4.xw;
    u_xlat5.x = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat8.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat9.x = (-u_xlat5.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat15.xy, u_xlat9.yz);
    u_xlat5.y = dot(u_xlat15.xy, u_xlat9.xy);
    u_xlat15.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat15.xy = _Liuguang4_G_TilingOffset.xy * u_xlat15.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat15.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat15.xy;
    u_xlat5.x = _Liuguang4_Intensity;
    u_xlat5.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat5.xxxw * _Liuguang4_Color;
    u_xlat5 = u_xlat5.wwwx * u_xlat8;
    u_xlat5 = u_xlat10_0.wwww * u_xlat5;
    u_xlat10_33 = texture2D(_Liuguang_4, u_xlat4.xw).x;
    u_xlat5 = vec4(u_xlat10_33) * u_xlat5;
    u_xlat10_33 = texture2D(_Liuguang_4, u_xlat15.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat2 * vec4(u_xlat10_22) + u_xlat1;
    u_xlat16_1 = u_xlat16_3 + u_xlat16_1;
    u_xlat16_1 = u_xlat6 * u_xlat10_0.xxxx + u_xlat16_1;
    u_xlat16_1 = u_xlat7 * vec4(u_xlat10_11) + u_xlat16_1;
    u_xlat16_0 = u_xlat5 * vec4(u_xlat10_33) + u_xlat16_1;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat4.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat10_13 = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat10_13;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_UIPARALLAX_OFF" }
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
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RNoise_GMask_BNoise;
UNITY_LOCATION(1) uniform mediump sampler2D _AniMask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Saoguang;
UNITY_LOCATION(5) uniform mediump sampler2D _Liuguang_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Liuguang_2;
UNITY_LOCATION(7) uniform mediump sampler2D _Liuguang_3;
UNITY_LOCATION(8) uniform mediump sampler2D _Liuguang_4;
UNITY_LOCATION(9) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
mediump vec2 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
mediump float u_xlat16_16;
vec2 u_xlat22;
float u_xlat23;
vec2 u_xlat24;
mediump float u_xlat16_24;
vec2 u_xlat27;
mediump vec2 u_xlat16_32;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat22.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat23 = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = sin(u_xlat23);
    u_xlat3.x = cos(u_xlat23);
    u_xlat1.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat1.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat2.xy;
    u_xlat1.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat1.xy;
    u_xlat16_1.x = texture(_RNoise_GMask_BNoise, u_xlat1.xy).z;
    u_xlat16_12.xy = texture(_AniMask, u_xlat22.xy).xz;
    u_xlat1.xw = u_xlat16_1.xx * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat2.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat2.y = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat2.xz = u_xlat2.xx * _AniLength_Intensity_Speed.xy;
    u_xlat13.xz = u_xlat2.yy * _AniLength2_Intensity_Speed.xy;
    u_xlat2.xy = u_xlat16_12.xx * u_xlat2.xz + u_xlat13.xz;
    u_xlat24.xy = u_xlat16_12.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat22.xy = u_xlat1.xw * u_xlat16_12.yy + u_xlat22.xy;
    u_xlat22.xy = u_xlat2.xy + u_xlat22.xy;
    u_xlat22.xy = (-u_xlat24.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat22.xy).xyz;
    u_xlat16_34 = texture(_BGTex, u_xlat22.xy).w;
    u_xlat2.x = (-u_xlat16_34) + 1.0;
    u_xlat13.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat16_13.xyz = texture(_BGTex, u_xlat13.xy).xyz;
    u_xlat13.xyz = u_xlat16_13.xyz * _BG_Color.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_34) + u_xlat13.xyz;
    u_xlat13.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat35 = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat35);
    u_xlat4.x = cos(u_xlat35);
    u_xlat13.xy = u_xlat13.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat13.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat13.xy, u_xlat5.xy);
    u_xlat13.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat35 = _Time.y * 0.300000012;
    u_xlat3.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat13.xy = vec2(u_xlat35) * u_xlat3.xy + u_xlat13.xy;
    u_xlat3.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat13.xy = u_xlat13.xy / u_xlat3.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy * u_xlat13.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_Saoguang, u_xlat13.xy);
    u_xlat16_13.x = texture(_AniMask, u_xlat22.xy).y;
    u_xlat3 = u_xlat16_3.wwww * u_xlat16_3;
    u_xlat4.xyz = u_xlat3.xyz;
    u_xlat4.w = _Saoguang_Color.w;
    u_xlat4 = u_xlat4 * _Saoguang_Color;
    u_xlat3.x = _Saoguang_Color.w;
    u_xlat3 = u_xlat3.xxxw * u_xlat4;
    u_xlat3 = u_xlat3 * vec4(_Saoguang_Intensity);
    u_xlat24.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = sin(u_xlat24.x);
    u_xlat5.x = cos(u_xlat24.x);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat0.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat24.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Noise_TilingOffset.xy * u_xlat24.xy + _Noise_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat24.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat0.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat0.xy, u_xlat6.xy);
        u_xlat0.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat0.xy = _Mask_TilingOffset.xy * u_xlat0.xy + _Mask_TilingOffset.zw;
        u_xlat0.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat0.xy;
        u_xlat16_0.x = texture(_RNoise_GMask_BNoise, u_xlat0.xy).y;
        u_xlat0.x = u_xlat16_0.x * _Mask_Power_U;
    } else {
        u_xlat0.x = 1.0;
    }
    u_xlat0.xy = u_xlat0.xx + u_xlat24.xy;
    u_xlat16_0.x = texture(_RNoise_GMask_BNoise, u_xlat0.xy).x;
    u_xlat11 = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat0.x = u_xlat16_0.x + (-_Noise_Jianbian1);
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat0.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat11 = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat11);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat24.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat11));
    u_xlat11 = dot(u_xlat24.xy, u_xlat7.xy);
    u_xlat11 = u_xlat11 + 0.5;
    u_xlat11 = (-u_xlat11) + 1.0;
    u_xlat24.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat11 = u_xlat11 * u_xlat24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat5 = vec4(u_xlat11) * u_xlat5;
    u_xlat5 = u_xlat0.xxxx * u_xlat5;
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat6 = u_xlat2.xxxx * u_xlat5;
    u_xlat16_4 = (u_xlatb4.y) ? u_xlat6 : u_xlat5;
    u_xlat0.x = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat24.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat0.x);
    u_xlat5.y = u_xlat2.x;
    u_xlat5.z = u_xlat0.x;
    u_xlat0.x = dot(u_xlat24.xy, u_xlat5.yz);
    u_xlat0.y = dot(u_xlat24.xy, u_xlat5.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Liuguang2_R_TilingOffset.xy * u_xlat0.xy + _Liuguang2_R_TilingOffset.zw;
    u_xlat0.xy = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat0.xy;
    u_xlat2.x = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat6.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat16_7.xyz = texture(_Liuguang_Mask, u_xlat22.xy).xyz;
    u_xlat6 = u_xlat6 * u_xlat16_7.xxxx;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat0.xy).x;
    u_xlat0 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_2 = texture(_Liuguang_2, u_xlat5.xy).y;
    u_xlat5.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat6.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat6.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_R_TilingOffset.xy * u_xlat5.xy + _Liuguang3_R_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat5.xy;
    u_xlat27.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat6.x = sin(u_xlat27.x);
    u_xlat7.x = cos(u_xlat27.x);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat27.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat27.xy = _Liuguang3_G_TilingOffset.xy * u_xlat27.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat27.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat27.xy;
    u_xlat6.x = _Liuguang3_Intensity;
    u_xlat6.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat6.xxxw * _Liuguang3_Color;
    u_xlat6 = u_xlat6.wwwx * u_xlat8;
    u_xlat6 = u_xlat16_7.yyyy * u_xlat6;
    u_xlat16_5 = texture(_Liuguang_3, u_xlat5.xy).x;
    u_xlat5.xy = vec2(u_xlat16_5) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat27.xy;
    u_xlat16_5 = texture(_Liuguang_3, u_xlat5.xy).y;
    u_xlat16.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat7.x = sin(u_xlat16.x);
    u_xlat8.x = cos(u_xlat16.x);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat16.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Liuguang4_R_TilingOffset.xy * u_xlat16.xy + _Liuguang4_R_TilingOffset.zw;
    u_xlat16.xy = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat16.xy;
    u_xlat38 = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat7.x = sin(u_xlat38);
    u_xlat8.x = cos(u_xlat38);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat24.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Liuguang4_G_TilingOffset.xy * u_xlat24.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat24.xy;
    u_xlat7.x = _Liuguang4_Intensity;
    u_xlat7.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang4_Color;
    u_xlat8 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat16_7.zzzz * u_xlat8;
    u_xlat16_16 = texture(_Liuguang_4, u_xlat16.xy).x;
    u_xlat7 = vec4(u_xlat16_16) * u_xlat7;
    u_xlat16_24 = texture(_Liuguang_4, u_xlat24.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat3 * u_xlat16_13.xxxx + u_xlat1;
    u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
    u_xlat16_0 = u_xlat0 * vec4(u_xlat16_2) + u_xlat16_1;
    u_xlat16_0 = u_xlat6 * vec4(u_xlat16_5) + u_xlat16_0;
    u_xlat16_0 = u_xlat7 * vec4(u_xlat16_24) + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelRect.zw;
    u_xlat16_10.xy = u_xlat16_10.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat3.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat3.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat16_13.x = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat16_13.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_UIPARALLAX_OFF" }
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
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RNoise_GMask_BNoise;
UNITY_LOCATION(1) uniform mediump sampler2D _AniMask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Saoguang;
UNITY_LOCATION(5) uniform mediump sampler2D _Liuguang_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Liuguang_2;
UNITY_LOCATION(7) uniform mediump sampler2D _Liuguang_3;
UNITY_LOCATION(8) uniform mediump sampler2D _Liuguang_4;
UNITY_LOCATION(9) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
mediump vec2 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
mediump float u_xlat16_16;
vec2 u_xlat22;
float u_xlat23;
vec2 u_xlat24;
mediump float u_xlat16_24;
vec2 u_xlat27;
mediump vec2 u_xlat16_32;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat22.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat23 = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = sin(u_xlat23);
    u_xlat3.x = cos(u_xlat23);
    u_xlat1.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat1.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat2.xy;
    u_xlat1.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat1.xy;
    u_xlat16_1.x = texture(_RNoise_GMask_BNoise, u_xlat1.xy).z;
    u_xlat16_12.xy = texture(_AniMask, u_xlat22.xy).xz;
    u_xlat1.xw = u_xlat16_1.xx * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat2.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat2.y = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat2.xz = u_xlat2.xx * _AniLength_Intensity_Speed.xy;
    u_xlat13.xz = u_xlat2.yy * _AniLength2_Intensity_Speed.xy;
    u_xlat2.xy = u_xlat16_12.xx * u_xlat2.xz + u_xlat13.xz;
    u_xlat24.xy = u_xlat16_12.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat22.xy = u_xlat1.xw * u_xlat16_12.yy + u_xlat22.xy;
    u_xlat22.xy = u_xlat2.xy + u_xlat22.xy;
    u_xlat22.xy = (-u_xlat24.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat22.xy).xyz;
    u_xlat16_34 = texture(_BGTex, u_xlat22.xy).w;
    u_xlat2.x = (-u_xlat16_34) + 1.0;
    u_xlat13.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat16_13.xyz = texture(_BGTex, u_xlat13.xy).xyz;
    u_xlat13.xyz = u_xlat16_13.xyz * _BG_Color.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_34) + u_xlat13.xyz;
    u_xlat13.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat35 = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat35);
    u_xlat4.x = cos(u_xlat35);
    u_xlat13.xy = u_xlat13.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat13.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat13.xy, u_xlat5.xy);
    u_xlat13.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat35 = _Time.y * 0.300000012;
    u_xlat3.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat13.xy = vec2(u_xlat35) * u_xlat3.xy + u_xlat13.xy;
    u_xlat3.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat13.xy = u_xlat13.xy / u_xlat3.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy * u_xlat13.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_Saoguang, u_xlat13.xy);
    u_xlat16_13.x = texture(_AniMask, u_xlat22.xy).y;
    u_xlat3 = u_xlat16_3.wwww * u_xlat16_3;
    u_xlat4.xyz = u_xlat3.xyz;
    u_xlat4.w = _Saoguang_Color.w;
    u_xlat4 = u_xlat4 * _Saoguang_Color;
    u_xlat3.x = _Saoguang_Color.w;
    u_xlat3 = u_xlat3.xxxw * u_xlat4;
    u_xlat3 = u_xlat3 * vec4(_Saoguang_Intensity);
    u_xlat24.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = sin(u_xlat24.x);
    u_xlat5.x = cos(u_xlat24.x);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat0.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat24.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Noise_TilingOffset.xy * u_xlat24.xy + _Noise_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat24.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat0.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat0.xy, u_xlat6.xy);
        u_xlat0.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat0.xy = _Mask_TilingOffset.xy * u_xlat0.xy + _Mask_TilingOffset.zw;
        u_xlat0.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat0.xy;
        u_xlat16_0.x = texture(_RNoise_GMask_BNoise, u_xlat0.xy).y;
        u_xlat0.x = u_xlat16_0.x * _Mask_Power_U;
    } else {
        u_xlat0.x = 1.0;
    }
    u_xlat0.xy = u_xlat0.xx + u_xlat24.xy;
    u_xlat16_0.x = texture(_RNoise_GMask_BNoise, u_xlat0.xy).x;
    u_xlat11 = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat0.x = u_xlat16_0.x + (-_Noise_Jianbian1);
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat0.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat11 = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat11);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat24.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat11));
    u_xlat11 = dot(u_xlat24.xy, u_xlat7.xy);
    u_xlat11 = u_xlat11 + 0.5;
    u_xlat11 = (-u_xlat11) + 1.0;
    u_xlat24.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat11 = u_xlat11 * u_xlat24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat5 = vec4(u_xlat11) * u_xlat5;
    u_xlat5 = u_xlat0.xxxx * u_xlat5;
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat6 = u_xlat2.xxxx * u_xlat5;
    u_xlat16_4 = (u_xlatb4.y) ? u_xlat6 : u_xlat5;
    u_xlat0.x = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat24.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat0.x);
    u_xlat5.y = u_xlat2.x;
    u_xlat5.z = u_xlat0.x;
    u_xlat0.x = dot(u_xlat24.xy, u_xlat5.yz);
    u_xlat0.y = dot(u_xlat24.xy, u_xlat5.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Liuguang2_R_TilingOffset.xy * u_xlat0.xy + _Liuguang2_R_TilingOffset.zw;
    u_xlat0.xy = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat0.xy;
    u_xlat2.x = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat6.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat16_7.xyz = texture(_Liuguang_Mask, u_xlat22.xy).xyz;
    u_xlat6 = u_xlat6 * u_xlat16_7.xxxx;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat0.xy).x;
    u_xlat0 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_2 = texture(_Liuguang_2, u_xlat5.xy).y;
    u_xlat5.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat6.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat6.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_R_TilingOffset.xy * u_xlat5.xy + _Liuguang3_R_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat5.xy;
    u_xlat27.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat6.x = sin(u_xlat27.x);
    u_xlat7.x = cos(u_xlat27.x);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat27.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat27.xy = _Liuguang3_G_TilingOffset.xy * u_xlat27.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat27.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat27.xy;
    u_xlat6.x = _Liuguang3_Intensity;
    u_xlat6.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat6.xxxw * _Liuguang3_Color;
    u_xlat6 = u_xlat6.wwwx * u_xlat8;
    u_xlat6 = u_xlat16_7.yyyy * u_xlat6;
    u_xlat16_5 = texture(_Liuguang_3, u_xlat5.xy).x;
    u_xlat5.xy = vec2(u_xlat16_5) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat27.xy;
    u_xlat16_5 = texture(_Liuguang_3, u_xlat5.xy).y;
    u_xlat16.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat7.x = sin(u_xlat16.x);
    u_xlat8.x = cos(u_xlat16.x);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat16.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Liuguang4_R_TilingOffset.xy * u_xlat16.xy + _Liuguang4_R_TilingOffset.zw;
    u_xlat16.xy = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat16.xy;
    u_xlat38 = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat7.x = sin(u_xlat38);
    u_xlat8.x = cos(u_xlat38);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat24.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Liuguang4_G_TilingOffset.xy * u_xlat24.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat24.xy;
    u_xlat7.x = _Liuguang4_Intensity;
    u_xlat7.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang4_Color;
    u_xlat8 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat16_7.zzzz * u_xlat8;
    u_xlat16_16 = texture(_Liuguang_4, u_xlat16.xy).x;
    u_xlat7 = vec4(u_xlat16_16) * u_xlat7;
    u_xlat16_24 = texture(_Liuguang_4, u_xlat24.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat3 * u_xlat16_13.xxxx + u_xlat1;
    u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
    u_xlat16_0 = u_xlat0 * vec4(u_xlat16_2) + u_xlat16_1;
    u_xlat16_0 = u_xlat6 * vec4(u_xlat16_5) + u_xlat16_0;
    u_xlat16_0 = u_xlat7 * vec4(u_xlat16_24) + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelRect.zw;
    u_xlat16_10.xy = u_xlat16_10.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat3.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat3.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat16_13.x = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat16_13.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_UIPARALLAX_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _RNoise_GMask_BNoise;
uniform lowp sampler2D _AniMask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BGTex;
uniform lowp sampler2D _Saoguang;
uniform lowp sampler2D _Liuguang_Mask;
uniform lowp sampler2D _Liuguang_2;
uniform lowp sampler2D _Liuguang_3;
uniform lowp sampler2D _Liuguang_4;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp float u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
lowp float u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
lowp vec2 u_xlat10_12;
vec3 u_xlat13;
lowp vec3 u_xlat10_13;
vec2 u_xlat16;
lowp float u_xlat10_16;
vec2 u_xlat22;
float u_xlat23;
vec2 u_xlat24;
lowp float u_xlat10_24;
vec2 u_xlat27;
mediump vec2 u_xlat16_32;
lowp float u_xlat10_34;
float u_xlat35;
float u_xlat38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat22.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat23 = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = sin(u_xlat23);
    u_xlat3.x = cos(u_xlat23);
    u_xlat1.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat1.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat2.xy;
    u_xlat1.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat1.xy;
    u_xlat10_1.x = texture2D(_RNoise_GMask_BNoise, u_xlat1.xy).z;
    u_xlat10_12.xy = texture2D(_AniMask, u_xlat22.xy).xz;
    u_xlat1.xw = u_xlat10_1.xx * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat2.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat2.y = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat2.xz = u_xlat2.xx * _AniLength_Intensity_Speed.xy;
    u_xlat13.xz = u_xlat2.yy * _AniLength2_Intensity_Speed.xy;
    u_xlat2.xy = u_xlat10_12.xx * u_xlat2.xz + u_xlat13.xz;
    u_xlat24.xy = u_xlat10_12.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat22.xy = u_xlat1.xw * u_xlat10_12.yy + u_xlat22.xy;
    u_xlat22.xy = u_xlat2.xy + u_xlat22.xy;
    u_xlat22.xy = (-u_xlat24.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
    u_xlat10_34 = texture2D(_BGTex, u_xlat22.xy).w;
    u_xlat2.x = (-u_xlat10_34) + 1.0;
    u_xlat13.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat10_13.xyz = texture2D(_BGTex, u_xlat13.xy).xyz;
    u_xlat13.xyz = u_xlat10_13.xyz * _BG_Color.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat10_34) + u_xlat13.xyz;
    u_xlat13.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat35 = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat35);
    u_xlat4.x = cos(u_xlat35);
    u_xlat13.xy = u_xlat13.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat13.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat13.xy, u_xlat5.xy);
    u_xlat13.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat35 = _Time.y * 0.300000012;
    u_xlat3.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat13.xy = vec2(u_xlat35) * u_xlat3.xy + u_xlat13.xy;
    u_xlat3.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat13.xy = u_xlat13.xy / u_xlat3.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy * u_xlat13.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat10_3 = texture2D(_Saoguang, u_xlat13.xy);
    u_xlat10_13.x = texture2D(_AniMask, u_xlat22.xy).y;
    u_xlat3 = u_xlat10_3.wwww * u_xlat10_3;
    u_xlat4.xyz = u_xlat3.xyz;
    u_xlat4.w = _Saoguang_Color.w;
    u_xlat4 = u_xlat4 * _Saoguang_Color;
    u_xlat3.x = _Saoguang_Color.w;
    u_xlat3 = u_xlat3.xxxw * u_xlat4;
    u_xlat3 = u_xlat3 * vec4(_Saoguang_Intensity);
    u_xlat24.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = sin(u_xlat24.x);
    u_xlat5.x = cos(u_xlat24.x);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat0.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat24.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Noise_TilingOffset.xy * u_xlat24.xy + _Noise_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat24.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat0.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat0.xy, u_xlat6.xy);
        u_xlat0.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat0.xy = _Mask_TilingOffset.xy * u_xlat0.xy + _Mask_TilingOffset.zw;
        u_xlat0.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat0.xy;
        u_xlat10_0 = texture2D(_RNoise_GMask_BNoise, u_xlat0.xy).y;
        u_xlat0.x = u_xlat10_0 * _Mask_Power_U;
    } else {
        u_xlat0.x = 1.0;
    }
    u_xlat0.xy = u_xlat0.xx + u_xlat24.xy;
    u_xlat10_0 = texture2D(_RNoise_GMask_BNoise, u_xlat0.xy).x;
    u_xlat11 = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat0.x = u_xlat10_0 + (-_Noise_Jianbian1);
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat0.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat11 = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat11);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat24.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat11));
    u_xlat11 = dot(u_xlat24.xy, u_xlat7.xy);
    u_xlat11 = u_xlat11 + 0.5;
    u_xlat11 = (-u_xlat11) + 1.0;
    u_xlat24.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat24.x = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat5 = vec4(u_xlat11) * u_xlat5;
    u_xlat5 = u_xlat0.xxxx * u_xlat5;
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat6 = u_xlat2.xxxx * u_xlat5;
    u_xlat16_4 = (u_xlatb4.y) ? u_xlat6 : u_xlat5;
    u_xlat0.x = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat24.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat0.x);
    u_xlat5.y = u_xlat2.x;
    u_xlat5.z = u_xlat0.x;
    u_xlat0.x = dot(u_xlat24.xy, u_xlat5.yz);
    u_xlat0.y = dot(u_xlat24.xy, u_xlat5.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Liuguang2_R_TilingOffset.xy * u_xlat0.xy + _Liuguang2_R_TilingOffset.zw;
    u_xlat0.xy = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat0.xy;
    u_xlat2.x = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat6.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat10_7.xyz = texture2D(_Liuguang_Mask, u_xlat22.xy).xyz;
    u_xlat6 = u_xlat6 * u_xlat10_7.xxxx;
    u_xlat10_0 = texture2D(_Liuguang_2, u_xlat0.xy).x;
    u_xlat0 = vec4(u_xlat10_0) * u_xlat6;
    u_xlat10_2 = texture2D(_Liuguang_2, u_xlat5.xy).y;
    u_xlat5.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat6.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat6.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_R_TilingOffset.xy * u_xlat5.xy + _Liuguang3_R_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat5.xy;
    u_xlat27.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat6.x = sin(u_xlat27.x);
    u_xlat7.x = cos(u_xlat27.x);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat27.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat27.xy = _Liuguang3_G_TilingOffset.xy * u_xlat27.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat27.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat27.xy;
    u_xlat6.x = _Liuguang3_Intensity;
    u_xlat6.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat6.xxxw * _Liuguang3_Color;
    u_xlat6 = u_xlat6.wwwx * u_xlat8;
    u_xlat6 = u_xlat10_7.yyyy * u_xlat6;
    u_xlat10_5 = texture2D(_Liuguang_3, u_xlat5.xy).x;
    u_xlat5.xy = vec2(u_xlat10_5) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat27.xy;
    u_xlat10_5 = texture2D(_Liuguang_3, u_xlat5.xy).y;
    u_xlat16.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat7.x = sin(u_xlat16.x);
    u_xlat8.x = cos(u_xlat16.x);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat16.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Liuguang4_R_TilingOffset.xy * u_xlat16.xy + _Liuguang4_R_TilingOffset.zw;
    u_xlat16.xy = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat16.xy;
    u_xlat38 = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat7.x = sin(u_xlat38);
    u_xlat8.x = cos(u_xlat38);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat24.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Liuguang4_G_TilingOffset.xy * u_xlat24.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat24.xy;
    u_xlat7.x = _Liuguang4_Intensity;
    u_xlat7.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang4_Color;
    u_xlat8 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat10_7.zzzz * u_xlat8;
    u_xlat10_16 = texture2D(_Liuguang_4, u_xlat16.xy).x;
    u_xlat7 = vec4(u_xlat10_16) * u_xlat7;
    u_xlat10_24 = texture2D(_Liuguang_4, u_xlat24.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat3 * u_xlat10_13.xxxx + u_xlat1;
    u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
    u_xlat16_0 = u_xlat0 * vec4(u_xlat10_2) + u_xlat16_1;
    u_xlat16_0 = u_xlat6 * vec4(u_xlat10_5) + u_xlat16_0;
    u_xlat16_0 = u_xlat7 * vec4(u_xlat10_24) + u_xlat16_0;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelRect.zw;
    u_xlat16_10.xy = u_xlat16_10.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat3.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat3.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat10_13.x = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat10_13.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_UIPARALLAX_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    vs_TEXCOORD1.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _RNoise_GMask_BNoise;
uniform lowp sampler2D _AniMask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BGTex;
uniform lowp sampler2D _Saoguang;
uniform lowp sampler2D _Liuguang_Mask;
uniform lowp sampler2D _Liuguang_2;
uniform lowp sampler2D _Liuguang_3;
uniform lowp sampler2D _Liuguang_4;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp float u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
lowp float u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
lowp vec2 u_xlat10_12;
vec3 u_xlat13;
lowp vec3 u_xlat10_13;
vec2 u_xlat16;
lowp float u_xlat10_16;
vec2 u_xlat22;
float u_xlat23;
vec2 u_xlat24;
lowp float u_xlat10_24;
vec2 u_xlat27;
mediump vec2 u_xlat16_32;
lowp float u_xlat10_34;
float u_xlat35;
float u_xlat38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat22.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat23 = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = sin(u_xlat23);
    u_xlat3.x = cos(u_xlat23);
    u_xlat1.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat1.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat2.xy;
    u_xlat1.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat1.xy;
    u_xlat10_1.x = texture2D(_RNoise_GMask_BNoise, u_xlat1.xy).z;
    u_xlat10_12.xy = texture2D(_AniMask, u_xlat22.xy).xz;
    u_xlat1.xw = u_xlat10_1.xx * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat2.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat2.y = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat2.xz = u_xlat2.xx * _AniLength_Intensity_Speed.xy;
    u_xlat13.xz = u_xlat2.yy * _AniLength2_Intensity_Speed.xy;
    u_xlat2.xy = u_xlat10_12.xx * u_xlat2.xz + u_xlat13.xz;
    u_xlat24.xy = u_xlat10_12.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat22.xy = u_xlat1.xw * u_xlat10_12.yy + u_xlat22.xy;
    u_xlat22.xy = u_xlat2.xy + u_xlat22.xy;
    u_xlat22.xy = (-u_xlat24.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
    u_xlat10_34 = texture2D(_BGTex, u_xlat22.xy).w;
    u_xlat2.x = (-u_xlat10_34) + 1.0;
    u_xlat13.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat10_13.xyz = texture2D(_BGTex, u_xlat13.xy).xyz;
    u_xlat13.xyz = u_xlat10_13.xyz * _BG_Color.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat10_34) + u_xlat13.xyz;
    u_xlat13.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat35 = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat35);
    u_xlat4.x = cos(u_xlat35);
    u_xlat13.xy = u_xlat13.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat13.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat13.xy, u_xlat5.xy);
    u_xlat13.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat35 = _Time.y * 0.300000012;
    u_xlat3.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat13.xy = vec2(u_xlat35) * u_xlat3.xy + u_xlat13.xy;
    u_xlat3.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat13.xy = u_xlat13.xy / u_xlat3.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy * u_xlat13.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat10_3 = texture2D(_Saoguang, u_xlat13.xy);
    u_xlat10_13.x = texture2D(_AniMask, u_xlat22.xy).y;
    u_xlat3 = u_xlat10_3.wwww * u_xlat10_3;
    u_xlat4.xyz = u_xlat3.xyz;
    u_xlat4.w = _Saoguang_Color.w;
    u_xlat4 = u_xlat4 * _Saoguang_Color;
    u_xlat3.x = _Saoguang_Color.w;
    u_xlat3 = u_xlat3.xxxw * u_xlat4;
    u_xlat3 = u_xlat3 * vec4(_Saoguang_Intensity);
    u_xlat24.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = sin(u_xlat24.x);
    u_xlat5.x = cos(u_xlat24.x);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat0.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat24.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Noise_TilingOffset.xy * u_xlat24.xy + _Noise_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat24.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat0.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat0.xy, u_xlat6.xy);
        u_xlat0.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat0.xy = _Mask_TilingOffset.xy * u_xlat0.xy + _Mask_TilingOffset.zw;
        u_xlat0.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat0.xy;
        u_xlat10_0 = texture2D(_RNoise_GMask_BNoise, u_xlat0.xy).y;
        u_xlat0.x = u_xlat10_0 * _Mask_Power_U;
    } else {
        u_xlat0.x = 1.0;
    }
    u_xlat0.xy = u_xlat0.xx + u_xlat24.xy;
    u_xlat10_0 = texture2D(_RNoise_GMask_BNoise, u_xlat0.xy).x;
    u_xlat11 = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat0.x = u_xlat10_0 + (-_Noise_Jianbian1);
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat0.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat11 = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat11);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat24.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat11));
    u_xlat11 = dot(u_xlat24.xy, u_xlat7.xy);
    u_xlat11 = u_xlat11 + 0.5;
    u_xlat11 = (-u_xlat11) + 1.0;
    u_xlat24.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat24.x = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat5 = vec4(u_xlat11) * u_xlat5;
    u_xlat5 = u_xlat0.xxxx * u_xlat5;
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat6 = u_xlat2.xxxx * u_xlat5;
    u_xlat16_4 = (u_xlatb4.y) ? u_xlat6 : u_xlat5;
    u_xlat0.x = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat24.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat0.x);
    u_xlat5.y = u_xlat2.x;
    u_xlat5.z = u_xlat0.x;
    u_xlat0.x = dot(u_xlat24.xy, u_xlat5.yz);
    u_xlat0.y = dot(u_xlat24.xy, u_xlat5.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Liuguang2_R_TilingOffset.xy * u_xlat0.xy + _Liuguang2_R_TilingOffset.zw;
    u_xlat0.xy = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat0.xy;
    u_xlat2.x = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat6.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat10_7.xyz = texture2D(_Liuguang_Mask, u_xlat22.xy).xyz;
    u_xlat6 = u_xlat6 * u_xlat10_7.xxxx;
    u_xlat10_0 = texture2D(_Liuguang_2, u_xlat0.xy).x;
    u_xlat0 = vec4(u_xlat10_0) * u_xlat6;
    u_xlat10_2 = texture2D(_Liuguang_2, u_xlat5.xy).y;
    u_xlat5.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat6.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat6.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_R_TilingOffset.xy * u_xlat5.xy + _Liuguang3_R_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat5.xy;
    u_xlat27.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat6.x = sin(u_xlat27.x);
    u_xlat7.x = cos(u_xlat27.x);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat27.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat27.xy = _Liuguang3_G_TilingOffset.xy * u_xlat27.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat27.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat27.xy;
    u_xlat6.x = _Liuguang3_Intensity;
    u_xlat6.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat6.xxxw * _Liuguang3_Color;
    u_xlat6 = u_xlat6.wwwx * u_xlat8;
    u_xlat6 = u_xlat10_7.yyyy * u_xlat6;
    u_xlat10_5 = texture2D(_Liuguang_3, u_xlat5.xy).x;
    u_xlat5.xy = vec2(u_xlat10_5) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat27.xy;
    u_xlat10_5 = texture2D(_Liuguang_3, u_xlat5.xy).y;
    u_xlat16.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat7.x = sin(u_xlat16.x);
    u_xlat8.x = cos(u_xlat16.x);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat16.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Liuguang4_R_TilingOffset.xy * u_xlat16.xy + _Liuguang4_R_TilingOffset.zw;
    u_xlat16.xy = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat16.xy;
    u_xlat38 = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat7.x = sin(u_xlat38);
    u_xlat8.x = cos(u_xlat38);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat24.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Liuguang4_G_TilingOffset.xy * u_xlat24.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat24.xy;
    u_xlat7.x = _Liuguang4_Intensity;
    u_xlat7.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang4_Color;
    u_xlat8 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat10_7.zzzz * u_xlat8;
    u_xlat10_16 = texture2D(_Liuguang_4, u_xlat16.xy).x;
    u_xlat7 = vec4(u_xlat10_16) * u_xlat7;
    u_xlat10_24 = texture2D(_Liuguang_4, u_xlat24.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat3 * u_xlat10_13.xxxx + u_xlat1;
    u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
    u_xlat16_0 = u_xlat0 * vec4(u_xlat10_2) + u_xlat16_1;
    u_xlat16_0 = u_xlat6 * vec4(u_xlat10_5) + u_xlat16_0;
    u_xlat16_0 = u_xlat7 * vec4(u_xlat10_24) + u_xlat16_0;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelRect.zw;
    u_xlat16_10.xy = u_xlat16_10.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat3.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat3.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat10_13.x = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat10_13.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" "_UIPARALLAX_OFF" }
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
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RNoise_GMask_BNoise;
UNITY_LOCATION(1) uniform mediump sampler2D _AniMask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Saoguang;
UNITY_LOCATION(5) uniform mediump sampler2D _Liuguang_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Liuguang_2;
UNITY_LOCATION(7) uniform mediump sampler2D _Liuguang_3;
UNITY_LOCATION(8) uniform mediump sampler2D _Liuguang_4;
UNITY_LOCATION(9) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
mediump vec2 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
mediump float u_xlat16_16;
vec2 u_xlat22;
float u_xlat23;
vec2 u_xlat24;
mediump float u_xlat16_24;
vec2 u_xlat27;
mediump vec2 u_xlat16_32;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat22.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat23 = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = sin(u_xlat23);
    u_xlat3.x = cos(u_xlat23);
    u_xlat1.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat1.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat2.xy;
    u_xlat1.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat1.xy;
    u_xlat16_1.x = texture(_RNoise_GMask_BNoise, u_xlat1.xy).z;
    u_xlat16_12.xy = texture(_AniMask, u_xlat22.xy).xz;
    u_xlat1.xw = u_xlat16_1.xx * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat2.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat2.y = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat2.xz = u_xlat2.xx * _AniLength_Intensity_Speed.xy;
    u_xlat13.xz = u_xlat2.yy * _AniLength2_Intensity_Speed.xy;
    u_xlat2.xy = u_xlat16_12.xx * u_xlat2.xz + u_xlat13.xz;
    u_xlat24.xy = u_xlat16_12.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat22.xy = u_xlat1.xw * u_xlat16_12.yy + u_xlat22.xy;
    u_xlat22.xy = u_xlat2.xy + u_xlat22.xy;
    u_xlat22.xy = (-u_xlat24.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat22.xy).xyz;
    u_xlat16_34 = texture(_BGTex, u_xlat22.xy).w;
    u_xlat2.x = (-u_xlat16_34) + 1.0;
    u_xlat13.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat16_13.xyz = texture(_BGTex, u_xlat13.xy).xyz;
    u_xlat13.xyz = u_xlat16_13.xyz * _BG_Color.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_34) + u_xlat13.xyz;
    u_xlat13.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat35 = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat35);
    u_xlat4.x = cos(u_xlat35);
    u_xlat13.xy = u_xlat13.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat13.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat13.xy, u_xlat5.xy);
    u_xlat13.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat35 = _Time.y * 0.300000012;
    u_xlat3.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat13.xy = vec2(u_xlat35) * u_xlat3.xy + u_xlat13.xy;
    u_xlat3.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat13.xy = u_xlat13.xy / u_xlat3.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy * u_xlat13.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_Saoguang, u_xlat13.xy);
    u_xlat16_13.x = texture(_AniMask, u_xlat22.xy).y;
    u_xlat3 = u_xlat16_3.wwww * u_xlat16_3;
    u_xlat4.xyz = u_xlat3.xyz;
    u_xlat4.w = _Saoguang_Color.w;
    u_xlat4 = u_xlat4 * _Saoguang_Color;
    u_xlat3.x = _Saoguang_Color.w;
    u_xlat3 = u_xlat3.xxxw * u_xlat4;
    u_xlat3 = u_xlat3 * vec4(_Saoguang_Intensity);
    u_xlat24.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = sin(u_xlat24.x);
    u_xlat5.x = cos(u_xlat24.x);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat0.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat24.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Noise_TilingOffset.xy * u_xlat24.xy + _Noise_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat24.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat0.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat0.xy, u_xlat6.xy);
        u_xlat0.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat0.xy = _Mask_TilingOffset.xy * u_xlat0.xy + _Mask_TilingOffset.zw;
        u_xlat0.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat0.xy;
        u_xlat16_0.x = texture(_RNoise_GMask_BNoise, u_xlat0.xy).y;
        u_xlat0.x = u_xlat16_0.x * _Mask_Power_U;
    } else {
        u_xlat0.x = 1.0;
    }
    u_xlat0.xy = u_xlat0.xx + u_xlat24.xy;
    u_xlat16_0.x = texture(_RNoise_GMask_BNoise, u_xlat0.xy).x;
    u_xlat11 = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat0.x = u_xlat16_0.x + (-_Noise_Jianbian1);
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat0.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat11 = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat11);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat24.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat11));
    u_xlat11 = dot(u_xlat24.xy, u_xlat7.xy);
    u_xlat11 = u_xlat11 + 0.5;
    u_xlat11 = (-u_xlat11) + 1.0;
    u_xlat24.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat11 = u_xlat11 * u_xlat24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat5 = vec4(u_xlat11) * u_xlat5;
    u_xlat5 = u_xlat0.xxxx * u_xlat5;
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat6 = u_xlat2.xxxx * u_xlat5;
    u_xlat16_4 = (u_xlatb4.y) ? u_xlat6 : u_xlat5;
    u_xlat0.x = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat24.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat0.x);
    u_xlat5.y = u_xlat2.x;
    u_xlat5.z = u_xlat0.x;
    u_xlat0.x = dot(u_xlat24.xy, u_xlat5.yz);
    u_xlat0.y = dot(u_xlat24.xy, u_xlat5.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Liuguang2_R_TilingOffset.xy * u_xlat0.xy + _Liuguang2_R_TilingOffset.zw;
    u_xlat0.xy = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat0.xy;
    u_xlat2.x = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat6.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat16_7.xyz = texture(_Liuguang_Mask, u_xlat22.xy).xyz;
    u_xlat6 = u_xlat6 * u_xlat16_7.xxxx;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat0.xy).x;
    u_xlat0 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_2 = texture(_Liuguang_2, u_xlat5.xy).y;
    u_xlat5.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat6.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat6.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_R_TilingOffset.xy * u_xlat5.xy + _Liuguang3_R_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat5.xy;
    u_xlat27.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat6.x = sin(u_xlat27.x);
    u_xlat7.x = cos(u_xlat27.x);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat27.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat27.xy = _Liuguang3_G_TilingOffset.xy * u_xlat27.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat27.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat27.xy;
    u_xlat6.x = _Liuguang3_Intensity;
    u_xlat6.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat6.xxxw * _Liuguang3_Color;
    u_xlat6 = u_xlat6.wwwx * u_xlat8;
    u_xlat6 = u_xlat16_7.yyyy * u_xlat6;
    u_xlat16_5 = texture(_Liuguang_3, u_xlat5.xy).x;
    u_xlat5.xy = vec2(u_xlat16_5) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat27.xy;
    u_xlat16_5 = texture(_Liuguang_3, u_xlat5.xy).y;
    u_xlat16.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat7.x = sin(u_xlat16.x);
    u_xlat8.x = cos(u_xlat16.x);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat16.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Liuguang4_R_TilingOffset.xy * u_xlat16.xy + _Liuguang4_R_TilingOffset.zw;
    u_xlat16.xy = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat16.xy;
    u_xlat38 = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat7.x = sin(u_xlat38);
    u_xlat8.x = cos(u_xlat38);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat24.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Liuguang4_G_TilingOffset.xy * u_xlat24.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat24.xy;
    u_xlat7.x = _Liuguang4_Intensity;
    u_xlat7.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang4_Color;
    u_xlat8 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat16_7.zzzz * u_xlat8;
    u_xlat16_16 = texture(_Liuguang_4, u_xlat16.xy).x;
    u_xlat7 = vec4(u_xlat16_16) * u_xlat7;
    u_xlat16_24 = texture(_Liuguang_4, u_xlat24.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat3 * u_xlat16_13.xxxx + u_xlat1;
    u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
    u_xlat16_0 = u_xlat0 * vec4(u_xlat16_2) + u_xlat16_1;
    u_xlat16_0 = u_xlat6 * vec4(u_xlat16_5) + u_xlat16_0;
    u_xlat16_0 = u_xlat7 * vec4(u_xlat16_24) + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat3.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat3.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat16_13.x = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat16_13.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" "_UIPARALLAX_OFF" }
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
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _RNoise_GMask_BNoise;
UNITY_LOCATION(1) uniform mediump sampler2D _AniMask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _BGTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Saoguang;
UNITY_LOCATION(5) uniform mediump sampler2D _Liuguang_Mask;
UNITY_LOCATION(6) uniform mediump sampler2D _Liuguang_2;
UNITY_LOCATION(7) uniform mediump sampler2D _Liuguang_3;
UNITY_LOCATION(8) uniform mediump sampler2D _Liuguang_4;
UNITY_LOCATION(9) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
mediump vec2 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
mediump float u_xlat16_16;
vec2 u_xlat22;
float u_xlat23;
vec2 u_xlat24;
mediump float u_xlat16_24;
vec2 u_xlat27;
mediump vec2 u_xlat16_32;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat22.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat23 = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = sin(u_xlat23);
    u_xlat3.x = cos(u_xlat23);
    u_xlat1.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat1.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat2.xy;
    u_xlat1.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat1.xy;
    u_xlat16_1.x = texture(_RNoise_GMask_BNoise, u_xlat1.xy).z;
    u_xlat16_12.xy = texture(_AniMask, u_xlat22.xy).xz;
    u_xlat1.xw = u_xlat16_1.xx * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat2.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat2.y = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat2.xz = u_xlat2.xx * _AniLength_Intensity_Speed.xy;
    u_xlat13.xz = u_xlat2.yy * _AniLength2_Intensity_Speed.xy;
    u_xlat2.xy = u_xlat16_12.xx * u_xlat2.xz + u_xlat13.xz;
    u_xlat24.xy = u_xlat16_12.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat22.xy = u_xlat1.xw * u_xlat16_12.yy + u_xlat22.xy;
    u_xlat22.xy = u_xlat2.xy + u_xlat22.xy;
    u_xlat22.xy = (-u_xlat24.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat22.xy).xyz;
    u_xlat16_34 = texture(_BGTex, u_xlat22.xy).w;
    u_xlat2.x = (-u_xlat16_34) + 1.0;
    u_xlat13.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat16_13.xyz = texture(_BGTex, u_xlat13.xy).xyz;
    u_xlat13.xyz = u_xlat16_13.xyz * _BG_Color.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat16_34) + u_xlat13.xyz;
    u_xlat13.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat35 = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat35);
    u_xlat4.x = cos(u_xlat35);
    u_xlat13.xy = u_xlat13.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat13.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat13.xy, u_xlat5.xy);
    u_xlat13.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat35 = _Time.y * 0.300000012;
    u_xlat3.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat13.xy = vec2(u_xlat35) * u_xlat3.xy + u_xlat13.xy;
    u_xlat3.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat13.xy = u_xlat13.xy / u_xlat3.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy * u_xlat13.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_Saoguang, u_xlat13.xy);
    u_xlat16_13.x = texture(_AniMask, u_xlat22.xy).y;
    u_xlat3 = u_xlat16_3.wwww * u_xlat16_3;
    u_xlat4.xyz = u_xlat3.xyz;
    u_xlat4.w = _Saoguang_Color.w;
    u_xlat4 = u_xlat4 * _Saoguang_Color;
    u_xlat3.x = _Saoguang_Color.w;
    u_xlat3 = u_xlat3.xxxw * u_xlat4;
    u_xlat3 = u_xlat3 * vec4(_Saoguang_Intensity);
    u_xlat24.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = sin(u_xlat24.x);
    u_xlat5.x = cos(u_xlat24.x);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat0.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat24.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Noise_TilingOffset.xy * u_xlat24.xy + _Noise_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat24.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat0.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat0.xy, u_xlat6.xy);
        u_xlat0.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat0.xy = _Mask_TilingOffset.xy * u_xlat0.xy + _Mask_TilingOffset.zw;
        u_xlat0.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat0.xy;
        u_xlat16_0.x = texture(_RNoise_GMask_BNoise, u_xlat0.xy).y;
        u_xlat0.x = u_xlat16_0.x * _Mask_Power_U;
    } else {
        u_xlat0.x = 1.0;
    }
    u_xlat0.xy = u_xlat0.xx + u_xlat24.xy;
    u_xlat16_0.x = texture(_RNoise_GMask_BNoise, u_xlat0.xy).x;
    u_xlat11 = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat0.x = u_xlat16_0.x + (-_Noise_Jianbian1);
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat0.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat11 = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat11);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat24.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat11));
    u_xlat11 = dot(u_xlat24.xy, u_xlat7.xy);
    u_xlat11 = u_xlat11 + 0.5;
    u_xlat11 = (-u_xlat11) + 1.0;
    u_xlat24.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat11 = u_xlat11 * u_xlat24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat5 = vec4(u_xlat11) * u_xlat5;
    u_xlat5 = u_xlat0.xxxx * u_xlat5;
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat6 = u_xlat2.xxxx * u_xlat5;
    u_xlat16_4 = (u_xlatb4.y) ? u_xlat6 : u_xlat5;
    u_xlat0.x = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat24.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat0.x);
    u_xlat5.y = u_xlat2.x;
    u_xlat5.z = u_xlat0.x;
    u_xlat0.x = dot(u_xlat24.xy, u_xlat5.yz);
    u_xlat0.y = dot(u_xlat24.xy, u_xlat5.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Liuguang2_R_TilingOffset.xy * u_xlat0.xy + _Liuguang2_R_TilingOffset.zw;
    u_xlat0.xy = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat0.xy;
    u_xlat2.x = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat6.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat16_7.xyz = texture(_Liuguang_Mask, u_xlat22.xy).xyz;
    u_xlat6 = u_xlat6 * u_xlat16_7.xxxx;
    u_xlat16_0.x = texture(_Liuguang_2, u_xlat0.xy).x;
    u_xlat0 = u_xlat16_0.xxxx * u_xlat6;
    u_xlat16_2 = texture(_Liuguang_2, u_xlat5.xy).y;
    u_xlat5.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat6.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat6.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_R_TilingOffset.xy * u_xlat5.xy + _Liuguang3_R_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat5.xy;
    u_xlat27.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat6.x = sin(u_xlat27.x);
    u_xlat7.x = cos(u_xlat27.x);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat27.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat27.xy = _Liuguang3_G_TilingOffset.xy * u_xlat27.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat27.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat27.xy;
    u_xlat6.x = _Liuguang3_Intensity;
    u_xlat6.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat6.xxxw * _Liuguang3_Color;
    u_xlat6 = u_xlat6.wwwx * u_xlat8;
    u_xlat6 = u_xlat16_7.yyyy * u_xlat6;
    u_xlat16_5 = texture(_Liuguang_3, u_xlat5.xy).x;
    u_xlat5.xy = vec2(u_xlat16_5) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat27.xy;
    u_xlat16_5 = texture(_Liuguang_3, u_xlat5.xy).y;
    u_xlat16.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat7.x = sin(u_xlat16.x);
    u_xlat8.x = cos(u_xlat16.x);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat16.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Liuguang4_R_TilingOffset.xy * u_xlat16.xy + _Liuguang4_R_TilingOffset.zw;
    u_xlat16.xy = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat16.xy;
    u_xlat38 = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat7.x = sin(u_xlat38);
    u_xlat8.x = cos(u_xlat38);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat24.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Liuguang4_G_TilingOffset.xy * u_xlat24.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat24.xy;
    u_xlat7.x = _Liuguang4_Intensity;
    u_xlat7.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang4_Color;
    u_xlat8 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat16_7.zzzz * u_xlat8;
    u_xlat16_16 = texture(_Liuguang_4, u_xlat16.xy).x;
    u_xlat7 = vec4(u_xlat16_16) * u_xlat7;
    u_xlat16_24 = texture(_Liuguang_4, u_xlat24.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat3 * u_xlat16_13.xxxx + u_xlat1;
    u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
    u_xlat16_0 = u_xlat0 * vec4(u_xlat16_2) + u_xlat16_1;
    u_xlat16_0 = u_xlat6 * vec4(u_xlat16_5) + u_xlat16_0;
    u_xlat16_0 = u_xlat7 * vec4(u_xlat16_24) + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xy = min(max(u_xlat16_32.xy, 0.0), 1.0);
#else
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
#endif
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xy = min(max(u_xlat13.xy, 0.0), 1.0);
#else
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
#endif
    u_xlat3.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat3.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat16_13.x = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat16_13.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" "_UIPARALLAX_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _RNoise_GMask_BNoise;
uniform lowp sampler2D _AniMask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BGTex;
uniform lowp sampler2D _Saoguang;
uniform lowp sampler2D _Liuguang_Mask;
uniform lowp sampler2D _Liuguang_2;
uniform lowp sampler2D _Liuguang_3;
uniform lowp sampler2D _Liuguang_4;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp float u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
lowp float u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
lowp vec2 u_xlat10_12;
vec3 u_xlat13;
lowp vec3 u_xlat10_13;
vec2 u_xlat16;
lowp float u_xlat10_16;
vec2 u_xlat22;
float u_xlat23;
vec2 u_xlat24;
lowp float u_xlat10_24;
vec2 u_xlat27;
mediump vec2 u_xlat16_32;
lowp float u_xlat10_34;
float u_xlat35;
float u_xlat38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat22.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat23 = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = sin(u_xlat23);
    u_xlat3.x = cos(u_xlat23);
    u_xlat1.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat1.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat2.xy;
    u_xlat1.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat1.xy;
    u_xlat10_1.x = texture2D(_RNoise_GMask_BNoise, u_xlat1.xy).z;
    u_xlat10_12.xy = texture2D(_AniMask, u_xlat22.xy).xz;
    u_xlat1.xw = u_xlat10_1.xx * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat2.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat2.y = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat2.xz = u_xlat2.xx * _AniLength_Intensity_Speed.xy;
    u_xlat13.xz = u_xlat2.yy * _AniLength2_Intensity_Speed.xy;
    u_xlat2.xy = u_xlat10_12.xx * u_xlat2.xz + u_xlat13.xz;
    u_xlat24.xy = u_xlat10_12.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat22.xy = u_xlat1.xw * u_xlat10_12.yy + u_xlat22.xy;
    u_xlat22.xy = u_xlat2.xy + u_xlat22.xy;
    u_xlat22.xy = (-u_xlat24.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
    u_xlat10_34 = texture2D(_BGTex, u_xlat22.xy).w;
    u_xlat2.x = (-u_xlat10_34) + 1.0;
    u_xlat13.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat10_13.xyz = texture2D(_BGTex, u_xlat13.xy).xyz;
    u_xlat13.xyz = u_xlat10_13.xyz * _BG_Color.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat10_34) + u_xlat13.xyz;
    u_xlat13.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat35 = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat35);
    u_xlat4.x = cos(u_xlat35);
    u_xlat13.xy = u_xlat13.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat13.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat13.xy, u_xlat5.xy);
    u_xlat13.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat35 = _Time.y * 0.300000012;
    u_xlat3.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat13.xy = vec2(u_xlat35) * u_xlat3.xy + u_xlat13.xy;
    u_xlat3.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat13.xy = u_xlat13.xy / u_xlat3.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy * u_xlat13.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat10_3 = texture2D(_Saoguang, u_xlat13.xy);
    u_xlat10_13.x = texture2D(_AniMask, u_xlat22.xy).y;
    u_xlat3 = u_xlat10_3.wwww * u_xlat10_3;
    u_xlat4.xyz = u_xlat3.xyz;
    u_xlat4.w = _Saoguang_Color.w;
    u_xlat4 = u_xlat4 * _Saoguang_Color;
    u_xlat3.x = _Saoguang_Color.w;
    u_xlat3 = u_xlat3.xxxw * u_xlat4;
    u_xlat3 = u_xlat3 * vec4(_Saoguang_Intensity);
    u_xlat24.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = sin(u_xlat24.x);
    u_xlat5.x = cos(u_xlat24.x);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat0.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat24.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Noise_TilingOffset.xy * u_xlat24.xy + _Noise_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat24.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat0.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat0.xy, u_xlat6.xy);
        u_xlat0.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat0.xy = _Mask_TilingOffset.xy * u_xlat0.xy + _Mask_TilingOffset.zw;
        u_xlat0.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat0.xy;
        u_xlat10_0 = texture2D(_RNoise_GMask_BNoise, u_xlat0.xy).y;
        u_xlat0.x = u_xlat10_0 * _Mask_Power_U;
    } else {
        u_xlat0.x = 1.0;
    }
    u_xlat0.xy = u_xlat0.xx + u_xlat24.xy;
    u_xlat10_0 = texture2D(_RNoise_GMask_BNoise, u_xlat0.xy).x;
    u_xlat11 = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat0.x = u_xlat10_0 + (-_Noise_Jianbian1);
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat0.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat11 = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat11);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat24.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat11));
    u_xlat11 = dot(u_xlat24.xy, u_xlat7.xy);
    u_xlat11 = u_xlat11 + 0.5;
    u_xlat11 = (-u_xlat11) + 1.0;
    u_xlat24.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat24.x = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat5 = vec4(u_xlat11) * u_xlat5;
    u_xlat5 = u_xlat0.xxxx * u_xlat5;
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat6 = u_xlat2.xxxx * u_xlat5;
    u_xlat16_4 = (u_xlatb4.y) ? u_xlat6 : u_xlat5;
    u_xlat0.x = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat24.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat0.x);
    u_xlat5.y = u_xlat2.x;
    u_xlat5.z = u_xlat0.x;
    u_xlat0.x = dot(u_xlat24.xy, u_xlat5.yz);
    u_xlat0.y = dot(u_xlat24.xy, u_xlat5.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Liuguang2_R_TilingOffset.xy * u_xlat0.xy + _Liuguang2_R_TilingOffset.zw;
    u_xlat0.xy = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat0.xy;
    u_xlat2.x = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat6.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat10_7.xyz = texture2D(_Liuguang_Mask, u_xlat22.xy).xyz;
    u_xlat6 = u_xlat6 * u_xlat10_7.xxxx;
    u_xlat10_0 = texture2D(_Liuguang_2, u_xlat0.xy).x;
    u_xlat0 = vec4(u_xlat10_0) * u_xlat6;
    u_xlat10_2 = texture2D(_Liuguang_2, u_xlat5.xy).y;
    u_xlat5.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat6.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat6.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_R_TilingOffset.xy * u_xlat5.xy + _Liuguang3_R_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat5.xy;
    u_xlat27.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat6.x = sin(u_xlat27.x);
    u_xlat7.x = cos(u_xlat27.x);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat27.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat27.xy = _Liuguang3_G_TilingOffset.xy * u_xlat27.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat27.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat27.xy;
    u_xlat6.x = _Liuguang3_Intensity;
    u_xlat6.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat6.xxxw * _Liuguang3_Color;
    u_xlat6 = u_xlat6.wwwx * u_xlat8;
    u_xlat6 = u_xlat10_7.yyyy * u_xlat6;
    u_xlat10_5 = texture2D(_Liuguang_3, u_xlat5.xy).x;
    u_xlat5.xy = vec2(u_xlat10_5) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat27.xy;
    u_xlat10_5 = texture2D(_Liuguang_3, u_xlat5.xy).y;
    u_xlat16.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat7.x = sin(u_xlat16.x);
    u_xlat8.x = cos(u_xlat16.x);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat16.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Liuguang4_R_TilingOffset.xy * u_xlat16.xy + _Liuguang4_R_TilingOffset.zw;
    u_xlat16.xy = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat16.xy;
    u_xlat38 = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat7.x = sin(u_xlat38);
    u_xlat8.x = cos(u_xlat38);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat24.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Liuguang4_G_TilingOffset.xy * u_xlat24.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat24.xy;
    u_xlat7.x = _Liuguang4_Intensity;
    u_xlat7.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang4_Color;
    u_xlat8 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat10_7.zzzz * u_xlat8;
    u_xlat10_16 = texture2D(_Liuguang_4, u_xlat16.xy).x;
    u_xlat7 = vec4(u_xlat10_16) * u_xlat7;
    u_xlat10_24 = texture2D(_Liuguang_4, u_xlat24.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat3 * u_xlat10_13.xxxx + u_xlat1;
    u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
    u_xlat16_0 = u_xlat0 * vec4(u_xlat10_2) + u_xlat16_1;
    u_xlat16_0 = u_xlat6 * vec4(u_xlat10_5) + u_xlat16_0;
    u_xlat16_0 = u_xlat7 * vec4(u_xlat10_24) + u_xlat16_0;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat3.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat3.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat10_13.x = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat10_13.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" "_UIPARALLAX_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
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
uniform 	float _Main_Scale;
uniform 	float _Noise_Speed_U;
uniform 	float _Noise_Speed_V;
uniform 	vec4 _Noise_Tiling_Offest;
uniform 	float _Noise_Rotation;
uniform 	float _Noise_Rotation_Speed;
uniform 	float _Noise_Power_U;
uniform 	float _Noise_Power_V;
uniform 	vec4 _AniLength_Intensity_Speed;
uniform 	vec4 _AniLength2_Intensity_Speed;
uniform 	vec4 _BGTex_ST;
uniform 	vec4 _BG_Color;
uniform 	vec4 _Saoguang_RatatorCenter2;
uniform 	vec4 _Saoguang_Tiling_Offest;
uniform 	float _Saoguang_RatatorIntensity2;
uniform 	float _RotSpeed2;
uniform 	float _Saoguang_Jiange2;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Noise_Color1;
uniform 	vec4 _Noise_Color2;
uniform 	float _Noise_Jianbian1;
uniform 	float _Noise_Jianbian2;
uniform 	float _Noise_SpeedU;
uniform 	float _Noise_SpeedV;
uniform 	vec4 _Noise_TilingOffset;
uniform 	float _Noise_Rotate;
uniform 	float _Mask_SpeedU;
uniform 	float _Mask_SpeedV;
uniform 	vec4 _Mask_TilingOffset;
uniform 	float _Mask_Rotation;
uniform 	float _Mask_Rotation_Speed;
uniform 	float _Noise_Intensity;
uniform 	float _Noise_Mask_Jianbian;
uniform 	float _Noise_Mask_High;
uniform 	float _Noise_Mask_Rotate;
uniform 	vec4 _Liuguang2_Color;
uniform 	float _Liuguang2_Intensity;
uniform 	float _Liuguang2_R_SpeedX;
uniform 	float _Liuguang2_R_SpeedY;
uniform 	vec4 _Liuguang2_R_TilingOffset;
uniform 	float _Liuguang2_R_Rotation;
uniform 	float _Liuguang2_R_Rotation_Speed;
uniform 	float _Liuguang2_G_SpeedX;
uniform 	float _Liuguang2_G_SpeedY;
uniform 	vec4 _Liuguang2_G_TilingOffset;
uniform 	float _Liuguang2_G_Rotation;
uniform 	float _Liuguang2_G_Rotation_Speed;
uniform 	float _Liuguang3_R_Power_U;
uniform 	float _Liuguang3_R_Power_V;
uniform 	float _Liuguang3_Intensity;
uniform 	vec4 _Liuguang3_Color;
uniform 	float _Liuguang3_R_SpeedX;
uniform 	float _Liuguang3_R_SpeedY;
uniform 	vec4 _Liuguang3_R_TilingOffset;
uniform 	float _Liuguang3_R_Rotation;
uniform 	float _Liuguang3_R_Rotation_Speed;
uniform 	float _Liuguang3_G_SpeedX;
uniform 	float _Liuguang3_G_SpeedY;
uniform 	vec4 _Liuguang3_G_TilingOffset;
uniform 	float _Liuguang3_G_Rotation;
uniform 	float _Liuguang3_G_Rotation_Speed;
uniform 	float _Liuguang4_Intensity;
uniform 	vec4 _Liuguang4_Color;
uniform 	float _Liuguang4_R_SpeedX;
uniform 	float _Liuguang4_R_SpeedY;
uniform 	vec4 _Liuguang4_R_TilingOffset;
uniform 	float _Liuguang4_R_Rotation;
uniform 	float _Liuguang4_R_Rotation_Speed;
uniform 	float _Liuguang4_G_SpeedX;
uniform 	float _Liuguang4_G_SpeedY;
uniform 	vec4 _Liuguang4_G_TilingOffset;
uniform 	float _Liuguang4_G_Rotation;
uniform 	float _Liuguang4_G_Rotation_Speed;
uniform 	float _Mask_Power_U;
uniform 	float _useBGAlpha;
uniform 	float _UseCardMask;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	float _EdgeSoftness;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _RNoise_GMask_BNoise;
uniform lowp sampler2D _AniMask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BGTex;
uniform lowp sampler2D _Saoguang;
uniform lowp sampler2D _Liuguang_Mask;
uniform lowp sampler2D _Liuguang_2;
uniform lowp sampler2D _Liuguang_3;
uniform lowp sampler2D _Liuguang_4;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp float u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec4 u_xlat5;
lowp float u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat7;
lowp vec3 u_xlat10_7;
vec4 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
lowp vec2 u_xlat10_12;
vec3 u_xlat13;
lowp vec3 u_xlat10_13;
vec2 u_xlat16;
lowp float u_xlat10_16;
vec2 u_xlat22;
float u_xlat23;
vec2 u_xlat24;
lowp float u_xlat10_24;
vec2 u_xlat27;
mediump vec2 u_xlat16_32;
lowp float u_xlat10_34;
float u_xlat35;
float u_xlat38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat22.xy = u_xlat0.xy * vec2(_Main_Scale) + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Noise_Tiling_Offest.xy + _Noise_Tiling_Offest.zw;
    u_xlat23 = _Time.y * _Noise_Rotation_Speed + _Noise_Rotation;
    u_xlat2.x = sin(u_xlat23);
    u_xlat3.x = cos(u_xlat23);
    u_xlat1.xy = (-_Noise_Tiling_Offest.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat1.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat1.xy, u_xlat4.xy);
    u_xlat1.xy = _Noise_Tiling_Offest.xy * vec2(0.5, 0.5) + u_xlat2.xy;
    u_xlat1.xy = _Time.yy * vec2(_Noise_Speed_U, _Noise_Speed_V) + u_xlat1.xy;
    u_xlat10_1.x = texture2D(_RNoise_GMask_BNoise, u_xlat1.xy).z;
    u_xlat10_12.xy = texture2D(_AniMask, u_xlat22.xy).xz;
    u_xlat1.xw = u_xlat10_1.xx * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat2.x = _Time.y * _AniLength_Intensity_Speed.z;
    u_xlat2.y = _Time.y * _AniLength2_Intensity_Speed.z;
    u_xlat2.xy = sin(u_xlat2.xy);
    u_xlat2.xz = u_xlat2.xx * _AniLength_Intensity_Speed.xy;
    u_xlat13.xz = u_xlat2.yy * _AniLength2_Intensity_Speed.xy;
    u_xlat2.xy = u_xlat10_12.xx * u_xlat2.xz + u_xlat13.xz;
    u_xlat24.xy = u_xlat10_12.yy * vec2(_Noise_Power_U, _Noise_Power_V);
    u_xlat22.xy = u_xlat1.xw * u_xlat10_12.yy + u_xlat22.xy;
    u_xlat22.xy = u_xlat2.xy + u_xlat22.xy;
    u_xlat22.xy = (-u_xlat24.xy) * vec2(0.5, 0.5) + u_xlat22.xy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat22.xy).xyz;
    u_xlat10_34 = texture2D(_BGTex, u_xlat22.xy).w;
    u_xlat2.x = (-u_xlat10_34) + 1.0;
    u_xlat13.xy = vs_TEXCOORD0.xy * _BGTex_ST.xy + _BGTex_ST.zw;
    u_xlat10_13.xyz = texture2D(_BGTex, u_xlat13.xy).xyz;
    u_xlat13.xyz = u_xlat10_13.xyz * _BG_Color.xyz;
    u_xlat13.xyz = u_xlat13.xyz * u_xlat2.xxx;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat10_34) + u_xlat13.xyz;
    u_xlat13.xy = vs_TEXCOORD0.xy * _Saoguang_Tiling_Offest.xy + _Saoguang_Tiling_Offest.zw;
    u_xlat35 = _Time.y * _RotSpeed2 + _Saoguang_RatatorIntensity2;
    u_xlat3.x = sin(u_xlat35);
    u_xlat4.x = cos(u_xlat35);
    u_xlat13.xy = u_xlat13.xy + (-_Saoguang_RatatorCenter2.xy);
    u_xlat5.x = (-u_xlat3.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat3.x;
    u_xlat3.x = dot(u_xlat13.xy, u_xlat5.yz);
    u_xlat3.y = dot(u_xlat13.xy, u_xlat5.xy);
    u_xlat13.xy = u_xlat3.xy + _Saoguang_RatatorCenter2.xy;
    u_xlat35 = _Time.y * 0.300000012;
    u_xlat3.xy = _Saoguang_RatatorCenter2.zw * _Saoguang_Tiling_Offest.xy;
    u_xlat13.xy = vec2(u_xlat35) * u_xlat3.xy + u_xlat13.xy;
    u_xlat3.xy = _Saoguang_Tiling_Offest.xy * vec2(vec2(_Saoguang_Jiange2, _Saoguang_Jiange2));
    u_xlat13.xy = u_xlat13.xy / u_xlat3.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy * u_xlat13.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat10_3 = texture2D(_Saoguang, u_xlat13.xy);
    u_xlat10_13.x = texture2D(_AniMask, u_xlat22.xy).y;
    u_xlat3 = u_xlat10_3.wwww * u_xlat10_3;
    u_xlat4.xyz = u_xlat3.xyz;
    u_xlat4.w = _Saoguang_Color.w;
    u_xlat4 = u_xlat4 * _Saoguang_Color;
    u_xlat3.x = _Saoguang_Color.w;
    u_xlat3 = u_xlat3.xxxw * u_xlat4;
    u_xlat3 = u_xlat3 * vec4(_Saoguang_Intensity);
    u_xlat24.x = _Noise_Rotate * 0.00872664712;
    u_xlat4.x = sin(u_xlat24.x);
    u_xlat5.x = cos(u_xlat24.x);
    u_xlat6.x = (-u_xlat4.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat4.x;
    u_xlat4.x = dot(u_xlat0.xy, u_xlat6.yz);
    u_xlat4.y = dot(u_xlat0.xy, u_xlat6.xy);
    u_xlat24.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Noise_TilingOffset.xy * u_xlat24.xy + _Noise_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Noise_SpeedU, _Noise_SpeedV) + u_xlat24.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCardMask, _useBGAlpha, _UseCardMask, _UseCardMask)).xy;
    if(u_xlatb4.x){
        u_xlat4.x = _Time.y * _Mask_Rotation_Speed;
        u_xlat4.x = _Mask_Rotation * 0.00872664712 + u_xlat4.x;
        u_xlat5.x = cos(u_xlat4.x);
        u_xlat4.x = sin(u_xlat4.x);
        u_xlat6.x = (-u_xlat4.x);
        u_xlat6.y = u_xlat5.x;
        u_xlat6.z = u_xlat4.x;
        u_xlat5.x = dot(u_xlat0.xy, u_xlat6.yz);
        u_xlat5.y = dot(u_xlat0.xy, u_xlat6.xy);
        u_xlat0.xy = u_xlat5.xy + vec2(0.5, 0.5);
        u_xlat0.xy = _Mask_TilingOffset.xy * u_xlat0.xy + _Mask_TilingOffset.zw;
        u_xlat0.xy = _Time.yy * vec2(_Mask_SpeedU, _Mask_SpeedV) + u_xlat0.xy;
        u_xlat10_0 = texture2D(_RNoise_GMask_BNoise, u_xlat0.xy).y;
        u_xlat0.x = u_xlat10_0 * _Mask_Power_U;
    } else {
        u_xlat0.x = 1.0;
    }
    u_xlat0.xy = u_xlat0.xx + u_xlat24.xy;
    u_xlat10_0 = texture2D(_RNoise_GMask_BNoise, u_xlat0.xy).x;
    u_xlat11 = (-_Noise_Jianbian1) + _Noise_Jianbian2;
    u_xlat0.x = u_xlat10_0 + (-_Noise_Jianbian1);
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat5 = (-_Noise_Color1) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat5 = u_xlat5 * _Noise_Color1.wwww;
    u_xlat6 = (-_Noise_Color2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6 = u_xlat6 * _Noise_Color2.wwww + (-u_xlat5);
    u_xlat5 = u_xlat0.xxxx * u_xlat6 + u_xlat5;
    u_xlat6.y = vs_TEXCOORD0.y + _Noise_Mask_High;
    u_xlat11 = _Noise_Mask_Rotate * 0.00872664712;
    u_xlat7.y = cos(u_xlat11);
    u_xlat6.x = vs_TEXCOORD0.x;
    u_xlat24.xy = u_xlat6.xy + vec2(-0.5, -0.5);
    u_xlat7.x = sin((-u_xlat11));
    u_xlat11 = dot(u_xlat24.xy, u_xlat7.xy);
    u_xlat11 = u_xlat11 + 0.5;
    u_xlat11 = (-u_xlat11) + 1.0;
    u_xlat24.x = float(1.0) / _Noise_Mask_Jianbian;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
    u_xlat24.x = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat24.x;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat5 = vec4(u_xlat11) * u_xlat5;
    u_xlat5 = u_xlat0.xxxx * u_xlat5;
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Noise_Intensity, _Noise_Intensity, _Noise_Intensity));
    u_xlat6 = u_xlat2.xxxx * u_xlat5;
    u_xlat16_4 = (u_xlatb4.y) ? u_xlat6 : u_xlat5;
    u_xlat0.x = _Time.y * _Liuguang2_R_Rotation_Speed + _Liuguang2_R_Rotation;
    u_xlat2.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat24.xy = u_xlat22.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat0.x);
    u_xlat5.y = u_xlat2.x;
    u_xlat5.z = u_xlat0.x;
    u_xlat0.x = dot(u_xlat24.xy, u_xlat5.yz);
    u_xlat0.y = dot(u_xlat24.xy, u_xlat5.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _Liuguang2_R_TilingOffset.xy * u_xlat0.xy + _Liuguang2_R_TilingOffset.zw;
    u_xlat0.xy = _Time.yy * vec2(_Liuguang2_R_SpeedX, _Liuguang2_R_SpeedY) + u_xlat0.xy;
    u_xlat2.x = _Time.y * _Liuguang2_G_Rotation_Speed + _Liuguang2_G_Rotation;
    u_xlat5.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat5.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat6.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat6.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang2_G_TilingOffset.xy * u_xlat5.xy + _Liuguang2_G_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang2_G_SpeedX, _Liuguang2_G_SpeedY) + u_xlat5.xy;
    u_xlat6 = _Liuguang2_Color.wwww * _Liuguang2_Color;
    u_xlat6 = u_xlat6 * vec4(_Liuguang2_Intensity);
    u_xlat10_7.xyz = texture2D(_Liuguang_Mask, u_xlat22.xy).xyz;
    u_xlat6 = u_xlat6 * u_xlat10_7.xxxx;
    u_xlat10_0 = texture2D(_Liuguang_2, u_xlat0.xy).x;
    u_xlat0 = vec4(u_xlat10_0) * u_xlat6;
    u_xlat10_2 = texture2D(_Liuguang_2, u_xlat5.xy).y;
    u_xlat5.x = _Time.y * _Liuguang3_R_Rotation_Speed + _Liuguang3_R_Rotation;
    u_xlat6.x = cos(u_xlat5.x);
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat8.x = (-u_xlat5.x);
    u_xlat8.y = u_xlat6.x;
    u_xlat8.z = u_xlat5.x;
    u_xlat5.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat5.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat5.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat5.xy = _Liuguang3_R_TilingOffset.xy * u_xlat5.xy + _Liuguang3_R_TilingOffset.zw;
    u_xlat5.xy = _Time.yy * vec2(_Liuguang3_R_SpeedX, _Liuguang3_R_SpeedY) + u_xlat5.xy;
    u_xlat27.x = _Time.y * _Liuguang3_G_Rotation_Speed + _Liuguang3_G_Rotation;
    u_xlat6.x = sin(u_xlat27.x);
    u_xlat7.x = cos(u_xlat27.x);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat24.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat24.xy, u_xlat8.xy);
    u_xlat27.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat27.xy = _Liuguang3_G_TilingOffset.xy * u_xlat27.xy + _Liuguang3_G_TilingOffset.zw;
    u_xlat27.xy = _Time.yy * vec2(_Liuguang3_G_SpeedX, _Liuguang3_G_SpeedY) + u_xlat27.xy;
    u_xlat6.x = _Liuguang3_Intensity;
    u_xlat6.w = _Liuguang3_Color.w;
    u_xlat8 = u_xlat6.xxxw * _Liuguang3_Color;
    u_xlat6 = u_xlat6.wwwx * u_xlat8;
    u_xlat6 = u_xlat10_7.yyyy * u_xlat6;
    u_xlat10_5 = texture2D(_Liuguang_3, u_xlat5.xy).x;
    u_xlat5.xy = vec2(u_xlat10_5) * vec2(_Liuguang3_R_Power_U, _Liuguang3_R_Power_V) + u_xlat27.xy;
    u_xlat10_5 = texture2D(_Liuguang_3, u_xlat5.xy).y;
    u_xlat16.x = _Time.y * _Liuguang4_R_Rotation_Speed + _Liuguang4_R_Rotation;
    u_xlat7.x = sin(u_xlat16.x);
    u_xlat8.x = cos(u_xlat16.x);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat16.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Liuguang4_R_TilingOffset.xy * u_xlat16.xy + _Liuguang4_R_TilingOffset.zw;
    u_xlat16.xy = _Time.yy * vec2(_Liuguang4_R_SpeedX, _Liuguang4_R_SpeedY) + u_xlat16.xy;
    u_xlat38 = _Time.y * _Liuguang4_G_Rotation_Speed + _Liuguang4_G_Rotation;
    u_xlat7.x = sin(u_xlat38);
    u_xlat8.x = cos(u_xlat38);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat24.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat24.xy, u_xlat9.xy);
    u_xlat24.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat24.xy = _Liuguang4_G_TilingOffset.xy * u_xlat24.xy + _Liuguang4_G_TilingOffset.zw;
    u_xlat24.xy = _Time.yy * vec2(_Liuguang4_G_SpeedX, _Liuguang4_G_SpeedY) + u_xlat24.xy;
    u_xlat7.x = _Liuguang4_Intensity;
    u_xlat7.w = _Liuguang4_Color.w;
    u_xlat8 = u_xlat7.xxxw * _Liuguang4_Color;
    u_xlat8 = u_xlat7.wwwx * u_xlat8;
    u_xlat7 = u_xlat10_7.zzzz * u_xlat8;
    u_xlat10_16 = texture2D(_Liuguang_4, u_xlat16.xy).x;
    u_xlat7 = vec4(u_xlat10_16) * u_xlat7;
    u_xlat10_24 = texture2D(_Liuguang_4, u_xlat24.xy).y;
    u_xlat1.w = 1.0;
    u_xlat16_1 = u_xlat3 * u_xlat10_13.xxxx + u_xlat1;
    u_xlat16_1 = u_xlat16_4 + u_xlat16_1;
    u_xlat16_0 = u_xlat0 * vec4(u_xlat10_2) + u_xlat16_1;
    u_xlat16_0 = u_xlat6 * vec4(u_xlat10_5) + u_xlat16_0;
    u_xlat16_0 = u_xlat7 * vec4(u_xlat10_24) + u_xlat16_0;
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_10.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_10.xy;
    u_xlat16_10.xy = abs(u_xlat16_10.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlatb2.xy = equal(u_xlat16_10.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlat16_32.xy = u_xlat16_10.xy;
    u_xlat16_32.xy = clamp(u_xlat16_32.xy, 0.0, 1.0);
    u_xlat16_10.z = max(u_xlat16_32.y, u_xlat16_32.x);
    u_xlat13.x = _EdgeSoftness + 0.5;
    u_xlat24.xy = u_xlat16_10.xy + vec2(_EdgeSoftness);
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat13.xy = u_xlat13.xx * u_xlat24.xy;
    u_xlat13.xy = clamp(u_xlat13.xy, 0.0, 1.0);
    u_xlat3.xy = u_xlat13.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat3.xy;
    u_xlat16_10.x = max(u_xlat13.y, u_xlat13.x);
    u_xlat16_10.xz = (-u_xlat16_10.xz) + vec2(1.0, 1.0);
    u_xlat2.x = (u_xlatb2.x) ? u_xlat16_10.z : u_xlat16_10.x;
    u_xlat0 = u_xlat16_0 * u_xlat2.xxxx;
    u_xlat10_13.x = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat2.x = u_xlat2.x * u_xlat10_13.x;
    u_xlat16_10.x = u_xlat0.w * u_xlat2.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_10.x = u_xlat16_10.x * _Color.w;
    SV_Target0.w = u_xlat16_10.x * vs_COLOR0.w;
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
Keywords { "_UIPARALLAX_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_UIPARALLAX_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_UIPARALLAX_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_UIPARALLAX_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" "_UIPARALLAX_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" "_UIPARALLAX_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" "_UIPARALLAX_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" "_UIPARALLAX_OFF" }
""
}
}
}
}
}