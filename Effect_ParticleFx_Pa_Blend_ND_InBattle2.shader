//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/ParticleFx_Pa_Blend_ND_InBattle2" {
Properties {

[Space(15)] [Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

[Space(15)] [Header(Texture(2D)________________________________________________________________________)] [Space(10)] [Toggle(OpenCustom)] _OpenCustom ("开启CustomData", Float) = 0.0

[Toggle(UnMult)] _UnMult ("UnMult去黑", Float) = 0.0

[Space(10)] _DiffuseColor ("TextureColor", Color) = (1,1,1,1)

_Diffuse ("Texture2D", 2D) = "white" { }

_DiffusePower ("TexturePower", Float) = 1.0

_DiffuseAdd ("TextureAdd", Float) = 0.0

_DiffAngle ("Texture旋转", Float) = 0.0

_DiffXSpeed ("TexSpeedU", Float) = 0.0

_DiffYSpeed ("TexSpeedV", Float) = 0.0

[Space(15)] [Header(Dissolve And Noise________________________________________________________________________)] [Space(10)] _DissolveTex ("溶解和Noise", 2D) = "white" { }

_DissolveStep ("溶解", Float) = 0.0

_SoftSize ("溶解软硬", Range(0, 2)) = 0.0

[Space(10)] [Toggle] _DissolveOutline_On ("溶解边缘叠色", Float) = 1.0

_DissolveOutlineWidth ("溶解边缘", Range(0, 0.5)) = 0.0010000000474974513

_DissolveOutlineSoft ("溶解边缘_软硬", Range(0, 0.5)) = 0.0

_DissolveColorPW ("溶解边缘_强度", Float) = 1.0

_DissolveColor ("溶解边缘_颜色", Color) = (1,1,1,1)

[Space(10)] [Toggle] _EffectByMask ("Mask影响Noise", Float) = 0.0

_NoiseXStreng ("扭曲强度U", Range(-10, 10)) = 0.0

_NoiseYStreng ("扭曲强度V", Range(-10, 10)) = 0.0

_GChannel ("G通xy控Tiling zw控速度", Vector) = (1,1,0,0)

[Space(15)] [Header(Mask________________________________________________________________________)] [Space(10)] _Mask ("Mask", 2D) = "white" { }

[Toggle] _MaskNotEffectDiff ("MaskNotEffectDiff", Float) = 0.0

_MaskXSpeed ("MaskSpeedU", Float) = 0.0

_MaskYSpeed ("MaskSpeedV", Float) = 0.0

[Space(15)] [Header(Gradient________________________________________________________________________)] [Space(10)] [Toggle(_GRADIENT_ON)] _GRADIENT_ON ("左右渐变颜色开关(禁动画中K开关)", Float) = 0.0

[Toggle] _Gradient_Rotate ("渐变跟随Diff旋转", Float) = 0.0

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_MidPosLeft ("左中渐变中心点", Range(0, 1)) = 0.20000000298023224

_MidColor ("中间渐变色", Color) = (1,1,1,1)

_MidPosRight ("中右渐变中心点", Range(0, 1)) = 0.800000011920929

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_MidPosLeftSharp ("左中渐变权重", Range(0, 1)) = 1.0

_MidPosRightSharp ("中右渐变权重", Range(0, 1)) = 1.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

[Toggle] _IsGray ("IsGray", Float) = 0.0

_TransparentStrong ("TransparentStrong", Float) = 1.0

_IsInvertGray ("IsInvertGray", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 35554
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat12.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat12.xy = u_xlat12.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture(_Mask, u_xlat12.xy).x;
    u_xlat1.xy = u_xlat12.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat16_3.x));
    u_xlat16_5 = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_4.z = u_xlat16_3.x;
    u_xlat16_3.y = dot(u_xlat16_4.zy, u_xlat1.xy);
    u_xlat16_3.x = dot(u_xlat16_4.yx, u_xlat1.xy);
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat16_3.x = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat16_3.x = (u_xlatb2.y) ? u_xlat16_3.x : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat12.x = (u_xlatb18) ? 1.0 : u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat16_3.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_3.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_3.xy).x;
    u_xlat6.xz = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat6.xz = max(u_xlat6.xz, vec2(0.0, 0.0));
    u_xlat6.x = u_xlat6.x + _SoftSize;
    u_xlat18 = u_xlat6.z + _DissolveStep;
    u_xlat16_3.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat18;
    u_xlat16_9.x = (-u_xlat18) + u_xlat16_0.x;
    u_xlat6.x = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat18 = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat6.x) + u_xlat16_0.x;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_3.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat16_4.x = (-_DissolveOutline_On) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat16_9.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_9.xyz;
    u_xlat16_21 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_3.xyz = (u_xlatb6.x) ? vec3(u_xlat16_21) : u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_1.xyz = (u_xlatb6.y) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat12.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat12.xy = u_xlat12.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture(_Mask, u_xlat12.xy).x;
    u_xlat1.xy = u_xlat12.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat16_3.x));
    u_xlat16_5 = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_4.z = u_xlat16_3.x;
    u_xlat16_3.y = dot(u_xlat16_4.zy, u_xlat1.xy);
    u_xlat16_3.x = dot(u_xlat16_4.yx, u_xlat1.xy);
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat16_3.x = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat16_3.x = (u_xlatb2.y) ? u_xlat16_3.x : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat12.x = (u_xlatb18) ? 1.0 : u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat16_3.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_3.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_3.xy).x;
    u_xlat6.xz = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat6.xz = max(u_xlat6.xz, vec2(0.0, 0.0));
    u_xlat6.x = u_xlat6.x + _SoftSize;
    u_xlat18 = u_xlat6.z + _DissolveStep;
    u_xlat16_3.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat18;
    u_xlat16_9.x = (-u_xlat18) + u_xlat16_0.x;
    u_xlat6.x = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat18 = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat6.x) + u_xlat16_0.x;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_3.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat16_4.x = (-_DissolveOutline_On) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat16_9.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_9.xyz;
    u_xlat16_21 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_3.xyz = (u_xlatb6.x) ? vec3(u_xlat16_21) : u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_1.xyz = (u_xlatb6.y) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
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
attribute highp vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat12.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat12.xy = u_xlat12.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture2D(_Mask, u_xlat12.xy).x;
    u_xlat1.xy = u_xlat12.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat16_3.x));
    u_xlat16_5 = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_4.z = u_xlat16_3.x;
    u_xlat16_3.y = dot(u_xlat16_4.zy, u_xlat1.xy);
    u_xlat16_3.x = dot(u_xlat16_4.yx, u_xlat1.xy);
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat16_3.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat16_3.x = (u_xlatb2.y) ? u_xlat16_3.x : u_xlat10_1.w;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat12.x = (u_xlatb18) ? 1.0 : u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat16_3.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_3.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_3.xy).x;
    u_xlat6.xz = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat6.xz = max(u_xlat6.xz, vec2(0.0, 0.0));
    u_xlat6.x = u_xlat6.x + _SoftSize;
    u_xlat18 = u_xlat6.z + _DissolveStep;
    u_xlat16_3.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat18;
    u_xlat16_9.x = (-u_xlat18) + u_xlat10_0;
    u_xlat6.x = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat18 = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat6.x) + u_xlat10_0;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_3.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat16_4.x = (-_DissolveOutline_On) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat16_9.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_9.xyz;
    u_xlat16_21 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_3.xyz = (u_xlatb6.x) ? vec3(u_xlat16_21) : u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_1.xyz = (u_xlatb6.y) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
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
attribute highp vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat12.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat12.xy = u_xlat12.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture2D(_Mask, u_xlat12.xy).x;
    u_xlat1.xy = u_xlat12.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat16_3.x));
    u_xlat16_5 = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_4.z = u_xlat16_3.x;
    u_xlat16_3.y = dot(u_xlat16_4.zy, u_xlat1.xy);
    u_xlat16_3.x = dot(u_xlat16_4.yx, u_xlat1.xy);
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat16_3.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat16_3.x = (u_xlatb2.y) ? u_xlat16_3.x : u_xlat10_1.w;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat12.x = (u_xlatb18) ? 1.0 : u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat16_3.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_3.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_3.xy).x;
    u_xlat6.xz = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat6.xz = max(u_xlat6.xz, vec2(0.0, 0.0));
    u_xlat6.x = u_xlat6.x + _SoftSize;
    u_xlat18 = u_xlat6.z + _DissolveStep;
    u_xlat16_3.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat18;
    u_xlat16_9.x = (-u_xlat18) + u_xlat10_0;
    u_xlat6.x = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat18 = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat6.x) + u_xlat10_0;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_3.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat16_4.x = (-_DissolveOutline_On) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat16_9.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_9.xyz;
    u_xlat16_21 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_3.xyz = (u_xlatb6.x) ? vec3(u_xlat16_21) : u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_1.xyz = (u_xlatb6.y) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat12.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat12.xy = u_xlat12.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture(_Mask, u_xlat12.xy).x;
    u_xlat1.xy = u_xlat12.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat16_3.x));
    u_xlat16_5 = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_4.z = u_xlat16_3.x;
    u_xlat16_3.y = dot(u_xlat16_4.zy, u_xlat1.xy);
    u_xlat16_3.x = dot(u_xlat16_4.yx, u_xlat1.xy);
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat16_3.x = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat16_3.x = (u_xlatb2.y) ? u_xlat16_3.x : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat12.x = (u_xlatb18) ? 1.0 : u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat16_3.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_3.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_3.xy).x;
    u_xlat6.xz = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat6.xz = max(u_xlat6.xz, vec2(0.0, 0.0));
    u_xlat6.x = u_xlat6.x + _SoftSize;
    u_xlat18 = u_xlat6.z + _DissolveStep;
    u_xlat16_3.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat18;
    u_xlat16_9.x = (-u_xlat18) + u_xlat16_0.x;
    u_xlat6.x = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat18 = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat6.x) + u_xlat16_0.x;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_3.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat16_4.x = (-_DissolveOutline_On) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat16_9.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_9.xyz;
    u_xlat16_21 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_3.xyz = (u_xlatb6.x) ? vec3(u_xlat16_21) : u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_1.xyz = (u_xlatb6.y) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat12.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat12.xy = u_xlat12.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture(_Mask, u_xlat12.xy).x;
    u_xlat1.xy = u_xlat12.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat16_3.x));
    u_xlat16_5 = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_4.z = u_xlat16_3.x;
    u_xlat16_3.y = dot(u_xlat16_4.zy, u_xlat1.xy);
    u_xlat16_3.x = dot(u_xlat16_4.yx, u_xlat1.xy);
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat16_3.x = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat16_3.x = (u_xlatb2.y) ? u_xlat16_3.x : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat12.x = (u_xlatb18) ? 1.0 : u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat16_3.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_3.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_3.xy).x;
    u_xlat6.xz = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat6.xz = max(u_xlat6.xz, vec2(0.0, 0.0));
    u_xlat6.x = u_xlat6.x + _SoftSize;
    u_xlat18 = u_xlat6.z + _DissolveStep;
    u_xlat16_3.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat18;
    u_xlat16_9.x = (-u_xlat18) + u_xlat16_0.x;
    u_xlat6.x = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat18 = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat6.x) + u_xlat16_0.x;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_3.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat16_4.x = (-_DissolveOutline_On) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat16_9.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_9.xyz;
    u_xlat16_21 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_3.xyz = (u_xlatb6.x) ? vec3(u_xlat16_21) : u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_1.xyz = (u_xlatb6.y) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat12.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat12.xy = u_xlat12.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture2D(_Mask, u_xlat12.xy).x;
    u_xlat1.xy = u_xlat12.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat16_3.x));
    u_xlat16_5 = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_4.z = u_xlat16_3.x;
    u_xlat16_3.y = dot(u_xlat16_4.zy, u_xlat1.xy);
    u_xlat16_3.x = dot(u_xlat16_4.yx, u_xlat1.xy);
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat16_3.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat16_3.x = (u_xlatb2.y) ? u_xlat16_3.x : u_xlat10_1.w;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat12.x = (u_xlatb18) ? 1.0 : u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat16_3.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_3.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_3.xy).x;
    u_xlat6.xz = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat6.xz = max(u_xlat6.xz, vec2(0.0, 0.0));
    u_xlat6.x = u_xlat6.x + _SoftSize;
    u_xlat18 = u_xlat6.z + _DissolveStep;
    u_xlat16_3.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat18;
    u_xlat16_9.x = (-u_xlat18) + u_xlat10_0;
    u_xlat6.x = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat18 = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat6.x) + u_xlat10_0;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_3.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat16_4.x = (-_DissolveOutline_On) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat16_9.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_9.xyz;
    u_xlat16_21 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_3.xyz = (u_xlatb6.x) ? vec3(u_xlat16_21) : u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_1.xyz = (u_xlatb6.y) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat12.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat12.xy = u_xlat12.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat12.x = texture2D(_Mask, u_xlat12.xy).x;
    u_xlat1.xy = u_xlat12.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat16_3.x));
    u_xlat16_5 = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_4.z = u_xlat16_3.x;
    u_xlat16_3.y = dot(u_xlat16_4.zy, u_xlat1.xy);
    u_xlat16_3.x = dot(u_xlat16_4.yx, u_xlat1.xy);
    u_xlat16_3.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat16_3.x = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat16_3.x = (u_xlatb2.y) ? u_xlat16_3.x : u_xlat10_1.w;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat12.x = (u_xlatb18) ? 1.0 : u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat16_3.x;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat16_3.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_3.xy).x;
    u_xlat6.xz = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat6.xz = max(u_xlat6.xz, vec2(0.0, 0.0));
    u_xlat6.x = u_xlat6.x + _SoftSize;
    u_xlat18 = u_xlat6.z + _DissolveStep;
    u_xlat16_3.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat18;
    u_xlat16_9.x = (-u_xlat18) + u_xlat10_0;
    u_xlat6.x = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat18 = (-u_xlat6.x) + u_xlat16_3.x;
    u_xlat0.x = (-u_xlat6.x) + u_xlat10_0;
    u_xlat6.x = float(1.0) / u_xlat18;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_3.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_9.x;
    u_xlat16_9.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat16_4.x = (-_DissolveOutline_On) + 1.0;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_9.xyz = u_xlat16_4.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_9.xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat16_9.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_4.xyz + u_xlat16_9.xyz;
    u_xlat16_21 = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_3.xyz = (u_xlatb6.x) ? vec3(u_xlat16_21) : u_xlat16_3.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_1.xyz = (u_xlatb6.y) ? u_xlat16_4.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _LeftColor;
uniform 	vec4 _RightColor;
uniform 	vec4 _MidColor;
uniform 	float _MidPosLeft;
uniform 	float _MidPosRight;
uniform 	float _MidPosLeftSharp;
uniform 	float _MidPosRightSharp;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bvec2 u_xlatb7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump vec2 u_xlat16_17;
float u_xlat20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb15.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat7.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin(u_xlat16_3.x);
    u_xlat16_5.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin((-u_xlat16_3.x));
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_3.y = u_xlat16_5.x;
    u_xlat16_5.x = dot(u_xlat16_3.yx, u_xlat7.xy);
    u_xlat16_3.z = u_xlat16_4.x;
    u_xlat16_5.y = dot(u_xlat16_3.zy, u_xlat7.xy);
    u_xlat16_3.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat16_10.x = u_xlat16_2.w * u_xlat16_2.x;
    u_xlat16_10.x = (u_xlatb15.y) ? u_xlat16_10.x : u_xlat16_2.w;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat15.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat15.xy;
    u_xlat16_17.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat16_17.xy).x;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = u_xlat7.x + _SoftSize;
    u_xlat14 = u_xlat7.y + _DissolveStep;
    u_xlat16_17.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat14;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat1.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_21;
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
    u_xlat16_17.x = (-u_xlat14) + u_xlat16_21;
    u_xlat16_24 = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_17.x = u_xlat16_24 * u_xlat16_17.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_17.x * -2.0 + 3.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_24;
    u_xlat16_5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_24 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_24);
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_17.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb14) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_10.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_10.x = dot(u_xlat16_4.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_10.xyz = (u_xlatb7.x) ? u_xlat16_10.xxx : u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
#endif
    u_xlat0.x = (u_xlatb0) ? u_xlat16_3.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(_MidPosLeft>=u_xlat0.x);
#else
    u_xlatb7.x = _MidPosLeft>=u_xlat0.x;
#endif
    if(u_xlatb7.x){
        u_xlatb7.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat7.x = (u_xlatb7.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat7.x = u_xlat0.x / u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<_MidPosLeftSharp);
#else
        u_xlatb21 = 0.0<_MidPosLeftSharp;
#endif
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat9 = log2(u_xlat7.x);
        u_xlat2.x = u_xlat9 * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat14 = (u_xlatb7.y) ? 0.0 : u_xlat2.x;
        u_xlat7.x = (u_xlatb21) ? u_xlat14 : u_xlat7.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat7.xxxx * u_xlat2 + _LeftColor;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb7.x = !!(_MidPosLeft<u_xlat0.x);
#else
        u_xlatb7.x = _MidPosLeft<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat0.x<_MidPosRight);
#else
        u_xlatb14 = u_xlat0.x<_MidPosRight;
#endif
        u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat0.x>=_MidPosRight);
#else
        u_xlatb14 = u_xlat0.x>=_MidPosRight;
#endif
        u_xlatb6.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat21 = (-_MidPosRight) + 1.0;
        u_xlat21 = (u_xlatb6.x) ? 0.000100016594 : u_xlat21;
        u_xlat0.x = u_xlat0.x / u_xlat21;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<_MidPosRightSharp);
#else
        u_xlatb21 = 0.0<_MidPosRightSharp;
#endif
        u_xlat6 = _MidPosRightSharp * 50.0;
        u_xlat20 = log2(u_xlat0.x);
        u_xlat6 = u_xlat20 * u_xlat6;
        u_xlat6 = exp2(u_xlat6);
        u_xlat6 = (u_xlatb6.y) ? 0.0 : u_xlat6;
        u_xlat0.x = (u_xlatb21) ? u_xlat6 : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb14) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb7.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_4.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1 : u_xlat0;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _LeftColor;
uniform 	vec4 _RightColor;
uniform 	vec4 _MidColor;
uniform 	float _MidPosLeft;
uniform 	float _MidPosRight;
uniform 	float _MidPosLeftSharp;
uniform 	float _MidPosRightSharp;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bvec2 u_xlatb7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump vec2 u_xlat16_17;
float u_xlat20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb15.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat7.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin(u_xlat16_3.x);
    u_xlat16_5.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin((-u_xlat16_3.x));
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_3.y = u_xlat16_5.x;
    u_xlat16_5.x = dot(u_xlat16_3.yx, u_xlat7.xy);
    u_xlat16_3.z = u_xlat16_4.x;
    u_xlat16_5.y = dot(u_xlat16_3.zy, u_xlat7.xy);
    u_xlat16_3.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat16_10.x = u_xlat16_2.w * u_xlat16_2.x;
    u_xlat16_10.x = (u_xlatb15.y) ? u_xlat16_10.x : u_xlat16_2.w;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat15.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat15.xy;
    u_xlat16_17.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat16_17.xy).x;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = u_xlat7.x + _SoftSize;
    u_xlat14 = u_xlat7.y + _DissolveStep;
    u_xlat16_17.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat14;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat1.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_21;
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
    u_xlat16_17.x = (-u_xlat14) + u_xlat16_21;
    u_xlat16_24 = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_17.x = u_xlat16_24 * u_xlat16_17.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_17.x * -2.0 + 3.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_24;
    u_xlat16_5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_24 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_24);
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_17.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb14) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_10.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_10.x = dot(u_xlat16_4.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_10.xyz = (u_xlatb7.x) ? u_xlat16_10.xxx : u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
#endif
    u_xlat0.x = (u_xlatb0) ? u_xlat16_3.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(_MidPosLeft>=u_xlat0.x);
#else
    u_xlatb7.x = _MidPosLeft>=u_xlat0.x;
#endif
    if(u_xlatb7.x){
        u_xlatb7.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat7.x = (u_xlatb7.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat7.x = u_xlat0.x / u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<_MidPosLeftSharp);
#else
        u_xlatb21 = 0.0<_MidPosLeftSharp;
#endif
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat9 = log2(u_xlat7.x);
        u_xlat2.x = u_xlat9 * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat14 = (u_xlatb7.y) ? 0.0 : u_xlat2.x;
        u_xlat7.x = (u_xlatb21) ? u_xlat14 : u_xlat7.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat7.xxxx * u_xlat2 + _LeftColor;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb7.x = !!(_MidPosLeft<u_xlat0.x);
#else
        u_xlatb7.x = _MidPosLeft<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat0.x<_MidPosRight);
#else
        u_xlatb14 = u_xlat0.x<_MidPosRight;
#endif
        u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat0.x>=_MidPosRight);
#else
        u_xlatb14 = u_xlat0.x>=_MidPosRight;
#endif
        u_xlatb6.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat21 = (-_MidPosRight) + 1.0;
        u_xlat21 = (u_xlatb6.x) ? 0.000100016594 : u_xlat21;
        u_xlat0.x = u_xlat0.x / u_xlat21;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<_MidPosRightSharp);
#else
        u_xlatb21 = 0.0<_MidPosRightSharp;
#endif
        u_xlat6 = _MidPosRightSharp * 50.0;
        u_xlat20 = log2(u_xlat0.x);
        u_xlat6 = u_xlat20 * u_xlat6;
        u_xlat6 = exp2(u_xlat6);
        u_xlat6 = (u_xlatb6.y) ? 0.0 : u_xlat6;
        u_xlat0.x = (u_xlatb21) ? u_xlat6 : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb14) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb7.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_4.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1 : u_xlat0;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _LeftColor;
uniform 	vec4 _RightColor;
uniform 	vec4 _MidColor;
uniform 	float _MidPosLeft;
uniform 	float _MidPosRight;
uniform 	float _MidPosLeftSharp;
uniform 	float _MidPosRightSharp;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bvec2 u_xlatb7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump vec2 u_xlat16_17;
float u_xlat20;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb15.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat7.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin(u_xlat16_3.x);
    u_xlat16_5.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin((-u_xlat16_3.x));
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_3.y = u_xlat16_5.x;
    u_xlat16_5.x = dot(u_xlat16_3.yx, u_xlat7.xy);
    u_xlat16_3.z = u_xlat16_4.x;
    u_xlat16_5.y = dot(u_xlat16_3.zy, u_xlat7.xy);
    u_xlat16_3.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat16_10.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlat16_10.x = (u_xlatb15.y) ? u_xlat16_10.x : u_xlat10_2.w;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat15.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat15.xy;
    u_xlat16_17.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat16_17.xy).x;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = u_xlat7.x + _SoftSize;
    u_xlat14 = u_xlat7.y + _DissolveStep;
    u_xlat16_17.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat14;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat1.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat10_21;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat16_17.x = (-u_xlat14) + u_xlat10_21;
    u_xlat16_24 = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_17.x = u_xlat16_24 * u_xlat16_17.x;
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
    u_xlat16_24 = u_xlat16_17.x * -2.0 + 3.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_24;
    u_xlat16_5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_24 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_24);
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_17.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb14) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_10.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_10.x = dot(u_xlat16_4.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_10.xyz = (u_xlatb7.x) ? u_xlat16_10.xxx : u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
    u_xlat0.x = (u_xlatb0) ? u_xlat16_3.x : vs_TEXCOORD0.x;
    u_xlatb7.x = _MidPosLeft>=u_xlat0.x;
    if(u_xlatb7.x){
        u_xlatb7.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat7.x = (u_xlatb7.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat7.x = u_xlat0.x / u_xlat7.x;
        u_xlatb21 = 0.0<_MidPosLeftSharp;
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat9 = log2(u_xlat7.x);
        u_xlat2.x = u_xlat9 * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat14 = (u_xlatb7.y) ? 0.0 : u_xlat2.x;
        u_xlat7.x = (u_xlatb21) ? u_xlat14 : u_xlat7.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat7.xxxx * u_xlat2 + _LeftColor;
    } else {
        u_xlatb7.x = _MidPosLeft<u_xlat0.x;
        u_xlatb14 = u_xlat0.x<_MidPosRight;
        u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
        u_xlatb14 = u_xlat0.x>=_MidPosRight;
        u_xlatb6.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat21 = (-_MidPosRight) + 1.0;
        u_xlat21 = (u_xlatb6.x) ? 0.000100016594 : u_xlat21;
        u_xlat0.x = u_xlat0.x / u_xlat21;
        u_xlatb21 = 0.0<_MidPosRightSharp;
        u_xlat6 = _MidPosRightSharp * 50.0;
        u_xlat20 = log2(u_xlat0.x);
        u_xlat6 = u_xlat20 * u_xlat6;
        u_xlat6 = exp2(u_xlat6);
        u_xlat6 = (u_xlatb6.y) ? 0.0 : u_xlat6;
        u_xlat0.x = (u_xlatb21) ? u_xlat6 : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb14) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb7.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1 : u_xlat0;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _LeftColor;
uniform 	vec4 _RightColor;
uniform 	vec4 _MidColor;
uniform 	float _MidPosLeft;
uniform 	float _MidPosRight;
uniform 	float _MidPosLeftSharp;
uniform 	float _MidPosRightSharp;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bvec2 u_xlatb7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump vec2 u_xlat16_17;
float u_xlat20;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb15.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat7.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin(u_xlat16_3.x);
    u_xlat16_5.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin((-u_xlat16_3.x));
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_3.y = u_xlat16_5.x;
    u_xlat16_5.x = dot(u_xlat16_3.yx, u_xlat7.xy);
    u_xlat16_3.z = u_xlat16_4.x;
    u_xlat16_5.y = dot(u_xlat16_3.zy, u_xlat7.xy);
    u_xlat16_3.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat16_10.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlat16_10.x = (u_xlatb15.y) ? u_xlat16_10.x : u_xlat10_2.w;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat15.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat15.xy;
    u_xlat16_17.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat16_17.xy).x;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = u_xlat7.x + _SoftSize;
    u_xlat14 = u_xlat7.y + _DissolveStep;
    u_xlat16_17.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat14;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat1.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat10_21;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat16_17.x = (-u_xlat14) + u_xlat10_21;
    u_xlat16_24 = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_17.x = u_xlat16_24 * u_xlat16_17.x;
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
    u_xlat16_24 = u_xlat16_17.x * -2.0 + 3.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_24;
    u_xlat16_5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_24 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_24);
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_17.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb14) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_10.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_10.x = dot(u_xlat16_4.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_10.xyz = (u_xlatb7.x) ? u_xlat16_10.xxx : u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
    u_xlat0.x = (u_xlatb0) ? u_xlat16_3.x : vs_TEXCOORD0.x;
    u_xlatb7.x = _MidPosLeft>=u_xlat0.x;
    if(u_xlatb7.x){
        u_xlatb7.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat7.x = (u_xlatb7.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat7.x = u_xlat0.x / u_xlat7.x;
        u_xlatb21 = 0.0<_MidPosLeftSharp;
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat9 = log2(u_xlat7.x);
        u_xlat2.x = u_xlat9 * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat14 = (u_xlatb7.y) ? 0.0 : u_xlat2.x;
        u_xlat7.x = (u_xlatb21) ? u_xlat14 : u_xlat7.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat7.xxxx * u_xlat2 + _LeftColor;
    } else {
        u_xlatb7.x = _MidPosLeft<u_xlat0.x;
        u_xlatb14 = u_xlat0.x<_MidPosRight;
        u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
        u_xlatb14 = u_xlat0.x>=_MidPosRight;
        u_xlatb6.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat21 = (-_MidPosRight) + 1.0;
        u_xlat21 = (u_xlatb6.x) ? 0.000100016594 : u_xlat21;
        u_xlat0.x = u_xlat0.x / u_xlat21;
        u_xlatb21 = 0.0<_MidPosRightSharp;
        u_xlat6 = _MidPosRightSharp * 50.0;
        u_xlat20 = log2(u_xlat0.x);
        u_xlat6 = u_xlat20 * u_xlat6;
        u_xlat6 = exp2(u_xlat6);
        u_xlat6 = (u_xlatb6.y) ? 0.0 : u_xlat6;
        u_xlat0.x = (u_xlatb21) ? u_xlat6 : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb14) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb7.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1 : u_xlat0;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _LeftColor;
uniform 	vec4 _RightColor;
uniform 	vec4 _MidColor;
uniform 	float _MidPosLeft;
uniform 	float _MidPosRight;
uniform 	float _MidPosLeftSharp;
uniform 	float _MidPosRightSharp;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bvec2 u_xlatb7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump vec2 u_xlat16_17;
float u_xlat20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb15.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat7.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin(u_xlat16_3.x);
    u_xlat16_5.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin((-u_xlat16_3.x));
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_3.y = u_xlat16_5.x;
    u_xlat16_5.x = dot(u_xlat16_3.yx, u_xlat7.xy);
    u_xlat16_3.z = u_xlat16_4.x;
    u_xlat16_5.y = dot(u_xlat16_3.zy, u_xlat7.xy);
    u_xlat16_3.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat16_10.x = u_xlat16_2.w * u_xlat16_2.x;
    u_xlat16_10.x = (u_xlatb15.y) ? u_xlat16_10.x : u_xlat16_2.w;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat15.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat15.xy;
    u_xlat16_17.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat16_17.xy).x;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = u_xlat7.x + _SoftSize;
    u_xlat14 = u_xlat7.y + _DissolveStep;
    u_xlat16_17.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat14;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat1.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_21;
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
    u_xlat16_17.x = (-u_xlat14) + u_xlat16_21;
    u_xlat16_24 = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_17.x = u_xlat16_24 * u_xlat16_17.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_17.x * -2.0 + 3.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_24;
    u_xlat16_5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_24 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_24);
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_17.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb14) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_10.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_10.x = dot(u_xlat16_4.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_10.xyz = (u_xlatb7.x) ? u_xlat16_10.xxx : u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
#endif
    u_xlat0.x = (u_xlatb0) ? u_xlat16_3.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(_MidPosLeft>=u_xlat0.x);
#else
    u_xlatb7.x = _MidPosLeft>=u_xlat0.x;
#endif
    if(u_xlatb7.x){
        u_xlatb7.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat7.x = (u_xlatb7.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat7.x = u_xlat0.x / u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<_MidPosLeftSharp);
#else
        u_xlatb21 = 0.0<_MidPosLeftSharp;
#endif
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat9 = log2(u_xlat7.x);
        u_xlat2.x = u_xlat9 * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat14 = (u_xlatb7.y) ? 0.0 : u_xlat2.x;
        u_xlat7.x = (u_xlatb21) ? u_xlat14 : u_xlat7.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat7.xxxx * u_xlat2 + _LeftColor;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb7.x = !!(_MidPosLeft<u_xlat0.x);
#else
        u_xlatb7.x = _MidPosLeft<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat0.x<_MidPosRight);
#else
        u_xlatb14 = u_xlat0.x<_MidPosRight;
#endif
        u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat0.x>=_MidPosRight);
#else
        u_xlatb14 = u_xlat0.x>=_MidPosRight;
#endif
        u_xlatb6.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat21 = (-_MidPosRight) + 1.0;
        u_xlat21 = (u_xlatb6.x) ? 0.000100016594 : u_xlat21;
        u_xlat0.x = u_xlat0.x / u_xlat21;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<_MidPosRightSharp);
#else
        u_xlatb21 = 0.0<_MidPosRightSharp;
#endif
        u_xlat6 = _MidPosRightSharp * 50.0;
        u_xlat20 = log2(u_xlat0.x);
        u_xlat6 = u_xlat20 * u_xlat6;
        u_xlat6 = exp2(u_xlat6);
        u_xlat6 = (u_xlatb6.y) ? 0.0 : u_xlat6;
        u_xlat0.x = (u_xlatb21) ? u_xlat6 : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb14) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb7.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_4.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1 : u_xlat0;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _LeftColor;
uniform 	vec4 _RightColor;
uniform 	vec4 _MidColor;
uniform 	float _MidPosLeft;
uniform 	float _MidPosRight;
uniform 	float _MidPosLeftSharp;
uniform 	float _MidPosRightSharp;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bvec2 u_xlatb7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump vec2 u_xlat16_17;
float u_xlat20;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_7 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb15.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat7.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin(u_xlat16_3.x);
    u_xlat16_5.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin((-u_xlat16_3.x));
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_3.y = u_xlat16_5.x;
    u_xlat16_5.x = dot(u_xlat16_3.yx, u_xlat7.xy);
    u_xlat16_3.z = u_xlat16_4.x;
    u_xlat16_5.y = dot(u_xlat16_3.zy, u_xlat7.xy);
    u_xlat16_3.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat16_10.x = u_xlat16_2.w * u_xlat16_2.x;
    u_xlat16_10.x = (u_xlatb15.y) ? u_xlat16_10.x : u_xlat16_2.w;
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat15.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat15.xy;
    u_xlat16_17.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat16_17.xy).x;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = u_xlat7.x + _SoftSize;
    u_xlat14 = u_xlat7.y + _DissolveStep;
    u_xlat16_17.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat14;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat1.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_21;
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
    u_xlat16_17.x = (-u_xlat14) + u_xlat16_21;
    u_xlat16_24 = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_17.x = u_xlat16_24 * u_xlat16_17.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.x = min(max(u_xlat16_17.x, 0.0), 1.0);
#else
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_17.x * -2.0 + 3.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_24;
    u_xlat16_5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_24 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_24);
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(_DiffusePower) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_17.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb14) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_10.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_10.x = dot(u_xlat16_4.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_10.xyz = (u_xlatb7.x) ? u_xlat16_10.xxx : u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
#endif
    u_xlat0.x = (u_xlatb0) ? u_xlat16_3.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(_MidPosLeft>=u_xlat0.x);
#else
    u_xlatb7.x = _MidPosLeft>=u_xlat0.x;
#endif
    if(u_xlatb7.x){
        u_xlatb7.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat7.x = (u_xlatb7.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat7.x = u_xlat0.x / u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<_MidPosLeftSharp);
#else
        u_xlatb21 = 0.0<_MidPosLeftSharp;
#endif
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat9 = log2(u_xlat7.x);
        u_xlat2.x = u_xlat9 * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat14 = (u_xlatb7.y) ? 0.0 : u_xlat2.x;
        u_xlat7.x = (u_xlatb21) ? u_xlat14 : u_xlat7.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat7.xxxx * u_xlat2 + _LeftColor;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb7.x = !!(_MidPosLeft<u_xlat0.x);
#else
        u_xlatb7.x = _MidPosLeft<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat0.x<_MidPosRight);
#else
        u_xlatb14 = u_xlat0.x<_MidPosRight;
#endif
        u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(u_xlat0.x>=_MidPosRight);
#else
        u_xlatb14 = u_xlat0.x>=_MidPosRight;
#endif
        u_xlatb6.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat21 = (-_MidPosRight) + 1.0;
        u_xlat21 = (u_xlatb6.x) ? 0.000100016594 : u_xlat21;
        u_xlat0.x = u_xlat0.x / u_xlat21;
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<_MidPosRightSharp);
#else
        u_xlatb21 = 0.0<_MidPosRightSharp;
#endif
        u_xlat6 = _MidPosRightSharp * 50.0;
        u_xlat20 = log2(u_xlat0.x);
        u_xlat6 = u_xlat20 * u_xlat6;
        u_xlat6 = exp2(u_xlat6);
        u_xlat6 = (u_xlatb6.y) ? 0.0 : u_xlat6;
        u_xlat0.x = (u_xlatb21) ? u_xlat6 : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb14) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb7.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_4.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1 : u_xlat0;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _LeftColor;
uniform 	vec4 _RightColor;
uniform 	vec4 _MidColor;
uniform 	float _MidPosLeft;
uniform 	float _MidPosRight;
uniform 	float _MidPosLeftSharp;
uniform 	float _MidPosRightSharp;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bvec2 u_xlatb7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump vec2 u_xlat16_17;
float u_xlat20;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb15.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat7.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin(u_xlat16_3.x);
    u_xlat16_5.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin((-u_xlat16_3.x));
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_3.y = u_xlat16_5.x;
    u_xlat16_5.x = dot(u_xlat16_3.yx, u_xlat7.xy);
    u_xlat16_3.z = u_xlat16_4.x;
    u_xlat16_5.y = dot(u_xlat16_3.zy, u_xlat7.xy);
    u_xlat16_3.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat16_10.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlat16_10.x = (u_xlatb15.y) ? u_xlat16_10.x : u_xlat10_2.w;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat15.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat15.xy;
    u_xlat16_17.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat16_17.xy).x;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = u_xlat7.x + _SoftSize;
    u_xlat14 = u_xlat7.y + _DissolveStep;
    u_xlat16_17.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat14;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat1.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat10_21;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat16_17.x = (-u_xlat14) + u_xlat10_21;
    u_xlat16_24 = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_17.x = u_xlat16_24 * u_xlat16_17.x;
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
    u_xlat16_24 = u_xlat16_17.x * -2.0 + 3.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_24;
    u_xlat16_5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_24 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_24);
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_17.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb14) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_10.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_10.x = dot(u_xlat16_4.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_10.xyz = (u_xlatb7.x) ? u_xlat16_10.xxx : u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
    u_xlat0.x = (u_xlatb0) ? u_xlat16_3.x : vs_TEXCOORD0.x;
    u_xlatb7.x = _MidPosLeft>=u_xlat0.x;
    if(u_xlatb7.x){
        u_xlatb7.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat7.x = (u_xlatb7.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat7.x = u_xlat0.x / u_xlat7.x;
        u_xlatb21 = 0.0<_MidPosLeftSharp;
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat9 = log2(u_xlat7.x);
        u_xlat2.x = u_xlat9 * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat14 = (u_xlatb7.y) ? 0.0 : u_xlat2.x;
        u_xlat7.x = (u_xlatb21) ? u_xlat14 : u_xlat7.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat7.xxxx * u_xlat2 + _LeftColor;
    } else {
        u_xlatb7.x = _MidPosLeft<u_xlat0.x;
        u_xlatb14 = u_xlat0.x<_MidPosRight;
        u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
        u_xlatb14 = u_xlat0.x>=_MidPosRight;
        u_xlatb6.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat21 = (-_MidPosRight) + 1.0;
        u_xlat21 = (u_xlatb6.x) ? 0.000100016594 : u_xlat21;
        u_xlat0.x = u_xlat0.x / u_xlat21;
        u_xlatb21 = 0.0<_MidPosRightSharp;
        u_xlat6 = _MidPosRightSharp * 50.0;
        u_xlat20 = log2(u_xlat0.x);
        u_xlat6 = u_xlat20 * u_xlat6;
        u_xlat6 = exp2(u_xlat6);
        u_xlat6 = (u_xlatb6.y) ? 0.0 : u_xlat6;
        u_xlat0.x = (u_xlatb21) ? u_xlat6 : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb14) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb7.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1 : u_xlat0;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _LeftColor;
uniform 	vec4 _RightColor;
uniform 	vec4 _MidColor;
uniform 	float _MidPosLeft;
uniform 	float _MidPosRight;
uniform 	float _MidPosLeftSharp;
uniform 	float _MidPosRightSharp;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DiffuseAdd;
uniform 	mediump float _DissolveOutline_On;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	vec4 _GChannel;
uniform 	mediump float _DiffAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bvec2 u_xlatb7;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
bvec2 u_xlatb15;
mediump vec2 u_xlat16_17;
float u_xlat20;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(_OpenCustom) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_7) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb15.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb15.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat7.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat16_4.x = sin(u_xlat16_3.x);
    u_xlat16_5.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin((-u_xlat16_3.x));
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16_3.y = u_xlat16_5.x;
    u_xlat16_5.x = dot(u_xlat16_3.yx, u_xlat7.xy);
    u_xlat16_3.z = u_xlat16_4.x;
    u_xlat16_5.y = dot(u_xlat16_3.zy, u_xlat7.xy);
    u_xlat16_3.xy = u_xlat16_5.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_3.xy;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat16_10.x = u_xlat10_2.w * u_xlat10_2.x;
    u_xlat16_10.x = (u_xlatb15.y) ? u_xlat16_10.x : u_xlat10_2.w;
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat15.xy = vs_TEXCOORD2.zw * vec2(_OpenCustom) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat15.xy;
    u_xlat16_17.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat16_17.xy).x;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat7.x = u_xlat7.x + _SoftSize;
    u_xlat14 = u_xlat7.y + _DissolveStep;
    u_xlat16_17.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat14;
    u_xlat7.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat1.x = (-u_xlat7.x) + u_xlat16_17.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat10_21;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat1.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat1.x;
    u_xlat16_17.x = (-u_xlat14) + u_xlat10_21;
    u_xlat16_24 = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_17.x = u_xlat16_24 * u_xlat16_17.x;
    u_xlat16_17.x = clamp(u_xlat16_17.x, 0.0, 1.0);
    u_xlat16_24 = u_xlat16_17.x * -2.0 + 3.0;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_17.x;
    u_xlat16_17.x = u_xlat16_17.x * u_xlat16_24;
    u_xlat16_5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_24 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_24);
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * vec3(_DiffusePower) + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat16_17.xxx * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlatb14 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb14) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_10.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_10.x = dot(u_xlat16_4.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_10.xyz = (u_xlatb7.x) ? u_xlat16_10.xxx : u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_10.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_1.xyz = (u_xlatb7.y) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
    u_xlat0.x = (u_xlatb0) ? u_xlat16_3.x : vs_TEXCOORD0.x;
    u_xlatb7.x = _MidPosLeft>=u_xlat0.x;
    if(u_xlatb7.x){
        u_xlatb7.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat7.x = (u_xlatb7.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat7.x = u_xlat0.x / u_xlat7.x;
        u_xlatb21 = 0.0<_MidPosLeftSharp;
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat9 = log2(u_xlat7.x);
        u_xlat2.x = u_xlat9 * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat14 = (u_xlatb7.y) ? 0.0 : u_xlat2.x;
        u_xlat7.x = (u_xlatb21) ? u_xlat14 : u_xlat7.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat7.xxxx * u_xlat2 + _LeftColor;
    } else {
        u_xlatb7.x = _MidPosLeft<u_xlat0.x;
        u_xlatb14 = u_xlat0.x<_MidPosRight;
        u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
        u_xlatb14 = u_xlat0.x>=_MidPosRight;
        u_xlatb6.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat21 = (-_MidPosRight) + 1.0;
        u_xlat21 = (u_xlatb6.x) ? 0.000100016594 : u_xlat21;
        u_xlat0.x = u_xlat0.x / u_xlat21;
        u_xlatb21 = 0.0<_MidPosRightSharp;
        u_xlat6 = _MidPosRightSharp * 50.0;
        u_xlat20 = log2(u_xlat0.x);
        u_xlat6 = u_xlat20 * u_xlat6;
        u_xlat6 = exp2(u_xlat6);
        u_xlat6 = (u_xlatb6.y) ? 0.0 : u_xlat6;
        u_xlat0.x = (u_xlatb21) ? u_xlat6 : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb14) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb7.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_4.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat0.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_1 : u_xlat0;
    SV_Target0.xyz = u_xlat16_0.xyz + vec3(vec3(_DiffuseAdd, _DiffuseAdd, _DiffuseAdd));
    SV_Target0.w = u_xlat16_0.w;
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
Keywords { "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
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
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
}
}
}
}