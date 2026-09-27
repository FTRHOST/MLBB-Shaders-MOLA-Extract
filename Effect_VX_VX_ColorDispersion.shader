//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect_VX/VX_ColorDispersion" {
Properties {

[Toggle] _Custom ("开启自定义曲线_1主图XYMaskZW_2扰动XY色散ZW", Float) = 0.0

_Cull ("剔除模式", Float) = 2.0

_ZWrite ("深度写入", Float) = 0.0

_ZTest ("深度测试", Float) = 4.0

_BlendSrc ("BlendSrc_混合源颜色系数", Float) = 5.0

_BlendDst ("BlendDst_混合目标色系数", Float) = 10.0

_Diffuse ("主贴图", 2D) = "white" { }

_DiffuseColor ("主颜色", Color) = (1,1,1,1)

_AlphaIntensity ("Alpha强度", Range(0, 10)) = 1.0

_MainTex_UVVec ("主贴图XY流速_旋转角度Z速度W", Vector) = (0,0,0,0)

_DispersioVec ("DispersioVec", Vector) = (0,0,0,0)

_DispersioColor ("DispersioColor", Vector) = (1,1,1,0)

_AnchorAndScale ("缩放色散_中心点XY_缩放ZW", Vector) = (0.5,0.5,1,1)

_AnchorAndRotator ("旋转色散_中心点XY_旋转ZW", Vector) = (0.5,0.5,0,0)

_NoiseTex ("R:主贴图扰动 G:色散扰动", 2D) = "white" { }

_NoiseR_Vector ("主图扰动强度", Vector) = (0,0,0,1)

_NoiseR_Speed ("主图扰动中心XY速度ZW", Vector) = (0.5,0.5,0,0)

_NoiseG_Speed ("色散扰动(G)_速度_开关", Vector) = (0,0,0,0)

_NoiseG_TiOf ("色散扰动(G)_TiOf", Vector) = (1,1,0,0)

_Mask ("R:遮罩图", 2D) = "white" { }

_MaskVector ("遮罩图_速度XY_角度Z角速度W", Vector) = (0,0,0,0)

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
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "Unlit"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 9396
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
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat12.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat12.x = u_xlat12.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.x = sin((-u_xlat12.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat12.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat16_1.x = texture(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat16_1.x + (-_NoiseR_Vector.y);
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat12.xy * _NoiseR_Vector.xx + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_NoiseG_Speed.z);
#else
    u_xlatb12 = 0.5<_NoiseG_Speed.z;
#endif
    if(u_xlatb12){
        u_xlat12.x = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat12.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat13.xy = u_xlat1.xy * u_xlat12.xx + u_xlat0.xy;
    u_xlat18 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat4.x = sin((-u_xlat18));
    u_xlat13.xy = u_xlat13.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat13.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat14.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _AnchorAndScale.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xy + (-u_xlat14.xy);
    u_xlat12.xy = (-u_xlat1.xy) * u_xlat12.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat12.xy = u_xlat12.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat12.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat12.xy);
    u_xlat12.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat12.xy = u_xlat12.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat16_1.xy = texture(_Diffuse, u_xlat13.xy).xw;
    u_xlat16_0.xy = texture(_Diffuse, u_xlat0.xy).yw;
    u_xlat16_12.xy = texture(_Diffuse, u_xlat12.xy).zw;
    u_xlat1.x = u_xlat16_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat16_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat16_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_12.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat16_12.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_1.y;
    u_xlat0.x = u_xlat16_12.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.x = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat0.w * u_xlat16_1.x;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = abs(u_xlat16_11.xy) * _PanelRect.zw;
    u_xlat16_11.xy = u_xlat16_11.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xy = min(max(u_xlat16_11.xy, 0.0), 1.0);
#else
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
#endif
    u_xlat16_11.x = max(u_xlat16_11.y, u_xlat16_11.x);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    SV_Target0.w = u_xlat16_11.x * u_xlat16_5;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat12.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat12.x = u_xlat12.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.x = sin((-u_xlat12.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat12.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat16_1.x = texture(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat16_1.x + (-_NoiseR_Vector.y);
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat12.xy * _NoiseR_Vector.xx + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_NoiseG_Speed.z);
#else
    u_xlatb12 = 0.5<_NoiseG_Speed.z;
#endif
    if(u_xlatb12){
        u_xlat12.x = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat12.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat13.xy = u_xlat1.xy * u_xlat12.xx + u_xlat0.xy;
    u_xlat18 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat4.x = sin((-u_xlat18));
    u_xlat13.xy = u_xlat13.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat13.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat14.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _AnchorAndScale.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xy + (-u_xlat14.xy);
    u_xlat12.xy = (-u_xlat1.xy) * u_xlat12.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat12.xy = u_xlat12.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat12.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat12.xy);
    u_xlat12.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat12.xy = u_xlat12.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat16_1.xy = texture(_Diffuse, u_xlat13.xy).xw;
    u_xlat16_0.xy = texture(_Diffuse, u_xlat0.xy).yw;
    u_xlat16_12.xy = texture(_Diffuse, u_xlat12.xy).zw;
    u_xlat1.x = u_xlat16_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat16_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat16_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_12.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat16_12.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_1.y;
    u_xlat0.x = u_xlat16_12.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.x = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat0.w * u_xlat16_1.x;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = abs(u_xlat16_11.xy) * _PanelRect.zw;
    u_xlat16_11.xy = u_xlat16_11.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xy = min(max(u_xlat16_11.xy, 0.0), 1.0);
#else
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
#endif
    u_xlat16_11.x = max(u_xlat16_11.y, u_xlat16_11.x);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    SV_Target0.w = u_xlat16_11.x * u_xlat16_5;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec2 u_xlat10_0;
vec2 u_xlat1;
lowp vec2 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_11;
vec2 u_xlat12;
lowp vec2 u_xlat10_12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat12.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat12.x = u_xlat12.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.x = sin((-u_xlat12.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat12.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat10_1.x + (-_NoiseR_Vector.y);
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat12.xy * _NoiseR_Vector.xx + u_xlat0.xy;
    u_xlatb12 = 0.5<_NoiseG_Speed.z;
    if(u_xlatb12){
        u_xlat12.x = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat12.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat13.xy = u_xlat1.xy * u_xlat12.xx + u_xlat0.xy;
    u_xlat18 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat4.x = sin((-u_xlat18));
    u_xlat13.xy = u_xlat13.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat13.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat14.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _AnchorAndScale.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xy + (-u_xlat14.xy);
    u_xlat12.xy = (-u_xlat1.xy) * u_xlat12.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat12.xy = u_xlat12.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat12.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat12.xy);
    u_xlat12.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat12.xy = u_xlat12.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat10_1.xy = texture2D(_Diffuse, u_xlat13.xy).xw;
    u_xlat10_0.xy = texture2D(_Diffuse, u_xlat0.xy).yw;
    u_xlat10_12.xy = texture2D(_Diffuse, u_xlat12.xy).zw;
    u_xlat1.x = u_xlat10_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat10_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat10_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_12.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat10_12.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.y + u_xlat10_1.y;
    u_xlat0.x = u_xlat10_12.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat10_1.x = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat0.w * u_xlat10_1.x;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_11.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = abs(u_xlat16_11.xy) * _PanelRect.zw;
    u_xlat16_11.xy = u_xlat16_11.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
    u_xlat16_11.x = max(u_xlat16_11.y, u_xlat16_11.x);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    SV_Target0.w = u_xlat16_11.x * u_xlat16_5;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec2 u_xlat10_0;
vec2 u_xlat1;
lowp vec2 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_11;
vec2 u_xlat12;
lowp vec2 u_xlat10_12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat12.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat12.x = u_xlat12.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.x = sin((-u_xlat12.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat12.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat10_1.x + (-_NoiseR_Vector.y);
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat12.xy * _NoiseR_Vector.xx + u_xlat0.xy;
    u_xlatb12 = 0.5<_NoiseG_Speed.z;
    if(u_xlatb12){
        u_xlat12.x = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat12.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat13.xy = u_xlat1.xy * u_xlat12.xx + u_xlat0.xy;
    u_xlat18 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat4.x = sin((-u_xlat18));
    u_xlat13.xy = u_xlat13.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat13.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat14.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _AnchorAndScale.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xy + (-u_xlat14.xy);
    u_xlat12.xy = (-u_xlat1.xy) * u_xlat12.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat12.xy = u_xlat12.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat12.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat12.xy);
    u_xlat12.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat12.xy = u_xlat12.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat10_1.xy = texture2D(_Diffuse, u_xlat13.xy).xw;
    u_xlat10_0.xy = texture2D(_Diffuse, u_xlat0.xy).yw;
    u_xlat10_12.xy = texture2D(_Diffuse, u_xlat12.xy).zw;
    u_xlat1.x = u_xlat10_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat10_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat10_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_12.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat10_12.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.y + u_xlat10_1.y;
    u_xlat0.x = u_xlat10_12.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat10_1.x = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat0.w * u_xlat10_1.x;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_11.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = abs(u_xlat16_11.xy) * _PanelRect.zw;
    u_xlat16_11.xy = u_xlat16_11.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
    u_xlat16_11.x = max(u_xlat16_11.y, u_xlat16_11.x);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    SV_Target0.w = u_xlat16_11.x * u_xlat16_5;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec2 u_xlat16_21;
float u_xlat24;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat16.x);
    u_xlat2.x = cos(u_xlat16.x);
    u_xlat3.x = sin((-u_xlat16.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat16.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat16_1.x = texture(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat16_1.x + (-_NoiseR_Vector.y);
    u_xlat16.xy = u_xlat16.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat16.xy * _NoiseR_Vector.xx + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_NoiseG_Speed.z);
#else
    u_xlatb16 = 0.5<_NoiseG_Speed.z;
#endif
    if(u_xlatb16){
        u_xlat16.x = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat16.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat17.xy = u_xlat1.xy * u_xlat16.xx + u_xlat0.xy;
    u_xlat24 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat24 = u_xlat24 * 0.0174532924;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat4.x = sin((-u_xlat24));
    u_xlat17.xy = u_xlat17.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat17.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat17.xy);
    u_xlat17.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat18.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat18.xy = u_xlat18.xy * _AnchorAndScale.xy;
    u_xlat17.xy = u_xlat17.xy * u_xlat2.xy + (-u_xlat18.xy);
    u_xlat16.xy = (-u_xlat1.xy) * u_xlat16.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat16.xy = u_xlat16.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat16.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat16.xy);
    u_xlat16.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat16.xy = u_xlat16.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat16_1.xy = texture(_Diffuse, u_xlat17.xy).xw;
    u_xlat16_0.xy = texture(_Diffuse, u_xlat0.xy).yw;
    u_xlat16_16.xy = texture(_Diffuse, u_xlat16.xy).zw;
    u_xlat1.x = u_xlat16_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat16_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat16_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_16.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat16_16.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_1.y;
    u_xlat0.x = u_xlat16_16.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat1 = u_xlat16_0.yzwx * vs_COLOR0.yzwx;
    u_xlat16_26 = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat1.z * u_xlat16_26;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_21.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat16_0.yz * vs_COLOR0.yz + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_21.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat9 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat17.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9 = u_xlat9 / u_xlat17.x;
    u_xlat9 = u_xlat0.z + u_xlat9;
    u_xlat17.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat17.x;
    u_xlat16_21.x = abs(u_xlat9) + _HSV_Vector.x;
    u_xlat16_29 = u_xlat16_21.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb9 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_6.y;
    u_xlat16_21.x = fract(u_xlat16_21.x);
    u_xlat16_29 = u_xlat1.x * _HSV_Vector.y;
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_21.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat16_29) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_21.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_13.x = u_xlat16_13.x + (-_SaturateWeights.y);
    u_xlat16_21.xy = vec2(1.0, 1.0) / u_xlat16_21.xy;
    u_xlat16_13.x = u_xlat16_21.x * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_13.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_13.x = u_xlat16_21.y * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_13.xy = u_xlat16_13.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = abs(u_xlat16_13.xy) * _PanelRect.zw;
    u_xlat16_13.xy = u_xlat16_13.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xy = min(max(u_xlat16_13.xy, 0.0), 1.0);
#else
    u_xlat16_13.xy = clamp(u_xlat16_13.xy, 0.0, 1.0);
#endif
    u_xlat16_13.x = max(u_xlat16_13.y, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    SV_Target0.w = u_xlat16_13.x * u_xlat16_5;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec2 u_xlat16_21;
float u_xlat24;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat16.x);
    u_xlat2.x = cos(u_xlat16.x);
    u_xlat3.x = sin((-u_xlat16.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat16.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat16_1.x = texture(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat16_1.x + (-_NoiseR_Vector.y);
    u_xlat16.xy = u_xlat16.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat16.xy * _NoiseR_Vector.xx + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_NoiseG_Speed.z);
#else
    u_xlatb16 = 0.5<_NoiseG_Speed.z;
#endif
    if(u_xlatb16){
        u_xlat16.x = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat16.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat17.xy = u_xlat1.xy * u_xlat16.xx + u_xlat0.xy;
    u_xlat24 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat24 = u_xlat24 * 0.0174532924;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat4.x = sin((-u_xlat24));
    u_xlat17.xy = u_xlat17.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat17.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat17.xy);
    u_xlat17.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat18.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat18.xy = u_xlat18.xy * _AnchorAndScale.xy;
    u_xlat17.xy = u_xlat17.xy * u_xlat2.xy + (-u_xlat18.xy);
    u_xlat16.xy = (-u_xlat1.xy) * u_xlat16.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat16.xy = u_xlat16.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat16.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat16.xy);
    u_xlat16.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat16.xy = u_xlat16.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat16_1.xy = texture(_Diffuse, u_xlat17.xy).xw;
    u_xlat16_0.xy = texture(_Diffuse, u_xlat0.xy).yw;
    u_xlat16_16.xy = texture(_Diffuse, u_xlat16.xy).zw;
    u_xlat1.x = u_xlat16_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat16_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat16_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_16.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat16_16.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_1.y;
    u_xlat0.x = u_xlat16_16.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat1 = u_xlat16_0.yzwx * vs_COLOR0.yzwx;
    u_xlat16_26 = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat1.z * u_xlat16_26;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_21.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat16_0.yz * vs_COLOR0.yz + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_21.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat9 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat17.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9 = u_xlat9 / u_xlat17.x;
    u_xlat9 = u_xlat0.z + u_xlat9;
    u_xlat17.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat17.x;
    u_xlat16_21.x = abs(u_xlat9) + _HSV_Vector.x;
    u_xlat16_29 = u_xlat16_21.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb9 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_6.y;
    u_xlat16_21.x = fract(u_xlat16_21.x);
    u_xlat16_29 = u_xlat1.x * _HSV_Vector.y;
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_21.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat16_29) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_21.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_13.x = u_xlat16_13.x + (-_SaturateWeights.y);
    u_xlat16_21.xy = vec2(1.0, 1.0) / u_xlat16_21.xy;
    u_xlat16_13.x = u_xlat16_21.x * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_13.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_13.x = u_xlat16_21.y * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_13.xy = u_xlat16_13.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = abs(u_xlat16_13.xy) * _PanelRect.zw;
    u_xlat16_13.xy = u_xlat16_13.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xy = min(max(u_xlat16_13.xy, 0.0), 1.0);
#else
    u_xlat16_13.xy = clamp(u_xlat16_13.xy, 0.0, 1.0);
#endif
    u_xlat16_13.x = max(u_xlat16_13.y, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    SV_Target0.w = u_xlat16_13.x * u_xlat16_5;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec2 u_xlat16_21;
float u_xlat24;
lowp float u_xlat10_26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat16.x);
    u_xlat2.x = cos(u_xlat16.x);
    u_xlat3.x = sin((-u_xlat16.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat16.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat10_1.x + (-_NoiseR_Vector.y);
    u_xlat16.xy = u_xlat16.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat16.xy * _NoiseR_Vector.xx + u_xlat0.xy;
    u_xlatb16 = 0.5<_NoiseG_Speed.z;
    if(u_xlatb16){
        u_xlat16.x = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat16.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat17.xy = u_xlat1.xy * u_xlat16.xx + u_xlat0.xy;
    u_xlat24 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat24 = u_xlat24 * 0.0174532924;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat4.x = sin((-u_xlat24));
    u_xlat17.xy = u_xlat17.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat17.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat17.xy);
    u_xlat17.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat18.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat18.xy = u_xlat18.xy * _AnchorAndScale.xy;
    u_xlat17.xy = u_xlat17.xy * u_xlat2.xy + (-u_xlat18.xy);
    u_xlat16.xy = (-u_xlat1.xy) * u_xlat16.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat16.xy = u_xlat16.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat16.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat16.xy);
    u_xlat16.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat16.xy = u_xlat16.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat10_1.xy = texture2D(_Diffuse, u_xlat17.xy).xw;
    u_xlat10_0.xy = texture2D(_Diffuse, u_xlat0.xy).yw;
    u_xlat10_16.xy = texture2D(_Diffuse, u_xlat16.xy).zw;
    u_xlat1.x = u_xlat10_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat10_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat10_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_16.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat10_16.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.y + u_xlat10_1.y;
    u_xlat0.x = u_xlat10_16.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat1 = u_xlat16_0.yzwx * vs_COLOR0.yzwx;
    u_xlat10_26 = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat1.z * u_xlat10_26;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_13.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_21.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat16_0.yz * vs_COLOR0.yz + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_21.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat9 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat17.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9 = u_xlat9 / u_xlat17.x;
    u_xlat9 = u_xlat0.z + u_xlat9;
    u_xlat17.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat17.x;
    u_xlat16_21.x = abs(u_xlat9) + _HSV_Vector.x;
    u_xlat16_29 = u_xlat16_21.x * 360.0;
    u_xlatb9 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_6.y;
    u_xlat16_21.x = fract(u_xlat16_21.x);
    u_xlat16_29 = u_xlat1.x * _HSV_Vector.y;
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_21.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat16_29) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_21.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_13.x = u_xlat16_13.x + (-_SaturateWeights.y);
    u_xlat16_21.xy = vec2(1.0, 1.0) / u_xlat16_21.xy;
    u_xlat16_13.x = u_xlat16_21.x * u_xlat16_13.x;
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_13.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_13.x = u_xlat16_21.y * u_xlat16_13.x;
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_13.xy = u_xlat16_13.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = abs(u_xlat16_13.xy) * _PanelRect.zw;
    u_xlat16_13.xy = u_xlat16_13.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_13.xy = clamp(u_xlat16_13.xy, 0.0, 1.0);
    u_xlat16_13.x = max(u_xlat16_13.y, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    SV_Target0.w = u_xlat16_13.x * u_xlat16_5;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    vs_TEXCOORD4.xy = u_xlat0.xy;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec2 u_xlat16_21;
float u_xlat24;
lowp float u_xlat10_26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat16.x);
    u_xlat2.x = cos(u_xlat16.x);
    u_xlat3.x = sin((-u_xlat16.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat16.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat10_1.x + (-_NoiseR_Vector.y);
    u_xlat16.xy = u_xlat16.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat16.xy * _NoiseR_Vector.xx + u_xlat0.xy;
    u_xlatb16 = 0.5<_NoiseG_Speed.z;
    if(u_xlatb16){
        u_xlat16.x = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat16.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat17.xy = u_xlat1.xy * u_xlat16.xx + u_xlat0.xy;
    u_xlat24 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat24 = u_xlat24 * 0.0174532924;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat4.x = sin((-u_xlat24));
    u_xlat17.xy = u_xlat17.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat17.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat17.xy);
    u_xlat17.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat18.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat18.xy = u_xlat18.xy * _AnchorAndScale.xy;
    u_xlat17.xy = u_xlat17.xy * u_xlat2.xy + (-u_xlat18.xy);
    u_xlat16.xy = (-u_xlat1.xy) * u_xlat16.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat16.xy = u_xlat16.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat16.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat16.xy);
    u_xlat16.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat16.xy = u_xlat16.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat10_1.xy = texture2D(_Diffuse, u_xlat17.xy).xw;
    u_xlat10_0.xy = texture2D(_Diffuse, u_xlat0.xy).yw;
    u_xlat10_16.xy = texture2D(_Diffuse, u_xlat16.xy).zw;
    u_xlat1.x = u_xlat10_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat10_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat10_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_16.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat10_16.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.y + u_xlat10_1.y;
    u_xlat0.x = u_xlat10_16.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat1 = u_xlat16_0.yzwx * vs_COLOR0.yzwx;
    u_xlat10_26 = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat1.z * u_xlat10_26;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_13.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_21.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat16_0.yz * vs_COLOR0.yz + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_21.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat9 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat17.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9 = u_xlat9 / u_xlat17.x;
    u_xlat9 = u_xlat0.z + u_xlat9;
    u_xlat17.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat17.x;
    u_xlat16_21.x = abs(u_xlat9) + _HSV_Vector.x;
    u_xlat16_29 = u_xlat16_21.x * 360.0;
    u_xlatb9 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_6.y;
    u_xlat16_21.x = fract(u_xlat16_21.x);
    u_xlat16_29 = u_xlat1.x * _HSV_Vector.y;
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_21.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat16_29) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_21.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_13.x = u_xlat16_13.x + (-_SaturateWeights.y);
    u_xlat16_21.xy = vec2(1.0, 1.0) / u_xlat16_21.xy;
    u_xlat16_13.x = u_xlat16_21.x * u_xlat16_13.x;
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_13.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_13.x = u_xlat16_21.y * u_xlat16_13.x;
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_13.xy = u_xlat16_13.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = abs(u_xlat16_13.xy) * _PanelRect.zw;
    u_xlat16_13.xy = u_xlat16_13.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_13.xy = clamp(u_xlat16_13.xy, 0.0, 1.0);
    u_xlat16_13.x = max(u_xlat16_13.y, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    SV_Target0.w = u_xlat16_13.x * u_xlat16_5;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat12.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat12.x = u_xlat12.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.x = sin((-u_xlat12.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat12.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat16_1.x = texture(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat16_1.x + (-_NoiseR_Vector.y);
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat12.xy * _NoiseR_Vector.xx + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_NoiseG_Speed.z);
#else
    u_xlatb12 = 0.5<_NoiseG_Speed.z;
#endif
    if(u_xlatb12){
        u_xlat12.x = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat12.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat13.xy = u_xlat1.xy * u_xlat12.xx + u_xlat0.xy;
    u_xlat18 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat4.x = sin((-u_xlat18));
    u_xlat13.xy = u_xlat13.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat13.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat14.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _AnchorAndScale.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xy + (-u_xlat14.xy);
    u_xlat12.xy = (-u_xlat1.xy) * u_xlat12.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat12.xy = u_xlat12.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat12.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat12.xy);
    u_xlat12.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat12.xy = u_xlat12.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat16_1.xy = texture(_Diffuse, u_xlat13.xy).xw;
    u_xlat16_0.xy = texture(_Diffuse, u_xlat0.xy).yw;
    u_xlat16_12.xy = texture(_Diffuse, u_xlat12.xy).zw;
    u_xlat1.x = u_xlat16_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat16_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat16_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_12.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat16_12.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_1.y;
    u_xlat0.x = u_xlat16_12.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.x = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat0.w * u_xlat16_1.x;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = abs(u_xlat16_11.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xy = min(max(u_xlat16_11.xy, 0.0), 1.0);
#else
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
#endif
    u_xlat16_11.x = max(u_xlat16_11.y, u_xlat16_11.x);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    SV_Target0.w = u_xlat16_11.x * u_xlat16_5;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_11;
vec2 u_xlat12;
mediump vec2 u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat12.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat12.x = u_xlat12.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.x = sin((-u_xlat12.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat12.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat16_1.x = texture(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat16_1.x + (-_NoiseR_Vector.y);
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat12.xy * _NoiseR_Vector.xx + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_NoiseG_Speed.z);
#else
    u_xlatb12 = 0.5<_NoiseG_Speed.z;
#endif
    if(u_xlatb12){
        u_xlat12.x = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat12.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat13.xy = u_xlat1.xy * u_xlat12.xx + u_xlat0.xy;
    u_xlat18 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat4.x = sin((-u_xlat18));
    u_xlat13.xy = u_xlat13.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat13.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat14.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _AnchorAndScale.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xy + (-u_xlat14.xy);
    u_xlat12.xy = (-u_xlat1.xy) * u_xlat12.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat12.xy = u_xlat12.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat12.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat12.xy);
    u_xlat12.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat12.xy = u_xlat12.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat16_1.xy = texture(_Diffuse, u_xlat13.xy).xw;
    u_xlat16_0.xy = texture(_Diffuse, u_xlat0.xy).yw;
    u_xlat16_12.xy = texture(_Diffuse, u_xlat12.xy).zw;
    u_xlat1.x = u_xlat16_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat16_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat16_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_12.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat16_12.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_1.y;
    u_xlat0.x = u_xlat16_12.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat16_1.x = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat0.w * u_xlat16_1.x;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_11.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = abs(u_xlat16_11.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xy = min(max(u_xlat16_11.xy, 0.0), 1.0);
#else
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
#endif
    u_xlat16_11.x = max(u_xlat16_11.y, u_xlat16_11.x);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    SV_Target0.w = u_xlat16_11.x * u_xlat16_5;
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

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec2 u_xlat10_0;
vec2 u_xlat1;
lowp vec2 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_11;
vec2 u_xlat12;
lowp vec2 u_xlat10_12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat12.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat12.x = u_xlat12.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.x = sin((-u_xlat12.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat12.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat10_1.x + (-_NoiseR_Vector.y);
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat12.xy * _NoiseR_Vector.xx + u_xlat0.xy;
    u_xlatb12 = 0.5<_NoiseG_Speed.z;
    if(u_xlatb12){
        u_xlat12.x = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat12.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat13.xy = u_xlat1.xy * u_xlat12.xx + u_xlat0.xy;
    u_xlat18 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat4.x = sin((-u_xlat18));
    u_xlat13.xy = u_xlat13.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat13.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat14.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _AnchorAndScale.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xy + (-u_xlat14.xy);
    u_xlat12.xy = (-u_xlat1.xy) * u_xlat12.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat12.xy = u_xlat12.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat12.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat12.xy);
    u_xlat12.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat12.xy = u_xlat12.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat10_1.xy = texture2D(_Diffuse, u_xlat13.xy).xw;
    u_xlat10_0.xy = texture2D(_Diffuse, u_xlat0.xy).yw;
    u_xlat10_12.xy = texture2D(_Diffuse, u_xlat12.xy).zw;
    u_xlat1.x = u_xlat10_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat10_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat10_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_12.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat10_12.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.y + u_xlat10_1.y;
    u_xlat0.x = u_xlat10_12.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat10_1.x = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat0.w * u_xlat10_1.x;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_11.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = abs(u_xlat16_11.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
    u_xlat16_11.x = max(u_xlat16_11.y, u_xlat16_11.x);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    SV_Target0.w = u_xlat16_11.x * u_xlat16_5;
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

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec2 u_xlat10_0;
vec2 u_xlat1;
lowp vec2 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_11;
vec2 u_xlat12;
lowp vec2 u_xlat10_12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat12.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat12.x = u_xlat12.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.x = sin((-u_xlat12.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat12.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat10_1.x + (-_NoiseR_Vector.y);
    u_xlat12.xy = u_xlat12.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat12.xy * _NoiseR_Vector.xx + u_xlat0.xy;
    u_xlatb12 = 0.5<_NoiseG_Speed.z;
    if(u_xlatb12){
        u_xlat12.x = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat12.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat13.xy = u_xlat1.xy * u_xlat12.xx + u_xlat0.xy;
    u_xlat18 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat4.x = sin((-u_xlat18));
    u_xlat13.xy = u_xlat13.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat13.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat13.xy);
    u_xlat13.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat14.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _AnchorAndScale.xy;
    u_xlat13.xy = u_xlat13.xy * u_xlat2.xy + (-u_xlat14.xy);
    u_xlat12.xy = (-u_xlat1.xy) * u_xlat12.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat12.xy = u_xlat12.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat12.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat12.xy);
    u_xlat12.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat12.xy = u_xlat12.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat10_1.xy = texture2D(_Diffuse, u_xlat13.xy).xw;
    u_xlat10_0.xy = texture2D(_Diffuse, u_xlat0.xy).yw;
    u_xlat10_12.xy = texture2D(_Diffuse, u_xlat12.xy).zw;
    u_xlat1.x = u_xlat10_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat10_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat10_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_12.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat10_12.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.y + u_xlat10_1.y;
    u_xlat0.x = u_xlat10_12.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat10_1.x = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat0.w * u_xlat10_1.x;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_11.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_11.xy = u_xlat16_11.xy + u_xlat16_11.xy;
    u_xlat16_11.xy = abs(u_xlat16_11.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_11.xy = clamp(u_xlat16_11.xy, 0.0, 1.0);
    u_xlat16_11.x = max(u_xlat16_11.y, u_xlat16_11.x);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    SV_Target0.w = u_xlat16_11.x * u_xlat16_5;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec2 u_xlat16_21;
float u_xlat24;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat16.x);
    u_xlat2.x = cos(u_xlat16.x);
    u_xlat3.x = sin((-u_xlat16.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat16.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat16_1.x = texture(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat16_1.x + (-_NoiseR_Vector.y);
    u_xlat16.xy = u_xlat16.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat16.xy * _NoiseR_Vector.xx + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_NoiseG_Speed.z);
#else
    u_xlatb16 = 0.5<_NoiseG_Speed.z;
#endif
    if(u_xlatb16){
        u_xlat16.x = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat16.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat17.xy = u_xlat1.xy * u_xlat16.xx + u_xlat0.xy;
    u_xlat24 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat24 = u_xlat24 * 0.0174532924;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat4.x = sin((-u_xlat24));
    u_xlat17.xy = u_xlat17.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat17.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat17.xy);
    u_xlat17.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat18.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat18.xy = u_xlat18.xy * _AnchorAndScale.xy;
    u_xlat17.xy = u_xlat17.xy * u_xlat2.xy + (-u_xlat18.xy);
    u_xlat16.xy = (-u_xlat1.xy) * u_xlat16.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat16.xy = u_xlat16.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat16.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat16.xy);
    u_xlat16.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat16.xy = u_xlat16.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat16_1.xy = texture(_Diffuse, u_xlat17.xy).xw;
    u_xlat16_0.xy = texture(_Diffuse, u_xlat0.xy).yw;
    u_xlat16_16.xy = texture(_Diffuse, u_xlat16.xy).zw;
    u_xlat1.x = u_xlat16_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat16_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat16_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_16.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat16_16.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_1.y;
    u_xlat0.x = u_xlat16_16.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat1 = u_xlat16_0.yzwx * vs_COLOR0.yzwx;
    u_xlat16_26 = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat1.z * u_xlat16_26;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_21.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat16_0.yz * vs_COLOR0.yz + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_21.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat9 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat17.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9 = u_xlat9 / u_xlat17.x;
    u_xlat9 = u_xlat0.z + u_xlat9;
    u_xlat17.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat17.x;
    u_xlat16_21.x = abs(u_xlat9) + _HSV_Vector.x;
    u_xlat16_29 = u_xlat16_21.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb9 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_6.y;
    u_xlat16_21.x = fract(u_xlat16_21.x);
    u_xlat16_29 = u_xlat1.x * _HSV_Vector.y;
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_21.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat16_29) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_21.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_13.x = u_xlat16_13.x + (-_SaturateWeights.y);
    u_xlat16_21.xy = vec2(1.0, 1.0) / u_xlat16_21.xy;
    u_xlat16_13.x = u_xlat16_21.x * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_13.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_13.x = u_xlat16_21.y * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_13.xy = u_xlat16_13.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = abs(u_xlat16_13.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xy = min(max(u_xlat16_13.xy, 0.0), 1.0);
#else
    u_xlat16_13.xy = clamp(u_xlat16_13.xy, 0.0, 1.0);
#endif
    u_xlat16_13.x = max(u_xlat16_13.y, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    SV_Target0.w = u_xlat16_13.x * u_xlat16_5;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec2 u_xlat16_21;
float u_xlat24;
mediump float u_xlat16_26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat16.x);
    u_xlat2.x = cos(u_xlat16.x);
    u_xlat3.x = sin((-u_xlat16.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat16.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat16_1.x = texture(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat16_1.x + (-_NoiseR_Vector.y);
    u_xlat16.xy = u_xlat16.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat16.xy * _NoiseR_Vector.xx + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.5<_NoiseG_Speed.z);
#else
    u_xlatb16 = 0.5<_NoiseG_Speed.z;
#endif
    if(u_xlatb16){
        u_xlat16.x = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat16.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat17.xy = u_xlat1.xy * u_xlat16.xx + u_xlat0.xy;
    u_xlat24 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat24 = u_xlat24 * 0.0174532924;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat4.x = sin((-u_xlat24));
    u_xlat17.xy = u_xlat17.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat17.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat17.xy);
    u_xlat17.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat18.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat18.xy = u_xlat18.xy * _AnchorAndScale.xy;
    u_xlat17.xy = u_xlat17.xy * u_xlat2.xy + (-u_xlat18.xy);
    u_xlat16.xy = (-u_xlat1.xy) * u_xlat16.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat16.xy = u_xlat16.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat16.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat16.xy);
    u_xlat16.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat16.xy = u_xlat16.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat16_1.xy = texture(_Diffuse, u_xlat17.xy).xw;
    u_xlat16_0.xy = texture(_Diffuse, u_xlat0.xy).yw;
    u_xlat16_16.xy = texture(_Diffuse, u_xlat16.xy).zw;
    u_xlat1.x = u_xlat16_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat16_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat16_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_16.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat16_16.y + _DispersioVec.z;
    u_xlat0.x = u_xlat16_0.y + u_xlat16_1.y;
    u_xlat0.x = u_xlat16_16.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat1 = u_xlat16_0.yzwx * vs_COLOR0.yzwx;
    u_xlat16_26 = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat1.z * u_xlat16_26;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_13.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_21.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat16_0.yz * vs_COLOR0.yz + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_21.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat9 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat17.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9 = u_xlat9 / u_xlat17.x;
    u_xlat9 = u_xlat0.z + u_xlat9;
    u_xlat17.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat17.x;
    u_xlat16_21.x = abs(u_xlat9) + _HSV_Vector.x;
    u_xlat16_29 = u_xlat16_21.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb9 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_6.y;
    u_xlat16_21.x = fract(u_xlat16_21.x);
    u_xlat16_29 = u_xlat1.x * _HSV_Vector.y;
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_21.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat16_29) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_21.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_13.x = u_xlat16_13.x + (-_SaturateWeights.y);
    u_xlat16_21.xy = vec2(1.0, 1.0) / u_xlat16_21.xy;
    u_xlat16_13.x = u_xlat16_21.x * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_13.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_13.x = u_xlat16_21.y * u_xlat16_13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_13.xy = u_xlat16_13.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = abs(u_xlat16_13.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xy = min(max(u_xlat16_13.xy, 0.0), 1.0);
#else
    u_xlat16_13.xy = clamp(u_xlat16_13.xy, 0.0, 1.0);
#endif
    u_xlat16_13.x = max(u_xlat16_13.y, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    SV_Target0.w = u_xlat16_13.x * u_xlat16_5;
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

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec2 u_xlat16_21;
float u_xlat24;
lowp float u_xlat10_26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat16.x);
    u_xlat2.x = cos(u_xlat16.x);
    u_xlat3.x = sin((-u_xlat16.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat16.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat10_1.x + (-_NoiseR_Vector.y);
    u_xlat16.xy = u_xlat16.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat16.xy * _NoiseR_Vector.xx + u_xlat0.xy;
    u_xlatb16 = 0.5<_NoiseG_Speed.z;
    if(u_xlatb16){
        u_xlat16.x = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat16.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat17.xy = u_xlat1.xy * u_xlat16.xx + u_xlat0.xy;
    u_xlat24 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat24 = u_xlat24 * 0.0174532924;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat4.x = sin((-u_xlat24));
    u_xlat17.xy = u_xlat17.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat17.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat17.xy);
    u_xlat17.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat18.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat18.xy = u_xlat18.xy * _AnchorAndScale.xy;
    u_xlat17.xy = u_xlat17.xy * u_xlat2.xy + (-u_xlat18.xy);
    u_xlat16.xy = (-u_xlat1.xy) * u_xlat16.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat16.xy = u_xlat16.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat16.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat16.xy);
    u_xlat16.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat16.xy = u_xlat16.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat10_1.xy = texture2D(_Diffuse, u_xlat17.xy).xw;
    u_xlat10_0.xy = texture2D(_Diffuse, u_xlat0.xy).yw;
    u_xlat10_16.xy = texture2D(_Diffuse, u_xlat16.xy).zw;
    u_xlat1.x = u_xlat10_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat10_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat10_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_16.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat10_16.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.y + u_xlat10_1.y;
    u_xlat0.x = u_xlat10_16.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat1 = u_xlat16_0.yzwx * vs_COLOR0.yzwx;
    u_xlat10_26 = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat1.z * u_xlat10_26;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_13.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_21.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat16_0.yz * vs_COLOR0.yz + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_21.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat9 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat17.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9 = u_xlat9 / u_xlat17.x;
    u_xlat9 = u_xlat0.z + u_xlat9;
    u_xlat17.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat17.x;
    u_xlat16_21.x = abs(u_xlat9) + _HSV_Vector.x;
    u_xlat16_29 = u_xlat16_21.x * 360.0;
    u_xlatb9 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_6.y;
    u_xlat16_21.x = fract(u_xlat16_21.x);
    u_xlat16_29 = u_xlat1.x * _HSV_Vector.y;
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_21.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat16_29) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_21.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_13.x = u_xlat16_13.x + (-_SaturateWeights.y);
    u_xlat16_21.xy = vec2(1.0, 1.0) / u_xlat16_21.xy;
    u_xlat16_13.x = u_xlat16_21.x * u_xlat16_13.x;
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_13.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_13.x = u_xlat16_21.y * u_xlat16_13.x;
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_13.xy = u_xlat16_13.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = abs(u_xlat16_13.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_13.xy = clamp(u_xlat16_13.xy, 0.0, 1.0);
    u_xlat16_13.x = max(u_xlat16_13.y, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    SV_Target0.w = u_xlat16_13.x * u_xlat16_5;
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

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseG_TiOf;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat9;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat0.x = u_xlat0.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat0.x));
    u_xlat2 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat3.xy = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat9 = float(_Custom);
    u_xlat3.xy = in_TEXCOORD2.zw * vec2(u_xlat9) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat1.y = u_xlat2;
    u_xlat1.z = u_xlat0.x;
    u_xlat7.y = dot(u_xlat1.zy, u_xlat3.xy);
    u_xlat7.x = dot(u_xlat1.yx, u_xlat3.xy);
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    vs_TEXCOORD1.zw = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.xy = _Time.yy * _NoiseR_Speed.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _NoiseG_Speed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat6.xy = in_TEXCOORD0.xy * _NoiseG_TiOf.xy + _NoiseG_TiOf.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy + u_xlat6.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump float _AlphaIntensity;
uniform 	vec4 _MainTex_UVVec;
uniform 	vec4 _DispersioVec;
uniform 	mediump vec4 _DispersioColor;
uniform 	vec4 _AnchorAndRotator;
uniform 	vec4 _AnchorAndScale;
uniform 	vec4 _NoiseR_Speed;
uniform 	vec2 _NoiseR_Vector;
uniform 	vec4 _NoiseG_Speed;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_13;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec2 u_xlat17;
vec2 u_xlat18;
mediump vec2 u_xlat16_21;
float u_xlat24;
lowp float u_xlat10_26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16.x = _MainTex_UVVec.w * _Time.y + _MainTex_UVVec.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat16.x);
    u_xlat2.x = cos(u_xlat16.x);
    u_xlat3.x = sin((-u_xlat16.x));
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = u_xlat2.x;
    u_xlat2.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = _MainTex_UVVec.xy * _Time.yy + u_xlat0.xy;
    u_xlat16.xy = (-vs_TEXCOORD1.xy) + _NoiseR_Speed.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, vs_TEXCOORD3.xy).x;
    u_xlat1.x = u_xlat10_1.x + (-_NoiseR_Vector.y);
    u_xlat16.xy = u_xlat16.xy * u_xlat1.xx;
    u_xlat0.xy = u_xlat16.xy * _NoiseR_Vector.xx + u_xlat0.xy;
    u_xlatb16 = 0.5<_NoiseG_Speed.z;
    if(u_xlatb16){
        u_xlat16.x = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    } else {
        u_xlat16.x = 1.0;
    }
    u_xlat1.xy = vs_TEXCOORD2.zw + _DispersioVec.xy;
    u_xlat17.xy = u_xlat1.xy * u_xlat16.xx + u_xlat0.xy;
    u_xlat24 = _AnchorAndRotator.w * _Time.y + _AnchorAndRotator.z;
    u_xlat24 = u_xlat24 * 0.0174532924;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat4.x = sin((-u_xlat24));
    u_xlat17.xy = u_xlat17.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat3.x = dot(u_xlat4.yx, u_xlat17.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat4.zy, u_xlat17.xy);
    u_xlat17.xy = u_xlat3.xy + _AnchorAndRotator.xy;
    u_xlat2.xy = max(_AnchorAndScale.zw, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = vec2(1.0, 1.0) / u_xlat2.xy;
    u_xlat18.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat18.xy = u_xlat18.xy * _AnchorAndScale.xy;
    u_xlat17.xy = u_xlat17.xy * u_xlat2.xy + (-u_xlat18.xy);
    u_xlat16.xy = (-u_xlat1.xy) * u_xlat16.xx + u_xlat0.xy;
    u_xlat1.x = (-_AnchorAndRotator.w) * _Time.y + (-_AnchorAndRotator.z);
    u_xlat1.x = u_xlat1.x * 0.0174532924;
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat4.x = sin((-u_xlat1.x));
    u_xlat16.xy = u_xlat16.xy + (-_AnchorAndRotator.xy);
    u_xlat4.y = u_xlat3.x;
    u_xlat1.x = dot(u_xlat4.yx, u_xlat16.xy);
    u_xlat4.z = u_xlat2.x;
    u_xlat1.y = dot(u_xlat4.zy, u_xlat16.xy);
    u_xlat16.xy = u_xlat1.xy + _AnchorAndRotator.xy;
    u_xlat1.xy = _AnchorAndScale.zw + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _AnchorAndScale.xy;
    u_xlat16.xy = u_xlat16.xy * _AnchorAndScale.zw + (-u_xlat1.xy);
    u_xlat10_1.xy = texture2D(_Diffuse, u_xlat17.xy).xw;
    u_xlat10_0.xy = texture2D(_Diffuse, u_xlat0.xy).yw;
    u_xlat10_16.xy = texture2D(_Diffuse, u_xlat16.xy).zw;
    u_xlat1.x = u_xlat10_1.x * _DispersioColor.x;
    u_xlat2.x = u_xlat1.x * u_xlat10_1.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.x * _DispersioColor.y;
    u_xlat2.y = u_xlat0.x * u_xlat10_0.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_16.x * _DispersioColor.z;
    u_xlat2.z = u_xlat0.x * u_xlat10_16.y + _DispersioVec.z;
    u_xlat0.x = u_xlat10_0.y + u_xlat10_1.y;
    u_xlat0.x = u_xlat10_16.y + u_xlat0.x;
    u_xlat2.w = u_xlat0.x * 0.333333343;
    u_xlat16_0 = u_xlat2 * _DiffuseColor;
    u_xlat1 = u_xlat16_0.yzwx * vs_COLOR0.yzwx;
    u_xlat10_26 = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat16_5 = u_xlat1.z * u_xlat10_26;
    u_xlat16_5 = u_xlat16_5 * _AlphaIntensity;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_13.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_21.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat16_0.yz * vs_COLOR0.yz + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_21.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat9 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat17.x = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat9 = u_xlat9 / u_xlat17.x;
    u_xlat9 = u_xlat0.z + u_xlat9;
    u_xlat17.x = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat17.x;
    u_xlat16_21.x = abs(u_xlat9) + _HSV_Vector.x;
    u_xlat16_29 = u_xlat16_21.x * 360.0;
    u_xlatb9 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_6.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_6.y;
    u_xlat16_21.x = fract(u_xlat16_21.x);
    u_xlat16_29 = u_xlat1.x * _HSV_Vector.y;
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_21.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat16_29) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_21.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_13.x = u_xlat16_13.x + (-_SaturateWeights.y);
    u_xlat16_21.xy = vec2(1.0, 1.0) / u_xlat16_21.xy;
    u_xlat16_13.x = u_xlat16_21.x * u_xlat16_13.x;
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_13.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_13.x = u_xlat16_21.y * u_xlat16_13.x;
    u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
    u_xlat16_21.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_21.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_13.xyz * u_xlat16_6.xyz;
    u_xlat16_13.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_13.xy = u_xlat16_13.xy + u_xlat16_13.xy;
    u_xlat16_13.xy = abs(u_xlat16_13.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_13.xy = clamp(u_xlat16_13.xy, 0.0, 1.0);
    u_xlat16_13.x = max(u_xlat16_13.y, u_xlat16_13.x);
    u_xlat16_13.x = (-u_xlat16_13.x) + 1.0;
    SV_Target0.w = u_xlat16_13.x * u_xlat16_5;
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
CustomEditor "CodeGenShaderGUI.VX_ColorDispersionGUI_Custom"
}