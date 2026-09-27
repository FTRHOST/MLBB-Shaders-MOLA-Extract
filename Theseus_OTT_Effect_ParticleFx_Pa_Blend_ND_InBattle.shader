//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/ParticleFx_Pa_Blend_ND_InBattle" {
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
  GpuProgramID 41510
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_15.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = (-u_xlat16_7.x) + vs_TEXCOORD0.x;
    u_xlat16_15.x = float(1.0) / u_xlat16_15.x;
    u_xlat16_7.x = u_xlat16_15.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_15.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = (-u_xlat16_7.x) + vs_TEXCOORD0.x;
    u_xlat16_15.x = float(1.0) / u_xlat16_15.x;
    u_xlat16_7.x = u_xlat16_15.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_15.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = (-u_xlat16_7.x) + vs_TEXCOORD0.x;
    u_xlat16_15.x = float(1.0) / u_xlat16_15.x;
    u_xlat16_7.x = u_xlat16_15.x * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_15.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = (-u_xlat16_7.x) + vs_TEXCOORD0.x;
    u_xlat16_15.x = float(1.0) / u_xlat16_15.x;
    u_xlat16_7.x = u_xlat16_15.x * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_23;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat10.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat10.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb10.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb10.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb10.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_23 = u_xlat2.x + (-u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_0 : u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_23;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat10.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat10.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb10.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb10.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb10.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_23 = u_xlat2.x + (-u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_0 : u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_23;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat10.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat10.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb10.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb10.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb10.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_23 = u_xlat2.x + (-u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_0 : u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_23;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat10.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat10.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb10.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb10.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb10.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_23 = u_xlat2.x + (-u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_0 : u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    SV_Target0.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_15.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = (-u_xlat16_7.x) + vs_TEXCOORD0.x;
    u_xlat16_15.x = float(1.0) / u_xlat16_15.x;
    u_xlat16_7.x = u_xlat16_15.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0 = u_xlat16_0;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_15.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = (-u_xlat16_7.x) + vs_TEXCOORD0.x;
    u_xlat16_15.x = float(1.0) / u_xlat16_15.x;
    u_xlat16_7.x = u_xlat16_15.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0 = u_xlat16_0;
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_15.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = (-u_xlat16_7.x) + vs_TEXCOORD0.x;
    u_xlat16_15.x = float(1.0) / u_xlat16_15.x;
    u_xlat16_7.x = u_xlat16_15.x * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0 = u_xlat16_0;
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat2.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat2.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb2.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb2.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_15.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = (-u_xlat16_7.x) + vs_TEXCOORD0.x;
    u_xlat16_15.x = float(1.0) / u_xlat16_15.x;
    u_xlat16_7.x = u_xlat16_15.x * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0 = u_xlat16_0;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_23;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat10.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat10.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb10.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb10.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb10.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_23 = u_xlat2.x + (-u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0 = u_xlat16_0;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_23;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _GChannel.zw * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _DiffYSpeed * _Time.y;
    u_xlat19.x = _DiffXSpeed * _Time.y;
    u_xlat10.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat10.xy);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat16_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat16_0.x * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
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
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
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
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat10.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb10.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb10.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb10.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_23 = u_xlat2.x + (-u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0 = u_xlat16_0;
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_23;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat10.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat10.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb10.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb10.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb10.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_23 = u_xlat2.x + (-u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_0 : u_xlat16_1;
    SV_Target0 = u_xlat16_0;
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
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _OpenCustom;
uniform 	mediump float _LeftWeights;
uniform 	mediump float _RightWeights;
uniform 	mediump float _Gradient;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat10;
bvec2 u_xlatb10;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
bvec2 u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_23;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat16.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat16_1.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16.x = texture2D(_Mask, u_xlat16.xy).x;
    u_xlat2.xy = u_xlat16.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb18.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat0.xy = (u_xlatb18.x) ? u_xlat2.xy : u_xlat0.xy;
    u_xlat2.xy = u_xlat0.xy + u_xlat16_1.zw;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _DiffAngle * 0.0174532924;
    u_xlat3.x = sin((-u_xlat16_1.x));
    u_xlat4.x = sin(u_xlat16_1.x);
    u_xlat5 = cos(u_xlat16_1.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat2.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat2.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat19.y = _Time.y * _DiffYSpeed;
    u_xlat19.x = _Time.y * _DiffXSpeed;
    u_xlat10.xy = u_xlat2.xy + u_xlat19.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat10.xy);
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_6.xyz;
    u_xlat16_30 = u_xlat10_1.w * u_xlat16_6.x;
    u_xlat16_30 = (u_xlatb18.y) ? u_xlat16_30 : u_xlat10_1.w;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16_7.x = (u_xlatb24) ? 1.0 : u_xlat16.x;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_7.xy).x;
    u_xlat16_7.x = u_xlat10_0 * 0.305306017 + 0.682171106;
    u_xlat16_7.x = u_xlat10_0 * u_xlat16_7.x + 0.0125228781;
    u_xlat16_15.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat16_15.xy = max(u_xlat16_15.xy, vec2(0.0, 0.0));
    u_xlat16_15.xy = u_xlat16_15.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat8.x = u_xlat16_15.y + (-_DissolveOutlineWidth);
    u_xlat16.x = (-u_xlat16_15.x) + u_xlat8.x;
    u_xlat24 = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16_15.y);
    u_xlat0.x = u_xlat10_0 * u_xlat16_7.x + (-u_xlat16.x);
    u_xlat8.x = (-u_xlat16.x) + u_xlat8.x;
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_30;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat8.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat8.x = u_xlat8.x * u_xlat24;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.x = u_xlat8.x * -2.0 + 3.0;
    u_xlat8.x = u_xlat8.x * u_xlat8.x;
    u_xlat8.x = u_xlat8.x * u_xlat16.x;
    u_xlat16_7.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat10.xyz = u_xlat16_6.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower)) + (-u_xlat16_7.xyz);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat10.xyz + u_xlat16_7.xyz;
    u_xlat16_6.x = dot(u_xlat8.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb10.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb10.x) ? u_xlat16_6.xxx : u_xlat8.xyz;
    u_xlat16_7.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_6.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_6.xyz = (u_xlatb10.y) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    u_xlat16_7.xy = vec2(vec2(_Gradient, _Gradient)) + vec2(_LeftWeights, _RightWeights);
    u_xlat16_23 = u_xlat2.x + (-u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_7.y;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_15.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_15.x;
    u_xlat16_0.xyz = _LeftColor.xyz * _LeftColor.xyz;
    u_xlat16_1.xyz = _RightColor.xyz * _RightColor.xyz + (-u_xlat16_0.xyz);
    u_xlat16_0.w = _LeftColor.w;
    u_xlat16_1.w = (-u_xlat16_0.w) + _RightColor.w;
    u_xlat16_0 = u_xlat16_7.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat16_1 = u_xlat16_0 * u_xlat16_6;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_7.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = u_xlat16_1.w * vs_COLOR0.w;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_0 = (bool(u_xlatb2)) ? u_xlat16_0 : u_xlat16_1;
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
}