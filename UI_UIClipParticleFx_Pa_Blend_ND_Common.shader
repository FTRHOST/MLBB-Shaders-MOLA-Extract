//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UIClipParticleFx_Pa_Blend_ND_Common" {
Properties {

[Space(15)] [Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

[Space(15)] [Header(Texture(2D)________________________________________________________________________)] [Space(5)] [Toggle(_SCREENUV)] _ScreenUV ("DiffScreenUV", Float) = 0.0

_ScreenTileOffset ("DiffScreenTileOffset", Vector) = (1,1,0,0)

[Space(10)] [Toggle(OpenCustom)] _OpenCustom ("开启CustomData", Float) = 0.0

[Toggle(UnMult)] _UnMult ("UnMult去黑", Float) = 0.0

[Space(10)] _DiffuseColor ("TextureColor", Color) = (1,1,1,1)

_Diffuse ("Texture2D", 2D) = "white" { }

_DiffusePower ("TextureePower", Float) = 1.0

_DiffAngle ("Texture旋转", Float) = 0.0

_DiffXSpeed ("TexSpeedU", Float) = 0.0

_DiffYSpeed ("TexSpeedV", Float) = 0.0

[Space(15)] [Header(Dissolve And Noise________________________________________________________________________)] [Space(10)] _DissolveTex ("溶解和Noise", 2D) = "white" { }

_DissolveStep ("溶解", Float) = 0.0

_SoftSize ("溶解软硬", Range(0, 2)) = 0.0

[Space(10)] [Toggle] _NoiseUnEffectDiff ("Noise不影响主贴图", Float) = 0.0

_DissolveOutlineWidth ("溶解边缘", Range(0, 0.5)) = 0.0010000000474974513

_DissolveOutlineSoft ("溶解边缘_软硬", Range(0, 0.5)) = 0.0

_DissolveColorPW ("溶解边缘_强度", Float) = 1.0

_DissolveColor ("溶解边缘_颜色", Color) = (1,1,1,1)

[Space(10)] _NoiseXStreng ("扭曲强度U", Range(-10, 10)) = 0.0

_NoiseYStreng ("扭曲强度V", Range(-10, 10)) = 0.0

_GChannel ("G通xy控Tiling zw控速度", Vector) = (1,1,0,0)

[Space(15)] [Header(Mask________________________________________________________________________)] [Space(10)] _Mask ("Mask", 2D) = "white" { }

[Toggle] _MaskNotEffectDiff ("MaskNotEffectDiff", Float) = 0.0

_NoiseEffectMaskStreng ("NoiseEffectMaskStreng", Range(0, 1)) = 1.0

_MaskXSpeed ("MaskSpeedU", Float) = 0.0

_MaskYSpeed ("MaskSpeedV", Float) = 0.0

[Space(15)] [Header(Gradient________________________________________________________________________)] [Space(10)] [Toggle(_GRADIENT_ON)] _GRADIENT_ON ("左右渐变颜色开关(禁动画中K开关)", Float) = 0.0

[Toggle(_GRADIENT_SAME_DIFF_ON)] _GRADIENT_SAME_DIFF_ON ("左右渐变开启Diff相同UV(禁动画中K开关)", Float) = 0.0

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_LeftWeights ("左侧渐变色权重", Range(0, 1)) = 0.0

_RightWeights ("右侧渐变色权重", Range(0, 1)) = 1.0

_Gradient ("渐变色权重偏移", Range(-1, 1)) = 0.0

[Toggle] _IsGray ("IsGray", Float) = 0.0

_TransparentStrong ("TransparentStrong", Float) = 1.0

_IsInvertGray ("IsInvertGray", Float) = 0.0

[Space(15)] [Header(ColorAdjust________________________________________________________________________)] [Space(10)] [Toggle(_COLOUR_ON)] _COLOUR_ON ("色彩开关(禁动画中K开关)", Float) = 0.0

_Hue ("色相", Range(-0.5, 0.5)) = 0.0

_Saturation ("饱和度", Range(0, 2)) = 1.0

_Contrast ("对比度", Range(0, 2)) = 1.0

_SaturRightColor ("灰度渐变亮色", Color) = (1,1,1,1)

_SaturLeftColor ("灰度渐变暗色", Color) = (1,1,1,1)

_SaturRightColorWeights ("灰度渐变亮色权重", Range(0.5, 1)) = 1.0

_SaturLeftColorWeights ("灰度渐变暗色权重", Range(0, 0.5)) = 0.0

[Header(OtherSettings__________________________________________________________________________________)] [Space(10)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

_PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

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
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 54315
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb14) ? u_xlat0.x : u_xlat16_2.w;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat14.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat14.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat14.xy = max(u_xlat14.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat1.x = u_xlat14.y + (-_DissolveOutlineWidth);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat21 = (-u_xlat14.y) + u_xlat16_7;
    u_xlat7.x = (-u_xlat14.x) + u_xlat16_7;
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_IsGray<1.0);
#else
    u_xlatb1.x = _IsGray<1.0;
#endif
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : u_xlat16_5.xyz;
    u_xlat7.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat7.x : u_xlat0.x;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_2 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb14) ? u_xlat0.x : u_xlat16_2.w;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat14.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat14.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat14.xy = max(u_xlat14.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat1.x = u_xlat14.y + (-_DissolveOutlineWidth);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat21 = (-u_xlat14.y) + u_xlat16_7;
    u_xlat7.x = (-u_xlat14.x) + u_xlat16_7;
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_IsGray<1.0);
#else
    u_xlatb1.x = _IsGray<1.0;
#endif
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : u_xlat16_5.xyz;
    u_xlat7.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat7.x : u_xlat0.x;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_2 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb14) ? u_xlat0.x : u_xlat10_2.w;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat14.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat14.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat14.xy = max(u_xlat14.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat1.x = u_xlat14.y + (-_DissolveOutlineWidth);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat21 = (-u_xlat14.y) + u_xlat10_7;
    u_xlat7.x = (-u_xlat14.x) + u_xlat10_7;
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xyz;
    u_xlatb1.x = _IsGray<1.0;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : u_xlat16_5.xyz;
    u_xlat7.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat7.x : u_xlat0.x;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb14) ? u_xlat0.x : u_xlat10_2.w;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat14.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat14.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat14.xy = max(u_xlat14.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat1.x = u_xlat14.y + (-_DissolveOutlineWidth);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat21 = (-u_xlat14.y) + u_xlat10_7;
    u_xlat7.x = (-u_xlat14.x) + u_xlat10_7;
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xyz;
    u_xlatb1.x = _IsGray<1.0;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : u_xlat16_5.xyz;
    u_xlat7.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat7.x : u_xlat0.x;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.w;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture(_Mask, u_xlat6.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat6.x = (u_xlatb12) ? 1.0 : u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat6.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat12.xy = max(u_xlat12.xy, vec2(0.0, 0.0));
    u_xlat12.xy = u_xlat12.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat12.y + (-_DissolveOutlineWidth);
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat18 = (-u_xlat12.y) + u_xlat16_6;
    u_xlat6.x = (-u_xlat12.x) + u_xlat16_6;
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat6.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat6.x = u_xlat6.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb1.x) ? u_xlat16_4.xxx : u_xlat6.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb1.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_IsGray<1.0);
#else
    u_xlatb1.x = _IsGray<1.0;
#endif
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat6.xyz : u_xlat16_4.xyz;
    u_xlat6.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat6.x : u_xlat0.x;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_2 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.w;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture(_Mask, u_xlat6.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat6.x = (u_xlatb12) ? 1.0 : u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat6.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat12.xy = max(u_xlat12.xy, vec2(0.0, 0.0));
    u_xlat12.xy = u_xlat12.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat12.y + (-_DissolveOutlineWidth);
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat18 = (-u_xlat12.y) + u_xlat16_6;
    u_xlat6.x = (-u_xlat12.x) + u_xlat16_6;
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat6.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat6.x = u_xlat6.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb1.x) ? u_xlat16_4.xxx : u_xlat6.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb1.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_IsGray<1.0);
#else
    u_xlatb1.x = _IsGray<1.0;
#endif
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat6.xyz : u_xlat16_4.xyz;
    u_xlat6.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat6.x : u_xlat0.x;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_2 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
bool u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat10_1.w;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture2D(_Mask, u_xlat6.xy).x;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat6.x = (u_xlatb12) ? 1.0 : u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat6.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat12.xy = max(u_xlat12.xy, vec2(0.0, 0.0));
    u_xlat12.xy = u_xlat12.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat12.y + (-_DissolveOutlineWidth);
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat18 = (-u_xlat12.y) + u_xlat10_6;
    u_xlat6.x = (-u_xlat12.x) + u_xlat10_6;
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat6.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat6.x = u_xlat6.x * u_xlat18;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb1.x) ? u_xlat16_4.xxx : u_xlat6.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb1.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
    u_xlatb1.x = _IsGray<1.0;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat6.xyz : u_xlat16_4.xyz;
    u_xlat6.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat6.x : u_xlat0.x;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
bool u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat10_1.w;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture2D(_Mask, u_xlat6.xy).x;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat6.x = (u_xlatb12) ? 1.0 : u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat6.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat12.xy = max(u_xlat12.xy, vec2(0.0, 0.0));
    u_xlat12.xy = u_xlat12.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat12.y + (-_DissolveOutlineWidth);
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat18 = (-u_xlat12.y) + u_xlat10_6;
    u_xlat6.x = (-u_xlat12.x) + u_xlat10_6;
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat6.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat6.x = u_xlat6.x * u_xlat18;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb1.x) ? u_xlat16_4.xxx : u_xlat6.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb1.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
    u_xlatb1.x = _IsGray<1.0;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat6.xyz : u_xlat16_4.xyz;
    u_xlat6.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat6.x : u_xlat0.x;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb14) ? u_xlat0.x : u_xlat16_2.w;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat14.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat14.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat14.xy = max(u_xlat14.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat1.x = u_xlat14.y + (-_DissolveOutlineWidth);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat21 = (-u_xlat14.y) + u_xlat16_7;
    u_xlat7.x = (-u_xlat14.x) + u_xlat16_7;
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_IsGray<1.0);
#else
    u_xlatb1.x = _IsGray<1.0;
#endif
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : u_xlat16_5.xyz;
    u_xlat7.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat7.x : u_xlat0.x;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb14) ? u_xlat0.x : u_xlat16_2.w;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat14.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat14.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat14.xy = max(u_xlat14.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat1.x = u_xlat14.y + (-_DissolveOutlineWidth);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat21 = (-u_xlat14.y) + u_xlat16_7;
    u_xlat7.x = (-u_xlat14.x) + u_xlat16_7;
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_IsGray<1.0);
#else
    u_xlatb1.x = _IsGray<1.0;
#endif
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : u_xlat16_5.xyz;
    u_xlat7.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat7.x : u_xlat0.x;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb14) ? u_xlat0.x : u_xlat10_2.w;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat14.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat14.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat14.xy = max(u_xlat14.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat1.x = u_xlat14.y + (-_DissolveOutlineWidth);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat21 = (-u_xlat14.y) + u_xlat10_7;
    u_xlat7.x = (-u_xlat14.x) + u_xlat10_7;
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xyz;
    u_xlatb1.x = _IsGray<1.0;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : u_xlat16_5.xyz;
    u_xlat7.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat7.x : u_xlat0.x;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb14) ? u_xlat0.x : u_xlat10_2.w;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat14.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat14.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat14.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat14.xy = max(u_xlat14.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat1.x = u_xlat14.y + (-_DissolveOutlineWidth);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat21 = (-u_xlat14.y) + u_xlat10_7;
    u_xlat7.x = (-u_xlat14.x) + u_xlat10_7;
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_5.xyz;
    u_xlatb1.x = _IsGray<1.0;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : u_xlat16_5.xyz;
    u_xlat7.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat7.x : u_xlat0.x;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.w;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture(_Mask, u_xlat6.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat6.x = (u_xlatb12) ? 1.0 : u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat6.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat12.xy = max(u_xlat12.xy, vec2(0.0, 0.0));
    u_xlat12.xy = u_xlat12.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat12.y + (-_DissolveOutlineWidth);
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat18 = (-u_xlat12.y) + u_xlat16_6;
    u_xlat6.x = (-u_xlat12.x) + u_xlat16_6;
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat6.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat6.x = u_xlat6.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb1.x) ? u_xlat16_4.xxx : u_xlat6.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb1.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_IsGray<1.0);
#else
    u_xlatb1.x = _IsGray<1.0;
#endif
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat6.xyz : u_xlat16_4.xyz;
    u_xlat6.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat6.x : u_xlat0.x;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.w;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture(_Mask, u_xlat6.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat6.x = (u_xlatb12) ? 1.0 : u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat6.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat12.xy = max(u_xlat12.xy, vec2(0.0, 0.0));
    u_xlat12.xy = u_xlat12.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat12.y + (-_DissolveOutlineWidth);
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat18 = (-u_xlat12.y) + u_xlat16_6;
    u_xlat6.x = (-u_xlat12.x) + u_xlat16_6;
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat6.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat6.x = u_xlat6.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb1.x) ? u_xlat16_4.xxx : u_xlat6.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb1.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_IsGray<1.0);
#else
    u_xlatb1.x = _IsGray<1.0;
#endif
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat6.xyz : u_xlat16_4.xyz;
    u_xlat6.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat6.x : u_xlat0.x;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
bool u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat10_1.w;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture2D(_Mask, u_xlat6.xy).x;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat6.x = (u_xlatb12) ? 1.0 : u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat6.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat12.xy = max(u_xlat12.xy, vec2(0.0, 0.0));
    u_xlat12.xy = u_xlat12.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat12.y + (-_DissolveOutlineWidth);
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat18 = (-u_xlat12.y) + u_xlat10_6;
    u_xlat6.x = (-u_xlat12.x) + u_xlat10_6;
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat6.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat6.x = u_xlat6.x * u_xlat18;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb1.x) ? u_xlat16_4.xxx : u_xlat6.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb1.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
    u_xlatb1.x = _IsGray<1.0;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat6.xyz : u_xlat16_4.xyz;
    u_xlat6.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat6.x : u_xlat0.x;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
bool u_xlatb6;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat10_1.w;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture2D(_Mask, u_xlat6.xy).x;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat6.x = (u_xlatb12) ? 1.0 : u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat6.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat12.xy = max(u_xlat12.xy, vec2(0.0, 0.0));
    u_xlat12.xy = u_xlat12.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat12.y + (-_DissolveOutlineWidth);
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat18 = (-u_xlat12.y) + u_xlat10_6;
    u_xlat6.x = (-u_xlat12.x) + u_xlat10_6;
    u_xlat12.x = (-u_xlat12.x) + u_xlat19;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat6.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat6.x = u_xlat6.x * u_xlat18;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat12.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb1.x) ? u_xlat16_4.xxx : u_xlat6.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb1.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
    u_xlatb1.x = _IsGray<1.0;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat6.xyz : u_xlat16_4.xyz;
    u_xlat6.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.w = (u_xlatb1.x) ? u_xlat6.x : u_xlat0.x;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_2 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb14.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb14.x) ? u_xlat0.x : u_xlat16_2.w;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat14.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb1 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_26 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat14.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat14.x = float(1.0);
    u_xlat14.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat14.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat16_5.x>=u_xlat1.x);
#else
    u_xlatb14.x = u_xlat16_5.x>=u_xlat1.x;
#endif
    u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
    u_xlat21 = u_xlat14.x * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyz = u_xlat14.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat14.x = min(u_xlat21, u_xlat1.y);
    u_xlat21 = u_xlat21 + (-u_xlat1.y);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat8.x = u_xlat14.x * 6.0 + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat8.x;
    u_xlat21 = u_xlat21 + u_xlat1.z;
    u_xlat16_5.x = abs(u_xlat21) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb21 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat1.x + 1.00000001e-10;
    u_xlat14.x = u_xlat14.x / u_xlat21;
    u_xlat16_5.x = u_xlat14.x * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat14.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_IsGray<1.0);
#else
    u_xlatb1 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb14.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb14.x) ? u_xlat0.x : u_xlat16_2.w;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat14.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb1 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_26 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat14.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat14.x = float(1.0);
    u_xlat14.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat14.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat16_5.x>=u_xlat1.x);
#else
    u_xlatb14.x = u_xlat16_5.x>=u_xlat1.x;
#endif
    u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
    u_xlat21 = u_xlat14.x * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyz = u_xlat14.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat14.x = min(u_xlat21, u_xlat1.y);
    u_xlat21 = u_xlat21 + (-u_xlat1.y);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat8.x = u_xlat14.x * 6.0 + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat8.x;
    u_xlat21 = u_xlat21 + u_xlat1.z;
    u_xlat16_5.x = abs(u_xlat21) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb21 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat1.x + 1.00000001e-10;
    u_xlat14.x = u_xlat14.x / u_xlat21;
    u_xlat16_5.x = u_xlat14.x * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat14.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_IsGray<1.0);
#else
    u_xlatb1 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb14.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb14.x) ? u_xlat0.x : u_xlat10_2.w;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = u_xlat10_2.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture2D(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat14.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
    u_xlatb1 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_26 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat14.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat14.x = float(1.0);
    u_xlat14.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat14.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
    u_xlatb14.x = u_xlat16_5.x>=u_xlat1.x;
    u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
    u_xlat21 = u_xlat14.x * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyz = u_xlat14.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat14.x = min(u_xlat21, u_xlat1.y);
    u_xlat21 = u_xlat21 + (-u_xlat1.y);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat8.x = u_xlat14.x * 6.0 + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat8.x;
    u_xlat21 = u_xlat21 + u_xlat1.z;
    u_xlat16_5.x = abs(u_xlat21) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
    u_xlatb21 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat1.x + 1.00000001e-10;
    u_xlat14.x = u_xlat14.x / u_xlat21;
    u_xlat16_5.x = u_xlat14.x * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat14.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat14.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlatb1 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb14.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb14.x) ? u_xlat0.x : u_xlat10_2.w;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = u_xlat10_2.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture2D(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat14.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
    u_xlatb1 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_26 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat14.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat14.x = float(1.0);
    u_xlat14.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat14.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
    u_xlatb14.x = u_xlat16_5.x>=u_xlat1.x;
    u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
    u_xlat21 = u_xlat14.x * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyz = u_xlat14.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat14.x = min(u_xlat21, u_xlat1.y);
    u_xlat21 = u_xlat21 + (-u_xlat1.y);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat8.x = u_xlat14.x * 6.0 + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat8.x;
    u_xlat21 = u_xlat21 + u_xlat1.z;
    u_xlat16_5.x = abs(u_xlat21) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
    u_xlatb21 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat1.x + 1.00000001e-10;
    u_xlat14.x = u_xlat14.x / u_xlat21;
    u_xlat16_5.x = u_xlat14.x * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat14.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat14.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlatb1 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.w;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture(_Mask, u_xlat6.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat6.x = (u_xlatb12.x) ? 1.0 : u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat12.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
    u_xlatb1 = u_xlat16_4.y>=u_xlat16_4.z;
#endif
    u_xlat16_22 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat12.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat12.x = float(1.0);
    u_xlat12.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat12.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(u_xlat16_4.x>=u_xlat1.x);
#else
    u_xlatb12.x = u_xlat16_4.x>=u_xlat1.x;
#endif
    u_xlat12.x = u_xlatb12.x ? 1.0 : float(0.0);
    u_xlat18 = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat18, u_xlat1.y);
    u_xlat18 = u_xlat18 + (-u_xlat1.y);
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat7.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat7.x;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat16_4.x = abs(u_xlat18) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb18 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat18;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat2.w = u_xlat6.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_IsGray<1.0);
#else
    u_xlatb1 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.w;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture(_Mask, u_xlat6.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat6.x = (u_xlatb12.x) ? 1.0 : u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat12.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
    u_xlatb1 = u_xlat16_4.y>=u_xlat16_4.z;
#endif
    u_xlat16_22 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat12.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat12.x = float(1.0);
    u_xlat12.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat12.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(u_xlat16_4.x>=u_xlat1.x);
#else
    u_xlatb12.x = u_xlat16_4.x>=u_xlat1.x;
#endif
    u_xlat12.x = u_xlatb12.x ? 1.0 : float(0.0);
    u_xlat18 = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat18, u_xlat1.y);
    u_xlat18 = u_xlat18 + (-u_xlat1.y);
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat7.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat7.x;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat16_4.x = abs(u_xlat18) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb18 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat18;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat2.w = u_xlat6.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_IsGray<1.0);
#else
    u_xlatb1 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat10_1.w;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture2D(_Mask, u_xlat6.xy).x;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat6.x = (u_xlatb12.x) ? 1.0 : u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat10_1.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture2D(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat12.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
    u_xlatb1 = u_xlat16_4.y>=u_xlat16_4.z;
    u_xlat16_22 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat12.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat12.x = float(1.0);
    u_xlat12.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat12.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
    u_xlatb12.x = u_xlat16_4.x>=u_xlat1.x;
    u_xlat12.x = u_xlatb12.x ? 1.0 : float(0.0);
    u_xlat18 = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat18, u_xlat1.y);
    u_xlat18 = u_xlat18 + (-u_xlat1.y);
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat7.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat7.x;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat16_4.x = abs(u_xlat18) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
    u_xlatb18 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat18;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat2.w = u_xlat6.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlatb1 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat10_1.w;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture2D(_Mask, u_xlat6.xy).x;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat6.x = (u_xlatb12.x) ? 1.0 : u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat10_1.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture2D(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat12.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
    u_xlatb1 = u_xlat16_4.y>=u_xlat16_4.z;
    u_xlat16_22 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat12.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat12.x = float(1.0);
    u_xlat12.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat12.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
    u_xlatb12.x = u_xlat16_4.x>=u_xlat1.x;
    u_xlat12.x = u_xlatb12.x ? 1.0 : float(0.0);
    u_xlat18 = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat18, u_xlat1.y);
    u_xlat18 = u_xlat18 + (-u_xlat1.y);
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat7.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat7.x;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat16_4.x = abs(u_xlat18) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
    u_xlatb18 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat18;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat2.w = u_xlat6.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlatb1 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb14.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb14.x) ? u_xlat0.x : u_xlat16_2.w;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat14.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb1 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_26 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat14.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat14.x = float(1.0);
    u_xlat14.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat14.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat16_5.x>=u_xlat1.x);
#else
    u_xlatb14.x = u_xlat16_5.x>=u_xlat1.x;
#endif
    u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
    u_xlat21 = u_xlat14.x * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyz = u_xlat14.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat14.x = min(u_xlat21, u_xlat1.y);
    u_xlat21 = u_xlat21 + (-u_xlat1.y);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat8.x = u_xlat14.x * 6.0 + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat8.x;
    u_xlat21 = u_xlat21 + u_xlat1.z;
    u_xlat16_5.x = abs(u_xlat21) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb21 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat1.x + 1.00000001e-10;
    u_xlat14.x = u_xlat14.x / u_xlat21;
    u_xlat16_5.x = u_xlat14.x * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat14.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_IsGray<1.0);
#else
    u_xlatb1 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb14.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb14.x) ? u_xlat0.x : u_xlat16_2.w;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat14.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb1 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_26 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat14.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat14.x = float(1.0);
    u_xlat14.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat14.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(u_xlat16_5.x>=u_xlat1.x);
#else
    u_xlatb14.x = u_xlat16_5.x>=u_xlat1.x;
#endif
    u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
    u_xlat21 = u_xlat14.x * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyz = u_xlat14.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat14.x = min(u_xlat21, u_xlat1.y);
    u_xlat21 = u_xlat21 + (-u_xlat1.y);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat8.x = u_xlat14.x * 6.0 + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat8.x;
    u_xlat21 = u_xlat21 + u_xlat1.z;
    u_xlat16_5.x = abs(u_xlat21) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb21 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat1.x + 1.00000001e-10;
    u_xlat14.x = u_xlat14.x / u_xlat21;
    u_xlat16_5.x = u_xlat14.x * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat14.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_IsGray<1.0);
#else
    u_xlatb1 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb14.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb14.x) ? u_xlat0.x : u_xlat10_2.w;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = u_xlat10_2.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture2D(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat14.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
    u_xlatb1 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_26 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat14.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat14.x = float(1.0);
    u_xlat14.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat14.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
    u_xlatb14.x = u_xlat16_5.x>=u_xlat1.x;
    u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
    u_xlat21 = u_xlat14.x * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyz = u_xlat14.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat14.x = min(u_xlat21, u_xlat1.y);
    u_xlat21 = u_xlat21 + (-u_xlat1.y);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat8.x = u_xlat14.x * 6.0 + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat8.x;
    u_xlat21 = u_xlat21 + u_xlat1.z;
    u_xlat16_5.x = abs(u_xlat21) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
    u_xlatb21 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat1.x + 1.00000001e-10;
    u_xlat14.x = u_xlat14.x / u_xlat21;
    u_xlat16_5.x = u_xlat14.x * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat14.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat14.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlatb1 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat0.xz = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat0.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb14.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb14.x) ? u_xlat0.x : u_xlat10_2.w;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb21) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = u_xlat10_2.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture2D(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat14.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
    u_xlatb1 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_26 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat14.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat14.x = float(1.0);
    u_xlat14.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat14.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
    u_xlatb14.x = u_xlat16_5.x>=u_xlat1.x;
    u_xlat14.x = u_xlatb14.x ? 1.0 : float(0.0);
    u_xlat21 = u_xlat14.x * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyz = u_xlat14.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat14.x = min(u_xlat21, u_xlat1.y);
    u_xlat21 = u_xlat21 + (-u_xlat1.y);
    u_xlat14.x = (-u_xlat14.x) + u_xlat1.x;
    u_xlat8.x = u_xlat14.x * 6.0 + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat8.x;
    u_xlat21 = u_xlat21 + u_xlat1.z;
    u_xlat16_5.x = abs(u_xlat21) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
    u_xlatb21 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat1.x + 1.00000001e-10;
    u_xlat14.x = u_xlat14.x / u_xlat21;
    u_xlat16_5.x = u_xlat14.x * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat14.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat0.x = u_xlat14.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat14.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlatb1 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.w;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture(_Mask, u_xlat6.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat6.x = (u_xlatb12.x) ? 1.0 : u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat12.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
    u_xlatb1 = u_xlat16_4.y>=u_xlat16_4.z;
#endif
    u_xlat16_22 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat12.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat12.x = float(1.0);
    u_xlat12.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat12.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(u_xlat16_4.x>=u_xlat1.x);
#else
    u_xlatb12.x = u_xlat16_4.x>=u_xlat1.x;
#endif
    u_xlat12.x = u_xlatb12.x ? 1.0 : float(0.0);
    u_xlat18 = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat18, u_xlat1.y);
    u_xlat18 = u_xlat18 + (-u_xlat1.y);
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat7.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat7.x;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat16_4.x = abs(u_xlat18) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb18 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat18;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat2.w = u_xlat6.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_IsGray<1.0);
#else
    u_xlatb1 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat16_1.w;
    u_xlat6.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture(_Mask, u_xlat6.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat6.x = (u_xlatb12.x) ? 1.0 : u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_1.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat12.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
    u_xlatb1 = u_xlat16_4.y>=u_xlat16_4.z;
#endif
    u_xlat16_22 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat12.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat12.x = float(1.0);
    u_xlat12.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat12.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(u_xlat16_4.x>=u_xlat1.x);
#else
    u_xlatb12.x = u_xlat16_4.x>=u_xlat1.x;
#endif
    u_xlat12.x = u_xlatb12.x ? 1.0 : float(0.0);
    u_xlat18 = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat18, u_xlat1.y);
    u_xlat18 = u_xlat18 + (-u_xlat1.y);
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat7.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat7.x;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat16_4.x = abs(u_xlat18) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb18 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat18;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat2.w = u_xlat6.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_IsGray<1.0);
#else
    u_xlatb1 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat10_1.w;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture2D(_Mask, u_xlat6.xy).x;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat6.x = (u_xlatb12.x) ? 1.0 : u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat10_1.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture2D(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat12.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
    u_xlatb1 = u_xlat16_4.y>=u_xlat16_4.z;
    u_xlat16_22 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat12.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat12.x = float(1.0);
    u_xlat12.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat12.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
    u_xlatb12.x = u_xlat16_4.x>=u_xlat1.x;
    u_xlat12.x = u_xlatb12.x ? 1.0 : float(0.0);
    u_xlat18 = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat18, u_xlat1.y);
    u_xlat18 = u_xlat18 + (-u_xlat1.y);
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat7.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat7.x;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat16_4.x = abs(u_xlat18) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
    u_xlatb18 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat18;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat2.w = u_xlat6.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlatb1 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3.x = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat0.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat0.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat10_1.w;
    u_xlat6.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat2.xy;
    u_xlat6.xy = vec2(_NoiseEffectMaskStreng) * u_xlat6.xy + u_xlat2.xy;
    u_xlat6.xy = u_xlat6.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat6.x = texture2D(_Mask, u_xlat6.xy).x;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat6.x = (u_xlatb12.x) ? 1.0 : u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat10_1.x * u_xlat0.x + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture2D(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat12.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
    u_xlatb1 = u_xlat16_4.y>=u_xlat16_4.z;
    u_xlat16_22 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat12.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat12.x = float(1.0);
    u_xlat12.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat12.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
    u_xlatb12.x = u_xlat16_4.x>=u_xlat1.x;
    u_xlat12.x = u_xlatb12.x ? 1.0 : float(0.0);
    u_xlat18 = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat18, u_xlat1.y);
    u_xlat18 = u_xlat18 + (-u_xlat1.y);
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat7.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat7.x;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat16_4.x = abs(u_xlat18) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
    u_xlatb18 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat18;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat2.w = u_xlat6.x * u_xlat1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlatb1 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb1)) ? u_xlat0 : u_xlat2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat16_2.w;
    u_xlat15.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture(_Mask, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb14.x = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_26 = (u_xlatb14.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat16_26 + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat7.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat16_2.w;
    u_xlat15.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture(_Mask, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb14.x = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_26 = (u_xlatb14.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat16_26 + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat7.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat10_2.w;
    u_xlat15.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture2D(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlatb14.x = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_26 = (u_xlatb14.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat16_26 + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat7.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat10_2.w;
    u_xlat15.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture2D(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlatb14.x = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_26 = (u_xlatb14.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat16_26 + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat7.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat6.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat6.xy);
    u_xlat6.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat6.x = (u_xlatb12.x) ? u_xlat6.x : u_xlat16_1.w;
    u_xlat2.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat14.xy;
    u_xlat2.xy = vec2(_NoiseEffectMaskStreng) * u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture(_Mask, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat12.x = (u_xlatb19) ? 1.0 : u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb12.x = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_22 = (u_xlatb12.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_5.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_22 = u_xlat16_22 + (-u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_22 * -2.0 + 3.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_22) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_2.w = u_xlat6.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat6.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat6.xy);
    u_xlat6.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat6.x = (u_xlatb12.x) ? u_xlat6.x : u_xlat16_1.w;
    u_xlat2.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat14.xy;
    u_xlat2.xy = vec2(_NoiseEffectMaskStreng) * u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture(_Mask, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat12.x = (u_xlatb19) ? 1.0 : u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb12.x = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_22 = (u_xlatb12.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_5.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_22 = u_xlat16_22 + (-u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_22 * -2.0 + 3.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_22) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_2.w = u_xlat6.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat6.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat6.xy);
    u_xlat6.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat6.x = (u_xlatb12.x) ? u_xlat6.x : u_xlat10_1.w;
    u_xlat2.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat14.xy;
    u_xlat2.xy = vec2(_NoiseEffectMaskStreng) * u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture2D(_Mask, u_xlat2.xy).x;
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat12.x = (u_xlatb19) ? 1.0 : u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture2D(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlatb12.x = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_22 = (u_xlatb12.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_5.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_22 = u_xlat16_22 + (-u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_5.x = u_xlat16_22 * -2.0 + 3.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_22) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_2.w = u_xlat6.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat6.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat6.xy);
    u_xlat6.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat6.x = (u_xlatb12.x) ? u_xlat6.x : u_xlat10_1.w;
    u_xlat2.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat14.xy;
    u_xlat2.xy = vec2(_NoiseEffectMaskStreng) * u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture2D(_Mask, u_xlat2.xy).x;
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat12.x = (u_xlatb19) ? 1.0 : u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture2D(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlatb12.x = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_22 = (u_xlatb12.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_5.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_22 = u_xlat16_22 + (-u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_5.x = u_xlat16_22 * -2.0 + 3.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_22) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_2.w = u_xlat6.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat16_2.w;
    u_xlat15.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture(_Mask, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb14.x = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_26 = (u_xlatb14.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat16_26 + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat7.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat16_2.w;
    u_xlat15.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture(_Mask, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14.x = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb14.x = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_26 = (u_xlatb14.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat16_26 + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat7.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat10_2.w;
    u_xlat15.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture2D(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlatb14.x = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_26 = (u_xlatb14.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat16_26 + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat7.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec2 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat10_2.w;
    u_xlat15.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat7.xz = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat7.xz = u_xlat7.xz * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat7.x = texture2D(_DissolveTex, u_xlat7.xz).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.z = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.xy = u_xlat7.zx + (-u_xlat1.xy);
    u_xlat7.xz = u_xlat7.xz + (-u_xlat1.xx);
    u_xlat21 = float(1.0) / u_xlat7.z;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat21 = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat14.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat14.x = u_xlat14.x * u_xlat1.y;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb14.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_5.xyz = (u_xlatb14.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb14.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlatb14.x = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_26 = (u_xlatb14.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat16_26 + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat7.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat6.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat6.xy);
    u_xlat6.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat6.x = (u_xlatb12.x) ? u_xlat6.x : u_xlat16_1.w;
    u_xlat2.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat14.xy;
    u_xlat2.xy = vec2(_NoiseEffectMaskStreng) * u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture(_Mask, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat12.x = (u_xlatb19) ? 1.0 : u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb12.x = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_22 = (u_xlatb12.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_5.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_22 = u_xlat16_22 + (-u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_22 * -2.0 + 3.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_22) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_2.w = u_xlat6.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat6.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat6.xy);
    u_xlat6.x = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat6.x = (u_xlatb12.x) ? u_xlat6.x : u_xlat16_1.w;
    u_xlat2.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat14.xy;
    u_xlat2.xy = vec2(_NoiseEffectMaskStreng) * u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture(_Mask, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat12.x = (u_xlatb19) ? 1.0 : u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12.x = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb12.x = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_22 = (u_xlatb12.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_5.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_22 = u_xlat16_22 + (-u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_22 * -2.0 + 3.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_22) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_2.w = u_xlat6.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat6.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat6.xy);
    u_xlat6.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat6.x = (u_xlatb12.x) ? u_xlat6.x : u_xlat10_1.w;
    u_xlat2.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat14.xy;
    u_xlat2.xy = vec2(_NoiseEffectMaskStreng) * u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture2D(_Mask, u_xlat2.xy).x;
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat12.x = (u_xlatb19) ? 1.0 : u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture2D(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlatb12.x = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_22 = (u_xlatb12.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_5.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_22 = u_xlat16_22 + (-u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_5.x = u_xlat16_22 * -2.0 + 3.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_22) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_2.w = u_xlat6.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
vec2 u_xlat12;
bvec2 u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat0.xy = (-u_xlat0.xy) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat0.xy;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat0.xy;
    u_xlat0.xy = (u_xlatb12.x) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat12.x = _DiffAngle * 0.0174532924;
    u_xlat1.x = sin((-u_xlat12.x));
    u_xlat2.x = sin(u_xlat12.x);
    u_xlat3 = cos(u_xlat12.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat6.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat6.xy);
    u_xlat6.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb12.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat6.x = (u_xlatb12.x) ? u_xlat6.x : u_xlat10_1.w;
    u_xlat2.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat14.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat14.xy;
    u_xlat2.xy = vec2(_NoiseEffectMaskStreng) * u_xlat2.xy + u_xlat14.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture2D(_Mask, u_xlat2.xy).x;
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat12.x = (u_xlatb19) ? 1.0 : u_xlat12.x;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat12.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat12.xy = u_xlat12.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat12.x = texture2D(_DissolveTex, u_xlat12.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat12.y = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat19 = (-u_xlat2.x) + u_xlat12.y;
    u_xlat2.x = u_xlat12.x + (-u_xlat2.y);
    u_xlat12.xy = u_xlat12.xy + (-vec2(u_xlat19));
    u_xlat18 = float(1.0) / u_xlat12.y;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat2.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb12.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_4.xyz = (u_xlatb12.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat16_5.xyz;
    u_xlat6.x = u_xlat6.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb12.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlatb12.x = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_22 = (u_xlatb12.x) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_5.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_22 = u_xlat16_22 + (-u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_5.y;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_5.x = u_xlat16_22 * -2.0 + 3.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_5.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_22) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_2.w = u_xlat6.x * u_xlat16_1.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_2;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat16_2.w;
    u_xlat15.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture(_Mask, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat14.x;
    u_xlat14.x = u_xlat16_2.x * u_xlat14.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat15.x = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat8.x = u_xlat16_7 + (-u_xlat1.y);
    u_xlat7.x = u_xlat16_7 + (-u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat21 = float(1.0) / _DissolveOutlineSoft;
    u_xlat21 = u_xlat21 * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat1.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb21 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_26 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat1.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_5.x>=u_xlat1.x);
#else
    u_xlatb21 = u_xlat16_5.x>=u_xlat1.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat21 * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyw = vec3(u_xlat21) * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat21 = min(u_xlat1.y, u_xlat15.x);
    u_xlat8.x = (-u_xlat1.y) + u_xlat15.x;
    u_xlat21 = (-u_xlat21) + u_xlat1.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat15.x;
    u_xlat8.x = u_xlat8.x + u_xlat1.w;
    u_xlat16_5.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb8 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat16_5.x = u_xlat21 * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat14.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat7.x = u_xlat7.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb14 = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_5.x = (u_xlatb14) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_12.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_5.x = (-u_xlat16_12.x) + u_xlat16_5.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_12.x = float(1.0) / u_xlat16_12.x;
    u_xlat16_5.x = u_xlat16_12.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_12.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat7.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat16_2.w;
    u_xlat15.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture(_Mask, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat14.x;
    u_xlat14.x = u_xlat16_2.x * u_xlat14.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat15.x = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat8.x = u_xlat16_7 + (-u_xlat1.y);
    u_xlat7.x = u_xlat16_7 + (-u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat21 = float(1.0) / _DissolveOutlineSoft;
    u_xlat21 = u_xlat21 * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat1.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb21 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_26 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat1.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_5.x>=u_xlat1.x);
#else
    u_xlatb21 = u_xlat16_5.x>=u_xlat1.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat21 * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyw = vec3(u_xlat21) * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat21 = min(u_xlat1.y, u_xlat15.x);
    u_xlat8.x = (-u_xlat1.y) + u_xlat15.x;
    u_xlat21 = (-u_xlat21) + u_xlat1.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat15.x;
    u_xlat8.x = u_xlat8.x + u_xlat1.w;
    u_xlat16_5.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb8 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat16_5.x = u_xlat21 * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat14.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat7.x = u_xlat7.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb14 = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_5.x = (u_xlatb14) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_12.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_5.x = (-u_xlat16_12.x) + u_xlat16_5.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_12.x = float(1.0) / u_xlat16_12.x;
    u_xlat16_5.x = u_xlat16_12.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_12.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat7.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat10_2.w;
    u_xlat15.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat14.x;
    u_xlat14.x = u_xlat10_2.x * u_xlat14.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat15.x = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat8.x = u_xlat10_7 + (-u_xlat1.y);
    u_xlat7.x = u_xlat10_7 + (-u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat21 = float(1.0) / _DissolveOutlineSoft;
    u_xlat21 = u_xlat21 * u_xlat8.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat1.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
    u_xlatb21 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_26 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat1.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
    u_xlatb21 = u_xlat16_5.x>=u_xlat1.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat21 * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyw = vec3(u_xlat21) * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat21 = min(u_xlat1.y, u_xlat15.x);
    u_xlat8.x = (-u_xlat1.y) + u_xlat15.x;
    u_xlat21 = (-u_xlat21) + u_xlat1.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat15.x;
    u_xlat8.x = u_xlat8.x + u_xlat1.w;
    u_xlat16_5.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
    u_xlatb8 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat16_5.x = u_xlat21 * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat14.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat7.x = u_xlat7.x * u_xlat1.w;
    u_xlatb14 = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_5.x = (u_xlatb14) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_12.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_5.x = (-u_xlat16_12.x) + u_xlat16_5.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_12.x = float(1.0) / u_xlat16_12.x;
    u_xlat16_5.x = u_xlat16_12.x * u_xlat16_5.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_12.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_12.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat7.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat10_2.w;
    u_xlat15.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat14.x;
    u_xlat14.x = u_xlat10_2.x * u_xlat14.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat15.x = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat8.x = u_xlat10_7 + (-u_xlat1.y);
    u_xlat7.x = u_xlat10_7 + (-u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat21 = float(1.0) / _DissolveOutlineSoft;
    u_xlat21 = u_xlat21 * u_xlat8.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat1.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
    u_xlatb21 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_26 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat1.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
    u_xlatb21 = u_xlat16_5.x>=u_xlat1.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat21 * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyw = vec3(u_xlat21) * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat21 = min(u_xlat1.y, u_xlat15.x);
    u_xlat8.x = (-u_xlat1.y) + u_xlat15.x;
    u_xlat21 = (-u_xlat21) + u_xlat1.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat15.x;
    u_xlat8.x = u_xlat8.x + u_xlat1.w;
    u_xlat16_5.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
    u_xlatb8 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat16_5.x = u_xlat21 * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat14.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat7.x = u_xlat7.x * u_xlat1.w;
    u_xlatb14 = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_5.x = (u_xlatb14) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_12.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_5.x = (-u_xlat16_12.x) + u_xlat16_5.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_12.x = float(1.0) / u_xlat16_12.x;
    u_xlat16_5.x = u_xlat16_12.x * u_xlat16_5.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_12.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_12.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat7.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
mediump float u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat12.xy = _Time.yy * _GChannel.zw;
    u_xlat12.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat12.xy;
    u_xlat16_12 = texture(_DissolveTex, u_xlat12.xy).y;
    u_xlat1.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
    u_xlat6.xz = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat6.xz = (-u_xlat6.xz) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat6.xz = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat6.xz;
    u_xlat1.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat6.xz = (bool(u_xlatb13)) ? u_xlat6.xz : u_xlat1.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(-0.5, -0.5);
    u_xlat1.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3.x;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat6.xz);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat1.xy = u_xlat6.xz + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat18 = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : u_xlat16_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat16_1.x * u_xlat18 + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_12 = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat2.x = (-u_xlat2.x) + u_xlat19;
    u_xlat8 = u_xlat16_12 + (-u_xlat2.y);
    u_xlat12.x = u_xlat16_12 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat12.x = u_xlat12.x * u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb2.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb2.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat1.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
    u_xlatb12 = u_xlat16_4.y>=u_xlat16_4.z;
#endif
    u_xlat16_22 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat1.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_4.x>=u_xlat1.x);
#else
    u_xlatb12 = u_xlat16_4.x>=u_xlat1.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat13.x = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyw = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat1.y, u_xlat13.x);
    u_xlat7.x = (-u_xlat1.y) + u_xlat13.x;
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat13.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat13.x;
    u_xlat7.x = u_xlat7.x + u_xlat1.w;
    u_xlat16_4.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat2.x;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat12.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb12 = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_4.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.x;
    u_xlat16_10.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_4.x = (-u_xlat16_10.x) + u_xlat16_4.x;
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_10.x = float(1.0) / u_xlat16_10.x;
    u_xlat16_4.x = u_xlat16_10.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_10.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
mediump float u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat12.xy = _Time.yy * _GChannel.zw;
    u_xlat12.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat12.xy;
    u_xlat16_12 = texture(_DissolveTex, u_xlat12.xy).y;
    u_xlat1.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
    u_xlat6.xz = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat6.xz = (-u_xlat6.xz) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat6.xz = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat6.xz;
    u_xlat1.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat6.xz = (bool(u_xlatb13)) ? u_xlat6.xz : u_xlat1.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(-0.5, -0.5);
    u_xlat1.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3.x;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat6.xz);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat1.xy = u_xlat6.xz + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat18 = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : u_xlat16_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat16_1.x * u_xlat18 + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_12 = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat2.x = (-u_xlat2.x) + u_xlat19;
    u_xlat8 = u_xlat16_12 + (-u_xlat2.y);
    u_xlat12.x = u_xlat16_12 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat12.x = u_xlat12.x * u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb2.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb2.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat1.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
    u_xlatb12 = u_xlat16_4.y>=u_xlat16_4.z;
#endif
    u_xlat16_22 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat1.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_4.x>=u_xlat1.x);
#else
    u_xlatb12 = u_xlat16_4.x>=u_xlat1.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat13.x = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyw = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat1.y, u_xlat13.x);
    u_xlat7.x = (-u_xlat1.y) + u_xlat13.x;
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat13.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat13.x;
    u_xlat7.x = u_xlat7.x + u_xlat1.w;
    u_xlat16_4.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat2.x;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat12.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb12 = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_4.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.x;
    u_xlat16_10.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_4.x = (-u_xlat16_10.x) + u_xlat16_4.x;
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_10.x = float(1.0) / u_xlat16_10.x;
    u_xlat16_4.x = u_xlat16_10.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_10.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
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
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
lowp float u_xlat10_12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat12.xy = _Time.yy * _GChannel.zw;
    u_xlat12.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat12.xy;
    u_xlat10_12 = texture2D(_DissolveTex, u_xlat12.xy).y;
    u_xlat1.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
    u_xlat6.xz = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat6.xz = (-u_xlat6.xz) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat6.xz = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat6.xz;
    u_xlat1.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xz;
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat6.xz = (bool(u_xlatb13)) ? u_xlat6.xz : u_xlat1.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(-0.5, -0.5);
    u_xlat1.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3.x;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat6.xz);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat1.xy = u_xlat6.xz + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat18 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : u_xlat10_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat10_1.x * u_xlat18 + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_12 = texture2D(_DissolveTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat2.x = (-u_xlat2.x) + u_xlat19;
    u_xlat8 = u_xlat10_12 + (-u_xlat2.y);
    u_xlat12.x = u_xlat10_12 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat8;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb2.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb2.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat1.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
    u_xlatb12 = u_xlat16_4.y>=u_xlat16_4.z;
    u_xlat16_22 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat1.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
    u_xlatb12 = u_xlat16_4.x>=u_xlat1.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat13.x = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyw = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat1.y, u_xlat13.x);
    u_xlat7.x = (-u_xlat1.y) + u_xlat13.x;
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat13.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat13.x;
    u_xlat7.x = u_xlat7.x + u_xlat1.w;
    u_xlat16_4.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat2.x;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat12.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb12 = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_4.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.x;
    u_xlat16_10.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_4.x = (-u_xlat16_10.x) + u_xlat16_4.x;
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_10.x = float(1.0) / u_xlat16_10.x;
    u_xlat16_4.x = u_xlat16_10.x * u_xlat16_4.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_10.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_10.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
lowp float u_xlat10_12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat12.xy = _Time.yy * _GChannel.zw;
    u_xlat12.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat12.xy;
    u_xlat10_12 = texture2D(_DissolveTex, u_xlat12.xy).y;
    u_xlat1.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
    u_xlat6.xz = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat6.xz = (-u_xlat6.xz) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat6.xz = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat6.xz;
    u_xlat1.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xz;
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat6.xz = (bool(u_xlatb13)) ? u_xlat6.xz : u_xlat1.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(-0.5, -0.5);
    u_xlat1.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3.x;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat6.xz);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat1.xy = u_xlat6.xz + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat18 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : u_xlat10_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat10_1.x * u_xlat18 + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_12 = texture2D(_DissolveTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat2.x = (-u_xlat2.x) + u_xlat19;
    u_xlat8 = u_xlat10_12 + (-u_xlat2.y);
    u_xlat12.x = u_xlat10_12 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat8;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb2.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb2.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat1.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
    u_xlatb12 = u_xlat16_4.y>=u_xlat16_4.z;
    u_xlat16_22 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat1.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
    u_xlatb12 = u_xlat16_4.x>=u_xlat1.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat13.x = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyw = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat1.y, u_xlat13.x);
    u_xlat7.x = (-u_xlat1.y) + u_xlat13.x;
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat13.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat13.x;
    u_xlat7.x = u_xlat7.x + u_xlat1.w;
    u_xlat16_4.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat2.x;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat12.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb12 = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_4.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.x;
    u_xlat16_10.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_4.x = (-u_xlat16_10.x) + u_xlat16_4.x;
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_10.x = float(1.0) / u_xlat16_10.x;
    u_xlat16_4.x = u_xlat16_10.x * u_xlat16_4.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_10.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_10.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat16_2.w;
    u_xlat15.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture(_Mask, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat14.x;
    u_xlat14.x = u_xlat16_2.x * u_xlat14.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat15.x = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat8.x = u_xlat16_7 + (-u_xlat1.y);
    u_xlat7.x = u_xlat16_7 + (-u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat21 = float(1.0) / _DissolveOutlineSoft;
    u_xlat21 = u_xlat21 * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat1.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb21 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_26 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat1.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_5.x>=u_xlat1.x);
#else
    u_xlatb21 = u_xlat16_5.x>=u_xlat1.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat21 * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyw = vec3(u_xlat21) * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat21 = min(u_xlat1.y, u_xlat15.x);
    u_xlat8.x = (-u_xlat1.y) + u_xlat15.x;
    u_xlat21 = (-u_xlat21) + u_xlat1.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat15.x;
    u_xlat8.x = u_xlat8.x + u_xlat1.w;
    u_xlat16_5.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb8 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat16_5.x = u_xlat21 * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat14.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat7.x = u_xlat7.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb14 = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_5.x = (u_xlatb14) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_12.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_5.x = (-u_xlat16_12.x) + u_xlat16_5.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_12.x = float(1.0) / u_xlat16_12.x;
    u_xlat16_5.x = u_xlat16_12.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_12.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat7.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat16_2.w * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat16_2.w;
    u_xlat15.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture(_Mask, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat14.x;
    u_xlat14.x = u_xlat16_2.x * u_xlat14.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat15.x = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat8.x = u_xlat16_7 + (-u_xlat1.y);
    u_xlat7.x = u_xlat16_7 + (-u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat21 = float(1.0) / _DissolveOutlineSoft;
    u_xlat21 = u_xlat21 * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat1.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_5.y>=u_xlat16_5.z);
#else
    u_xlatb21 = u_xlat16_5.y>=u_xlat16_5.z;
#endif
    u_xlat16_26 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat1.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_5.x>=u_xlat1.x);
#else
    u_xlatb21 = u_xlat16_5.x>=u_xlat1.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat21 * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyw = vec3(u_xlat21) * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat21 = min(u_xlat1.y, u_xlat15.x);
    u_xlat8.x = (-u_xlat1.y) + u_xlat15.x;
    u_xlat21 = (-u_xlat21) + u_xlat1.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat15.x;
    u_xlat8.x = u_xlat8.x + u_xlat1.w;
    u_xlat16_5.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb8 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat16_5.x = u_xlat21 * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat14.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat7.x = u_xlat7.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb14 = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_5.x = (u_xlatb14) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_12.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_5.x = (-u_xlat16_12.x) + u_xlat16_5.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_12.x = float(1.0) / u_xlat16_12.x;
    u_xlat16_5.x = u_xlat16_12.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_12.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat7.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat10_2.w;
    u_xlat15.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat14.x;
    u_xlat14.x = u_xlat10_2.x * u_xlat14.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat15.x = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat8.x = u_xlat10_7 + (-u_xlat1.y);
    u_xlat7.x = u_xlat10_7 + (-u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat21 = float(1.0) / _DissolveOutlineSoft;
    u_xlat21 = u_xlat21 * u_xlat8.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat1.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
    u_xlatb21 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_26 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat1.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
    u_xlatb21 = u_xlat16_5.x>=u_xlat1.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat21 * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyw = vec3(u_xlat21) * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat21 = min(u_xlat1.y, u_xlat15.x);
    u_xlat8.x = (-u_xlat1.y) + u_xlat15.x;
    u_xlat21 = (-u_xlat21) + u_xlat1.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat15.x;
    u_xlat8.x = u_xlat8.x + u_xlat1.w;
    u_xlat16_5.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
    u_xlatb8 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat16_5.x = u_xlat21 * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat14.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat7.x = u_xlat7.x * u_xlat1.w;
    u_xlatb14 = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_5.x = (u_xlatb14) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_12.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_5.x = (-u_xlat16_12.x) + u_xlat16_5.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_12.x = float(1.0) / u_xlat16_12.x;
    u_xlat16_5.x = u_xlat16_12.x * u_xlat16_5.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_12.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_12.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat7.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
float u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat7.xy = _Time.yy * _GChannel.zw;
    u_xlat7.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat7.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).y;
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.zw;
    u_xlat0.xz = (bool(u_xlatb0)) ? u_xlat1.zw : u_xlat14.xy;
    u_xlat1.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat21));
    u_xlat3.x = sin(u_xlat21);
    u_xlat4 = cos(u_xlat21);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.xz);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat15.y = _Time.y * _DiffYSpeed;
    u_xlat15.x = _Time.y * _DiffXSpeed;
    u_xlat14.xy = u_xlat0.xz + u_xlat15.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat14.xy);
    u_xlat14.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : u_xlat10_2.w;
    u_xlat15.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1.xy = vec2(_NoiseEffectMaskStreng) * u_xlat15.xy + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat21 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat21 = (u_xlatb1) ? 1.0 : u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat14.x;
    u_xlat14.x = u_xlat10_2.x * u_xlat14.x + (-_SaturLeftColorWeights);
    u_xlat1.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat1.xy = max(u_xlat1.xy, vec2(0.0, 0.0));
    u_xlat1.xy = u_xlat1.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat15.x = u_xlat1.y + (-_DissolveOutlineWidth);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat8.x = u_xlat10_7 + (-u_xlat1.y);
    u_xlat7.x = u_xlat10_7 + (-u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + u_xlat15.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = u_xlat7.x * _DiffuseColor.w;
    u_xlat21 = float(1.0) / _DissolveOutlineSoft;
    u_xlat21 = u_xlat21 * u_xlat8.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat1.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb2.x) ? u_xlat16_5.xxx : u_xlat1.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat7.xxx * u_xlat16_6.xyz;
    u_xlat7.x = u_xlat7.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb2.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat1.xy = (-u_xlat16_5.zy) + u_xlat16_5.yz;
    u_xlatb21 = u_xlat16_5.y>=u_xlat16_5.z;
    u_xlat16_26 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_26) * u_xlat1.xy + u_xlat16_5.zy;
    u_xlat2.w = (-u_xlat16_5.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_26) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_5.x;
    u_xlatb21 = u_xlat16_5.x>=u_xlat1.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat21 * u_xlat3.w + u_xlat16_5.x;
    u_xlat1.xyw = vec3(u_xlat21) * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat21 = min(u_xlat1.y, u_xlat15.x);
    u_xlat8.x = (-u_xlat1.y) + u_xlat15.x;
    u_xlat21 = (-u_xlat21) + u_xlat1.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat15.x;
    u_xlat8.x = u_xlat8.x + u_xlat1.w;
    u_xlat16_5.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_12.x = u_xlat16_5.x * 360.0;
    u_xlatb8 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_12.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat8.xyz = u_xlat16_12.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat16_5.x = u_xlat21 * _Saturation;
    u_xlat8.xyz = u_xlat16_5.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat14.x = u_xlat21 * u_xlat14.x;
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlat21 = u_xlat14.x * -2.0 + 3.0;
    u_xlat14.x = u_xlat14.x * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat14.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat7.x = u_xlat7.x * u_xlat1.w;
    u_xlatb14 = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_5.x = (u_xlatb14) ? u_xlat0.x : vs_TEXCOORD0.x;
    u_xlat16_12.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_5.x = (-u_xlat16_12.x) + u_xlat16_5.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_12.y;
    u_xlat16_12.x = float(1.0) / u_xlat16_12.x;
    u_xlat16_5.x = u_xlat16_12.x * u_xlat16_5.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_12.x = u_xlat16_5.x * -2.0 + 3.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_12.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_5.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat7.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_5.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
mediump float u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat12.xy = _Time.yy * _GChannel.zw;
    u_xlat12.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat12.xy;
    u_xlat16_12 = texture(_DissolveTex, u_xlat12.xy).y;
    u_xlat1.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
    u_xlat6.xz = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat6.xz = (-u_xlat6.xz) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat6.xz = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat6.xz;
    u_xlat1.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat6.xz = (bool(u_xlatb13)) ? u_xlat6.xz : u_xlat1.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(-0.5, -0.5);
    u_xlat1.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3.x;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat6.xz);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat1.xy = u_xlat6.xz + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat18 = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : u_xlat16_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat16_1.x * u_xlat18 + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_12 = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat2.x = (-u_xlat2.x) + u_xlat19;
    u_xlat8 = u_xlat16_12 + (-u_xlat2.y);
    u_xlat12.x = u_xlat16_12 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat12.x = u_xlat12.x * u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb2.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb2.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat1.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
    u_xlatb12 = u_xlat16_4.y>=u_xlat16_4.z;
#endif
    u_xlat16_22 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat1.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_4.x>=u_xlat1.x);
#else
    u_xlatb12 = u_xlat16_4.x>=u_xlat1.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat13.x = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyw = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat1.y, u_xlat13.x);
    u_xlat7.x = (-u_xlat1.y) + u_xlat13.x;
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat13.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat13.x;
    u_xlat7.x = u_xlat7.x + u_xlat1.w;
    u_xlat16_4.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat2.x;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat12.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb12 = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_4.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.x;
    u_xlat16_10.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_4.x = (-u_xlat16_10.x) + u_xlat16_4.x;
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_10.x = float(1.0) / u_xlat16_10.x;
    u_xlat16_4.x = u_xlat16_10.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_10.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_VAR_POSV0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
mediump float u_xlat16_12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat12.xy = _Time.yy * _GChannel.zw;
    u_xlat12.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat12.xy;
    u_xlat16_12 = texture(_DissolveTex, u_xlat12.xy).y;
    u_xlat1.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
    u_xlat6.xz = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat6.xz = (-u_xlat6.xz) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat6.xz = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat6.xz;
    u_xlat1.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat6.xz = (bool(u_xlatb13)) ? u_xlat6.xz : u_xlat1.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(-0.5, -0.5);
    u_xlat1.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3.x;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat6.xz);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat1.xy = u_xlat6.xz + u_xlat13.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat18 = u_xlat16_1.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : u_xlat16_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat16_1.x * u_xlat18 + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = vec2(u_xlat16_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_12 = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat2.x = (-u_xlat2.x) + u_xlat19;
    u_xlat8 = u_xlat16_12 + (-u_xlat2.y);
    u_xlat12.x = u_xlat16_12 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat12.x = u_xlat12.x * u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb2.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb2.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat1.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
    u_xlatb12 = u_xlat16_4.y>=u_xlat16_4.z;
#endif
    u_xlat16_22 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat1.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_4.x>=u_xlat1.x);
#else
    u_xlatb12 = u_xlat16_4.x>=u_xlat1.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat13.x = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyw = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat1.y, u_xlat13.x);
    u_xlat7.x = (-u_xlat1.y) + u_xlat13.x;
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat13.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat13.x;
    u_xlat7.x = u_xlat7.x + u_xlat1.w;
    u_xlat16_4.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat2.x;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat12.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_GRADIENT_SAME_DIFF_ON);
#else
    u_xlatb12 = 0.5<_GRADIENT_SAME_DIFF_ON;
#endif
    u_xlat16_4.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.x;
    u_xlat16_10.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_4.x = (-u_xlat16_10.x) + u_xlat16_4.x;
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_10.x = float(1.0) / u_xlat16_10.x;
    u_xlat16_4.x = u_xlat16_10.x * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_10.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
lowp float u_xlat10_12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat12.xy = _Time.yy * _GChannel.zw;
    u_xlat12.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat12.xy;
    u_xlat10_12 = texture2D(_DissolveTex, u_xlat12.xy).y;
    u_xlat1.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
    u_xlat6.xz = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat6.xz = (-u_xlat6.xz) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat6.xz = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat6.xz;
    u_xlat1.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xz;
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat6.xz = (bool(u_xlatb13)) ? u_xlat6.xz : u_xlat1.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(-0.5, -0.5);
    u_xlat1.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3.x;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat6.xz);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat1.xy = u_xlat6.xz + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat18 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : u_xlat10_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat10_1.x * u_xlat18 + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_12 = texture2D(_DissolveTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat2.x = (-u_xlat2.x) + u_xlat19;
    u_xlat8 = u_xlat10_12 + (-u_xlat2.y);
    u_xlat12.x = u_xlat10_12 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat8;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb2.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb2.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat1.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
    u_xlatb12 = u_xlat16_4.y>=u_xlat16_4.z;
    u_xlat16_22 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat1.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
    u_xlatb12 = u_xlat16_4.x>=u_xlat1.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat13.x = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyw = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat1.y, u_xlat13.x);
    u_xlat7.x = (-u_xlat1.y) + u_xlat13.x;
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat13.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat13.x;
    u_xlat7.x = u_xlat7.x + u_xlat1.w;
    u_xlat16_4.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat2.x;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat12.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb12 = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_4.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.x;
    u_xlat16_10.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_4.x = (-u_xlat16_10.x) + u_xlat16_4.x;
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_10.x = float(1.0) / u_xlat16_10.x;
    u_xlat16_4.x = u_xlat16_10.x * u_xlat16_4.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_10.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_10.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    vs_VAR_POSV0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat0.xyz;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _OpenCustom;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	float _DissolveOutlineSoft;
uniform 	float _DissolveOutlineWidth;
uniform 	float _UnMult;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform 	float _NoiseEffectMaskStreng;
uniform 	float _NoiseUnEffectDiff;
uniform 	vec4 _ScreenTileOffset;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _GRADIENT_SAME_DIFF_ON;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_VAR_POSV0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat8;
mediump vec2 u_xlat16_10;
vec2 u_xlat12;
lowp float u_xlat10_12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat12.xy = _Time.yy * _GChannel.zw;
    u_xlat12.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat12.xy;
    u_xlat10_12 = texture2D(_DissolveTex, u_xlat12.xy).y;
    u_xlat1.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
    u_xlat6.xz = vs_VAR_POSV0.xy / vs_VAR_POSV0.zz;
    u_xlat6.xz = (-u_xlat6.xz) * _ScreenTileOffset.xy + _ScreenTileOffset.zw;
    u_xlat6.xz = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat6.xz;
    u_xlat1.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat6.xz;
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat6.xz = (bool(u_xlatb13)) ? u_xlat6.xz : u_xlat1.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(-0.5, -0.5);
    u_xlat1.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin((-u_xlat1.x));
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat2.y = u_xlat3.x;
    u_xlat2.z = u_xlat1.x;
    u_xlat1.y = dot(u_xlat2.zy, u_xlat6.xz);
    u_xlat1.x = dot(u_xlat2.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.y = _Time.y * _DiffYSpeed;
    u_xlat13.x = _Time.y * _DiffXSpeed;
    u_xlat1.xy = u_xlat6.xz + u_xlat13.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat18 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat18 = (u_xlatb2.x) ? u_xlat18 : u_xlat10_1.w;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat10_1.x * u_xlat18 + (-_SaturLeftColorWeights);
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat2.xy = vec2(u_xlat10_12) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_12 = texture2D(_DissolveTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.0, 0.0));
    u_xlat2.xy = u_xlat2.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat19 = u_xlat2.y + (-_DissolveOutlineWidth);
    u_xlat2.x = (-u_xlat2.x) + u_xlat19;
    u_xlat8 = u_xlat10_12 + (-u_xlat2.y);
    u_xlat12.x = u_xlat10_12 + (-u_xlat2.x);
    u_xlat19 = u_xlat19 + (-u_xlat2.x);
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat12.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat12.x = u_xlat12.x * u_xlat8;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat19 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat19;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat12.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_4.xyz = (u_xlatb2.x) ? u_xlat16_4.xxx : u_xlat1.xyz;
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_4.xyz = (u_xlatb2.y) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat1.xy = (-u_xlat16_4.zy) + u_xlat16_4.yz;
    u_xlatb12 = u_xlat16_4.y>=u_xlat16_4.z;
    u_xlat16_22 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_22) * u_xlat1.xy + u_xlat16_4.zy;
    u_xlat2.w = (-u_xlat16_4.x);
    u_xlat3.x = float(1.0);
    u_xlat3.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_22) * u_xlat3.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat3.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat3.x = u_xlat2.x + u_xlat16_4.x;
    u_xlatb12 = u_xlat16_4.x>=u_xlat1.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat13.x = u_xlat12.x * u_xlat3.w + u_xlat16_4.x;
    u_xlat1.xyw = u_xlat12.xxx * u_xlat3.xyz + u_xlat1.xyw;
    u_xlat12.x = min(u_xlat1.y, u_xlat13.x);
    u_xlat7.x = (-u_xlat1.y) + u_xlat13.x;
    u_xlat12.x = (-u_xlat12.x) + u_xlat1.x;
    u_xlat13.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat13.x;
    u_xlat7.x = u_xlat7.x + u_xlat1.w;
    u_xlat16_4.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_4.x * 360.0;
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_4.x = u_xlat16_10.y * u_xlat16_4.x;
    u_xlat16_4.x = fract(u_xlat16_4.x);
    u_xlat7.xyz = u_xlat16_10.xxx * u_xlat16_4.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat2.x;
    u_xlat16_4.x = u_xlat12.x * _Saturation;
    u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat18;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = u_xlat12.xxxx * u_xlat1 + _SaturLeftColor;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlatb12 = 0.5<_GRADIENT_SAME_DIFF_ON;
    u_xlat16_4.x = (u_xlatb12) ? u_xlat6.x : vs_TEXCOORD0.x;
    u_xlat16_10.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_4.x = (-u_xlat16_10.x) + u_xlat16_4.x;
    u_xlat16_10.x = (-u_xlat16_10.x) + u_xlat16_10.y;
    u_xlat16_10.x = float(1.0) / u_xlat16_10.x;
    u_xlat16_4.x = u_xlat16_10.x * u_xlat16_4.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_10.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_10.x;
    u_xlat16_2 = (-_LeftColor) + _RightColor;
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + _LeftColor;
    u_xlat16_1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.w = u_xlat0.x * u_xlat16_2.w;
    u_xlat0.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat0 : u_xlat16_1;
    u_xlat16_4.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_4.xxxx;
    SV_Target0 = u_xlat16_0;
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
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_SCREENUV" }
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
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
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
Keywords { "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_PANEL_CLIP_NEW" }
Local Keywords { "_SCREENUV" }
""
}
}
}
}
}