//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/ParticleFx_Pa_Blend_ND_Common3_V2" {
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

[Space(15)] [Header(Flow Map ________________________________________________________________________)] [Space(10)] [Toggle] _UseFlowMap ("UseFlowMap", Float) = 0.0

_FlowMap ("FlowMap", 2D) = "white" { }

_FlowMapStength ("FlowMapStength", Range(0, 1)) = 0.0

[Toggle] _UseFlowCycle ("两层自动循环", Float) = 0.0

_FlowSpeed ("循环流速", Float) = 0.0

[Space(15)] [Header(Dissolve And Noise________________________________________________________________________)] [Space(10)] _DissolveTex ("溶解和Noise", 2D) = "white" { }

_DissolveStep ("溶解", Range(-2, 2)) = 0.0

_FlowMapDissolveStrength ("FlowMapDissolveStrength", Range(0, 1)) = 0.0

_SoftSize ("溶解软硬", Range(0.01, 2)) = 0.0

[Space(10)] [Toggle] _NoiseUnEffectDiff ("Noise不影响主贴图", Float) = 0.0

[Toggle] _UseSoftEdge ("UseSoftEdge", Float) = 0.0

_DissolveOutlineWidth ("溶解边缘", Range(0, 0.5)) = 0.0010000000474974513

_DissolveOutlineSoft ("溶解边缘_软硬", Range(0, 0.5)) = 0.0

_DissolveColorPW ("溶解边缘_强度", Float) = 1.0

_DissolveColor ("溶解边缘_颜色", Color) = (1,1,1,1)

_DissolveSpeedU ("DissolveSpeedU", Float) = 0.0

_DissolveSpeedV ("DissolveSpeedV", Float) = 0.0

[Space(10)] _NoiseXStreng ("扭曲强度U", Range(-10, 10)) = 0.0

_NoiseYStreng ("扭曲强度V", Range(-10, 10)) = 0.0

_GChannel ("G通xy控Tiling zw控速度", Vector) = (1,1,0,0)

[Space(15)] [Header(Mask________________________________________________________________________)] [Space(10)] _Mask ("Mask", 2D) = "white" { }

[Toggle] _UseUv2 ("_UseUv2", Float) = 0.0

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
  GpuProgramID 29054
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _GChannel.zw * _Time.yy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseUv2);
#else
    u_xlatb36 = 0.0<_UseUv2;
#endif
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_14.xy = texture(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat26.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseFlowMap);
#else
    u_xlatb36 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture(_FlowMap, u_xlat26.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb5 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb5){
            u_xlat5.x = _FlowSpeed * _Time.y;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_OpenCustom);
#else
            u_xlatb16 = 0.0<_OpenCustom;
#endif
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat16_7 = texture(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb4 = _UseFlowCycle==1.0;
#endif
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat16_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat16_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat16_7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat16_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat16_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat16_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat16_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat16_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat16_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat16_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(u_xlat15.x==0.0);
#else
    u_xlatb25.x = u_xlat15.x==0.0;
#endif
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat16_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(_IsGray<1.0);
#else
    u_xlatb25.x = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_0.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_33 = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb14 = 0.0<_UseSoftEdge;
#endif
    u_xlat3.x = u_xlat3.x * u_xlat16_33;
    u_xlat16_33 = (u_xlatb14) ? u_xlat3.x : u_xlat16_33;
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    SV_Target0.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_33;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _GChannel.zw * _Time.yy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseUv2);
#else
    u_xlatb36 = 0.0<_UseUv2;
#endif
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_14.xy = texture(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat26.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseFlowMap);
#else
    u_xlatb36 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture(_FlowMap, u_xlat26.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb5 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb5){
            u_xlat5.x = _FlowSpeed * _Time.y;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_OpenCustom);
#else
            u_xlatb16 = 0.0<_OpenCustom;
#endif
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat16_7 = texture(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb4 = _UseFlowCycle==1.0;
#endif
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat16_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat16_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat16_7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat16_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat16_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat16_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat16_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat16_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat16_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat16_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(u_xlat15.x==0.0);
#else
    u_xlatb25.x = u_xlat15.x==0.0;
#endif
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat16_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(_IsGray<1.0);
#else
    u_xlatb25.x = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_0.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_33 = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb14 = 0.0<_UseSoftEdge;
#endif
    u_xlat3.x = u_xlat3.x * u_xlat16_33;
    u_xlat16_33 = (u_xlatb14) ? u_xlat3.x : u_xlat16_33;
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    SV_Target0.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_33;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
lowp vec2 u_xlat10_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _Time.yy * _GChannel.zw;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb36 = 0.0<_UseUv2;
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_14.xy = texture2D(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat26.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat10_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb36 = 0.0<_UseFlowMap;
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture2D(_FlowMap, u_xlat26.xy).xy;
        u_xlatb5 = _UseFlowCycle==1.0;
        if(u_xlatb5){
            u_xlat5.x = _Time.y * _FlowSpeed;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture2D(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
            u_xlatb16 = 0.0<_OpenCustom;
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat10_7 = texture2D(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz;
    u_xlatb4 = _UseFlowCycle==1.0;
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat10_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat10_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat10_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat10_7.w;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat10_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat10_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat10_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat10_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat10_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat10_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat10_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
    u_xlatb25.x = u_xlat15.x==0.0;
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat10_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
    u_xlatb25.x = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_0.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_33 = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
    u_xlatb14 = 0.0<_UseSoftEdge;
    u_xlat3.x = u_xlat3.x * u_xlat16_33;
    u_xlat16_33 = (u_xlatb14) ? u_xlat3.x : u_xlat16_33;
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    SV_Target0.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    SV_Target0.w = u_xlat16_33;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
lowp vec2 u_xlat10_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _Time.yy * _GChannel.zw;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb36 = 0.0<_UseUv2;
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_14.xy = texture2D(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat26.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat10_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb36 = 0.0<_UseFlowMap;
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture2D(_FlowMap, u_xlat26.xy).xy;
        u_xlatb5 = _UseFlowCycle==1.0;
        if(u_xlatb5){
            u_xlat5.x = _Time.y * _FlowSpeed;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture2D(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
            u_xlatb16 = 0.0<_OpenCustom;
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat10_7 = texture2D(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz;
    u_xlatb4 = _UseFlowCycle==1.0;
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat10_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat10_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat10_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat10_7.w;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat10_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat10_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat10_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat10_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat10_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat10_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat10_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
    u_xlatb25.x = u_xlat15.x==0.0;
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat10_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
    u_xlatb25.x = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_0.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_33 = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
    u_xlatb14 = 0.0<_UseSoftEdge;
    u_xlat3.x = u_xlat3.x * u_xlat16_33;
    u_xlat16_33 = (u_xlatb14) ? u_xlat3.x : u_xlat16_33;
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    SV_Target0.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    SV_Target0.w = u_xlat16_33;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _GChannel.zw * _Time.yy;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseUv2);
#else
    u_xlatb40 = 0.0<_UseUv2;
#endif
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_16.xy = texture(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat29.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat16_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseFlowMap);
#else
    u_xlatb40 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture(_FlowMap, u_xlat29.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb6 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb6){
            u_xlat6.x = _FlowSpeed * _Time.y;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.0<_OpenCustom);
#else
            u_xlatb18 = 0.0<_OpenCustom;
#endif
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat16_8 = texture(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb5 = _UseFlowCycle==1.0;
#endif
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat16_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat16_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat16_8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat16_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat16_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat16_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat16_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat16_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat16_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat16_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat17.x==0.0);
#else
    u_xlatb28.x = u_xlat17.x==0.0;
#endif
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat16_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.x>=u_xlat16_2.y);
#else
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.w>=u_xlat16_7.x);
#else
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_IsGray<1.0);
#else
    u_xlatb16 = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb16 = 0.0<_UseSoftEdge;
#endif
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_36 = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    SV_Target0.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_36;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _GChannel.zw * _Time.yy;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseUv2);
#else
    u_xlatb40 = 0.0<_UseUv2;
#endif
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_16.xy = texture(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat29.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat16_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseFlowMap);
#else
    u_xlatb40 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture(_FlowMap, u_xlat29.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb6 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb6){
            u_xlat6.x = _FlowSpeed * _Time.y;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.0<_OpenCustom);
#else
            u_xlatb18 = 0.0<_OpenCustom;
#endif
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat16_8 = texture(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb5 = _UseFlowCycle==1.0;
#endif
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat16_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat16_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat16_8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat16_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat16_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat16_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat16_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat16_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat16_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat16_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat17.x==0.0);
#else
    u_xlatb28.x = u_xlat17.x==0.0;
#endif
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat16_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.x>=u_xlat16_2.y);
#else
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.w>=u_xlat16_7.x);
#else
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_IsGray<1.0);
#else
    u_xlatb16 = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb16 = 0.0<_UseSoftEdge;
#endif
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_36 = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    SV_Target0.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_36;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
lowp vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _Time.yy * _GChannel.zw;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb40 = 0.0<_UseUv2;
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_16.xy = texture2D(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat29.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat10_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb40 = 0.0<_UseFlowMap;
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture2D(_FlowMap, u_xlat29.xy).xy;
        u_xlatb6 = _UseFlowCycle==1.0;
        if(u_xlatb6){
            u_xlat6.x = _Time.y * _FlowSpeed;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture2D(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
            u_xlatb18 = 0.0<_OpenCustom;
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz;
    u_xlatb5 = _UseFlowCycle==1.0;
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat10_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat10_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat10_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat10_8.w;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat10_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat10_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat10_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat10_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat10_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat10_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat10_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlatb28.x = u_xlat17.x==0.0;
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat10_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
    u_xlatb16 = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
    u_xlatb16 = 0.0<_UseSoftEdge;
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_36 = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    SV_Target0.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    SV_Target0.w = u_xlat16_36;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
lowp vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _Time.yy * _GChannel.zw;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb40 = 0.0<_UseUv2;
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_16.xy = texture2D(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat29.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat10_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb40 = 0.0<_UseFlowMap;
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture2D(_FlowMap, u_xlat29.xy).xy;
        u_xlatb6 = _UseFlowCycle==1.0;
        if(u_xlatb6){
            u_xlat6.x = _Time.y * _FlowSpeed;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture2D(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
            u_xlatb18 = 0.0<_OpenCustom;
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz;
    u_xlatb5 = _UseFlowCycle==1.0;
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat10_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat10_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat10_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat10_8.w;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat10_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat10_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat10_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat10_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat10_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat10_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat10_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlatb28.x = u_xlat17.x==0.0;
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat10_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
    u_xlatb16 = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
    u_xlatb16 = 0.0<_UseSoftEdge;
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_36 = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    SV_Target0.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    SV_Target0.w = u_xlat16_36;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _GChannel.zw * _Time.yy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseUv2);
#else
    u_xlatb36 = 0.0<_UseUv2;
#endif
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_14.xy = texture(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat26.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseFlowMap);
#else
    u_xlatb36 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture(_FlowMap, u_xlat26.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb5 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb5){
            u_xlat5.x = _FlowSpeed * _Time.y;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_OpenCustom);
#else
            u_xlatb16 = 0.0<_OpenCustom;
#endif
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat16_7 = texture(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb4 = _UseFlowCycle==1.0;
#endif
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat16_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat16_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat16_7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat16_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat16_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat16_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat16_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat16_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat16_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat16_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(u_xlat15.x==0.0);
#else
    u_xlatb25.x = u_xlat15.x==0.0;
#endif
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat16_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(_IsGray<1.0);
#else
    u_xlatb25.x = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_0.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_33 = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb14 = 0.0<_UseSoftEdge;
#endif
    u_xlat3.x = u_xlat3.x * u_xlat16_33;
    u_xlat16_33 = (u_xlatb14) ? u_xlat3.x : u_xlat16_33;
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    SV_Target0.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_33;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _GChannel.zw * _Time.yy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseUv2);
#else
    u_xlatb36 = 0.0<_UseUv2;
#endif
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_14.xy = texture(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat26.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseFlowMap);
#else
    u_xlatb36 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture(_FlowMap, u_xlat26.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb5 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb5){
            u_xlat5.x = _FlowSpeed * _Time.y;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_OpenCustom);
#else
            u_xlatb16 = 0.0<_OpenCustom;
#endif
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat16_7 = texture(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb4 = _UseFlowCycle==1.0;
#endif
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat16_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat16_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat16_7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat16_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat16_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat16_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat16_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat16_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat16_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat16_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(u_xlat15.x==0.0);
#else
    u_xlatb25.x = u_xlat15.x==0.0;
#endif
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat16_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(_IsGray<1.0);
#else
    u_xlatb25.x = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_0.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_33 = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb14 = 0.0<_UseSoftEdge;
#endif
    u_xlat3.x = u_xlat3.x * u_xlat16_33;
    u_xlat16_33 = (u_xlatb14) ? u_xlat3.x : u_xlat16_33;
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    SV_Target0.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_33;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
lowp vec2 u_xlat10_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _Time.yy * _GChannel.zw;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb36 = 0.0<_UseUv2;
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_14.xy = texture2D(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat26.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat10_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb36 = 0.0<_UseFlowMap;
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture2D(_FlowMap, u_xlat26.xy).xy;
        u_xlatb5 = _UseFlowCycle==1.0;
        if(u_xlatb5){
            u_xlat5.x = _Time.y * _FlowSpeed;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture2D(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
            u_xlatb16 = 0.0<_OpenCustom;
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat10_7 = texture2D(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz;
    u_xlatb4 = _UseFlowCycle==1.0;
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat10_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat10_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat10_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat10_7.w;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat10_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat10_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat10_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat10_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat10_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat10_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat10_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
    u_xlatb25.x = u_xlat15.x==0.0;
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat10_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
    u_xlatb25.x = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_0.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_33 = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
    u_xlatb14 = 0.0<_UseSoftEdge;
    u_xlat3.x = u_xlat3.x * u_xlat16_33;
    u_xlat16_33 = (u_xlatb14) ? u_xlat3.x : u_xlat16_33;
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    SV_Target0.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    SV_Target0.w = u_xlat16_33;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
lowp vec2 u_xlat10_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _Time.yy * _GChannel.zw;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb36 = 0.0<_UseUv2;
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_14.xy = texture2D(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat26.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat10_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb36 = 0.0<_UseFlowMap;
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture2D(_FlowMap, u_xlat26.xy).xy;
        u_xlatb5 = _UseFlowCycle==1.0;
        if(u_xlatb5){
            u_xlat5.x = _Time.y * _FlowSpeed;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture2D(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
            u_xlatb16 = 0.0<_OpenCustom;
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat10_7 = texture2D(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz;
    u_xlatb4 = _UseFlowCycle==1.0;
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat10_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat10_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat10_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat10_7.w;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat10_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat10_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat10_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat10_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat10_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat10_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat10_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
    u_xlatb25.x = u_xlat15.x==0.0;
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat10_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
    u_xlatb25.x = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_0.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_33 = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
    u_xlatb14 = 0.0<_UseSoftEdge;
    u_xlat3.x = u_xlat3.x * u_xlat16_33;
    u_xlat16_33 = (u_xlatb14) ? u_xlat3.x : u_xlat16_33;
    u_xlat3.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    SV_Target0.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    SV_Target0.w = u_xlat16_33;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _GChannel.zw * _Time.yy;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseUv2);
#else
    u_xlatb40 = 0.0<_UseUv2;
#endif
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_16.xy = texture(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat29.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat16_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseFlowMap);
#else
    u_xlatb40 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture(_FlowMap, u_xlat29.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb6 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb6){
            u_xlat6.x = _FlowSpeed * _Time.y;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.0<_OpenCustom);
#else
            u_xlatb18 = 0.0<_OpenCustom;
#endif
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat16_8 = texture(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb5 = _UseFlowCycle==1.0;
#endif
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat16_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat16_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat16_8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat16_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat16_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat16_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat16_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat16_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat16_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat16_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat17.x==0.0);
#else
    u_xlatb28.x = u_xlat17.x==0.0;
#endif
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat16_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.x>=u_xlat16_2.y);
#else
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.w>=u_xlat16_7.x);
#else
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_IsGray<1.0);
#else
    u_xlatb16 = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb16 = 0.0<_UseSoftEdge;
#endif
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_36 = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    SV_Target0.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_36;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _GChannel.zw * _Time.yy;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseUv2);
#else
    u_xlatb40 = 0.0<_UseUv2;
#endif
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_16.xy = texture(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat29.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat16_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseFlowMap);
#else
    u_xlatb40 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture(_FlowMap, u_xlat29.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb6 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb6){
            u_xlat6.x = _FlowSpeed * _Time.y;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.0<_OpenCustom);
#else
            u_xlatb18 = 0.0<_OpenCustom;
#endif
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat16_8 = texture(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb5 = _UseFlowCycle==1.0;
#endif
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat16_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat16_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat16_8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat16_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat16_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat16_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat16_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat16_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat16_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat16_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat17.x==0.0);
#else
    u_xlatb28.x = u_xlat17.x==0.0;
#endif
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat16_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.x>=u_xlat16_2.y);
#else
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.w>=u_xlat16_7.x);
#else
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_IsGray<1.0);
#else
    u_xlatb16 = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb16 = 0.0<_UseSoftEdge;
#endif
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_36 = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    SV_Target0.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_36;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
lowp vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _Time.yy * _GChannel.zw;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb40 = 0.0<_UseUv2;
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_16.xy = texture2D(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat29.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat10_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb40 = 0.0<_UseFlowMap;
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture2D(_FlowMap, u_xlat29.xy).xy;
        u_xlatb6 = _UseFlowCycle==1.0;
        if(u_xlatb6){
            u_xlat6.x = _Time.y * _FlowSpeed;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture2D(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
            u_xlatb18 = 0.0<_OpenCustom;
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz;
    u_xlatb5 = _UseFlowCycle==1.0;
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat10_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat10_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat10_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat10_8.w;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat10_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat10_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat10_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat10_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat10_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat10_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat10_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlatb28.x = u_xlat17.x==0.0;
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat10_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
    u_xlatb16 = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
    u_xlatb16 = 0.0<_UseSoftEdge;
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_36 = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    SV_Target0.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    SV_Target0.w = u_xlat16_36;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
lowp vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _Time.yy * _GChannel.zw;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb40 = 0.0<_UseUv2;
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_16.xy = texture2D(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat29.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat10_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb40 = 0.0<_UseFlowMap;
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture2D(_FlowMap, u_xlat29.xy).xy;
        u_xlatb6 = _UseFlowCycle==1.0;
        if(u_xlatb6){
            u_xlat6.x = _Time.y * _FlowSpeed;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture2D(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
            u_xlatb18 = 0.0<_OpenCustom;
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz;
    u_xlatb5 = _UseFlowCycle==1.0;
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat10_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat10_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat10_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat10_8.w;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat10_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat10_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat10_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat10_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat10_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat10_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat10_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlatb28.x = u_xlat17.x==0.0;
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat10_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
    u_xlatb16 = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
    u_xlatb16 = 0.0<_UseSoftEdge;
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_36 = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    SV_Target0.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    SV_Target0.w = u_xlat16_36;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _GChannel.zw * _Time.yy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseUv2);
#else
    u_xlatb36 = 0.0<_UseUv2;
#endif
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_14.xy = texture(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat26.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseFlowMap);
#else
    u_xlatb36 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture(_FlowMap, u_xlat26.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb5 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb5){
            u_xlat5.x = _FlowSpeed * _Time.y;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_OpenCustom);
#else
            u_xlatb16 = 0.0<_OpenCustom;
#endif
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat16_7 = texture(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb4 = _UseFlowCycle==1.0;
#endif
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat16_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat16_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat16_7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat16_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat16_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat16_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat16_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat16_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat16_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat16_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(u_xlat15.x==0.0);
#else
    u_xlatb25.x = u_xlat15.x==0.0;
#endif
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat16_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(_IsGray<1.0);
#else
    u_xlatb25.x = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_1.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_0.x = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb14 = 0.0<_UseSoftEdge;
#endif
    u_xlat3.x = u_xlat3.x * u_xlat16_0.x;
    u_xlat16_1.w = (u_xlatb14) ? u_xlat3.x : u_xlat16_0.x;
    SV_Target0 = u_xlat16_1;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _GChannel.zw * _Time.yy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseUv2);
#else
    u_xlatb36 = 0.0<_UseUv2;
#endif
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_14.xy = texture(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat26.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseFlowMap);
#else
    u_xlatb36 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture(_FlowMap, u_xlat26.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb5 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb5){
            u_xlat5.x = _FlowSpeed * _Time.y;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_OpenCustom);
#else
            u_xlatb16 = 0.0<_OpenCustom;
#endif
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat16_7 = texture(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb4 = _UseFlowCycle==1.0;
#endif
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat16_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat16_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat16_7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat16_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat16_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat16_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat16_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat16_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat16_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat16_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(u_xlat15.x==0.0);
#else
    u_xlatb25.x = u_xlat15.x==0.0;
#endif
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat16_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(_IsGray<1.0);
#else
    u_xlatb25.x = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_1.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_0.x = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb14 = 0.0<_UseSoftEdge;
#endif
    u_xlat3.x = u_xlat3.x * u_xlat16_0.x;
    u_xlat16_1.w = (u_xlatb14) ? u_xlat3.x : u_xlat16_0.x;
    SV_Target0 = u_xlat16_1;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
lowp vec2 u_xlat10_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _Time.yy * _GChannel.zw;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb36 = 0.0<_UseUv2;
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_14.xy = texture2D(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat26.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat10_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb36 = 0.0<_UseFlowMap;
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture2D(_FlowMap, u_xlat26.xy).xy;
        u_xlatb5 = _UseFlowCycle==1.0;
        if(u_xlatb5){
            u_xlat5.x = _Time.y * _FlowSpeed;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture2D(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
            u_xlatb16 = 0.0<_OpenCustom;
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat10_7 = texture2D(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz;
    u_xlatb4 = _UseFlowCycle==1.0;
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat10_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat10_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat10_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat10_7.w;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat10_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat10_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat10_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat10_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat10_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat10_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat10_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
    u_xlatb25.x = u_xlat15.x==0.0;
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat10_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
    u_xlatb25.x = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_1.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_0.x = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
    u_xlatb14 = 0.0<_UseSoftEdge;
    u_xlat3.x = u_xlat3.x * u_xlat16_0.x;
    u_xlat16_1.w = (u_xlatb14) ? u_xlat3.x : u_xlat16_0.x;
    SV_Target0 = u_xlat16_1;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
lowp vec2 u_xlat10_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _Time.yy * _GChannel.zw;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb36 = 0.0<_UseUv2;
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_14.xy = texture2D(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat26.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat10_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb36 = 0.0<_UseFlowMap;
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture2D(_FlowMap, u_xlat26.xy).xy;
        u_xlatb5 = _UseFlowCycle==1.0;
        if(u_xlatb5){
            u_xlat5.x = _Time.y * _FlowSpeed;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture2D(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
            u_xlatb16 = 0.0<_OpenCustom;
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat10_7 = texture2D(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz;
    u_xlatb4 = _UseFlowCycle==1.0;
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat10_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat10_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat10_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat10_7.w;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat10_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat10_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat10_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat10_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat10_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat10_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat10_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
    u_xlatb25.x = u_xlat15.x==0.0;
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat10_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
    u_xlatb25.x = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_1.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_0.x = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
    u_xlatb14 = 0.0<_UseSoftEdge;
    u_xlat3.x = u_xlat3.x * u_xlat16_0.x;
    u_xlat16_1.w = (u_xlatb14) ? u_xlat3.x : u_xlat16_0.x;
    SV_Target0 = u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _GChannel.zw * _Time.yy;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseUv2);
#else
    u_xlatb40 = 0.0<_UseUv2;
#endif
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_16.xy = texture(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat29.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat16_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseFlowMap);
#else
    u_xlatb40 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture(_FlowMap, u_xlat29.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb6 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb6){
            u_xlat6.x = _FlowSpeed * _Time.y;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.0<_OpenCustom);
#else
            u_xlatb18 = 0.0<_OpenCustom;
#endif
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat16_8 = texture(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb5 = _UseFlowCycle==1.0;
#endif
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat16_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat16_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat16_8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat16_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat16_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat16_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat16_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat16_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat16_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat16_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat17.x==0.0);
#else
    u_xlatb28.x = u_xlat17.x==0.0;
#endif
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat16_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.x>=u_xlat16_2.y);
#else
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.w>=u_xlat16_7.x);
#else
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_IsGray<1.0);
#else
    u_xlatb16 = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb16 = 0.0<_UseSoftEdge;
#endif
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_0.w = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _GChannel.zw * _Time.yy;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseUv2);
#else
    u_xlatb40 = 0.0<_UseUv2;
#endif
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_16.xy = texture(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat29.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat16_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseFlowMap);
#else
    u_xlatb40 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture(_FlowMap, u_xlat29.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb6 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb6){
            u_xlat6.x = _FlowSpeed * _Time.y;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.0<_OpenCustom);
#else
            u_xlatb18 = 0.0<_OpenCustom;
#endif
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat16_8 = texture(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb5 = _UseFlowCycle==1.0;
#endif
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat16_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat16_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat16_8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat16_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat16_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat16_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat16_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat16_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat16_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat16_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat17.x==0.0);
#else
    u_xlatb28.x = u_xlat17.x==0.0;
#endif
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat16_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.x>=u_xlat16_2.y);
#else
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.w>=u_xlat16_7.x);
#else
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_IsGray<1.0);
#else
    u_xlatb16 = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb16 = 0.0<_UseSoftEdge;
#endif
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_0.w = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
lowp vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _Time.yy * _GChannel.zw;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb40 = 0.0<_UseUv2;
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_16.xy = texture2D(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat29.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat10_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb40 = 0.0<_UseFlowMap;
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture2D(_FlowMap, u_xlat29.xy).xy;
        u_xlatb6 = _UseFlowCycle==1.0;
        if(u_xlatb6){
            u_xlat6.x = _Time.y * _FlowSpeed;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture2D(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
            u_xlatb18 = 0.0<_OpenCustom;
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz;
    u_xlatb5 = _UseFlowCycle==1.0;
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat10_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat10_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat10_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat10_8.w;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat10_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat10_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat10_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat10_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat10_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat10_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat10_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlatb28.x = u_xlat17.x==0.0;
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat10_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
    u_xlatb16 = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
    u_xlatb16 = 0.0<_UseSoftEdge;
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_0.w = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
lowp vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _Time.yy * _GChannel.zw;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb40 = 0.0<_UseUv2;
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_16.xy = texture2D(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat29.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat10_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb40 = 0.0<_UseFlowMap;
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture2D(_FlowMap, u_xlat29.xy).xy;
        u_xlatb6 = _UseFlowCycle==1.0;
        if(u_xlatb6){
            u_xlat6.x = _Time.y * _FlowSpeed;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture2D(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
            u_xlatb18 = 0.0<_OpenCustom;
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz;
    u_xlatb5 = _UseFlowCycle==1.0;
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat10_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat10_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat10_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat10_8.w;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat10_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat10_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat10_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat10_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat10_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat10_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat10_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlatb28.x = u_xlat17.x==0.0;
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat10_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
    u_xlatb16 = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
    u_xlatb16 = 0.0<_UseSoftEdge;
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_0.w = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _GChannel.zw * _Time.yy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseUv2);
#else
    u_xlatb36 = 0.0<_UseUv2;
#endif
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_14.xy = texture(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat26.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseFlowMap);
#else
    u_xlatb36 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture(_FlowMap, u_xlat26.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb5 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb5){
            u_xlat5.x = _FlowSpeed * _Time.y;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_OpenCustom);
#else
            u_xlatb16 = 0.0<_OpenCustom;
#endif
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat16_7 = texture(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb4 = _UseFlowCycle==1.0;
#endif
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat16_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat16_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat16_7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat16_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat16_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat16_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat16_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat16_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat16_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat16_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(u_xlat15.x==0.0);
#else
    u_xlatb25.x = u_xlat15.x==0.0;
#endif
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat16_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(_IsGray<1.0);
#else
    u_xlatb25.x = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_1.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_0.x = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb14 = 0.0<_UseSoftEdge;
#endif
    u_xlat3.x = u_xlat3.x * u_xlat16_0.x;
    u_xlat16_1.w = (u_xlatb14) ? u_xlat3.x : u_xlat16_0.x;
    SV_Target0 = u_xlat16_1;
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _GChannel.zw * _Time.yy;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseUv2);
#else
    u_xlatb36 = 0.0<_UseUv2;
#endif
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_14.xy = texture(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat26.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat16_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_UseFlowMap);
#else
    u_xlatb36 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture(_FlowMap, u_xlat26.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb5 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb5){
            u_xlat5.x = _FlowSpeed * _Time.y;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_OpenCustom);
#else
            u_xlatb16 = 0.0<_OpenCustom;
#endif
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat16_7 = texture(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb4 = _UseFlowCycle==1.0;
#endif
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat16_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat16_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat16_7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat16_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat16_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat16_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat16_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat16_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat16_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat16_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat16_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(u_xlat15.x==0.0);
#else
    u_xlatb25.x = u_xlat15.x==0.0;
#endif
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat16_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25.x = !!(_IsGray<1.0);
#else
    u_xlatb25.x = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_1.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_0.x = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb14 = 0.0<_UseSoftEdge;
#endif
    u_xlat3.x = u_xlat3.x * u_xlat16_0.x;
    u_xlat16_1.w = (u_xlatb14) ? u_xlat3.x : u_xlat16_0.x;
    SV_Target0 = u_xlat16_1;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
lowp vec2 u_xlat10_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _Time.yy * _GChannel.zw;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb36 = 0.0<_UseUv2;
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_14.xy = texture2D(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat26.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat10_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb36 = 0.0<_UseFlowMap;
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture2D(_FlowMap, u_xlat26.xy).xy;
        u_xlatb5 = _UseFlowCycle==1.0;
        if(u_xlatb5){
            u_xlat5.x = _Time.y * _FlowSpeed;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture2D(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
            u_xlatb16 = 0.0<_OpenCustom;
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat10_7 = texture2D(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz;
    u_xlatb4 = _UseFlowCycle==1.0;
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat10_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat10_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat10_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat10_7.w;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat10_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat10_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat10_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat10_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat10_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat10_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat10_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
    u_xlatb25.x = u_xlat15.x==0.0;
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat10_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
    u_xlatb25.x = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_1.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_0.x = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
    u_xlatb14 = 0.0<_UseSoftEdge;
    u_xlat3.x = u_xlat3.x * u_xlat16_0.x;
    u_xlat16_1.w = (u_xlatb14) ? u_xlat3.x : u_xlat16_0.x;
    SV_Target0 = u_xlat16_1;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat4;
bool u_xlatb4;
vec4 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec4 u_xlat10;
vec2 u_xlat14;
lowp vec2 u_xlat10_14;
bool u_xlatb14;
vec3 u_xlat15;
bool u_xlatb15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat25;
bvec2 u_xlatb25;
vec2 u_xlat26;
float u_xlat27;
vec2 u_xlat28;
mediump float u_xlat16_33;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat3.xy = _Time.yy * _GChannel.zw;
    u_xlat3.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).y;
    u_xlat14.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb36 = 0.0<_UseUv2;
    u_xlat4.xy = (bool(u_xlatb36)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat4.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat4.xy;
    u_xlat14.xy = vec2(_NoiseEffectMaskStreng) * u_xlat14.xy + u_xlat4.xy;
    u_xlat14.xy = u_xlat14.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_14.xy = texture2D(_Mask, u_xlat14.xy).xy;
    u_xlat4.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb36 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat26.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat4.xy;
    u_xlat4.xy = (bool(u_xlatb36)) ? u_xlat4.xy : u_xlat26.xy;
    u_xlat36 = _DiffAngle * 0.0174532924;
    u_xlat5.x = sin(u_xlat36);
    u_xlat6.x = cos(u_xlat36);
    u_xlat7.x = sin((-u_xlat36));
    u_xlat26.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat7.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat7.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat26.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat26.xy = (-u_xlat4.xy) + u_xlat26.xy;
    u_xlat4.xy = u_xlat10_14.yy * u_xlat26.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb36 = 0.0<_UseFlowMap;
    if(u_xlatb36){
        u_xlat26.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat26.xy = texture2D(_FlowMap, u_xlat26.xy).xy;
        u_xlatb5 = _UseFlowCycle==1.0;
        if(u_xlatb5){
            u_xlat5.x = _Time.y * _FlowSpeed;
            u_xlat5.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat5.xy = fract(u_xlat5.xy);
            u_xlat27 = u_xlat5.x * 2.0 + -1.0;
            u_xlat6.xy = (-u_xlat4.xy) + u_xlat26.xy;
            u_xlat16.xz = u_xlat5.yy * u_xlat6.xy + u_xlat4.xy;
            u_xlat6.x = _DiffXSpeed;
            u_xlat6.y = _DiffYSpeed;
            u_xlat16.xz = _Time.yy * u_xlat6.xy + u_xlat16.xz;
            u_xlat6 = texture2D(_Diffuse, u_xlat16.xz);
            u_xlat27 = abs(u_xlat27);
        } else {
            u_xlatb16 = 0.0<_OpenCustom;
            u_xlat38 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat5.x = (u_xlatb16) ? u_xlat38 : _FlowMapStength;
            u_xlat6.x = float(0.0);
            u_xlat6.y = float(0.0);
            u_xlat6.z = float(0.0);
            u_xlat6.w = float(0.0);
            u_xlat27 = 0.0;
        }
        u_xlat16.xz = (-u_xlat4.xy) + u_xlat26.xy;
        u_xlat4.xy = u_xlat5.xx * u_xlat16.xz + u_xlat4.xy;
    } else {
        u_xlat6.x = float(0.0);
        u_xlat6.y = float(0.0);
        u_xlat6.z = float(0.0);
        u_xlat6.w = float(0.0);
        u_xlat26.x = float(1.0);
        u_xlat26.y = float(1.0);
        u_xlat27 = 0.0;
    }
    u_xlat5.x = _DiffXSpeed;
    u_xlat5.y = _DiffYSpeed;
    u_xlat4.xy = _Time.yy * u_xlat5.xy + u_xlat4.xy;
    u_xlat10_7 = texture2D(_Diffuse, u_xlat4.xy);
    u_xlat16_8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat10_7.xyz * u_xlat16_8.xyz;
    u_xlatb4 = _UseFlowCycle==1.0;
    u_xlatb4 = u_xlatb36 && u_xlatb4;
    u_xlat10.xyz = (-u_xlat16_9.xyz);
    u_xlat10.w = (-u_xlat10_7.w);
    u_xlat6 = u_xlat6 + u_xlat10;
    u_xlat5.xyw = vec3(u_xlat27) * u_xlat6.xyz;
    u_xlat5.xyw = u_xlat10_7.xyz * u_xlat16_8.xyz + u_xlat5.xyw;
    u_xlat15.x = u_xlat27 * u_xlat6.w + u_xlat10_7.w;
    u_xlat5.xyz = (bool(u_xlatb4)) ? u_xlat5.xyw : u_xlat16_9.xyz;
    u_xlat4.x = (u_xlatb4) ? u_xlat15.x : u_xlat10_7.w;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat38 = u_xlat4.x * u_xlat5.x;
    u_xlat4.x = (u_xlatb15) ? u_xlat38 : u_xlat4.x;
    u_xlat6.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat28.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat28.xy = vec2(u_xlat10_3) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat28.xy;
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat28.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat28.xy;
    u_xlat15.xy = u_xlat28.xy * u_xlat26.xy + (-u_xlat28.xy);
    u_xlat15.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat15.xy + u_xlat28.xy;
    u_xlat3.xw = (bool(u_xlatb36)) ? u_xlat15.xy : u_xlat28.xy;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xw).x;
    u_xlat16_33 = u_xlat10_3 * 0.305306017 + 0.682171106;
    u_xlat16_33 = u_xlat10_3 * u_xlat16_33 + 0.0125228781;
    u_xlat15.xy = max(u_xlat6.xy, vec2(0.0, 0.0));
    u_xlat36 = u_xlat15.x + _SoftSize;
    u_xlat15.x = u_xlat10_14.y * _DissolveStep;
    u_xlat26.x = _DissolveStep * u_xlat10_14.y + u_xlat15.y;
    u_xlat37 = u_xlat26.x + (-_DissolveOutlineWidth);
    u_xlat36 = (-u_xlat36) + u_xlat37;
    u_xlat37 = (-u_xlat36) + u_xlat37;
    u_xlat36 = u_xlat10_3 * u_xlat16_33 + (-u_xlat36);
    u_xlat37 = float(1.0) / u_xlat37;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat25 = u_xlat10_14.y * _DissolveOutlineSoft;
    u_xlat3.x = u_xlat10_3 * u_xlat16_33 + (-u_xlat26.x);
    u_xlat25 = float(1.0) / u_xlat25;
    u_xlat3.x = u_xlat25 * u_xlat3.x;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat25 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat25;
    u_xlatb25.x = u_xlat15.x==0.0;
    u_xlat3.x = (u_xlatb25.x) ? 1.0 : u_xlat3.x;
    u_xlat15.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(_DiffusePower) + (-u_xlat15.xyz);
    u_xlat15.xyz = u_xlat3.xxx * u_xlat5.xyz + u_xlat15.xyz;
    u_xlatb25.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat14.x = (u_xlatb25.x) ? 1.0 : u_xlat10_14.x;
    u_xlat14.x = u_xlat14.x * u_xlat4.x;
    u_xlat14.x = u_xlat36 * u_xlat14.x;
    u_xlat14.x = u_xlat14.x * _DiffuseColor.w;
    u_xlat16_33 = dot(u_xlat15.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb25.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb25.x) ? vec3(u_xlat16_33) : u_xlat15.xyz;
    u_xlat16_8.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat14.xxx * u_xlat16_8.xyz;
    u_xlat16_2.xyz = (u_xlatb25.y) ? u_xlat16_8.xyz : u_xlat16_2.xyz;
    u_xlat14.x = u_xlat14.x * _TransparentStrong;
    u_xlatb25.x = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_33 = u_xlat14.x * vs_COLOR0.w;
    u_xlat16_1.xyz = (u_xlatb25.x) ? u_xlat16_0.xyz : u_xlat16_2.xyz;
    u_xlat16_0.x = (u_xlatb25.x) ? u_xlat16_33 : u_xlat14.x;
    u_xlatb14 = 0.0<_UseSoftEdge;
    u_xlat3.x = u_xlat3.x * u_xlat16_0.x;
    u_xlat16_1.w = (u_xlatb14) ? u_xlat3.x : u_xlat16_0.x;
    SV_Target0 = u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _GChannel.zw * _Time.yy;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseUv2);
#else
    u_xlatb40 = 0.0<_UseUv2;
#endif
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_16.xy = texture(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat29.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat16_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseFlowMap);
#else
    u_xlatb40 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture(_FlowMap, u_xlat29.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb6 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb6){
            u_xlat6.x = _FlowSpeed * _Time.y;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.0<_OpenCustom);
#else
            u_xlatb18 = 0.0<_OpenCustom;
#endif
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat16_8 = texture(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb5 = _UseFlowCycle==1.0;
#endif
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat16_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat16_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat16_8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat16_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat16_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat16_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat16_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat16_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat16_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat16_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat17.x==0.0);
#else
    u_xlatb28.x = u_xlat17.x==0.0;
#endif
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat16_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.x>=u_xlat16_2.y);
#else
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.w>=u_xlat16_7.x);
#else
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_IsGray<1.0);
#else
    u_xlatb16 = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb16 = 0.0<_UseSoftEdge;
#endif
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_0.w = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
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
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _GChannel.zw * _Time.yy;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng);
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseUv2);
#else
    u_xlatb40 = 0.0<_UseUv2;
#endif
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_16.xy = texture(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat29.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat16_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.0<_UseFlowMap);
#else
    u_xlatb40 = 0.0<_UseFlowMap;
#endif
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture(_FlowMap, u_xlat29.xy).xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(_UseFlowCycle==1.0);
#else
        u_xlatb6 = _UseFlowCycle==1.0;
#endif
        if(u_xlatb6){
            u_xlat6.x = _FlowSpeed * _Time.y;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb18 = !!(0.0<_OpenCustom);
#else
            u_xlatb18 = 0.0<_OpenCustom;
#endif
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat16_8 = texture(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_UseFlowCycle==1.0);
#else
    u_xlatb5 = _UseFlowCycle==1.0;
#endif
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat16_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat16_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat16_8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat16_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat16_4 = texture(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat16_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat16_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat16_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat16_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat16_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat16_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat16_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat17.x==0.0);
#else
    u_xlatb28.x = u_xlat17.x==0.0;
#endif
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat16_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.x>=u_xlat16_2.y);
#else
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_2.w>=u_xlat16_7.x);
#else
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
#endif
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28.x = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_IsGray<1.0);
#else
    u_xlatb16 = _IsGray<1.0;
#endif
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<_UseSoftEdge);
#else
    u_xlatb16 = 0.0<_UseSoftEdge;
#endif
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_0.w = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
lowp vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _Time.yy * _GChannel.zw;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb40 = 0.0<_UseUv2;
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_16.xy = texture2D(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat29.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat10_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb40 = 0.0<_UseFlowMap;
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture2D(_FlowMap, u_xlat29.xy).xy;
        u_xlatb6 = _UseFlowCycle==1.0;
        if(u_xlatb6){
            u_xlat6.x = _Time.y * _FlowSpeed;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture2D(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
            u_xlatb18 = 0.0<_OpenCustom;
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz;
    u_xlatb5 = _UseFlowCycle==1.0;
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat10_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat10_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat10_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat10_8.w;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat10_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat10_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat10_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat10_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat10_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat10_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat10_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlatb28.x = u_xlat17.x==0.0;
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat10_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
    u_xlatb16 = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
    u_xlatb16 = 0.0<_UseSoftEdge;
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_0.w = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _UseUv2;
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
uniform 	float _UseFlowMap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowMapStength;
uniform 	float _UseFlowCycle;
uniform 	float _FlowSpeed;
uniform 	float _FlowMapDissolveStrength;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	float _UseSoftEdge;
uniform 	float _DissolveSpeedU;
uniform 	float _DissolveSpeedV;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
lowp float u_xlat10_4;
vec3 u_xlat5;
bool u_xlatb5;
vec4 u_xlat6;
bool u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
lowp vec4 u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
bool u_xlatb16;
vec3 u_xlat17;
bool u_xlatb17;
vec3 u_xlat18;
bool u_xlatb18;
float u_xlat28;
bvec2 u_xlatb28;
vec2 u_xlat29;
float u_xlat30;
vec2 u_xlat31;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat16_0.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat4.xy = _Time.yy * _GChannel.zw;
    u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat4.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xy).y;
    u_xlat16.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb40 = 0.0<_UseUv2;
    u_xlat5.xy = (bool(u_xlatb40)) ? vs_TEXCOORD2.xy : vs_TEXCOORD0.xy;
    u_xlat5.xy = vs_TEXCOORD1.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + u_xlat5.xy;
    u_xlat5.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat5.xy;
    u_xlat16.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16.xy + u_xlat5.xy;
    u_xlat16.xy = u_xlat16.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_16.xy = texture2D(_Mask, u_xlat16.xy).xy;
    u_xlat5.xy = vs_TEXCOORD1.xy * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlatb40 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat29.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat5.xy;
    u_xlat5.xy = (bool(u_xlatb40)) ? u_xlat5.xy : u_xlat29.xy;
    u_xlat40 = _DiffAngle * 0.0174532924;
    u_xlat6.x = sin(u_xlat40);
    u_xlat7.x = cos(u_xlat40);
    u_xlat8.x = sin((-u_xlat40));
    u_xlat29.xy = u_xlat5.xy + vec2(-0.5, -0.5);
    u_xlat8.y = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.yx, u_xlat29.xy);
    u_xlat8.z = u_xlat6.x;
    u_xlat7.y = dot(u_xlat8.zy, u_xlat29.xy);
    u_xlat29.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat29.xy = (-u_xlat5.xy) + u_xlat29.xy;
    u_xlat5.xy = u_xlat10_16.yy * u_xlat29.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlatb40 = 0.0<_UseFlowMap;
    if(u_xlatb40){
        u_xlat29.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat29.xy = texture2D(_FlowMap, u_xlat29.xy).xy;
        u_xlatb6 = _UseFlowCycle==1.0;
        if(u_xlatb6){
            u_xlat6.x = _Time.y * _FlowSpeed;
            u_xlat6.y = _Time.y * _FlowSpeed + 0.5;
            u_xlat6.xy = fract(u_xlat6.xy);
            u_xlat30 = u_xlat6.x * 2.0 + -1.0;
            u_xlat7.xy = (-u_xlat5.xy) + u_xlat29.xy;
            u_xlat18.xz = u_xlat6.yy * u_xlat7.xy + u_xlat5.xy;
            u_xlat7.x = _DiffXSpeed;
            u_xlat7.y = _DiffYSpeed;
            u_xlat18.xz = _Time.yy * u_xlat7.xy + u_xlat18.xz;
            u_xlat7 = texture2D(_Diffuse, u_xlat18.xz);
            u_xlat30 = abs(u_xlat30);
        } else {
            u_xlatb18 = 0.0<_OpenCustom;
            u_xlat42 = vs_TEXCOORD2.x + _FlowMapStength;
            u_xlat6.x = (u_xlatb18) ? u_xlat42 : _FlowMapStength;
            u_xlat7.x = float(0.0);
            u_xlat7.y = float(0.0);
            u_xlat7.z = float(0.0);
            u_xlat7.w = float(0.0);
            u_xlat30 = 0.0;
        }
        u_xlat18.xz = (-u_xlat5.xy) + u_xlat29.xy;
        u_xlat5.xy = u_xlat6.xx * u_xlat18.xz + u_xlat5.xy;
    } else {
        u_xlat7.x = float(0.0);
        u_xlat7.y = float(0.0);
        u_xlat7.z = float(0.0);
        u_xlat7.w = float(0.0);
        u_xlat29.x = float(1.0);
        u_xlat29.y = float(1.0);
        u_xlat30 = 0.0;
    }
    u_xlat6.x = _DiffXSpeed;
    u_xlat6.y = _DiffYSpeed;
    u_xlat5.xy = _Time.yy * u_xlat6.xy + u_xlat5.xy;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat5.xy);
    u_xlat16_9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_9.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat10_8.xyz * u_xlat16_9.xyz;
    u_xlatb5 = _UseFlowCycle==1.0;
    u_xlatb5 = u_xlatb40 && u_xlatb5;
    u_xlat11.xyz = (-u_xlat16_10.xyz);
    u_xlat11.w = (-u_xlat10_8.w);
    u_xlat7 = u_xlat7 + u_xlat11;
    u_xlat6.xyw = vec3(u_xlat30) * u_xlat7.xyz;
    u_xlat6.xyw = u_xlat10_8.xyz * u_xlat16_9.xyz + u_xlat6.xyw;
    u_xlat17.x = u_xlat30 * u_xlat7.w + u_xlat10_8.w;
    u_xlat6.xyz = (bool(u_xlatb5)) ? u_xlat6.xyw : u_xlat16_10.xyz;
    u_xlat5.x = (u_xlatb5) ? u_xlat17.x : u_xlat10_8.w;
    u_xlatb17 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat42 = u_xlat5.x * u_xlat6.x;
    u_xlat5.x = (u_xlatb17) ? u_xlat42 : u_xlat5.x;
    u_xlat7.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat31.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat31.xy = vec2(u_xlat10_4) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat31.xy;
    u_xlat31.xy = u_xlat31.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat31.xy = _Time.yy * vec2(_DissolveSpeedU, _DissolveSpeedV) + u_xlat31.xy;
    u_xlat17.xy = u_xlat31.xy * u_xlat29.xy + (-u_xlat31.xy);
    u_xlat17.xy = vec2(vec2(_FlowMapDissolveStrength, _FlowMapDissolveStrength)) * u_xlat17.xy + u_xlat31.xy;
    u_xlat4.xw = (bool(u_xlatb40)) ? u_xlat17.xy : u_xlat31.xy;
    u_xlat10_4 = texture2D(_DissolveTex, u_xlat4.xw).x;
    u_xlat16_36 = u_xlat10_4 * 0.305306017 + 0.682171106;
    u_xlat16_36 = u_xlat10_4 * u_xlat16_36 + 0.0125228781;
    u_xlat17.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
    u_xlat40 = u_xlat17.x + _SoftSize;
    u_xlat17.x = u_xlat10_16.y * _DissolveStep;
    u_xlat29.x = _DissolveStep * u_xlat10_16.y + u_xlat17.y;
    u_xlat41 = u_xlat29.x + (-_DissolveOutlineWidth);
    u_xlat40 = (-u_xlat40) + u_xlat41;
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = u_xlat10_4 * u_xlat16_36 + (-u_xlat40);
    u_xlat41 = float(1.0) / u_xlat41;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat41 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat28 = u_xlat10_16.y * _DissolveOutlineSoft;
    u_xlat4.x = u_xlat10_4 * u_xlat16_36 + (-u_xlat29.x);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat4.x = u_xlat28 * u_xlat4.x;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat28 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat4.x * u_xlat28;
    u_xlatb28.x = u_xlat17.x==0.0;
    u_xlat4.x = (u_xlatb28.x) ? 1.0 : u_xlat4.x;
    u_xlat17.xyz = u_xlat16_2.xyz * vec3(_DissolveColorPW);
    u_xlat18.xyz = u_xlat6.xyz * vec3(_DiffusePower) + (-u_xlat17.xyz);
    u_xlat17.xyz = u_xlat4.xxx * u_xlat18.xyz + u_xlat17.xyz;
    u_xlatb28.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat16.x = (u_xlatb28.x) ? 1.0 : u_xlat10_16.x;
    u_xlat16.x = u_xlat16.x * u_xlat5.x;
    u_xlat16.x = u_xlat40 * u_xlat16.x;
    u_xlat16.x = u_xlat16.x * _DiffuseColor.w;
    u_xlat16_36 = dot(u_xlat17.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb28.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsInvertGray)).xy;
    u_xlat16_2.xyz = (u_xlatb28.x) ? vec3(u_xlat16_36) : u_xlat17.xyz;
    u_xlat16_9.xyz = (-u_xlat16_2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyw = (u_xlatb28.y) ? u_xlat16_9.yzx : u_xlat16_2.yzx;
    u_xlat16.x = u_xlat16.x * _TransparentStrong;
    u_xlatb28.x = u_xlat16_2.x>=u_xlat16_2.y;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_7.xy = u_xlat16_2.yx;
    u_xlat16_7.z = float(-1.0);
    u_xlat16_7.w = float(0.666666687);
    u_xlat16_8.xy = u_xlat16_2.xy + (-u_xlat16_7.xy);
    u_xlat16_8.z = float(1.0);
    u_xlat16_8.w = float(-1.0);
    u_xlat16_7 = vec4(u_xlat16_36) * u_xlat16_8 + u_xlat16_7;
    u_xlatb28.x = u_xlat16_2.w>=u_xlat16_7.x;
    u_xlat16_36 = (u_xlatb28.x) ? 1.0 : 0.0;
    u_xlat16_2.xyz = u_xlat16_7.xyw;
    u_xlat16_7.xyw = u_xlat16_2.wyx;
    u_xlat16_7 = (-u_xlat16_2) + u_xlat16_7;
    u_xlat16_2 = vec4(u_xlat16_36) * u_xlat16_7 + u_xlat16_2;
    u_xlat16_36 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_36 = (-u_xlat16_36) + u_xlat16_2.x;
    u_xlat16_37 = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_14.x = u_xlat16_36 * 6.0 + 9.99999975e-05;
    u_xlat16_37 = u_xlat16_37 / u_xlat16_14.x;
    u_xlat16_37 = u_xlat16_37 + u_xlat16_2.z;
    u_xlat16_14.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_36 = u_xlat16_36 / u_xlat16_14.x;
    u_xlat16_37 = abs(u_xlat16_37) + _Hue;
    u_xlat16_14.x = u_xlat16_37 * 360.0;
    u_xlatb28.x = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (u_xlatb28.x) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_37 = u_xlat16_37 * u_xlat16_14.y;
    u_xlat16_37 = fract(u_xlat16_37);
    u_xlat16_36 = u_xlat16_36 * _Saturation;
    u_xlat16_14.xyz = u_xlat16_14.xxx * vec3(u_xlat16_37) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_14.xyz = fract(u_xlat16_14.xyz);
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_14.xyz = abs(u_xlat16_14.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_36) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat40 = u_xlat6.x * u_xlat5.x + (-_SaturLeftColorWeights);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat40 = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat40;
    u_xlat5.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat40 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat28 = u_xlat28 * u_xlat40 + _SaturLeftColor.w;
    u_xlat2.w = u_xlat28 * u_xlat16.x;
    u_xlatb16 = _IsGray<1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.w = u_xlat2.w * vs_COLOR0.w;
    u_xlat16_0 = (bool(u_xlatb16)) ? u_xlat16_0 : u_xlat2;
    u_xlatb16 = 0.0<_UseSoftEdge;
    u_xlat4.x = u_xlat4.x * u_xlat16_0.w;
    u_xlat16_0.w = (u_xlatb16) ? u_xlat4.x : u_xlat16_0.w;
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
Keywords { "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
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
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
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
Keywords { "_COLOR_HDR_" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
Local Keywords { "_SCREENUV" }
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
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
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
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" }
Local Keywords { "_SCREENUV" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_GRADIENT_ON" "_GRADIENT_SAME_DIFF_ON" }
Local Keywords { "_SCREENUV" }
""
}
}
}
}
}