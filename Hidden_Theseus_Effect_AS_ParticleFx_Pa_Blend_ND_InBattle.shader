//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/Effect/AS_ParticleFx_Pa_Blend_ND_InBattle" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

[Space(15)] [Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

[Space(15)] [Header(Texture(2D)________________________________________________________________________)] [Space(10)] [Toggle(OpenCustom)] _OpenCustom ("开启CustomData", Float) = 0.0

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

[Space(10)] _DissolveOutlineWidth ("溶解边缘", Range(0, 0.5)) = 0.0010000000474974513

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

[Toggle(_GRADIENT_SAME_DIFF_ON)] _GRADIENT_SAME_DIFF_ON ("左右渐变开启Diff相同UV(禁动画中K开关)", Float) = 0.0

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_LeftWeights ("左侧渐变色权重", Range(0, 1)) = 0.0

_RightWeights ("右侧渐变色权重", Range(0, 1)) = 1.0

_Gradient ("渐变色权重偏移", Range(-1, 1)) = 0.0

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
  GpuProgramID 11947
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_IsGray<1.0);
#else
    u_xlatb7 = _IsGray<1.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb7)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_1.w = (u_xlatb7) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0 = u_xlat16_1;
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_IsGray<1.0);
#else
    u_xlatb7 = _IsGray<1.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb7)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_1.w = (u_xlatb7) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0 = u_xlat16_1;
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
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_1.w;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlatb7 = _IsGray<1.0;
    u_xlat16_1.xyz = (bool(u_xlatb7)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_1.w = (u_xlatb7) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0 = u_xlat16_1;
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
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_1.w;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlatb7 = _IsGray<1.0;
    u_xlat16_1.xyz = (bool(u_xlatb7)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_1.w = (u_xlatb7) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0 = u_xlat16_1;
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_IsGray<1.0);
#else
    u_xlatb7 = _IsGray<1.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb7)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_1.w = (u_xlatb7) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0 = u_xlat16_1;
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_IsGray<1.0);
#else
    u_xlatb7 = _IsGray<1.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb7)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_1.w = (u_xlatb7) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0 = u_xlat16_1;
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
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_1.w;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlatb7 = _IsGray<1.0;
    u_xlat16_1.xyz = (bool(u_xlatb7)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_1.w = (u_xlatb7) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0 = u_xlat16_1;
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
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_1.w;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlatb7 = _IsGray<1.0;
    u_xlat16_1.xyz = (bool(u_xlatb7)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_1.w = (u_xlatb7) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0 = u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat16;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat1.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat24 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat24));
    u_xlat2.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat16_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xzw;
    u_xlat24 = u_xlat16_1.w * u_xlat1.x;
    u_xlat24 = (u_xlatb2.y) ? u_xlat24 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb25) ? 1.0 : u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat8.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat8.xz = max(u_xlat8.xz, vec2(0.0, 0.0));
    u_xlat8.xz = u_xlat8.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat25 = u_xlat8.z + (-_DissolveOutlineWidth);
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat24 = (-u_xlat8.z) + u_xlat16_0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat16_0;
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
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
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat8.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_IsGray<1.0);
#else
    u_xlatb8 = _IsGray<1.0;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb8)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_5.x = (u_xlatb8) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0.w = u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat16;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat1.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat24 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat24));
    u_xlat2.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat16_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xzw;
    u_xlat24 = u_xlat16_1.w * u_xlat1.x;
    u_xlat24 = (u_xlatb2.y) ? u_xlat24 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb25) ? 1.0 : u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat8.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat8.xz = max(u_xlat8.xz, vec2(0.0, 0.0));
    u_xlat8.xz = u_xlat8.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat25 = u_xlat8.z + (-_DissolveOutlineWidth);
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat24 = (-u_xlat8.z) + u_xlat16_0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat16_0;
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
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
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat8.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_IsGray<1.0);
#else
    u_xlatb8 = _IsGray<1.0;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb8)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_5.x = (u_xlatb8) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0.w = u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat16;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat1.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat24 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat24));
    u_xlat2.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat10_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xzw;
    u_xlat24 = u_xlat10_1.w * u_xlat1.x;
    u_xlat24 = (u_xlatb2.y) ? u_xlat24 : u_xlat10_1.w;
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb25) ? 1.0 : u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat8.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat8.xz = max(u_xlat8.xz, vec2(0.0, 0.0));
    u_xlat8.xz = u_xlat8.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat25 = u_xlat8.z + (-_DissolveOutlineWidth);
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat24 = (-u_xlat8.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat10_0;
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat8.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlatb8 = _IsGray<1.0;
    u_xlat16_5.xyz = (bool(u_xlatb8)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_5.x = (u_xlatb8) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0.w = u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat16;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat1.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat24 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat24));
    u_xlat2.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat10_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xzw;
    u_xlat24 = u_xlat10_1.w * u_xlat1.x;
    u_xlat24 = (u_xlatb2.y) ? u_xlat24 : u_xlat10_1.w;
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb25) ? 1.0 : u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat8.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat8.xz = max(u_xlat8.xz, vec2(0.0, 0.0));
    u_xlat8.xz = u_xlat8.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat25 = u_xlat8.z + (-_DissolveOutlineWidth);
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat24 = (-u_xlat8.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat10_0;
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat8.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlatb8 = _IsGray<1.0;
    u_xlat16_5.xyz = (bool(u_xlatb8)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_5.x = (u_xlatb8) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0.w = u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat16;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat1.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat24 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat24));
    u_xlat2.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat16_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xzw;
    u_xlat24 = u_xlat16_1.w * u_xlat1.x;
    u_xlat24 = (u_xlatb2.y) ? u_xlat24 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb25) ? 1.0 : u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat8.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat8.xz = max(u_xlat8.xz, vec2(0.0, 0.0));
    u_xlat8.xz = u_xlat8.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat25 = u_xlat8.z + (-_DissolveOutlineWidth);
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat24 = (-u_xlat8.z) + u_xlat16_0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat16_0;
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
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
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat8.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_IsGray<1.0);
#else
    u_xlatb8 = _IsGray<1.0;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb8)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_5.x = (u_xlatb8) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0.w = u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat16;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat1.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat24 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat24));
    u_xlat2.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat16_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xzw;
    u_xlat24 = u_xlat16_1.w * u_xlat1.x;
    u_xlat24 = (u_xlatb2.y) ? u_xlat24 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb25) ? 1.0 : u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat8.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat8.xz = max(u_xlat8.xz, vec2(0.0, 0.0));
    u_xlat8.xz = u_xlat8.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat25 = u_xlat8.z + (-_DissolveOutlineWidth);
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat24 = (-u_xlat8.z) + u_xlat16_0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat16_0;
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
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
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat8.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(_IsGray<1.0);
#else
    u_xlatb8 = _IsGray<1.0;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb8)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_5.x = (u_xlatb8) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0.w = u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat16;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat1.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat24 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat24));
    u_xlat2.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat10_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xzw;
    u_xlat24 = u_xlat10_1.w * u_xlat1.x;
    u_xlat24 = (u_xlatb2.y) ? u_xlat24 : u_xlat10_1.w;
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb25) ? 1.0 : u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat8.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat8.xz = max(u_xlat8.xz, vec2(0.0, 0.0));
    u_xlat8.xz = u_xlat8.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat25 = u_xlat8.z + (-_DissolveOutlineWidth);
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat24 = (-u_xlat8.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat10_0;
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat8.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlatb8 = _IsGray<1.0;
    u_xlat16_5.xyz = (bool(u_xlatb8)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_5.x = (u_xlatb8) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0.w = u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat16;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat1.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat24 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat24));
    u_xlat2.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat10_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xzw;
    u_xlat24 = u_xlat10_1.w * u_xlat1.x;
    u_xlat24 = (u_xlatb2.y) ? u_xlat24 : u_xlat10_1.w;
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb25) ? 1.0 : u_xlat16.x;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat8.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat8.xz = max(u_xlat8.xz, vec2(0.0, 0.0));
    u_xlat8.xz = u_xlat8.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat25 = u_xlat8.z + (-_DissolveOutlineWidth);
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat24 = (-u_xlat8.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat10_0;
    u_xlat8.x = (-u_xlat8.x) + u_xlat25;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat8.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat8.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlatb8 = _IsGray<1.0;
    u_xlat16_5.xyz = (bool(u_xlatb8)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_5.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_5.x = (u_xlatb8) ? u_xlat16_5.x : u_xlat0.x;
    SV_Target0.w = u_xlat16_5.x;
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0.x;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = (-u_xlat16_6.x) + vs_TEXCOORD0.x;
    u_xlat16_26 = float(1.0) / u_xlat16_26;
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
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0.x;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = (-u_xlat16_6.x) + vs_TEXCOORD0.x;
    u_xlat16_26 = float(1.0) / u_xlat16_26;
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
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_1.w;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = (-u_xlat16_6.x) + vs_TEXCOORD0.x;
    u_xlat16_26 = float(1.0) / u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat21 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_1.w;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = (-u_xlat16_6.x) + vs_TEXCOORD0.x;
    u_xlat16_26 = float(1.0) / u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1 = (-_LeftColor) + _RightColor;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_1 + _LeftColor;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    SV_Target0 = u_xlat16_0;
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat14;
float u_xlat21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat8.xy);
    u_xlat21 = u_xlat16_3.w * u_xlat16_3.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb8.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb8.x) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat8.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat8.x;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0.x;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat8.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(_DiffusePower) + (-u_xlat8.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat8.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb8.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb8.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat1.x + (-u_xlat16_6.x);
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
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    SV_Target0 = u_xlat16_0;
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat14;
float u_xlat21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat8.xy);
    u_xlat21 = u_xlat16_3.w * u_xlat16_3.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb8.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb8.x) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat8.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat8.x;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0.x;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat8.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(_DiffusePower) + (-u_xlat8.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat8.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb8.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb8.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat1.x + (-u_xlat16_6.x);
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
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    SV_Target0 = u_xlat16_0;
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
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat14;
float u_xlat21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat21 = u_xlat10_3.w * u_xlat10_3.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_3.w;
    u_xlatb8.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb8.x) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat8.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat8.x;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat8.x;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat8.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_3.xyz * vec3(_DiffusePower) + (-u_xlat8.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat8.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb8.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb8.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat1.x + (-u_xlat16_6.x);
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
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    SV_Target0 = u_xlat16_0;
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
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat14;
float u_xlat21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat21 = u_xlat10_3.w * u_xlat10_3.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_3.w;
    u_xlatb8.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb8.x) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat8.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat8.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat8.x;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat8.x;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat8.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat10_3.xyz * vec3(_DiffusePower) + (-u_xlat8.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat2.xyz + u_xlat8.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb8.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb8.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat1.x + (-u_xlat16_6.x);
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
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat16_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xzw;
    u_xlat21 = u_xlat16_1.w * u_xlat1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0.x;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = (-u_xlat16_6.x) + vs_TEXCOORD0.x;
    u_xlat16_26 = float(1.0) / u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_2.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.w = _LeftColor.w;
    u_xlat16_2.w = (-u_xlat16_1.w) + _RightColor.w;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    u_xlat16_5.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat16_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xzw;
    u_xlat21 = u_xlat16_1.w * u_xlat1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0.x;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = (-u_xlat16_6.x) + vs_TEXCOORD0.x;
    u_xlat16_26 = float(1.0) / u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_2.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.w = _LeftColor.w;
    u_xlat16_2.w = (-u_xlat16_1.w) + _RightColor.w;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    u_xlat16_5.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat10_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xzw;
    u_xlat21 = u_xlat10_1.w * u_xlat1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_1.w;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = (-u_xlat16_6.x) + vs_TEXCOORD0.x;
    u_xlat16_26 = float(1.0) / u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_2.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.w = _LeftColor.w;
    u_xlat16_2.w = (-u_xlat16_1.w) + _RightColor.w;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    u_xlat16_5.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat14;
float u_xlat21;
float u_xlat22;
bool u_xlatb22;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xzw = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xzw = u_xlat10_1.xyz * u_xlat2.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xzw;
    u_xlat21 = u_xlat10_1.w * u_xlat1.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_1.w;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb22) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat22 = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat22;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb1.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb1.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = (-u_xlat16_6.x) + vs_TEXCOORD0.x;
    u_xlat16_26 = float(1.0) / u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_2.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.w = _LeftColor.w;
    u_xlat16_2.w = (-u_xlat16_1.w) + _RightColor.w;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    u_xlat16_5.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat14;
float u_xlat21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat8.xy);
    u_xlat8.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_3.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_3.xyz;
    u_xlat21 = u_xlat16_3.w * u_xlat8.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb2.x) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat2.x = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0.x;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb8.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb8.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat1.x + (-u_xlat16_6.x);
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
    u_xlat16_1.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_2.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.w = _LeftColor.w;
    u_xlat16_2.w = (-u_xlat16_1.w) + _RightColor.w;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    u_xlat16_5.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat14;
float u_xlat21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat8.xy);
    u_xlat8.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_3.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_3.xyz;
    u_xlat21 = u_xlat16_3.w * u_xlat8.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb2.x) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat2.x = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
    u_xlat21 = (-u_xlat7.z) + u_xlat16_0.x;
    u_xlat0.x = (-u_xlat7.x) + u_xlat16_0.x;
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
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
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb8.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb8.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat1.x + (-u_xlat16_6.x);
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
    u_xlat16_1.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_2.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.w = _LeftColor.w;
    u_xlat16_2.w = (-u_xlat16_1.w) + _RightColor.w;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_IsGray<1.0);
#else
    u_xlatb3 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    u_xlat16_5.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat14;
float u_xlat21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat8.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat10_3.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10_3.xyz;
    u_xlat21 = u_xlat10_3.w * u_xlat8.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_3.w;
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb2.x) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat2.x = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb8.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb8.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat1.x + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_2.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.w = _LeftColor.w;
    u_xlat16_2.w = (-u_xlat16_1.w) + _RightColor.w;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    u_xlat16_5.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat14;
float u_xlat21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat14.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat14.x = texture2D(_Mask, u_xlat14.xy).x;
    u_xlat1.xy = u_xlat14.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat21 = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat21));
    u_xlat2.x = sin(u_xlat21);
    u_xlat4.x = cos(u_xlat21);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat8.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat10_3.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10_3.xyz;
    u_xlat21 = u_xlat10_3.w * u_xlat8.x;
    u_xlat21 = (u_xlatb2.y) ? u_xlat21 : u_xlat10_3.w;
    u_xlatb2.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb2.x) ? 1.0 : u_xlat14.x;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlat2.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat7.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat7.xz = max(u_xlat7.xz, vec2(0.0, 0.0));
    u_xlat7.xz = u_xlat7.xz + vec2(_SoftSize, _DissolveStep);
    u_xlat2.x = u_xlat7.z + (-_DissolveOutlineWidth);
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
    u_xlat21 = (-u_xlat7.z) + u_xlat10_0;
    u_xlat0.x = (-u_xlat7.x) + u_xlat10_0;
    u_xlat7.x = (-u_xlat7.x) + u_xlat2.x;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat0.x = u_xlat7.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat7.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat7.x = u_xlat7.x * u_xlat21;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_5.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(_DissolveColorPW);
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DiffusePower) + (-u_xlat2.xyz);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat8.xyz + u_xlat2.xyz;
    u_xlat16_5.x = dot(u_xlat7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb8.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_5.xyz = (u_xlatb8.x) ? u_xlat16_5.xxx : u_xlat7.xyz;
    u_xlat16_6.xyz = (-u_xlat16_5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz;
    u_xlat0.x = u_xlat0.x * _TransparentStrong;
    u_xlat16_5.xyz = (u_xlatb8.y) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    u_xlat16_6.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_26 = u_xlat1.x + (-u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + u_xlat16_6.y;
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_6.x;
    u_xlat16_1.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_2.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.w = _LeftColor.w;
    u_xlat16_2.w = (-u_xlat16_1.w) + _RightColor.w;
    u_xlat16_1 = vec4(u_xlat16_26) * u_xlat16_2 + u_xlat16_1;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_2.w = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_5.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = u_xlat16_2.w * vs_COLOR0.w;
    u_xlatb3 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb3)) ? u_xlat16_0 : u_xlat16_2;
    u_xlat16_5.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat3.xyz = log2(u_xlat16_5.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
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
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
}
}
}
CustomEditor "HeroShowRenderingGUI.VFX.ASEffectShaderGUI"
}