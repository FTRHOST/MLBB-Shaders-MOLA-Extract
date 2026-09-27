//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect_VX/VX_RadialWipe" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_ZWrite ("深度写入", Float) = 0.0

_BlendSrc ("BlendSrc_混合源颜色系数", Float) = 5.0

_BlendDst ("BlendDst_混合目标色系数", Float) = 10.0

[Toggle] _Custom ("开启自定义曲线_1主图XYMaskZW_2扰动XY溶解Z", Float) = 0.0

_Diffuse ("主贴图", 2D) = "white" { }

_DiffuseColor ("主颜色", Color) = (1,1,1,1)

_ColorPower ("颜色强度", Float) = 1.0

_Alpha ("Alpha强度", Float) = 1.0

_Diffuse_SpeedAndRotator ("主图_速度XY_角度Z角速度W", Vector) = (0,0,0,0)

_DissolveR_NoiseG ("溶解锯齿纹理图", 2D) = "white" { }

_DissolveCenterAndSpeed ("溶解图中心XY_速度ZW", Vector) = (0.5,0.5,0,0)

[Toggle] _InvertDissolve ("反转溶解图颜色", Float) = 0.0

_Dissolve ("溶解进程", Range(-2, 2)) = 0.0

_WipeNoiseWidth ("溶解锯齿宽度", Range(0, 1)) = 0.5003625750541687

_EdgePower ("软边硬度", Range(1, 16)) = 4.0

_SoftEdge ("软边宽度(负数反转溶解方向)", Range(-1, 1)) = 0.10000000149011612

[Toggle] _WipeEdgeOn ("开启溶解边缘色", Float) = 1.0

_EdgeColor ("软边颜色", Color) = (0.146849,0.52261,0.943396,1)

_SoftEdgeColorPower ("软边颜色强度", Float) = 1.0

_SoftEdgeAlphaPower ("软边Alpha强度", Float) = 1.0

[Toggle] _CenterLine ("开启中心线溶解", Float) = 1.0

[Toggle] _RampColorOn ("开启溶解软边渐变色映射", Float) = 1.0

_RampColor ("溶解软边渐变色映射图", 2D) = "white" { }

_RampOffset ("溶解软边渐变映色位置(由下至上)", Range(0, 1)) = 0.009999999776482582

[Toggle] _Noise_On ("开启扰动(溶解图G通道)", Float) = 0.0

_NoisePower ("扰动强度", Range(-2, 2)) = 0.0

_NoiseOffset ("扰动偏移缩放校正", Range(0, 1)) = 0.20000000298023224

_Noise_G_SpeedX ("扰动(溶解图G通道)_X速度", Float) = 0.0

_Noise_G_SpeedY ("扰动(溶解图G通道)_Y速度", Float) = 0.0

_Noise_G_Tiling_Center ("扰动(溶解图G通道)_TilingXY_扰动中心ZW", Vector) = (1,1,0.5,0.5)

[Toggle] _NoiseMaskOn ("开启扰动遮罩(溶解图B通道)", Float) = 0.0

_NoiseMaskPower ("扰动Mask强度(溶解图B强度)", Range(0, 2)) = 1.0

_NoiseMask_ScaleAndOffset ("扰动Mask(溶解图B通道)_缩放XY_偏移ZW", Vector) = (1,1,0,0)

_Mask ("遮罩图", 2D) = "white" { }

_Mask_SpeedAndRotator ("遮罩图_速度XY_角度Z角速度W", Vector) = (0,0,0,0)

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
  GpuProgramID 4480
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
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveR_NoiseG;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _RampColor;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat24 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat24 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat24;
    u_xlat8.xy = u_xlat8.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat8.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat8.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat16_24 = texture(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat24 = u_xlat16_24 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat16_1.x = texture(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat16_1.x * _NoiseMaskPower;
        u_xlat9.x = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat9.xy = u_xlat9.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat9.xy;
    } else {
        u_xlat24 = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat24) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat8.xy + u_xlat1.xy;
    u_xlat8.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat8.xy;
    u_xlat4 = texture(_Diffuse, u_xlat8.xy);
    u_xlat8.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat16.x = u_xlat8.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    { bool cond = _InvertDissolve==1.0; u_xlat24 = uintBitsToFloat(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlat24 = uintBitsToFloat((_InvertDissolve==1.0) ? 0xFFFFFFFFu : uint(0));
#endif
    if(floatBitsToUint(u_xlat24) != uint(0)) {
        u_xlat16_24 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat24 = (-u_xlat16_24) + 1.0;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(_InvertDissolve<1.0);
#else
        u_xlatb17 = _InvertDissolve<1.0;
#endif
        if(u_xlatb17){
            u_xlat24 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat8.x = (-u_xlat8.x) * 1.41421354 + u_xlat24;
    u_xlat8.x = _WipeNoiseWidth * u_xlat8.x + u_xlat16.x;
    u_xlat8.x = u_xlat8.x + _Dissolve;
    u_xlat8.x = u_xlat1.w + u_xlat8.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat16.x) + u_xlat0;
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat8.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat16_5 = texture(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat16_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat16.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat1.x);
    u_xlat16.x = u_xlat16.x * _EdgePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.xyz * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat16.xy = u_xlat2.zw + u_xlat16.xy;
    u_xlat4.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat16.xy = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat16.xy, u_xlat5.yz);
    u_xlat2.y = dot(u_xlat16.xy, u_xlat5.xy);
    u_xlat16.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat16.xy;
    u_xlat16_16 = texture(_Mask, u_xlat16.xy).x;
    u_xlat0 = (-u_xlat8.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat1.w;
    u_xlat8.x = u_xlat16_16 * _Alpha;
    u_xlat0 = u_xlat8.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
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
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat3.xyz;
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
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveR_NoiseG;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _RampColor;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat24 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat24 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat24;
    u_xlat8.xy = u_xlat8.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat8.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat8.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat16_24 = texture(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat24 = u_xlat16_24 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat16_1.x = texture(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat16_1.x * _NoiseMaskPower;
        u_xlat9.x = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat9.xy = u_xlat9.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat9.xy;
    } else {
        u_xlat24 = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat24) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat8.xy + u_xlat1.xy;
    u_xlat8.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat8.xy;
    u_xlat4 = texture(_Diffuse, u_xlat8.xy);
    u_xlat8.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat16.x = u_xlat8.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    { bool cond = _InvertDissolve==1.0; u_xlat24 = uintBitsToFloat(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlat24 = uintBitsToFloat((_InvertDissolve==1.0) ? 0xFFFFFFFFu : uint(0));
#endif
    if(floatBitsToUint(u_xlat24) != uint(0)) {
        u_xlat16_24 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat24 = (-u_xlat16_24) + 1.0;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(_InvertDissolve<1.0);
#else
        u_xlatb17 = _InvertDissolve<1.0;
#endif
        if(u_xlatb17){
            u_xlat24 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat8.x = (-u_xlat8.x) * 1.41421354 + u_xlat24;
    u_xlat8.x = _WipeNoiseWidth * u_xlat8.x + u_xlat16.x;
    u_xlat8.x = u_xlat8.x + _Dissolve;
    u_xlat8.x = u_xlat1.w + u_xlat8.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat16.x) + u_xlat0;
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat8.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat16_5 = texture(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat16_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat16.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat1.x);
    u_xlat16.x = u_xlat16.x * _EdgePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.xyz * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat16.xy = u_xlat2.zw + u_xlat16.xy;
    u_xlat4.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat16.xy = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat16.xy, u_xlat5.yz);
    u_xlat2.y = dot(u_xlat16.xy, u_xlat5.xy);
    u_xlat16.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat16.xy;
    u_xlat16_16 = texture(_Mask, u_xlat16.xy).x;
    u_xlat0 = (-u_xlat8.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat1.w;
    u_xlat8.x = u_xlat16_16 * _Alpha;
    u_xlat0 = u_xlat8.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
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
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat3.xyz;
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
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
uniform lowp sampler2D _DissolveR_NoiseG;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _RampColor;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb17;
float u_xlat24;
lowp float u_xlat10_24;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat24 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat24 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat24;
    u_xlat8.xy = u_xlat8.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat8.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat8.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat10_24 = texture2D(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat24 = u_xlat10_24 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat10_1 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat10_1 * _NoiseMaskPower;
        u_xlat9.x = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat9.xy = u_xlat9.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat9.xy;
    } else {
        u_xlat24 = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat24) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat8.xy + u_xlat1.xy;
    u_xlat8.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat8.xy;
    u_xlat4 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat8.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat16.x = u_xlat8.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
    u_xlat24 = float((_InvertDissolve==1.0) ? -1 : 0);
    if(int(u_xlat24) != 0) {
        u_xlat10_24 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat24 = (-u_xlat10_24) + 1.0;
    } else {
        u_xlatb17 = _InvertDissolve<1.0;
        if(u_xlatb17){
            u_xlat24 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat8.x = (-u_xlat8.x) * 1.41421354 + u_xlat24;
    u_xlat8.x = _WipeNoiseWidth * u_xlat8.x + u_xlat16.x;
    u_xlat8.x = u_xlat8.x + _Dissolve;
    u_xlat8.x = u_xlat1.w + u_xlat8.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat4.w;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat16.x) + u_xlat0;
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat8.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat8.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat8.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat10_5 = texture2D(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat10_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat16.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat1.x);
    u_xlat16.x = u_xlat16.x * _EdgePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.xyz * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat16.xy = u_xlat2.zw + u_xlat16.xy;
    u_xlat4.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat16.xy = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat16.xy, u_xlat5.yz);
    u_xlat2.y = dot(u_xlat16.xy, u_xlat5.xy);
    u_xlat16.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat16.xy;
    u_xlat10_16 = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat0 = (-u_xlat8.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat1.w;
    u_xlat8.x = u_xlat10_16 * _Alpha;
    u_xlat0 = u_xlat8.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat3.xyz;
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
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
uniform lowp sampler2D _DissolveR_NoiseG;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _RampColor;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb17;
float u_xlat24;
lowp float u_xlat10_24;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat24 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat24 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat24;
    u_xlat8.xy = u_xlat8.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat8.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat8.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat10_24 = texture2D(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat24 = u_xlat10_24 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat10_1 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat10_1 * _NoiseMaskPower;
        u_xlat9.x = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat9.xy = u_xlat9.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat9.xy;
    } else {
        u_xlat24 = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat24) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat8.xy + u_xlat1.xy;
    u_xlat8.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat8.xy;
    u_xlat4 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat8.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat16.x = u_xlat8.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
    u_xlat24 = float((_InvertDissolve==1.0) ? -1 : 0);
    if(int(u_xlat24) != 0) {
        u_xlat10_24 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat24 = (-u_xlat10_24) + 1.0;
    } else {
        u_xlatb17 = _InvertDissolve<1.0;
        if(u_xlatb17){
            u_xlat24 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat8.x = (-u_xlat8.x) * 1.41421354 + u_xlat24;
    u_xlat8.x = _WipeNoiseWidth * u_xlat8.x + u_xlat16.x;
    u_xlat8.x = u_xlat8.x + _Dissolve;
    u_xlat8.x = u_xlat1.w + u_xlat8.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat4.w;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat16.x) + u_xlat0;
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat8.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat8.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat8.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat10_5 = texture2D(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat10_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat16.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat1.x);
    u_xlat16.x = u_xlat16.x * _EdgePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.xyz * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat16.xy = u_xlat2.zw + u_xlat16.xy;
    u_xlat4.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat16.xy = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat16.xy, u_xlat5.yz);
    u_xlat2.y = dot(u_xlat16.xy, u_xlat5.xy);
    u_xlat16.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat16.xy;
    u_xlat10_16 = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat0 = (-u_xlat8.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat1.w;
    u_xlat8.x = u_xlat10_16 * _Alpha;
    u_xlat0 = u_xlat8.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat3.xyz;
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
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveR_NoiseG;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _RampColor;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
bool u_xlatb19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat27 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat27 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat27;
    u_xlat9.xy = u_xlat9.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat27);
    u_xlat3.x = cos(u_xlat27);
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat9.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat9.xy, u_xlat4.xy);
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat9.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat16_27 = texture(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat27 = u_xlat16_27 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat16_1.x = texture(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat16_1.x * _NoiseMaskPower;
        u_xlat10.x = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat10.xy = u_xlat10.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat10.xy;
    } else {
        u_xlat27 = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat27) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat9.xy + u_xlat1.xy;
    u_xlat9.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat9.xy;
    u_xlat4 = texture(_Diffuse, u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat18.x = u_xlat9.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    { bool cond = _InvertDissolve==1.0; u_xlat27 = uintBitsToFloat(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlat27 = uintBitsToFloat((_InvertDissolve==1.0) ? 0xFFFFFFFFu : uint(0));
#endif
    if(floatBitsToUint(u_xlat27) != uint(0)) {
        u_xlat16_27 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat27 = (-u_xlat16_27) + 1.0;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(_InvertDissolve<1.0);
#else
        u_xlatb19 = _InvertDissolve<1.0;
#endif
        if(u_xlatb19){
            u_xlat27 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat9.x = (-u_xlat9.x) * 1.41421354 + u_xlat27;
    u_xlat9.x = _WipeNoiseWidth * u_xlat9.x + u_xlat18.x;
    u_xlat9.x = u_xlat9.x + _Dissolve;
    u_xlat9.x = u_xlat1.w + u_xlat9.x;
    u_xlat9.x = (-u_xlat9.x) + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat18.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat18.x) + u_xlat0;
    u_xlat9.x = (-u_xlat18.x) + u_xlat9.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat9.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat16_5 = texture(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat16_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat18.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat18.x;
    u_xlat18.x = log2(u_xlat1.x);
    u_xlat18.x = u_xlat18.x * _EdgePower;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat16_1 * u_xlat3;
    u_xlat5.xyw = u_xlat3.yzx * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16_7.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb18 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_16.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat5.yx;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat6.xy = u_xlat3.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat1.xy);
    u_xlat6.z = float(1.0);
    u_xlat6.w = float(-1.0);
    u_xlat1 = u_xlat16_16.xxxx * u_xlat6 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat5.w>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat5.w>=u_xlat1.x;
#endif
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat5.wyx;
    u_xlat1 = (-u_xlat5) + u_xlat1;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat5;
    u_xlat18.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat2.x = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat27 = u_xlat27 / u_xlat2.x;
    u_xlat27 = u_xlat27 + u_xlat1.z;
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat18.x = u_xlat18.x / u_xlat2.x;
    u_xlat16_16.x = abs(u_xlat27) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb27 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb27)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat16_34 = u_xlat18.x * _HSV_Vector.y;
    u_xlat3.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat3.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
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
    u_xlat18.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat18.xy = u_xlat2.zw + u_xlat18.xy;
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat18.xy = u_xlat18.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat18.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat18.xy, u_xlat4.xy);
    u_xlat18.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat18.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat18.xy;
    u_xlat16_18 = texture(_Mask, u_xlat18.xy).x;
    u_xlat0 = (-u_xlat9.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat3.w;
    u_xlat9.x = u_xlat16_18 * _Alpha;
    u_xlat0 = u_xlat9.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
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
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
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
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveR_NoiseG;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _RampColor;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
bool u_xlatb19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat27 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat27 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat27;
    u_xlat9.xy = u_xlat9.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat27);
    u_xlat3.x = cos(u_xlat27);
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat9.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat9.xy, u_xlat4.xy);
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat9.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat16_27 = texture(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat27 = u_xlat16_27 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat16_1.x = texture(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat16_1.x * _NoiseMaskPower;
        u_xlat10.x = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat10.xy = u_xlat10.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat10.xy;
    } else {
        u_xlat27 = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat27) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat9.xy + u_xlat1.xy;
    u_xlat9.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat9.xy;
    u_xlat4 = texture(_Diffuse, u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat18.x = u_xlat9.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    { bool cond = _InvertDissolve==1.0; u_xlat27 = uintBitsToFloat(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlat27 = uintBitsToFloat((_InvertDissolve==1.0) ? 0xFFFFFFFFu : uint(0));
#endif
    if(floatBitsToUint(u_xlat27) != uint(0)) {
        u_xlat16_27 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat27 = (-u_xlat16_27) + 1.0;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(_InvertDissolve<1.0);
#else
        u_xlatb19 = _InvertDissolve<1.0;
#endif
        if(u_xlatb19){
            u_xlat27 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat9.x = (-u_xlat9.x) * 1.41421354 + u_xlat27;
    u_xlat9.x = _WipeNoiseWidth * u_xlat9.x + u_xlat18.x;
    u_xlat9.x = u_xlat9.x + _Dissolve;
    u_xlat9.x = u_xlat1.w + u_xlat9.x;
    u_xlat9.x = (-u_xlat9.x) + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat18.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat18.x) + u_xlat0;
    u_xlat9.x = (-u_xlat18.x) + u_xlat9.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat9.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat16_5 = texture(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat16_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat18.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat18.x;
    u_xlat18.x = log2(u_xlat1.x);
    u_xlat18.x = u_xlat18.x * _EdgePower;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat16_1 * u_xlat3;
    u_xlat5.xyw = u_xlat3.yzx * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16_7.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb18 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_16.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat5.yx;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat6.xy = u_xlat3.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat1.xy);
    u_xlat6.z = float(1.0);
    u_xlat6.w = float(-1.0);
    u_xlat1 = u_xlat16_16.xxxx * u_xlat6 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat5.w>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat5.w>=u_xlat1.x;
#endif
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat5.wyx;
    u_xlat1 = (-u_xlat5) + u_xlat1;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat5;
    u_xlat18.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat2.x = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat27 = u_xlat27 / u_xlat2.x;
    u_xlat27 = u_xlat27 + u_xlat1.z;
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat18.x = u_xlat18.x / u_xlat2.x;
    u_xlat16_16.x = abs(u_xlat27) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb27 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb27)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat16_34 = u_xlat18.x * _HSV_Vector.y;
    u_xlat3.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat3.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
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
    u_xlat18.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat18.xy = u_xlat2.zw + u_xlat18.xy;
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat18.xy = u_xlat18.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat18.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat18.xy, u_xlat4.xy);
    u_xlat18.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat18.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat18.xy;
    u_xlat16_18 = texture(_Mask, u_xlat18.xy).x;
    u_xlat0 = (-u_xlat9.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat3.w;
    u_xlat9.x = u_xlat16_18 * _Alpha;
    u_xlat0 = u_xlat9.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
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
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
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
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
uniform lowp sampler2D _DissolveR_NoiseG;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _RampColor;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
bool u_xlatb19;
mediump vec2 u_xlat16_25;
float u_xlat27;
lowp float u_xlat10_27;
bool u_xlatb27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat27 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat27 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat27;
    u_xlat9.xy = u_xlat9.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat27);
    u_xlat3.x = cos(u_xlat27);
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat9.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat9.xy, u_xlat4.xy);
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat9.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat10_27 = texture2D(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat27 = u_xlat10_27 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat10_1 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat10_1 * _NoiseMaskPower;
        u_xlat10.x = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat10.xy = u_xlat10.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat10.xy;
    } else {
        u_xlat27 = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat27) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat9.xy + u_xlat1.xy;
    u_xlat9.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat9.xy;
    u_xlat4 = texture2D(_Diffuse, u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat18.x = u_xlat9.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
    u_xlat27 = float((_InvertDissolve==1.0) ? -1 : 0);
    if(int(u_xlat27) != 0) {
        u_xlat10_27 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat27 = (-u_xlat10_27) + 1.0;
    } else {
        u_xlatb19 = _InvertDissolve<1.0;
        if(u_xlatb19){
            u_xlat27 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat9.x = (-u_xlat9.x) * 1.41421354 + u_xlat27;
    u_xlat9.x = _WipeNoiseWidth * u_xlat9.x + u_xlat18.x;
    u_xlat9.x = u_xlat9.x + _Dissolve;
    u_xlat9.x = u_xlat1.w + u_xlat9.x;
    u_xlat9.x = (-u_xlat9.x) + u_xlat4.w;
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat18.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat18.x) + u_xlat0;
    u_xlat9.x = (-u_xlat18.x) + u_xlat9.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat9.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat9.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat9.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat10_5 = texture2D(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat10_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat18.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat18.x;
    u_xlat18.x = log2(u_xlat1.x);
    u_xlat18.x = u_xlat18.x * _EdgePower;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat16_1 * u_xlat3;
    u_xlat5.xyw = u_xlat3.yzx * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16_7.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb18 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_16.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat5.yx;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat6.xy = u_xlat3.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat1.xy);
    u_xlat6.z = float(1.0);
    u_xlat6.w = float(-1.0);
    u_xlat1 = u_xlat16_16.xxxx * u_xlat6 + u_xlat1;
    u_xlatb18 = u_xlat5.w>=u_xlat1.x;
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat5.wyx;
    u_xlat1 = (-u_xlat5) + u_xlat1;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat5;
    u_xlat18.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat2.x = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat27 = u_xlat27 / u_xlat2.x;
    u_xlat27 = u_xlat27 + u_xlat1.z;
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat18.x = u_xlat18.x / u_xlat2.x;
    u_xlat16_16.x = abs(u_xlat27) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
    u_xlatb27 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlat16_25.xy = (bool(u_xlatb27)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat16_34 = u_xlat18.x * _HSV_Vector.y;
    u_xlat3.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat3.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
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
    u_xlat18.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat18.xy = u_xlat2.zw + u_xlat18.xy;
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat18.xy = u_xlat18.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat18.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat18.xy, u_xlat4.xy);
    u_xlat18.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat18.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat18.xy;
    u_xlat10_18 = texture2D(_Mask, u_xlat18.xy).x;
    u_xlat0 = (-u_xlat9.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat3.w;
    u_xlat9.x = u_xlat10_18 * _Alpha;
    u_xlat0 = u_xlat9.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
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
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
uniform lowp sampler2D _DissolveR_NoiseG;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _RampColor;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
bool u_xlatb19;
mediump vec2 u_xlat16_25;
float u_xlat27;
lowp float u_xlat10_27;
bool u_xlatb27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat27 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat27 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat27;
    u_xlat9.xy = u_xlat9.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat27);
    u_xlat3.x = cos(u_xlat27);
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat9.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat9.xy, u_xlat4.xy);
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat9.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat10_27 = texture2D(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat27 = u_xlat10_27 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat10_1 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat10_1 * _NoiseMaskPower;
        u_xlat10.x = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat10.xy = u_xlat10.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat10.xy;
    } else {
        u_xlat27 = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat27) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat9.xy + u_xlat1.xy;
    u_xlat9.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat9.xy;
    u_xlat4 = texture2D(_Diffuse, u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat18.x = u_xlat9.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
    u_xlat27 = float((_InvertDissolve==1.0) ? -1 : 0);
    if(int(u_xlat27) != 0) {
        u_xlat10_27 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat27 = (-u_xlat10_27) + 1.0;
    } else {
        u_xlatb19 = _InvertDissolve<1.0;
        if(u_xlatb19){
            u_xlat27 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat9.x = (-u_xlat9.x) * 1.41421354 + u_xlat27;
    u_xlat9.x = _WipeNoiseWidth * u_xlat9.x + u_xlat18.x;
    u_xlat9.x = u_xlat9.x + _Dissolve;
    u_xlat9.x = u_xlat1.w + u_xlat9.x;
    u_xlat9.x = (-u_xlat9.x) + u_xlat4.w;
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat18.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat18.x) + u_xlat0;
    u_xlat9.x = (-u_xlat18.x) + u_xlat9.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat9.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat9.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat9.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat10_5 = texture2D(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat10_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat18.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat18.x;
    u_xlat18.x = log2(u_xlat1.x);
    u_xlat18.x = u_xlat18.x * _EdgePower;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat16_1 * u_xlat3;
    u_xlat5.xyw = u_xlat3.yzx * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16_7.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb18 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_16.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat5.yx;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat6.xy = u_xlat3.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat1.xy);
    u_xlat6.z = float(1.0);
    u_xlat6.w = float(-1.0);
    u_xlat1 = u_xlat16_16.xxxx * u_xlat6 + u_xlat1;
    u_xlatb18 = u_xlat5.w>=u_xlat1.x;
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat5.wyx;
    u_xlat1 = (-u_xlat5) + u_xlat1;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat5;
    u_xlat18.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat2.x = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat27 = u_xlat27 / u_xlat2.x;
    u_xlat27 = u_xlat27 + u_xlat1.z;
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat18.x = u_xlat18.x / u_xlat2.x;
    u_xlat16_16.x = abs(u_xlat27) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
    u_xlatb27 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlat16_25.xy = (bool(u_xlatb27)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat16_34 = u_xlat18.x * _HSV_Vector.y;
    u_xlat3.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat3.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
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
    u_xlat18.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat18.xy = u_xlat2.zw + u_xlat18.xy;
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat18.xy = u_xlat18.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat18.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat18.xy, u_xlat4.xy);
    u_xlat18.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat18.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat18.xy;
    u_xlat10_18 = texture2D(_Mask, u_xlat18.xy).x;
    u_xlat0 = (-u_xlat9.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat3.w;
    u_xlat9.x = u_xlat10_18 * _Alpha;
    u_xlat0 = u_xlat9.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelRect.zw;
    u_xlat16_7.xy = u_xlat16_7.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
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
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveR_NoiseG;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _RampColor;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat24 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat24 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat24;
    u_xlat8.xy = u_xlat8.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat8.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat8.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat16_24 = texture(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat24 = u_xlat16_24 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat16_1.x = texture(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat16_1.x * _NoiseMaskPower;
        u_xlat9.x = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat9.xy = u_xlat9.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat9.xy;
    } else {
        u_xlat24 = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat24) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat8.xy + u_xlat1.xy;
    u_xlat8.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat8.xy;
    u_xlat4 = texture(_Diffuse, u_xlat8.xy);
    u_xlat8.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat16.x = u_xlat8.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    { bool cond = _InvertDissolve==1.0; u_xlat24 = uintBitsToFloat(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlat24 = uintBitsToFloat((_InvertDissolve==1.0) ? 0xFFFFFFFFu : uint(0));
#endif
    if(floatBitsToUint(u_xlat24) != uint(0)) {
        u_xlat16_24 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat24 = (-u_xlat16_24) + 1.0;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(_InvertDissolve<1.0);
#else
        u_xlatb17 = _InvertDissolve<1.0;
#endif
        if(u_xlatb17){
            u_xlat24 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat8.x = (-u_xlat8.x) * 1.41421354 + u_xlat24;
    u_xlat8.x = _WipeNoiseWidth * u_xlat8.x + u_xlat16.x;
    u_xlat8.x = u_xlat8.x + _Dissolve;
    u_xlat8.x = u_xlat1.w + u_xlat8.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat16.x) + u_xlat0;
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat8.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat16_5 = texture(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat16_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat16.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat1.x);
    u_xlat16.x = u_xlat16.x * _EdgePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.xyz * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat16.xy = u_xlat2.zw + u_xlat16.xy;
    u_xlat4.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat16.xy = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat16.xy, u_xlat5.yz);
    u_xlat2.y = dot(u_xlat16.xy, u_xlat5.xy);
    u_xlat16.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat16.xy;
    u_xlat16_16 = texture(_Mask, u_xlat16.xy).x;
    u_xlat0 = (-u_xlat8.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat1.w;
    u_xlat8.x = u_xlat16_16 * _Alpha;
    u_xlat0 = u_xlat8.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat3.xyz;
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
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveR_NoiseG;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _RampColor;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat24 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat24 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat24;
    u_xlat8.xy = u_xlat8.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat8.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat8.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat16_24 = texture(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat24 = u_xlat16_24 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat16_1.x = texture(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat16_1.x * _NoiseMaskPower;
        u_xlat9.x = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat9.xy = u_xlat9.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat9.xy;
    } else {
        u_xlat24 = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat24) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat8.xy + u_xlat1.xy;
    u_xlat8.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat8.xy;
    u_xlat4 = texture(_Diffuse, u_xlat8.xy);
    u_xlat8.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat16.x = u_xlat8.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    { bool cond = _InvertDissolve==1.0; u_xlat24 = uintBitsToFloat(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlat24 = uintBitsToFloat((_InvertDissolve==1.0) ? 0xFFFFFFFFu : uint(0));
#endif
    if(floatBitsToUint(u_xlat24) != uint(0)) {
        u_xlat16_24 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat24 = (-u_xlat16_24) + 1.0;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(_InvertDissolve<1.0);
#else
        u_xlatb17 = _InvertDissolve<1.0;
#endif
        if(u_xlatb17){
            u_xlat24 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat8.x = (-u_xlat8.x) * 1.41421354 + u_xlat24;
    u_xlat8.x = _WipeNoiseWidth * u_xlat8.x + u_xlat16.x;
    u_xlat8.x = u_xlat8.x + _Dissolve;
    u_xlat8.x = u_xlat1.w + u_xlat8.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat16.x) + u_xlat0;
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat8.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat16_5 = texture(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat16_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat16.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat1.x);
    u_xlat16.x = u_xlat16.x * _EdgePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.xyz * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat16.xy = u_xlat2.zw + u_xlat16.xy;
    u_xlat4.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat16.xy = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat16.xy, u_xlat5.yz);
    u_xlat2.y = dot(u_xlat16.xy, u_xlat5.xy);
    u_xlat16.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat16.xy;
    u_xlat16_16 = texture(_Mask, u_xlat16.xy).x;
    u_xlat0 = (-u_xlat8.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat1.w;
    u_xlat8.x = u_xlat16_16 * _Alpha;
    u_xlat0 = u_xlat8.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat3.xyz;
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
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
uniform lowp sampler2D _DissolveR_NoiseG;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _RampColor;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb17;
float u_xlat24;
lowp float u_xlat10_24;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat24 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat24 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat24;
    u_xlat8.xy = u_xlat8.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat8.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat8.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat10_24 = texture2D(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat24 = u_xlat10_24 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat10_1 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat10_1 * _NoiseMaskPower;
        u_xlat9.x = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat9.xy = u_xlat9.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat9.xy;
    } else {
        u_xlat24 = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat24) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat8.xy + u_xlat1.xy;
    u_xlat8.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat8.xy;
    u_xlat4 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat8.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat16.x = u_xlat8.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
    u_xlat24 = float((_InvertDissolve==1.0) ? -1 : 0);
    if(int(u_xlat24) != 0) {
        u_xlat10_24 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat24 = (-u_xlat10_24) + 1.0;
    } else {
        u_xlatb17 = _InvertDissolve<1.0;
        if(u_xlatb17){
            u_xlat24 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat8.x = (-u_xlat8.x) * 1.41421354 + u_xlat24;
    u_xlat8.x = _WipeNoiseWidth * u_xlat8.x + u_xlat16.x;
    u_xlat8.x = u_xlat8.x + _Dissolve;
    u_xlat8.x = u_xlat1.w + u_xlat8.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat4.w;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat16.x) + u_xlat0;
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat8.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat8.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat8.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat10_5 = texture2D(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat10_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat16.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat1.x);
    u_xlat16.x = u_xlat16.x * _EdgePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.xyz * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat16.xy = u_xlat2.zw + u_xlat16.xy;
    u_xlat4.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat16.xy = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat16.xy, u_xlat5.yz);
    u_xlat2.y = dot(u_xlat16.xy, u_xlat5.xy);
    u_xlat16.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat16.xy;
    u_xlat10_16 = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat0 = (-u_xlat8.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat1.w;
    u_xlat8.x = u_xlat10_16 * _Alpha;
    u_xlat0 = u_xlat8.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat3.xyz;
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
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
uniform lowp sampler2D _DissolveR_NoiseG;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _RampColor;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec2 u_xlat16_7;
vec2 u_xlat8;
vec2 u_xlat9;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb17;
float u_xlat24;
lowp float u_xlat10_24;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat24 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat24 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat24;
    u_xlat8.xy = u_xlat8.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat24);
    u_xlat3.x = cos(u_xlat24);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat8.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat8.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat8.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat10_24 = texture2D(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat24 = u_xlat10_24 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat10_1 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat10_1 * _NoiseMaskPower;
        u_xlat9.x = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat9.xy = u_xlat9.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat9.xy;
    } else {
        u_xlat24 = u_xlat24 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat24) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat8.xy + u_xlat1.xy;
    u_xlat8.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat8.xy;
    u_xlat4 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat8.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat8.xy);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat16.x = u_xlat8.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
    u_xlat24 = float((_InvertDissolve==1.0) ? -1 : 0);
    if(int(u_xlat24) != 0) {
        u_xlat10_24 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat24 = (-u_xlat10_24) + 1.0;
    } else {
        u_xlatb17 = _InvertDissolve<1.0;
        if(u_xlatb17){
            u_xlat24 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat8.x = (-u_xlat8.x) * 1.41421354 + u_xlat24;
    u_xlat8.x = _WipeNoiseWidth * u_xlat8.x + u_xlat16.x;
    u_xlat8.x = u_xlat8.x + _Dissolve;
    u_xlat8.x = u_xlat1.w + u_xlat8.x;
    u_xlat8.x = (-u_xlat8.x) + u_xlat4.w;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat16.x) + u_xlat0;
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat8.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat8.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat8.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat10_5 = texture2D(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat10_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat16.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat16.x;
    u_xlat16.x = log2(u_xlat1.x);
    u_xlat16.x = u_xlat16.x * _EdgePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat16.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.xyz * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat16.xy = u_xlat2.zw + u_xlat16.xy;
    u_xlat4.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat16.xy = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat16.xy, u_xlat5.yz);
    u_xlat2.y = dot(u_xlat16.xy, u_xlat5.xy);
    u_xlat16.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat16.xy;
    u_xlat10_16 = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat0 = (-u_xlat8.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat1.w;
    u_xlat8.x = u_xlat10_16 * _Alpha;
    u_xlat0 = u_xlat8.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
    SV_Target0.xyz = u_xlat3.xyz;
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
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveR_NoiseG;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _RampColor;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
bool u_xlatb19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat27 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat27 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat27;
    u_xlat9.xy = u_xlat9.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat27);
    u_xlat3.x = cos(u_xlat27);
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat9.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat9.xy, u_xlat4.xy);
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat9.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat16_27 = texture(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat27 = u_xlat16_27 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat16_1.x = texture(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat16_1.x * _NoiseMaskPower;
        u_xlat10.x = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat10.xy = u_xlat10.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat10.xy;
    } else {
        u_xlat27 = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat27) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat9.xy + u_xlat1.xy;
    u_xlat9.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat9.xy;
    u_xlat4 = texture(_Diffuse, u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat18.x = u_xlat9.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    { bool cond = _InvertDissolve==1.0; u_xlat27 = uintBitsToFloat(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlat27 = uintBitsToFloat((_InvertDissolve==1.0) ? 0xFFFFFFFFu : uint(0));
#endif
    if(floatBitsToUint(u_xlat27) != uint(0)) {
        u_xlat16_27 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat27 = (-u_xlat16_27) + 1.0;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(_InvertDissolve<1.0);
#else
        u_xlatb19 = _InvertDissolve<1.0;
#endif
        if(u_xlatb19){
            u_xlat27 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat9.x = (-u_xlat9.x) * 1.41421354 + u_xlat27;
    u_xlat9.x = _WipeNoiseWidth * u_xlat9.x + u_xlat18.x;
    u_xlat9.x = u_xlat9.x + _Dissolve;
    u_xlat9.x = u_xlat1.w + u_xlat9.x;
    u_xlat9.x = (-u_xlat9.x) + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat18.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat18.x) + u_xlat0;
    u_xlat9.x = (-u_xlat18.x) + u_xlat9.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat9.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat16_5 = texture(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat16_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat18.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat18.x;
    u_xlat18.x = log2(u_xlat1.x);
    u_xlat18.x = u_xlat18.x * _EdgePower;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat16_1 * u_xlat3;
    u_xlat5.xyw = u_xlat3.yzx * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16_7.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb18 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_16.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat5.yx;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat6.xy = u_xlat3.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat1.xy);
    u_xlat6.z = float(1.0);
    u_xlat6.w = float(-1.0);
    u_xlat1 = u_xlat16_16.xxxx * u_xlat6 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat5.w>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat5.w>=u_xlat1.x;
#endif
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat5.wyx;
    u_xlat1 = (-u_xlat5) + u_xlat1;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat5;
    u_xlat18.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat2.x = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat27 = u_xlat27 / u_xlat2.x;
    u_xlat27 = u_xlat27 + u_xlat1.z;
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat18.x = u_xlat18.x / u_xlat2.x;
    u_xlat16_16.x = abs(u_xlat27) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb27 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb27)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat16_34 = u_xlat18.x * _HSV_Vector.y;
    u_xlat3.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat3.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
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
    u_xlat18.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat18.xy = u_xlat2.zw + u_xlat18.xy;
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat18.xy = u_xlat18.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat18.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat18.xy, u_xlat4.xy);
    u_xlat18.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat18.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat18.xy;
    u_xlat16_18 = texture(_Mask, u_xlat18.xy).x;
    u_xlat0 = (-u_xlat9.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat3.w;
    u_xlat9.x = u_xlat16_18 * _Alpha;
    u_xlat0 = u_xlat9.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
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
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveR_NoiseG;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _RampColor;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
bool u_xlatb19;
mediump vec2 u_xlat16_25;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat27 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat27 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat27;
    u_xlat9.xy = u_xlat9.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat27);
    u_xlat3.x = cos(u_xlat27);
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat9.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat9.xy, u_xlat4.xy);
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat9.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat16_27 = texture(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat27 = u_xlat16_27 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat16_1.x = texture(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat16_1.x * _NoiseMaskPower;
        u_xlat10.x = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat10.xy = u_xlat10.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat10.xy;
    } else {
        u_xlat27 = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat27) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat9.xy + u_xlat1.xy;
    u_xlat9.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat9.xy;
    u_xlat4 = texture(_Diffuse, u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat18.x = u_xlat9.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    { bool cond = _InvertDissolve==1.0; u_xlat27 = uintBitsToFloat(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlat27 = uintBitsToFloat((_InvertDissolve==1.0) ? 0xFFFFFFFFu : uint(0));
#endif
    if(floatBitsToUint(u_xlat27) != uint(0)) {
        u_xlat16_27 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat27 = (-u_xlat16_27) + 1.0;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(_InvertDissolve<1.0);
#else
        u_xlatb19 = _InvertDissolve<1.0;
#endif
        if(u_xlatb19){
            u_xlat27 = texture(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat9.x = (-u_xlat9.x) * 1.41421354 + u_xlat27;
    u_xlat9.x = _WipeNoiseWidth * u_xlat9.x + u_xlat18.x;
    u_xlat9.x = u_xlat9.x + _Dissolve;
    u_xlat9.x = u_xlat1.w + u_xlat9.x;
    u_xlat9.x = (-u_xlat9.x) + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat18.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat18.x) + u_xlat0;
    u_xlat9.x = (-u_xlat18.x) + u_xlat9.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat9.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat16_5 = texture(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat16_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat18.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat18.x;
    u_xlat18.x = log2(u_xlat1.x);
    u_xlat18.x = u_xlat18.x * _EdgePower;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat16_1 * u_xlat3;
    u_xlat5.xyw = u_xlat3.yzx * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16_7.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb18 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_16.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat5.yx;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat6.xy = u_xlat3.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat1.xy);
    u_xlat6.z = float(1.0);
    u_xlat6.w = float(-1.0);
    u_xlat1 = u_xlat16_16.xxxx * u_xlat6 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat5.w>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat5.w>=u_xlat1.x;
#endif
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat5.wyx;
    u_xlat1 = (-u_xlat5) + u_xlat1;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat5;
    u_xlat18.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat2.x = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat27 = u_xlat27 / u_xlat2.x;
    u_xlat27 = u_xlat27 + u_xlat1.z;
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat18.x = u_xlat18.x / u_xlat2.x;
    u_xlat16_16.x = abs(u_xlat27) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb27 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlat16_25.xy = (bool(u_xlatb27)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat16_34 = u_xlat18.x * _HSV_Vector.y;
    u_xlat3.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat3.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
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
    u_xlat18.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat18.xy = u_xlat2.zw + u_xlat18.xy;
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat18.xy = u_xlat18.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat18.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat18.xy, u_xlat4.xy);
    u_xlat18.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat18.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat18.xy;
    u_xlat16_18 = texture(_Mask, u_xlat18.xy).x;
    u_xlat0 = (-u_xlat9.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat3.w;
    u_xlat9.x = u_xlat16_18 * _Alpha;
    u_xlat0 = u_xlat9.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
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
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
uniform lowp sampler2D _DissolveR_NoiseG;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _RampColor;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
bool u_xlatb19;
mediump vec2 u_xlat16_25;
float u_xlat27;
lowp float u_xlat10_27;
bool u_xlatb27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat27 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat27 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat27;
    u_xlat9.xy = u_xlat9.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat27);
    u_xlat3.x = cos(u_xlat27);
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat9.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat9.xy, u_xlat4.xy);
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat9.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat10_27 = texture2D(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat27 = u_xlat10_27 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat10_1 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat10_1 * _NoiseMaskPower;
        u_xlat10.x = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat10.xy = u_xlat10.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat10.xy;
    } else {
        u_xlat27 = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat27) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat9.xy + u_xlat1.xy;
    u_xlat9.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat9.xy;
    u_xlat4 = texture2D(_Diffuse, u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat18.x = u_xlat9.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
    u_xlat27 = float((_InvertDissolve==1.0) ? -1 : 0);
    if(int(u_xlat27) != 0) {
        u_xlat10_27 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat27 = (-u_xlat10_27) + 1.0;
    } else {
        u_xlatb19 = _InvertDissolve<1.0;
        if(u_xlatb19){
            u_xlat27 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat9.x = (-u_xlat9.x) * 1.41421354 + u_xlat27;
    u_xlat9.x = _WipeNoiseWidth * u_xlat9.x + u_xlat18.x;
    u_xlat9.x = u_xlat9.x + _Dissolve;
    u_xlat9.x = u_xlat1.w + u_xlat9.x;
    u_xlat9.x = (-u_xlat9.x) + u_xlat4.w;
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat18.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat18.x) + u_xlat0;
    u_xlat9.x = (-u_xlat18.x) + u_xlat9.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat9.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat9.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat9.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat10_5 = texture2D(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat10_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat18.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat18.x;
    u_xlat18.x = log2(u_xlat1.x);
    u_xlat18.x = u_xlat18.x * _EdgePower;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat16_1 * u_xlat3;
    u_xlat5.xyw = u_xlat3.yzx * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16_7.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb18 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_16.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat5.yx;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat6.xy = u_xlat3.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat1.xy);
    u_xlat6.z = float(1.0);
    u_xlat6.w = float(-1.0);
    u_xlat1 = u_xlat16_16.xxxx * u_xlat6 + u_xlat1;
    u_xlatb18 = u_xlat5.w>=u_xlat1.x;
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat5.wyx;
    u_xlat1 = (-u_xlat5) + u_xlat1;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat5;
    u_xlat18.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat2.x = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat27 = u_xlat27 / u_xlat2.x;
    u_xlat27 = u_xlat27 + u_xlat1.z;
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat18.x = u_xlat18.x / u_xlat2.x;
    u_xlat16_16.x = abs(u_xlat27) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
    u_xlatb27 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlat16_25.xy = (bool(u_xlatb27)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat16_34 = u_xlat18.x * _HSV_Vector.y;
    u_xlat3.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat3.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
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
    u_xlat18.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat18.xy = u_xlat2.zw + u_xlat18.xy;
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat18.xy = u_xlat18.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat18.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat18.xy, u_xlat4.xy);
    u_xlat18.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat18.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat18.xy;
    u_xlat10_18 = texture2D(_Mask, u_xlat18.xy).x;
    u_xlat0 = (-u_xlat9.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat3.w;
    u_xlat9.x = u_xlat10_18 * _Alpha;
    u_xlat0 = u_xlat9.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
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
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
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
    vs_TEXCOORD3.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _DiffuseColor;
uniform 	float _WipeEdgeOn;
uniform 	float _RampColorOn;
uniform 	float _SoftEdge;
uniform 	float _Noise_On;
uniform 	vec4 _Diffuse_SpeedAndRotator;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Custom;
uniform 	float _NoiseMaskOn;
uniform 	float _Noise_G_SpeedX;
uniform 	float _Noise_G_SpeedY;
uniform 	vec4 _Noise_G_Tiling_Center;
uniform 	float _NoiseOffset;
uniform 	float _NoisePower;
uniform 	vec4 _NoiseMask_ScaleAndOffset;
uniform 	float _NoiseMaskPower;
uniform 	float _InvertDissolve;
uniform 	vec4 _DissolveCenterAndSpeed;
uniform 	vec4 _DissolveR_NoiseG_ST;
uniform 	float _WipeNoiseWidth;
uniform 	float _Dissolve;
uniform 	float _RampOffset;
uniform 	vec4 _EdgeColor;
uniform 	float _SoftEdgeColorPower;
uniform 	float _SoftEdgeAlphaPower;
uniform 	float _EdgePower;
uniform 	float _ColorPower;
uniform 	vec4 _PanelClipInfo;
uniform 	float _Alpha;
uniform 	vec4 _Mask_SpeedAndRotator;
uniform 	vec4 _Mask_ST;
uniform lowp sampler2D _DissolveR_NoiseG;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _RampColor;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec2 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_16;
vec2 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
bool u_xlatb19;
mediump vec2 u_xlat16_25;
float u_xlat27;
lowp float u_xlat10_27;
bool u_xlatb27;
mediump float u_xlat16_34;
void main()
{
    u_xlat0 = _SoftEdge * 0.5 + 0.5;
    u_xlat9.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb1.xy = equal(vec4(_Custom, _NoiseMaskOn, _Custom, _Custom), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat2 = u_xlatb1.x ? vs_TEXCOORD1 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat27 = _Time.y * _Diffuse_SpeedAndRotator.w;
    u_xlat27 = _Diffuse_SpeedAndRotator.z * 6.28318501 + u_xlat27;
    u_xlat9.xy = u_xlat9.xy + u_xlat2.xy;
    u_xlat2.x = sin(u_xlat27);
    u_xlat3.x = cos(u_xlat27);
    u_xlat9.xy = u_xlat9.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat9.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat9.xy, u_xlat4.xy);
    u_xlat9.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat9.xy = _Diffuse_SpeedAndRotator.xy * _Time.yy + u_xlat9.xy;
    u_xlat1.xzw = u_xlatb1.x ? vs_TEXCOORD2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat1.xz = u_xlat1.xz + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_Noise_G_SpeedX, _Noise_G_SpeedY);
    u_xlat1.xz = u_xlat1.xz * _Noise_G_Tiling_Center.xy + u_xlat2.xy;
    u_xlat10_27 = texture2D(_DissolveR_NoiseG, u_xlat1.xz).y;
    u_xlat27 = u_xlat10_27 + (-_NoiseOffset);
    if(u_xlatb1.y){
        u_xlat1.xy = vs_TEXCOORD0.xy + _NoiseMask_ScaleAndOffset.zw;
        u_xlat1.xy = u_xlat1.xy / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = vec2(1.0, 1.0) / _NoiseMask_ScaleAndOffset.xy;
        u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
        u_xlat1.xy = (-u_xlat2.xy) * vec2(0.5, 0.5) + u_xlat1.xy;
        u_xlat10_1 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).z;
        u_xlat1.x = u_xlat10_1 * _NoiseMaskPower;
        u_xlat10.x = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat10.xy = u_xlat10.xx * (-u_xlat2.xy);
        u_xlat1.xy = u_xlat1.xx * u_xlat10.xy;
    } else {
        u_xlat27 = u_xlat27 * _NoisePower;
        u_xlat2.xy = vs_TEXCOORD0.xy + (-_Noise_G_Tiling_Center.zw);
        u_xlat1.xy = vec2(u_xlat27) * (-u_xlat2.xy);
    }
    u_xlatb3.xyz = equal(vec4(_Noise_On, _RampColorOn, _WipeEdgeOn, _Noise_On), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat1.xy = u_xlat9.xy + u_xlat1.xy;
    u_xlat9.xy = (u_xlatb3.x) ? u_xlat1.xy : u_xlat9.xy;
    u_xlat4 = texture2D(_Diffuse, u_xlat9.xy);
    u_xlat9.xy = vs_TEXCOORD0.xy + (-_DissolveCenterAndSpeed.xy);
    u_xlat9.x = dot(u_xlat9.xy, u_xlat9.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat18.x = u_xlat9.x * 1.41421354;
    u_xlat1.xy = vs_TEXCOORD0.xy * _DissolveR_NoiseG_ST.xy + _DissolveR_NoiseG_ST.zw;
    u_xlat1.xy = _Time.yy * _DissolveCenterAndSpeed.zw + u_xlat1.xy;
    u_xlat27 = float((_InvertDissolve==1.0) ? -1 : 0);
    if(int(u_xlat27) != 0) {
        u_xlat10_27 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        u_xlat27 = (-u_xlat10_27) + 1.0;
    } else {
        u_xlatb19 = _InvertDissolve<1.0;
        if(u_xlatb19){
            u_xlat27 = texture2D(_DissolveR_NoiseG, u_xlat1.xy).x;
        }
    }
    u_xlat9.x = (-u_xlat9.x) * 1.41421354 + u_xlat27;
    u_xlat9.x = _WipeNoiseWidth * u_xlat9.x + u_xlat18.x;
    u_xlat9.x = u_xlat9.x + _Dissolve;
    u_xlat9.x = u_xlat1.w + u_xlat9.x;
    u_xlat9.x = (-u_xlat9.x) + u_xlat4.w;
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
    u_xlat18.x = (-u_xlat0) + 1.0;
    u_xlat0 = (-u_xlat18.x) + u_xlat0;
    u_xlat9.x = (-u_xlat18.x) + u_xlat9.x;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat9.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat9.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = u_xlat0 * u_xlat9.x;
    if(u_xlatb3.y){
        u_xlat1.y = _RampOffset;
        u_xlat10_5 = texture2D(_RampColor, u_xlat1.xy);
        u_xlat5 = u_xlat10_5 * _EdgeColor;
    } else {
        u_xlat5 = _EdgeColor;
    }
    u_xlat6.xyz = u_xlat5.xyz * vec3(_SoftEdgeColorPower);
    u_xlat18.x = u_xlat5.w * _SoftEdgeAlphaPower;
    u_xlat6.w = u_xlat4.w * u_xlat18.x;
    u_xlat18.x = log2(u_xlat1.x);
    u_xlat18.x = u_xlat18.x * _EdgePower;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat1 = u_xlat4 + (-u_xlat6);
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat6;
    u_xlat16_1 = (u_xlatb3.z) ? u_xlat1 : u_xlat4;
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat16_1 * u_xlat3;
    u_xlat5.xyw = u_xlat3.yzx * vec3(vec3(_ColorPower, _ColorPower, _ColorPower));
    u_xlat16_7.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb18 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_16.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat5.yx;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat6.xy = u_xlat3.yz * vec2(vec2(_ColorPower, _ColorPower)) + (-u_xlat1.xy);
    u_xlat6.z = float(1.0);
    u_xlat6.w = float(-1.0);
    u_xlat1 = u_xlat16_16.xxxx * u_xlat6 + u_xlat1;
    u_xlatb18 = u_xlat5.w>=u_xlat1.x;
    u_xlat18.x = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat5.wyx;
    u_xlat1 = (-u_xlat5) + u_xlat1;
    u_xlat1 = u_xlat18.xxxx * u_xlat1 + u_xlat5;
    u_xlat18.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat2.x = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat27 = u_xlat27 / u_xlat2.x;
    u_xlat27 = u_xlat27 + u_xlat1.z;
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat18.x = u_xlat18.x / u_xlat2.x;
    u_xlat16_16.x = abs(u_xlat27) + _HSV_Vector.x;
    u_xlat16_25.x = u_xlat16_16.x * 360.0;
    u_xlatb27 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlat16_25.xy = (bool(u_xlatb27)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_16.x = u_xlat16_25.y * u_xlat16_16.x;
    u_xlat16_16.x = fract(u_xlat16_16.x);
    u_xlat16_34 = u_xlat18.x * _HSV_Vector.y;
    u_xlat3.xyz = u_xlat16_25.xxx * u_xlat16_16.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_16.xyz = u_xlat3.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_7.x = u_xlat16_7.x + (-_SaturateWeights.y);
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
    u_xlat18.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.x = _Time.y * _Mask_SpeedAndRotator.w;
    u_xlat2.x = _Mask_SpeedAndRotator.z * 6.28318501 + u_xlat2.x;
    u_xlat18.xy = u_xlat2.zw + u_xlat18.xy;
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat18.xy = u_xlat18.xy + vec2(-0.5, -0.5);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat2.x = dot(u_xlat18.xy, u_xlat4.yz);
    u_xlat2.y = dot(u_xlat18.xy, u_xlat4.xy);
    u_xlat18.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat18.xy = _Mask_SpeedAndRotator.xy * _Time.yy + u_xlat18.xy;
    u_xlat10_18 = texture2D(_Mask, u_xlat18.xy).x;
    u_xlat0 = (-u_xlat9.x) * u_xlat0 + 1.0;
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _EdgePower;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = u_xlat0 * u_xlat4.w;
    u_xlat0 = u_xlat0 * u_xlat3.w;
    u_xlat9.x = u_xlat10_18 * _Alpha;
    u_xlat0 = u_xlat9.x * u_xlat0;
    u_xlat16_7.xy = vs_TEXCOORD3.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_7.x = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    SV_Target0.w = u_xlat0 * u_xlat16_7.x;
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
CustomEditor "CodeGenShaderGUI.VX_RadialWipeGUI"
}