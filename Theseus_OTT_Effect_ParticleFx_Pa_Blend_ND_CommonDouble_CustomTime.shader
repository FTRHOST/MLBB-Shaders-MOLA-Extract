//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/ParticleFx_Pa_Blend_ND_CommonDouble_CustomTime" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

[Space(15)] [Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

[Space(15)] [Header(Texture(2D)________________________________________________________________________)] [Toggle(_SCREENUV)] _ScreenUV ("DiffScreenUV", Float) = 0.0

_ScreenTileOffset ("DiffScreenTileOffset", Vector) = (1,1,0,0)

[Space(10)] [Header(coord1.xy_DiffUV __ coord1.zw_Mask __ coord2.xy_DissolveInstensity  __ coord2.zw_DissolveUV)] [Toggle(OpenCustom)] _OpenCustom ("开启CustomData", Float) = 0.0

[Toggle(UnMult)] _UnMult ("UnMult去黑", Float) = 0.0

[Space(10)] _FrontIntensity ("FrontIntensity", Range(0, 2)) = 1.0

_DiffuseColor ("TextureColor", Color) = (1,1,1,1)

_BackIntensity ("BackIntensity", Range(0, 2)) = 1.0

_DiffuseBackColor ("TextureBackColor", Color) = (1,1,1,1)

_Diffuse ("Texture2D", 2D) = "white" { }

_DiffusePower ("TextureePower", Float) = 1.0

_DiffAngle ("主帖图旋转", Range(0, 720)) = 0.0

_DiffUVScale ("主贴图缩放", Range(0, 10)) = 1.0

_DiffXSpeed ("TexSpeedU", Float) = 0.0

_DiffYSpeed ("TexSpeedV", Float) = 0.0

_MixDiffuse ("和主贴图混合的贴图", 2D) = "white" { }

[Enum(Overlay,0, Multiply, 1)] _MixDiffuseMode ("混合模式选择", Float) = 0.0

_MixLumThreshold ("提亮灰度阈值", Range(0, 1)) = 0.0

_MixLumOffset ("提亮强范围偏移", Range(1, 32)) = 16.0

_MixLumPower ("提亮强度值", Range(1, 10)) = 1.0

_MixDiffusePower ("混合帖图强度", Range(0, 1)) = 1.0

_MixDiffuseAngle ("混合帖图旋转", Range(0, 720)) = 0.0

_MixDiffuseXSpeed ("混合帖图SpeedU", Float) = 0.0

_MixDiffuseYSpeed ("混合帖图SpeedV", Float) = 0.0

[Space(15)] [Header(Fresnel________________________________________________________________________)] [Toggle] _TransparentFresnelPart ("TransparentFresnelPart", Float) = 0.0

_FresnelPower ("FresnelPower", Range(0, 5)) = 0.0

_FresnelScale ("FresnelScale", Range(0, 20)) = 1.0

_FresnelColor ("FresnelColor", Color) = (0,0,0,0)

[Space(15)] [Header(Mask________________________________________________________________________)] [Header(R_Mask G_Dissolve B_Noise)] [Space(10)] _Mask ("Mask", 2D) = "white" { }

_MaskAngle ("Mask帖图旋转", Range(0, 720)) = 0.0

[Toggle] _MaskNotEffectDiff ("MaskNotEffectDiff", Float) = 0.0

[Toggle] _MaskedDissolve ("遮罩G通道影响溶解(禁动画中K开关)", Float) = 0.0

[Toggle] _EffectByMask ("Mask影响Noise(禁动画中K开关)", Float) = 0.0

_NoiseEffectMaskStreng ("NoiseEffectMaskStreng", Range(0, 1)) = 1.0

_MaskUVScale ("遮罩图缩放", Range(0, 10)) = 1.0

_MaskXSpeed ("MaskSpeedU", Float) = 0.0

_MaskYSpeed ("MaskSpeedV", Float) = 0.0

[Space(15)] [Header(Dissolve And Noise________________________________________________________________________)] [Space(10)] _DissolveTex ("溶解和Noise", 2D) = "white" { }

_DissolveAngle ("溶解和Noise旋转", Range(0, 720)) = 0.0

_DissolveUVSpeed ("溶解UV偏移速度(仅xy生效)", Vector) = (0,0,0,0)

_DissolveStep ("溶解", Float) = -1.0

_SoftSize ("溶解软硬", Range(0, 2)) = 0.0

[Space(10)] [Toggle] _DissolveOutline_On ("溶解边缘叠色", Float) = 1.0

_DissolveOutlineWidth ("溶解边缘", Range(0, 0.5)) = 0.0010000000474974513

_DissolveOutlineSoft ("溶解边缘_软硬", Range(0, 1)) = 0.0

_DissolveColorPW ("溶解边缘_强度", Float) = 1.0

_DissolveColor ("溶解边缘_颜色", Color) = (1,1,1,1)

[Space(10)] [Toggle] _NoiseUnEffectDiff ("Noise不影响主贴图", Float) = 0.0

_NoiseXStreng ("扭曲强度U", Range(-10, 10)) = 0.0

_NoiseYStreng ("扭曲强度V", Range(-10, 10)) = 0.0

_GChannel ("G通xy控Tiling zw控速度", Vector) = (1,1,0,0)

[Space(5)] [Header(Vertex Offset________________________________________________________________________)] [Space(10)] [Toggle(_ENABLE_VERTEX_OFFSET)] _EnableVertexOffset ("开启噪声偏移(禁动画中K开关)", Float) = 0.0

_VertexOffsetNoiseMap ("VertexOffsetNoiseMap R:顶点偏移通道", 2D) = "white" { }

_VertexOffset_UVRotation ("贴图旋转", Range(0, 720)) = 0.0

_VertexOffset_UVScale ("贴图缩放", Range(0.001, 10)) = 1.0

[Enum(Normal,0,Vertex,1)] _MotionDir ("运动方向", Float) = 0.0

_VertexDir ("VertexDir", Vector) = (0,0,0,0)

_VertexScale ("VertexScale", Float) = 0.0

_VertexPower ("VertexPower", Float) = 1.0

_VertexScaleHeightU ("VertexScaleHeightU", Float) = 1.0

_VertexScaleHeightV ("VertexScaleHeightV", Float) = 0.0

_VertexMotionSpeed ("UV流动速度(仅xy生效对应u和v)", Vector) = (0,0,0,0)

[Space(15)] [Header(Gradient________________________________________________________________________)] [Space(10)] [Toggle(_GRADIENT_ON)] _GRADIENT_ON ("左右渐变颜色开关(禁动画中K开关)", Float) = 0.0

[Toggle] _GRADIENT_SAME_DIFF_ON ("左右渐变开启Diff相同UV(禁动画中K开关)", Float) = 0.0

_UVWeights ("UV方向权重0-u 1-v", Range(0, 1)) = 0.0

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_LeftWeights ("左侧渐变色权重", Range(0, 1)) = 0.0

_RightWeights ("右侧渐变色权重", Range(0, 1)) = 1.0

_Gradient ("渐变色权重偏移", Range(-1, 1)) = 0.0

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
  GpuProgramID 63945
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
uniform 	mediump float _OpenCustom;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_1 = in_TEXCOORD1 * vec4(_OpenCustom) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0.zw = u_xlat16_1.zw;
    vs_TEXCOORD1.xy = u_xlat16_1.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD2.zw * vec2(_OpenCustom) + in_TEXCOORD0.xy;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = in_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    vs_TEXCOORD2.w = u_xlat16_2.y;
    vs_TEXCOORD3.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = in_COLOR0;
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
uniform 	float _CustomTime;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _MixDiffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec4 _DissolveUVSpeed;
uniform 	mediump float _DiffUVScale;
uniform 	mediump float _MaskUVScale;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _BackIntensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _DissolveAngle;
uniform 	mediump float _MixLumThreshold;
uniform 	mediump float _MixLumOffset;
uniform 	mediump float _MixLumPower;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MixDiffuseMode;
uniform 	mediump float _MixDiffusePower;
uniform 	mediump float _MixDiffuseAngle;
uniform 	mediump float _MixDiffuseXSpeed;
uniform 	mediump float _MixDiffuseYSpeed;
uniform 	mediump float _MaskAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _NoiseEffectMaskStreng;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump float _MaskedDissolve;
uniform 	mediump float _UnMult;
uniform 	mediump float _NoiseUnEffectDiff;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _TransparentFresnelPart;
uniform 	mediump float _DissolveOutline_On;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _MixDiffuse;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_20;
vec2 u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat28;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _MixDiffuseAngle * 0.0174532942;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat3.y = (-u_xlat16_1.x);
    u_xlat3.x = u_xlat16_2.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat16_1.y = u_xlat3.x;
    u_xlat4.y = dot(u_xlat16_1.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MixDiffuse_ST.xy + _MixDiffuse_ST.zw;
    u_xlat24.x = _CustomTime * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat24.x>=(-u_xlat24.x));
#else
    u_xlatb36 = u_xlat24.x>=(-u_xlat24.x);
#endif
    u_xlat24.x = fract(abs(u_xlat24.x));
    u_xlat24.x = (u_xlatb36) ? u_xlat24.x : (-u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 3600.0;
    u_xlat3.x = u_xlat24.x * _MixDiffuseXSpeed;
    u_xlat3.y = u_xlat24.x * _MixDiffuseYSpeed;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_0.xyw = texture(_MixDiffuse, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_37 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_37 = u_xlat16_37 + (-_MixLumThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(vec3(_MixLumOffset, _MixLumOffset, _MixLumOffset));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_MixLumPower);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat16_1.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower));
    u_xlat16_2.xyz = vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower)) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_MixDiffuseMode);
#else
    u_xlatb0.x = 0.5<_MixDiffuseMode;
#endif
    u_xlat16_1.xyz = (u_xlatb0.x) ? u_xlat16_1.xyz : u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat24.xx * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat16_2.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_26.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16_2.xy + u_xlat16_26.xy;
    u_xlat16_37 = _MaskAngle * 0.0174532924;
    u_xlat16_5.x = sin(u_xlat16_37);
    u_xlat16_6.x = cos(u_xlat16_37);
    u_xlat16_26.xy = max(vec2(_MaskUVScale, _DiffUVScale), vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat16_26.xy = vec2(1.0, 1.0) / u_xlat16_26.xy;
    u_xlat3.x = u_xlat16_26.x * u_xlat16_5.x;
    u_xlat3.y = u_xlat16_26.x * u_xlat16_6.x;
    u_xlat3.z = (-u_xlat3.x);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat3 = u_xlat24.xxxx * vec4(_MaskXSpeed, _MaskYSpeed, _DiffXSpeed, _DiffYSpeed);
    u_xlat24.xy = u_xlat24.xx * _DissolveUVSpeed.xy;
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat3 = fract(u_xlat3);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat16_5.xy = u_xlat16_2.xy * u_xlat16_4.zz;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _TransparentFresnelPart, _EffectByMask, _EffectByMask)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? u_xlat16_5.xy : u_xlat16_2.xy;
    u_xlat3.xy = u_xlat16_2.xy + vs_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat3.xy = (u_xlatb0.x) ? vs_TEXCOORD1.xy : u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = vec2(_DiffAngle, _DissolveAngle) * vec2(0.0174532924, 0.0174532942);
    u_xlat16_6.x = cos(u_xlat16_5.x);
    u_xlat16_5.x = sin(u_xlat16_5.x);
    u_xlat16_7.x = sin(u_xlat16_5.y);
    u_xlat16_8 = cos(u_xlat16_5.y);
    u_xlat9.x = u_xlat16_26.y * u_xlat16_5.x;
    u_xlat9.y = u_xlat16_26.y * u_xlat16_6.x;
    u_xlat9.z = (-u_xlat9.x);
    u_xlat10.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat10.x = dot(u_xlat9.yz, u_xlat3.xy);
    u_xlat3.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = u_xlat3.zw + u_xlat3.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_37 = u_xlat16_3.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_37 : u_xlat16_3.w;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_FrontIntensity, _FrontIntensity, _FrontIntensity));
    u_xlat16_20.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(_BackIntensity);
    u_xlat16_3.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_6.xyz : u_xlat16_20.xyz;
    u_xlat16_3.w = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? _DiffuseColor.w : _DiffuseBackColor.w;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat10.y = (-u_xlat16_7.x);
    u_xlat10.x = u_xlat16_8;
    u_xlat16_1.xy = vs_TEXCOORD1.zw + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat10.xy, u_xlat16_1.xy);
    u_xlat16_7.y = u_xlat10.x;
    u_xlat11.y = dot(u_xlat16_7.xy, u_xlat16_1.xy);
    u_xlat28.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xz = u_xlat24.xy + u_xlat28.xy;
    u_xlat0.xz = u_xlat16_2.xy + u_xlat0.xz;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xz).x;
    u_xlat16_1.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_1.x + 0.0125228781;
    u_xlat16_13.x = vs_TEXCOORD3.w + _SoftSize;
    u_xlat16_25 = vs_TEXCOORD2.w + _DissolveStep;
    u_xlat24.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat16_25;
    u_xlat36 = u_xlat16_0.x * u_xlat16_1.x + (-u_xlat16_25);
    u_xlat24.x = u_xlat24.x + 0.5;
    u_xlat28.x = (-u_xlat16_13.x) + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + (-u_xlat28.x);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_1.x + (-u_xlat28.x);
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = u_xlat0.x * u_xlat24.x;
    u_xlat16_1.x = (-u_xlat16_4.y) + 1.0;
    u_xlat0.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat0.x = u_xlat0.x * u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.y = u_xlat0.x * u_xlat24.x;
    u_xlat0.xz = max(u_xlat16_1.xx, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_MaskedDissolve);
#else
    u_xlatb36 = 0.0<_MaskedDissolve;
#endif
    u_xlat0.xz = (bool(u_xlatb36)) ? u_xlat0.xz : u_xlat10.xy;
    u_xlat16.xyz = u_xlat0.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_13.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = vs_TEXCOORD4.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * u_xlat16_2.xyz + u_xlat16_13.xyz;
    u_xlat16.xyz = log2(abs(u_xlat16_13.xyz));
    u_xlat16.xyz = u_xlat16.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16.xyz = exp2(u_xlat16.xyz);
    u_xlat16.xyz = u_xlat16.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_MaskNotEffectDiff>=0.5);
#else
    u_xlatb24 = _MaskNotEffectDiff>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = u_xlat16_4.x * u_xlat16_13.y + u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat0.x * vs_TEXCOORD4.w;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13.x;
    SV_Target0.w = (u_xlatb0.y) ? u_xlat16_1.x : u_xlat16_13.x;
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
uniform 	mediump float _OpenCustom;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_1 = in_TEXCOORD1 * vec4(_OpenCustom) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0.zw = u_xlat16_1.zw;
    vs_TEXCOORD1.xy = u_xlat16_1.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD2.zw * vec2(_OpenCustom) + in_TEXCOORD0.xy;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = in_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    vs_TEXCOORD2.w = u_xlat16_2.y;
    vs_TEXCOORD3.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = in_COLOR0;
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
uniform 	float _CustomTime;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _MixDiffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec4 _DissolveUVSpeed;
uniform 	mediump float _DiffUVScale;
uniform 	mediump float _MaskUVScale;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _BackIntensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _DissolveAngle;
uniform 	mediump float _MixLumThreshold;
uniform 	mediump float _MixLumOffset;
uniform 	mediump float _MixLumPower;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MixDiffuseMode;
uniform 	mediump float _MixDiffusePower;
uniform 	mediump float _MixDiffuseAngle;
uniform 	mediump float _MixDiffuseXSpeed;
uniform 	mediump float _MixDiffuseYSpeed;
uniform 	mediump float _MaskAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _NoiseEffectMaskStreng;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump float _MaskedDissolve;
uniform 	mediump float _UnMult;
uniform 	mediump float _NoiseUnEffectDiff;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _TransparentFresnelPart;
uniform 	mediump float _DissolveOutline_On;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _MixDiffuse;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_20;
vec2 u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat28;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _MixDiffuseAngle * 0.0174532942;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat3.y = (-u_xlat16_1.x);
    u_xlat3.x = u_xlat16_2.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat16_1.y = u_xlat3.x;
    u_xlat4.y = dot(u_xlat16_1.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MixDiffuse_ST.xy + _MixDiffuse_ST.zw;
    u_xlat24.x = _CustomTime * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat24.x>=(-u_xlat24.x));
#else
    u_xlatb36 = u_xlat24.x>=(-u_xlat24.x);
#endif
    u_xlat24.x = fract(abs(u_xlat24.x));
    u_xlat24.x = (u_xlatb36) ? u_xlat24.x : (-u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 3600.0;
    u_xlat3.x = u_xlat24.x * _MixDiffuseXSpeed;
    u_xlat3.y = u_xlat24.x * _MixDiffuseYSpeed;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_0.xyw = texture(_MixDiffuse, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_37 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_37 = u_xlat16_37 + (-_MixLumThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(vec3(_MixLumOffset, _MixLumOffset, _MixLumOffset));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_MixLumPower);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat16_1.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower));
    u_xlat16_2.xyz = vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower)) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_MixDiffuseMode);
#else
    u_xlatb0.x = 0.5<_MixDiffuseMode;
#endif
    u_xlat16_1.xyz = (u_xlatb0.x) ? u_xlat16_1.xyz : u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat24.xx * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat16_2.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_26.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16_2.xy + u_xlat16_26.xy;
    u_xlat16_37 = _MaskAngle * 0.0174532924;
    u_xlat16_5.x = sin(u_xlat16_37);
    u_xlat16_6.x = cos(u_xlat16_37);
    u_xlat16_26.xy = max(vec2(_MaskUVScale, _DiffUVScale), vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat16_26.xy = vec2(1.0, 1.0) / u_xlat16_26.xy;
    u_xlat3.x = u_xlat16_26.x * u_xlat16_5.x;
    u_xlat3.y = u_xlat16_26.x * u_xlat16_6.x;
    u_xlat3.z = (-u_xlat3.x);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat3 = u_xlat24.xxxx * vec4(_MaskXSpeed, _MaskYSpeed, _DiffXSpeed, _DiffYSpeed);
    u_xlat24.xy = u_xlat24.xx * _DissolveUVSpeed.xy;
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat3 = fract(u_xlat3);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat16_5.xy = u_xlat16_2.xy * u_xlat16_4.zz;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _TransparentFresnelPart, _EffectByMask, _EffectByMask)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? u_xlat16_5.xy : u_xlat16_2.xy;
    u_xlat3.xy = u_xlat16_2.xy + vs_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat3.xy = (u_xlatb0.x) ? vs_TEXCOORD1.xy : u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = vec2(_DiffAngle, _DissolveAngle) * vec2(0.0174532924, 0.0174532942);
    u_xlat16_6.x = cos(u_xlat16_5.x);
    u_xlat16_5.x = sin(u_xlat16_5.x);
    u_xlat16_7.x = sin(u_xlat16_5.y);
    u_xlat16_8 = cos(u_xlat16_5.y);
    u_xlat9.x = u_xlat16_26.y * u_xlat16_5.x;
    u_xlat9.y = u_xlat16_26.y * u_xlat16_6.x;
    u_xlat9.z = (-u_xlat9.x);
    u_xlat10.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat10.x = dot(u_xlat9.yz, u_xlat3.xy);
    u_xlat3.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = u_xlat3.zw + u_xlat3.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_37 = u_xlat16_3.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_37 : u_xlat16_3.w;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_FrontIntensity, _FrontIntensity, _FrontIntensity));
    u_xlat16_20.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(_BackIntensity);
    u_xlat16_3.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_6.xyz : u_xlat16_20.xyz;
    u_xlat16_3.w = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? _DiffuseColor.w : _DiffuseBackColor.w;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat10.y = (-u_xlat16_7.x);
    u_xlat10.x = u_xlat16_8;
    u_xlat16_1.xy = vs_TEXCOORD1.zw + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat10.xy, u_xlat16_1.xy);
    u_xlat16_7.y = u_xlat10.x;
    u_xlat11.y = dot(u_xlat16_7.xy, u_xlat16_1.xy);
    u_xlat28.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xz = u_xlat24.xy + u_xlat28.xy;
    u_xlat0.xz = u_xlat16_2.xy + u_xlat0.xz;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xz).x;
    u_xlat16_1.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_1.x + 0.0125228781;
    u_xlat16_13.x = vs_TEXCOORD3.w + _SoftSize;
    u_xlat16_25 = vs_TEXCOORD2.w + _DissolveStep;
    u_xlat24.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat16_25;
    u_xlat36 = u_xlat16_0.x * u_xlat16_1.x + (-u_xlat16_25);
    u_xlat24.x = u_xlat24.x + 0.5;
    u_xlat28.x = (-u_xlat16_13.x) + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + (-u_xlat28.x);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_1.x + (-u_xlat28.x);
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = u_xlat0.x * u_xlat24.x;
    u_xlat16_1.x = (-u_xlat16_4.y) + 1.0;
    u_xlat0.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat0.x = u_xlat0.x * u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.y = u_xlat0.x * u_xlat24.x;
    u_xlat0.xz = max(u_xlat16_1.xx, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_MaskedDissolve);
#else
    u_xlatb36 = 0.0<_MaskedDissolve;
#endif
    u_xlat0.xz = (bool(u_xlatb36)) ? u_xlat0.xz : u_xlat10.xy;
    u_xlat16.xyz = u_xlat0.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_13.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = vs_TEXCOORD4.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * u_xlat16_2.xyz + u_xlat16_13.xyz;
    u_xlat16.xyz = log2(abs(u_xlat16_13.xyz));
    u_xlat16.xyz = u_xlat16.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16.xyz = exp2(u_xlat16.xyz);
    u_xlat16.xyz = u_xlat16.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_MaskNotEffectDiff>=0.5);
#else
    u_xlatb24 = _MaskNotEffectDiff>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = u_xlat16_4.x * u_xlat16_13.y + u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat0.x * vs_TEXCOORD4.w;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13.x;
    SV_Target0.w = (u_xlatb0.y) ? u_xlat16_1.x : u_xlat16_13.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _OpenCustom;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_1 = in_TEXCOORD1 * vec4(_OpenCustom) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0.zw = u_xlat16_1.zw;
    vs_TEXCOORD1.xy = u_xlat16_1.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD2.zw * vec2(_OpenCustom) + in_TEXCOORD0.xy;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = in_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    vs_TEXCOORD2.w = u_xlat16_2.y;
    vs_TEXCOORD3.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = in_COLOR0;
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
uniform 	float _CustomTime;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _MixDiffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec4 _DissolveUVSpeed;
uniform 	mediump float _DiffUVScale;
uniform 	mediump float _MaskUVScale;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _BackIntensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _DissolveAngle;
uniform 	mediump float _MixLumThreshold;
uniform 	mediump float _MixLumOffset;
uniform 	mediump float _MixLumPower;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MixDiffuseMode;
uniform 	mediump float _MixDiffusePower;
uniform 	mediump float _MixDiffuseAngle;
uniform 	mediump float _MixDiffuseXSpeed;
uniform 	mediump float _MixDiffuseYSpeed;
uniform 	mediump float _MaskAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _NoiseEffectMaskStreng;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump float _MaskedDissolve;
uniform 	mediump float _UnMult;
uniform 	mediump float _NoiseUnEffectDiff;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _TransparentFresnelPart;
uniform 	mediump float _DissolveOutline_On;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _MixDiffuse;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_20;
vec2 u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat28;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _MixDiffuseAngle * 0.0174532942;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat3.y = (-u_xlat16_1.x);
    u_xlat3.x = u_xlat16_2.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat16_1.y = u_xlat3.x;
    u_xlat4.y = dot(u_xlat16_1.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MixDiffuse_ST.xy + _MixDiffuse_ST.zw;
    u_xlat24.x = _CustomTime * 0.000277777785;
    u_xlatb36 = u_xlat24.x>=(-u_xlat24.x);
    u_xlat24.x = fract(abs(u_xlat24.x));
    u_xlat24.x = (u_xlatb36) ? u_xlat24.x : (-u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 3600.0;
    u_xlat3.x = u_xlat24.x * _MixDiffuseXSpeed;
    u_xlat3.y = u_xlat24.x * _MixDiffuseYSpeed;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat10_0.xyw = texture2D(_MixDiffuse, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_37 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_37 = u_xlat16_37 + (-_MixLumThreshold);
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(vec3(_MixLumOffset, _MixLumOffset, _MixLumOffset));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_MixLumPower);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat16_1.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower));
    u_xlat16_2.xyz = vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower)) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlatb0.x = 0.5<_MixDiffuseMode;
    u_xlat16_1.xyz = (u_xlatb0.x) ? u_xlat16_1.xyz : u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat24.xx * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat16_2.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_26.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16_2.xy + u_xlat16_26.xy;
    u_xlat16_37 = _MaskAngle * 0.0174532924;
    u_xlat16_5.x = sin(u_xlat16_37);
    u_xlat16_6.x = cos(u_xlat16_37);
    u_xlat16_26.xy = max(vec2(_MaskUVScale, _DiffUVScale), vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat16_26.xy = vec2(1.0, 1.0) / u_xlat16_26.xy;
    u_xlat3.x = u_xlat16_26.x * u_xlat16_5.x;
    u_xlat3.y = u_xlat16_26.x * u_xlat16_6.x;
    u_xlat3.z = (-u_xlat3.x);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat3 = u_xlat24.xxxx * vec4(_MaskXSpeed, _MaskYSpeed, _DiffXSpeed, _DiffYSpeed);
    u_xlat24.xy = u_xlat24.xx * _DissolveUVSpeed.xy;
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat3 = fract(u_xlat3);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat16_5.xy = u_xlat16_2.xy * u_xlat10_4.zz;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _TransparentFresnelPart, _EffectByMask, _EffectByMask)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? u_xlat16_5.xy : u_xlat16_2.xy;
    u_xlat3.xy = u_xlat16_2.xy + vs_TEXCOORD1.xy;
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat3.xy = (u_xlatb0.x) ? vs_TEXCOORD1.xy : u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = vec2(_DiffAngle, _DissolveAngle) * vec2(0.0174532924, 0.0174532942);
    u_xlat16_6.x = cos(u_xlat16_5.x);
    u_xlat16_5.x = sin(u_xlat16_5.x);
    u_xlat16_7.x = sin(u_xlat16_5.y);
    u_xlat16_8 = cos(u_xlat16_5.y);
    u_xlat9.x = u_xlat16_26.y * u_xlat16_5.x;
    u_xlat9.y = u_xlat16_26.y * u_xlat16_6.x;
    u_xlat9.z = (-u_xlat9.x);
    u_xlat10.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat10.x = dot(u_xlat9.yz, u_xlat3.xy);
    u_xlat3.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = u_xlat3.zw + u_xlat3.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz;
    u_xlat16_37 = u_xlat10_3.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_37 : u_xlat10_3.w;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_FrontIntensity, _FrontIntensity, _FrontIntensity));
    u_xlat16_20.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(_BackIntensity);
    u_xlat16_3.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat16_6.xyz : u_xlat16_20.xyz;
    u_xlat16_3.w = ((gl_FrontFacing ? 1 : 0) != 0) ? _DiffuseColor.w : _DiffuseBackColor.w;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat10.y = (-u_xlat16_7.x);
    u_xlat10.x = u_xlat16_8;
    u_xlat16_1.xy = vs_TEXCOORD1.zw + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat10.xy, u_xlat16_1.xy);
    u_xlat16_7.y = u_xlat10.x;
    u_xlat11.y = dot(u_xlat16_7.xy, u_xlat16_1.xy);
    u_xlat28.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xz = u_xlat24.xy + u_xlat28.xy;
    u_xlat0.xz = u_xlat16_2.xy + u_xlat0.xz;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xz).x;
    u_xlat16_1.x = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1.x = u_xlat10_0.x * u_xlat16_1.x + 0.0125228781;
    u_xlat16_13.x = vs_TEXCOORD3.w + _SoftSize;
    u_xlat16_25 = vs_TEXCOORD2.w + _DissolveStep;
    u_xlat24.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat16_25;
    u_xlat36 = u_xlat10_0.x * u_xlat16_1.x + (-u_xlat16_25);
    u_xlat24.x = u_xlat24.x + 0.5;
    u_xlat28.x = (-u_xlat16_13.x) + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + (-u_xlat28.x);
    u_xlat0.x = u_xlat10_0.x * u_xlat16_1.x + (-u_xlat28.x);
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = u_xlat0.x * u_xlat24.x;
    u_xlat16_1.x = (-u_xlat10_4.y) + 1.0;
    u_xlat0.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat0.x = u_xlat0.x * u_xlat36;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.y = u_xlat0.x * u_xlat24.x;
    u_xlat0.xz = max(u_xlat16_1.xx, u_xlat10.xy);
    u_xlatb36 = 0.0<_MaskedDissolve;
    u_xlat0.xz = (bool(u_xlatb36)) ? u_xlat0.xz : u_xlat10.xy;
    u_xlat16.xyz = u_xlat0.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_13.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = vs_TEXCOORD4.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * u_xlat16_2.xyz + u_xlat16_13.xyz;
    u_xlat16.xyz = log2(abs(u_xlat16_13.xyz));
    u_xlat16.xyz = u_xlat16.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16.xyz = exp2(u_xlat16.xyz);
    u_xlat16.xyz = u_xlat16.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat16.xyz;
    u_xlatb24 = _MaskNotEffectDiff>=0.5;
    u_xlat16_13.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = u_xlat10_4.x * u_xlat16_13.y + u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat0.x * vs_TEXCOORD4.w;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13.x;
    SV_Target0.w = (u_xlatb0.y) ? u_xlat16_1.x : u_xlat16_13.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _OpenCustom;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_1 = in_TEXCOORD1 * vec4(_OpenCustom) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0.zw = u_xlat16_1.zw;
    vs_TEXCOORD1.xy = u_xlat16_1.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD2.zw * vec2(_OpenCustom) + in_TEXCOORD0.xy;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = in_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    vs_TEXCOORD2.w = u_xlat16_2.y;
    vs_TEXCOORD3.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = in_COLOR0;
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
uniform 	float _CustomTime;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _MixDiffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec4 _DissolveUVSpeed;
uniform 	mediump float _DiffUVScale;
uniform 	mediump float _MaskUVScale;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _BackIntensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _DissolveAngle;
uniform 	mediump float _MixLumThreshold;
uniform 	mediump float _MixLumOffset;
uniform 	mediump float _MixLumPower;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MixDiffuseMode;
uniform 	mediump float _MixDiffusePower;
uniform 	mediump float _MixDiffuseAngle;
uniform 	mediump float _MixDiffuseXSpeed;
uniform 	mediump float _MixDiffuseYSpeed;
uniform 	mediump float _MaskAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _NoiseEffectMaskStreng;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump float _MaskedDissolve;
uniform 	mediump float _UnMult;
uniform 	mediump float _NoiseUnEffectDiff;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _TransparentFresnelPart;
uniform 	mediump float _DissolveOutline_On;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _MixDiffuse;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_20;
vec2 u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat28;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _MixDiffuseAngle * 0.0174532942;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat3.y = (-u_xlat16_1.x);
    u_xlat3.x = u_xlat16_2.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat16_1.y = u_xlat3.x;
    u_xlat4.y = dot(u_xlat16_1.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MixDiffuse_ST.xy + _MixDiffuse_ST.zw;
    u_xlat24.x = _CustomTime * 0.000277777785;
    u_xlatb36 = u_xlat24.x>=(-u_xlat24.x);
    u_xlat24.x = fract(abs(u_xlat24.x));
    u_xlat24.x = (u_xlatb36) ? u_xlat24.x : (-u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 3600.0;
    u_xlat3.x = u_xlat24.x * _MixDiffuseXSpeed;
    u_xlat3.y = u_xlat24.x * _MixDiffuseYSpeed;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat10_0.xyw = texture2D(_MixDiffuse, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_37 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_37 = u_xlat16_37 + (-_MixLumThreshold);
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(vec3(_MixLumOffset, _MixLumOffset, _MixLumOffset));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_MixLumPower);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat16_1.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower));
    u_xlat16_2.xyz = vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower)) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlatb0.x = 0.5<_MixDiffuseMode;
    u_xlat16_1.xyz = (u_xlatb0.x) ? u_xlat16_1.xyz : u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat24.xx * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat16_2.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_26.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16_2.xy + u_xlat16_26.xy;
    u_xlat16_37 = _MaskAngle * 0.0174532924;
    u_xlat16_5.x = sin(u_xlat16_37);
    u_xlat16_6.x = cos(u_xlat16_37);
    u_xlat16_26.xy = max(vec2(_MaskUVScale, _DiffUVScale), vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat16_26.xy = vec2(1.0, 1.0) / u_xlat16_26.xy;
    u_xlat3.x = u_xlat16_26.x * u_xlat16_5.x;
    u_xlat3.y = u_xlat16_26.x * u_xlat16_6.x;
    u_xlat3.z = (-u_xlat3.x);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat3 = u_xlat24.xxxx * vec4(_MaskXSpeed, _MaskYSpeed, _DiffXSpeed, _DiffYSpeed);
    u_xlat24.xy = u_xlat24.xx * _DissolveUVSpeed.xy;
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat3 = fract(u_xlat3);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat16_5.xy = u_xlat16_2.xy * u_xlat10_4.zz;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _TransparentFresnelPart, _EffectByMask, _EffectByMask)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? u_xlat16_5.xy : u_xlat16_2.xy;
    u_xlat3.xy = u_xlat16_2.xy + vs_TEXCOORD1.xy;
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat3.xy = (u_xlatb0.x) ? vs_TEXCOORD1.xy : u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = vec2(_DiffAngle, _DissolveAngle) * vec2(0.0174532924, 0.0174532942);
    u_xlat16_6.x = cos(u_xlat16_5.x);
    u_xlat16_5.x = sin(u_xlat16_5.x);
    u_xlat16_7.x = sin(u_xlat16_5.y);
    u_xlat16_8 = cos(u_xlat16_5.y);
    u_xlat9.x = u_xlat16_26.y * u_xlat16_5.x;
    u_xlat9.y = u_xlat16_26.y * u_xlat16_6.x;
    u_xlat9.z = (-u_xlat9.x);
    u_xlat10.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat10.x = dot(u_xlat9.yz, u_xlat3.xy);
    u_xlat3.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = u_xlat3.zw + u_xlat3.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz;
    u_xlat16_37 = u_xlat10_3.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_37 : u_xlat10_3.w;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_FrontIntensity, _FrontIntensity, _FrontIntensity));
    u_xlat16_20.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(_BackIntensity);
    u_xlat16_3.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat16_6.xyz : u_xlat16_20.xyz;
    u_xlat16_3.w = ((gl_FrontFacing ? 1 : 0) != 0) ? _DiffuseColor.w : _DiffuseBackColor.w;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat10.y = (-u_xlat16_7.x);
    u_xlat10.x = u_xlat16_8;
    u_xlat16_1.xy = vs_TEXCOORD1.zw + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat10.xy, u_xlat16_1.xy);
    u_xlat16_7.y = u_xlat10.x;
    u_xlat11.y = dot(u_xlat16_7.xy, u_xlat16_1.xy);
    u_xlat28.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xz = u_xlat24.xy + u_xlat28.xy;
    u_xlat0.xz = u_xlat16_2.xy + u_xlat0.xz;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xz).x;
    u_xlat16_1.x = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1.x = u_xlat10_0.x * u_xlat16_1.x + 0.0125228781;
    u_xlat16_13.x = vs_TEXCOORD3.w + _SoftSize;
    u_xlat16_25 = vs_TEXCOORD2.w + _DissolveStep;
    u_xlat24.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat16_25;
    u_xlat36 = u_xlat10_0.x * u_xlat16_1.x + (-u_xlat16_25);
    u_xlat24.x = u_xlat24.x + 0.5;
    u_xlat28.x = (-u_xlat16_13.x) + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + (-u_xlat28.x);
    u_xlat0.x = u_xlat10_0.x * u_xlat16_1.x + (-u_xlat28.x);
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = u_xlat0.x * u_xlat24.x;
    u_xlat16_1.x = (-u_xlat10_4.y) + 1.0;
    u_xlat0.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat0.x = u_xlat0.x * u_xlat36;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.y = u_xlat0.x * u_xlat24.x;
    u_xlat0.xz = max(u_xlat16_1.xx, u_xlat10.xy);
    u_xlatb36 = 0.0<_MaskedDissolve;
    u_xlat0.xz = (bool(u_xlatb36)) ? u_xlat0.xz : u_xlat10.xy;
    u_xlat16.xyz = u_xlat0.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_13.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = vs_TEXCOORD4.xyz * vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * u_xlat16_2.xyz + u_xlat16_13.xyz;
    u_xlat16.xyz = log2(abs(u_xlat16_13.xyz));
    u_xlat16.xyz = u_xlat16.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16.xyz = exp2(u_xlat16.xyz);
    u_xlat16.xyz = u_xlat16.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat16.xyz;
    u_xlatb24 = _MaskNotEffectDiff>=0.5;
    u_xlat16_13.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = u_xlat10_4.x * u_xlat16_13.y + u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat0.x * vs_TEXCOORD4.w;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13.x;
    SV_Target0.w = (u_xlatb0.y) ? u_xlat16_1.x : u_xlat16_13.x;
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
uniform 	mediump float _OpenCustom;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_1 = in_TEXCOORD1 * vec4(_OpenCustom) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0.zw = u_xlat16_1.zw;
    vs_TEXCOORD1.xy = u_xlat16_1.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD2.zw * vec2(_OpenCustom) + in_TEXCOORD0.xy;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = in_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    vs_TEXCOORD2.w = u_xlat16_2.y;
    vs_TEXCOORD3.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = in_COLOR0;
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
uniform 	float _CustomTime;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _MixDiffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec4 _DissolveUVSpeed;
uniform 	mediump float _DiffUVScale;
uniform 	mediump float _MaskUVScale;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _BackIntensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _DissolveAngle;
uniform 	mediump float _MixLumThreshold;
uniform 	mediump float _MixLumOffset;
uniform 	mediump float _MixLumPower;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MixDiffuseMode;
uniform 	mediump float _MixDiffusePower;
uniform 	mediump float _MixDiffuseAngle;
uniform 	mediump float _MixDiffuseXSpeed;
uniform 	mediump float _MixDiffuseYSpeed;
uniform 	mediump float _MaskAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _NoiseEffectMaskStreng;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump float _MaskedDissolve;
uniform 	mediump float _UnMult;
uniform 	mediump float _NoiseUnEffectDiff;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _TransparentFresnelPart;
uniform 	mediump float _DissolveOutline_On;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _MixDiffuse;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_20;
vec2 u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat28;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _MixDiffuseAngle * 0.0174532942;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat3.y = (-u_xlat16_1.x);
    u_xlat3.x = u_xlat16_2.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat16_1.y = u_xlat3.x;
    u_xlat4.y = dot(u_xlat16_1.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MixDiffuse_ST.xy + _MixDiffuse_ST.zw;
    u_xlat24.x = _CustomTime * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat24.x>=(-u_xlat24.x));
#else
    u_xlatb36 = u_xlat24.x>=(-u_xlat24.x);
#endif
    u_xlat24.x = fract(abs(u_xlat24.x));
    u_xlat24.x = (u_xlatb36) ? u_xlat24.x : (-u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 3600.0;
    u_xlat3.x = u_xlat24.x * _MixDiffuseXSpeed;
    u_xlat3.y = u_xlat24.x * _MixDiffuseYSpeed;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_0.xyw = texture(_MixDiffuse, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_37 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_37 = u_xlat16_37 + (-_MixLumThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(vec3(_MixLumOffset, _MixLumOffset, _MixLumOffset));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_MixLumPower);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat16_1.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower));
    u_xlat16_2.xyz = vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower)) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_MixDiffuseMode);
#else
    u_xlatb0.x = 0.5<_MixDiffuseMode;
#endif
    u_xlat16_1.xyz = (u_xlatb0.x) ? u_xlat16_1.xyz : u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat24.xx * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat16_2.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_26.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16_2.xy + u_xlat16_26.xy;
    u_xlat16_37 = _MaskAngle * 0.0174532924;
    u_xlat16_5.x = sin(u_xlat16_37);
    u_xlat16_6.x = cos(u_xlat16_37);
    u_xlat16_26.xy = max(vec2(_MaskUVScale, _DiffUVScale), vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat16_26.xy = vec2(1.0, 1.0) / u_xlat16_26.xy;
    u_xlat3.x = u_xlat16_26.x * u_xlat16_5.x;
    u_xlat3.y = u_xlat16_26.x * u_xlat16_6.x;
    u_xlat3.z = (-u_xlat3.x);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat3 = u_xlat24.xxxx * vec4(_MaskXSpeed, _MaskYSpeed, _DiffXSpeed, _DiffYSpeed);
    u_xlat24.xy = u_xlat24.xx * _DissolveUVSpeed.xy;
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat3 = fract(u_xlat3);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat16_5.xy = u_xlat16_2.xy * u_xlat16_4.zz;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _TransparentFresnelPart, _EffectByMask, _EffectByMask)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? u_xlat16_5.xy : u_xlat16_2.xy;
    u_xlat3.xy = u_xlat16_2.xy + vs_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat3.xy = (u_xlatb0.x) ? vs_TEXCOORD1.xy : u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = vec2(_DiffAngle, _DissolveAngle) * vec2(0.0174532924, 0.0174532942);
    u_xlat16_6.x = cos(u_xlat16_5.x);
    u_xlat16_5.x = sin(u_xlat16_5.x);
    u_xlat16_7.x = sin(u_xlat16_5.y);
    u_xlat16_8 = cos(u_xlat16_5.y);
    u_xlat9.x = u_xlat16_26.y * u_xlat16_5.x;
    u_xlat9.y = u_xlat16_26.y * u_xlat16_6.x;
    u_xlat9.z = (-u_xlat9.x);
    u_xlat10.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat10.x = dot(u_xlat9.yz, u_xlat3.xy);
    u_xlat3.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = u_xlat3.zw + u_xlat3.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_37 = u_xlat16_3.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_37 : u_xlat16_3.w;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_FrontIntensity, _FrontIntensity, _FrontIntensity));
    u_xlat16_20.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(_BackIntensity);
    u_xlat16_3.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_6.xyz : u_xlat16_20.xyz;
    u_xlat16_3.w = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? _DiffuseColor.w : _DiffuseBackColor.w;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat10.y = (-u_xlat16_7.x);
    u_xlat10.x = u_xlat16_8;
    u_xlat16_1.xy = vs_TEXCOORD1.zw + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat10.xy, u_xlat16_1.xy);
    u_xlat16_7.y = u_xlat10.x;
    u_xlat11.y = dot(u_xlat16_7.xy, u_xlat16_1.xy);
    u_xlat28.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xz = u_xlat24.xy + u_xlat28.xy;
    u_xlat0.xz = u_xlat16_2.xy + u_xlat0.xz;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xz).x;
    u_xlat16_1.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_1.x + 0.0125228781;
    u_xlat16_13.x = vs_TEXCOORD3.w + _SoftSize;
    u_xlat16_25 = vs_TEXCOORD2.w + _DissolveStep;
    u_xlat24.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat16_25;
    u_xlat36 = u_xlat16_0.x * u_xlat16_1.x + (-u_xlat16_25);
    u_xlat24.x = u_xlat24.x + 0.5;
    u_xlat28.x = (-u_xlat16_13.x) + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + (-u_xlat28.x);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_1.x + (-u_xlat28.x);
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = u_xlat0.x * u_xlat24.x;
    u_xlat16_1.x = (-u_xlat16_4.y) + 1.0;
    u_xlat0.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat0.x = u_xlat0.x * u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.y = u_xlat0.x * u_xlat24.x;
    u_xlat0.xz = max(u_xlat16_1.xx, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_MaskedDissolve);
#else
    u_xlatb36 = 0.0<_MaskedDissolve;
#endif
    u_xlat0.xz = (bool(u_xlatb36)) ? u_xlat0.xz : u_xlat10.xy;
    u_xlat16.xyz = u_xlat0.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_13.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = vs_TEXCOORD4.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat16.xyz * u_xlat16_2.xyz + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_MaskNotEffectDiff>=0.5);
#else
    u_xlatb24 = _MaskNotEffectDiff>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = u_xlat16_4.x * u_xlat16_13.y + u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat0.x * vs_TEXCOORD4.w;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13.x;
    SV_Target0.w = (u_xlatb0.y) ? u_xlat16_1.x : u_xlat16_13.x;
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
uniform 	mediump float _OpenCustom;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_1 = in_TEXCOORD1 * vec4(_OpenCustom) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0.zw = u_xlat16_1.zw;
    vs_TEXCOORD1.xy = u_xlat16_1.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD2.zw * vec2(_OpenCustom) + in_TEXCOORD0.xy;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = in_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    vs_TEXCOORD2.w = u_xlat16_2.y;
    vs_TEXCOORD3.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = in_COLOR0;
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
uniform 	float _CustomTime;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _MixDiffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec4 _DissolveUVSpeed;
uniform 	mediump float _DiffUVScale;
uniform 	mediump float _MaskUVScale;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _BackIntensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _DissolveAngle;
uniform 	mediump float _MixLumThreshold;
uniform 	mediump float _MixLumOffset;
uniform 	mediump float _MixLumPower;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MixDiffuseMode;
uniform 	mediump float _MixDiffusePower;
uniform 	mediump float _MixDiffuseAngle;
uniform 	mediump float _MixDiffuseXSpeed;
uniform 	mediump float _MixDiffuseYSpeed;
uniform 	mediump float _MaskAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _NoiseEffectMaskStreng;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump float _MaskedDissolve;
uniform 	mediump float _UnMult;
uniform 	mediump float _NoiseUnEffectDiff;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _TransparentFresnelPart;
uniform 	mediump float _DissolveOutline_On;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _MixDiffuse;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_20;
vec2 u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat28;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _MixDiffuseAngle * 0.0174532942;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat3.y = (-u_xlat16_1.x);
    u_xlat3.x = u_xlat16_2.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat16_1.y = u_xlat3.x;
    u_xlat4.y = dot(u_xlat16_1.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MixDiffuse_ST.xy + _MixDiffuse_ST.zw;
    u_xlat24.x = _CustomTime * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat24.x>=(-u_xlat24.x));
#else
    u_xlatb36 = u_xlat24.x>=(-u_xlat24.x);
#endif
    u_xlat24.x = fract(abs(u_xlat24.x));
    u_xlat24.x = (u_xlatb36) ? u_xlat24.x : (-u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 3600.0;
    u_xlat3.x = u_xlat24.x * _MixDiffuseXSpeed;
    u_xlat3.y = u_xlat24.x * _MixDiffuseYSpeed;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_0.xyw = texture(_MixDiffuse, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_37 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_37 = u_xlat16_37 + (-_MixLumThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(vec3(_MixLumOffset, _MixLumOffset, _MixLumOffset));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_MixLumPower);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat16_1.xyz = u_xlat16_0.xyw * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower));
    u_xlat16_2.xyz = vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower)) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5<_MixDiffuseMode);
#else
    u_xlatb0.x = 0.5<_MixDiffuseMode;
#endif
    u_xlat16_1.xyz = (u_xlatb0.x) ? u_xlat16_1.xyz : u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat24.xx * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat16_2.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_26.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16_2.xy + u_xlat16_26.xy;
    u_xlat16_37 = _MaskAngle * 0.0174532924;
    u_xlat16_5.x = sin(u_xlat16_37);
    u_xlat16_6.x = cos(u_xlat16_37);
    u_xlat16_26.xy = max(vec2(_MaskUVScale, _DiffUVScale), vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat16_26.xy = vec2(1.0, 1.0) / u_xlat16_26.xy;
    u_xlat3.x = u_xlat16_26.x * u_xlat16_5.x;
    u_xlat3.y = u_xlat16_26.x * u_xlat16_6.x;
    u_xlat3.z = (-u_xlat3.x);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat3 = u_xlat24.xxxx * vec4(_MaskXSpeed, _MaskYSpeed, _DiffXSpeed, _DiffYSpeed);
    u_xlat24.xy = u_xlat24.xx * _DissolveUVSpeed.xy;
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat3 = fract(u_xlat3);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat16_4.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat16_5.xy = u_xlat16_2.xy * u_xlat16_4.zz;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _TransparentFresnelPart, _EffectByMask, _EffectByMask)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? u_xlat16_5.xy : u_xlat16_2.xy;
    u_xlat3.xy = u_xlat16_2.xy + vs_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
#endif
    u_xlat3.xy = (u_xlatb0.x) ? vs_TEXCOORD1.xy : u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = vec2(_DiffAngle, _DissolveAngle) * vec2(0.0174532924, 0.0174532942);
    u_xlat16_6.x = cos(u_xlat16_5.x);
    u_xlat16_5.x = sin(u_xlat16_5.x);
    u_xlat16_7.x = sin(u_xlat16_5.y);
    u_xlat16_8 = cos(u_xlat16_5.y);
    u_xlat9.x = u_xlat16_26.y * u_xlat16_5.x;
    u_xlat9.y = u_xlat16_26.y * u_xlat16_6.x;
    u_xlat9.z = (-u_xlat9.x);
    u_xlat10.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat10.x = dot(u_xlat9.yz, u_xlat3.xy);
    u_xlat3.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = u_xlat3.zw + u_xlat3.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_37 = u_xlat16_3.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
#endif
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_37 : u_xlat16_3.w;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_FrontIntensity, _FrontIntensity, _FrontIntensity));
    u_xlat16_20.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(_BackIntensity);
    u_xlat16_3.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_6.xyz : u_xlat16_20.xyz;
    u_xlat16_3.w = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? _DiffuseColor.w : _DiffuseBackColor.w;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat10.y = (-u_xlat16_7.x);
    u_xlat10.x = u_xlat16_8;
    u_xlat16_1.xy = vs_TEXCOORD1.zw + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat10.xy, u_xlat16_1.xy);
    u_xlat16_7.y = u_xlat10.x;
    u_xlat11.y = dot(u_xlat16_7.xy, u_xlat16_1.xy);
    u_xlat28.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xz = u_xlat24.xy + u_xlat28.xy;
    u_xlat0.xz = u_xlat16_2.xy + u_xlat0.xz;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xz).x;
    u_xlat16_1.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1.x = u_xlat16_0.x * u_xlat16_1.x + 0.0125228781;
    u_xlat16_13.x = vs_TEXCOORD3.w + _SoftSize;
    u_xlat16_25 = vs_TEXCOORD2.w + _DissolveStep;
    u_xlat24.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat16_25;
    u_xlat36 = u_xlat16_0.x * u_xlat16_1.x + (-u_xlat16_25);
    u_xlat24.x = u_xlat24.x + 0.5;
    u_xlat28.x = (-u_xlat16_13.x) + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + (-u_xlat28.x);
    u_xlat0.x = u_xlat16_0.x * u_xlat16_1.x + (-u_xlat28.x);
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = u_xlat0.x * u_xlat24.x;
    u_xlat16_1.x = (-u_xlat16_4.y) + 1.0;
    u_xlat0.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat0.x = u_xlat0.x * u_xlat36;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.y = u_xlat0.x * u_xlat24.x;
    u_xlat0.xz = max(u_xlat16_1.xx, u_xlat10.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_MaskedDissolve);
#else
    u_xlatb36 = 0.0<_MaskedDissolve;
#endif
    u_xlat0.xz = (bool(u_xlatb36)) ? u_xlat0.xz : u_xlat10.xy;
    u_xlat16.xyz = u_xlat0.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_13.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = vs_TEXCOORD4.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat16.xyz * u_xlat16_2.xyz + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_MaskNotEffectDiff>=0.5);
#else
    u_xlatb24 = _MaskNotEffectDiff>=0.5;
#endif
    u_xlat16_13.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = u_xlat16_4.x * u_xlat16_13.y + u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat0.x * vs_TEXCOORD4.w;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13.x;
    SV_Target0.w = (u_xlatb0.y) ? u_xlat16_1.x : u_xlat16_13.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _OpenCustom;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_1 = in_TEXCOORD1 * vec4(_OpenCustom) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0.zw = u_xlat16_1.zw;
    vs_TEXCOORD1.xy = u_xlat16_1.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD2.zw * vec2(_OpenCustom) + in_TEXCOORD0.xy;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = in_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    vs_TEXCOORD2.w = u_xlat16_2.y;
    vs_TEXCOORD3.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = in_COLOR0;
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
uniform 	float _CustomTime;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _MixDiffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec4 _DissolveUVSpeed;
uniform 	mediump float _DiffUVScale;
uniform 	mediump float _MaskUVScale;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _BackIntensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _DissolveAngle;
uniform 	mediump float _MixLumThreshold;
uniform 	mediump float _MixLumOffset;
uniform 	mediump float _MixLumPower;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MixDiffuseMode;
uniform 	mediump float _MixDiffusePower;
uniform 	mediump float _MixDiffuseAngle;
uniform 	mediump float _MixDiffuseXSpeed;
uniform 	mediump float _MixDiffuseYSpeed;
uniform 	mediump float _MaskAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _NoiseEffectMaskStreng;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump float _MaskedDissolve;
uniform 	mediump float _UnMult;
uniform 	mediump float _NoiseUnEffectDiff;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _TransparentFresnelPart;
uniform 	mediump float _DissolveOutline_On;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _MixDiffuse;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_20;
vec2 u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat28;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _MixDiffuseAngle * 0.0174532942;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat3.y = (-u_xlat16_1.x);
    u_xlat3.x = u_xlat16_2.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat16_1.y = u_xlat3.x;
    u_xlat4.y = dot(u_xlat16_1.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MixDiffuse_ST.xy + _MixDiffuse_ST.zw;
    u_xlat24.x = _CustomTime * 0.000277777785;
    u_xlatb36 = u_xlat24.x>=(-u_xlat24.x);
    u_xlat24.x = fract(abs(u_xlat24.x));
    u_xlat24.x = (u_xlatb36) ? u_xlat24.x : (-u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 3600.0;
    u_xlat3.x = u_xlat24.x * _MixDiffuseXSpeed;
    u_xlat3.y = u_xlat24.x * _MixDiffuseYSpeed;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat10_0.xyw = texture2D(_MixDiffuse, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_37 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_37 = u_xlat16_37 + (-_MixLumThreshold);
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(vec3(_MixLumOffset, _MixLumOffset, _MixLumOffset));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_MixLumPower);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat16_1.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower));
    u_xlat16_2.xyz = vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower)) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlatb0.x = 0.5<_MixDiffuseMode;
    u_xlat16_1.xyz = (u_xlatb0.x) ? u_xlat16_1.xyz : u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat24.xx * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat16_2.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_26.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16_2.xy + u_xlat16_26.xy;
    u_xlat16_37 = _MaskAngle * 0.0174532924;
    u_xlat16_5.x = sin(u_xlat16_37);
    u_xlat16_6.x = cos(u_xlat16_37);
    u_xlat16_26.xy = max(vec2(_MaskUVScale, _DiffUVScale), vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat16_26.xy = vec2(1.0, 1.0) / u_xlat16_26.xy;
    u_xlat3.x = u_xlat16_26.x * u_xlat16_5.x;
    u_xlat3.y = u_xlat16_26.x * u_xlat16_6.x;
    u_xlat3.z = (-u_xlat3.x);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat3 = u_xlat24.xxxx * vec4(_MaskXSpeed, _MaskYSpeed, _DiffXSpeed, _DiffYSpeed);
    u_xlat24.xy = u_xlat24.xx * _DissolveUVSpeed.xy;
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat3 = fract(u_xlat3);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat16_5.xy = u_xlat16_2.xy * u_xlat10_4.zz;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _TransparentFresnelPart, _EffectByMask, _EffectByMask)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? u_xlat16_5.xy : u_xlat16_2.xy;
    u_xlat3.xy = u_xlat16_2.xy + vs_TEXCOORD1.xy;
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat3.xy = (u_xlatb0.x) ? vs_TEXCOORD1.xy : u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = vec2(_DiffAngle, _DissolveAngle) * vec2(0.0174532924, 0.0174532942);
    u_xlat16_6.x = cos(u_xlat16_5.x);
    u_xlat16_5.x = sin(u_xlat16_5.x);
    u_xlat16_7.x = sin(u_xlat16_5.y);
    u_xlat16_8 = cos(u_xlat16_5.y);
    u_xlat9.x = u_xlat16_26.y * u_xlat16_5.x;
    u_xlat9.y = u_xlat16_26.y * u_xlat16_6.x;
    u_xlat9.z = (-u_xlat9.x);
    u_xlat10.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat10.x = dot(u_xlat9.yz, u_xlat3.xy);
    u_xlat3.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = u_xlat3.zw + u_xlat3.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz;
    u_xlat16_37 = u_xlat10_3.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_37 : u_xlat10_3.w;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_FrontIntensity, _FrontIntensity, _FrontIntensity));
    u_xlat16_20.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(_BackIntensity);
    u_xlat16_3.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat16_6.xyz : u_xlat16_20.xyz;
    u_xlat16_3.w = ((gl_FrontFacing ? 1 : 0) != 0) ? _DiffuseColor.w : _DiffuseBackColor.w;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat10.y = (-u_xlat16_7.x);
    u_xlat10.x = u_xlat16_8;
    u_xlat16_1.xy = vs_TEXCOORD1.zw + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat10.xy, u_xlat16_1.xy);
    u_xlat16_7.y = u_xlat10.x;
    u_xlat11.y = dot(u_xlat16_7.xy, u_xlat16_1.xy);
    u_xlat28.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xz = u_xlat24.xy + u_xlat28.xy;
    u_xlat0.xz = u_xlat16_2.xy + u_xlat0.xz;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xz).x;
    u_xlat16_1.x = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1.x = u_xlat10_0.x * u_xlat16_1.x + 0.0125228781;
    u_xlat16_13.x = vs_TEXCOORD3.w + _SoftSize;
    u_xlat16_25 = vs_TEXCOORD2.w + _DissolveStep;
    u_xlat24.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat16_25;
    u_xlat36 = u_xlat10_0.x * u_xlat16_1.x + (-u_xlat16_25);
    u_xlat24.x = u_xlat24.x + 0.5;
    u_xlat28.x = (-u_xlat16_13.x) + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + (-u_xlat28.x);
    u_xlat0.x = u_xlat10_0.x * u_xlat16_1.x + (-u_xlat28.x);
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = u_xlat0.x * u_xlat24.x;
    u_xlat16_1.x = (-u_xlat10_4.y) + 1.0;
    u_xlat0.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat0.x = u_xlat0.x * u_xlat36;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.y = u_xlat0.x * u_xlat24.x;
    u_xlat0.xz = max(u_xlat16_1.xx, u_xlat10.xy);
    u_xlatb36 = 0.0<_MaskedDissolve;
    u_xlat0.xz = (bool(u_xlatb36)) ? u_xlat0.xz : u_xlat10.xy;
    u_xlat16.xyz = u_xlat0.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_13.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = vs_TEXCOORD4.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat16.xyz * u_xlat16_2.xyz + u_xlat16_13.xyz;
    u_xlatb24 = _MaskNotEffectDiff>=0.5;
    u_xlat16_13.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = u_xlat10_4.x * u_xlat16_13.y + u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat0.x * vs_TEXCOORD4.w;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13.x;
    SV_Target0.w = (u_xlatb0.y) ? u_xlat16_1.x : u_xlat16_13.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _OpenCustom;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_1 = in_TEXCOORD1 * vec4(_OpenCustom) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD0.zw = u_xlat16_1.zw;
    vs_TEXCOORD1.xy = u_xlat16_1.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD2.zw * vec2(_OpenCustom) + in_TEXCOORD0.xy;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = in_TEXCOORD2.xy * vec2(_OpenCustom);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    vs_TEXCOORD2.w = u_xlat16_2.y;
    vs_TEXCOORD3.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = in_COLOR0;
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
uniform 	float _CustomTime;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _MixDiffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec4 _DissolveUVSpeed;
uniform 	mediump float _DiffUVScale;
uniform 	mediump float _MaskUVScale;
uniform 	mediump float _DiffusePower;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _BackIntensity;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _DiffAngle;
uniform 	mediump float _DissolveAngle;
uniform 	mediump float _MixLumThreshold;
uniform 	mediump float _MixLumOffset;
uniform 	mediump float _MixLumPower;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _DiffXSpeed;
uniform 	mediump float _DiffYSpeed;
uniform 	mediump float _MaskXSpeed;
uniform 	mediump float _MaskYSpeed;
uniform 	mediump float _MixDiffuseMode;
uniform 	mediump float _MixDiffusePower;
uniform 	mediump float _MixDiffuseAngle;
uniform 	mediump float _MixDiffuseXSpeed;
uniform 	mediump float _MixDiffuseYSpeed;
uniform 	mediump float _MaskAngle;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	mediump float _NoiseEffectMaskStreng;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump float _MaskedDissolve;
uniform 	mediump float _UnMult;
uniform 	mediump float _NoiseUnEffectDiff;
uniform 	mediump float _EffectByMask;
uniform 	mediump float _TransparentFresnelPart;
uniform 	mediump float _DissolveOutline_On;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _MixDiffuse;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_13;
vec3 u_xlat16;
mediump vec3 u_xlat16_20;
vec2 u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat28;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_37;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.x = _MixDiffuseAngle * 0.0174532942;
    u_xlat16_2.x = cos(u_xlat16_1.x);
    u_xlat16_1.x = sin(u_xlat16_1.x);
    u_xlat3.y = (-u_xlat16_1.x);
    u_xlat3.x = u_xlat16_2.x;
    u_xlat4.x = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat16_1.y = u_xlat3.x;
    u_xlat4.y = dot(u_xlat16_1.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _MixDiffuse_ST.xy + _MixDiffuse_ST.zw;
    u_xlat24.x = _CustomTime * 0.000277777785;
    u_xlatb36 = u_xlat24.x>=(-u_xlat24.x);
    u_xlat24.x = fract(abs(u_xlat24.x));
    u_xlat24.x = (u_xlatb36) ? u_xlat24.x : (-u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 3600.0;
    u_xlat3.x = u_xlat24.x * _MixDiffuseXSpeed;
    u_xlat3.y = u_xlat24.x * _MixDiffuseYSpeed;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat10_0.xyw = texture2D(_MixDiffuse, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz;
    u_xlat16_5.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_37 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_37 = u_xlat16_37 + (-_MixLumThreshold);
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(vec3(_MixLumOffset, _MixLumOffset, _MixLumOffset));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_MixLumPower);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-05, 9.99999975e-05, 9.99999975e-05));
    u_xlat16_1.xyz = u_xlat10_0.xyw * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower));
    u_xlat16_2.xyz = vec3(vec3(_MixDiffusePower, _MixDiffusePower, _MixDiffusePower)) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlatb0.x = 0.5<_MixDiffuseMode;
    u_xlat16_1.xyz = (u_xlatb0.x) ? u_xlat16_1.xyz : u_xlat16_2.xyz;
    u_xlat0.xy = u_xlat24.xx * _GChannel.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat16_2.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat16_26.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat0.xy = vec2(_NoiseEffectMaskStreng) * u_xlat16_2.xy + u_xlat16_26.xy;
    u_xlat16_37 = _MaskAngle * 0.0174532924;
    u_xlat16_5.x = sin(u_xlat16_37);
    u_xlat16_6.x = cos(u_xlat16_37);
    u_xlat16_26.xy = max(vec2(_MaskUVScale, _DiffUVScale), vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat16_26.xy = vec2(1.0, 1.0) / u_xlat16_26.xy;
    u_xlat3.x = u_xlat16_26.x * u_xlat16_5.x;
    u_xlat3.y = u_xlat16_26.x * u_xlat16_6.x;
    u_xlat3.z = (-u_xlat3.x);
    u_xlat4.y = dot(u_xlat3.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat3 = u_xlat24.xxxx * vec4(_MaskXSpeed, _MaskYSpeed, _DiffXSpeed, _DiffYSpeed);
    u_xlat24.xy = u_xlat24.xx * _DissolveUVSpeed.xy;
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat3 = fract(u_xlat3);
    u_xlat0.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat10_4.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat16_5.xy = u_xlat16_2.xy * u_xlat10_4.zz;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _TransparentFresnelPart, _EffectByMask, _EffectByMask)).xy;
    u_xlat16_2.xy = (u_xlatb0.x) ? u_xlat16_5.xy : u_xlat16_2.xy;
    u_xlat3.xy = u_xlat16_2.xy + vs_TEXCOORD1.xy;
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_NoiseUnEffectDiff);
    u_xlat3.xy = (u_xlatb0.x) ? vs_TEXCOORD1.xy : u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = vec2(_DiffAngle, _DissolveAngle) * vec2(0.0174532924, 0.0174532942);
    u_xlat16_6.x = cos(u_xlat16_5.x);
    u_xlat16_5.x = sin(u_xlat16_5.x);
    u_xlat16_7.x = sin(u_xlat16_5.y);
    u_xlat16_8 = cos(u_xlat16_5.y);
    u_xlat9.x = u_xlat16_26.y * u_xlat16_5.x;
    u_xlat9.y = u_xlat16_26.y * u_xlat16_6.x;
    u_xlat9.z = (-u_xlat9.x);
    u_xlat10.y = dot(u_xlat9.xy, u_xlat3.xy);
    u_xlat10.x = dot(u_xlat9.yz, u_xlat3.xy);
    u_xlat3.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat3.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = u_xlat3.zw + u_xlat3.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz;
    u_xlat16_37 = u_xlat10_3.w * u_xlat16_5.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UnMult);
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_37 : u_xlat10_3.w;
    u_xlat16_6.xyz = _DiffuseColor.xyz * _DiffuseColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_FrontIntensity, _FrontIntensity, _FrontIntensity));
    u_xlat16_20.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(_BackIntensity);
    u_xlat16_3.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat16_6.xyz : u_xlat16_20.xyz;
    u_xlat16_3.w = ((gl_FrontFacing ? 1 : 0) != 0) ? _DiffuseColor.w : _DiffuseBackColor.w;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_5;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_6.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat9.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + (-u_xlat16_5.xyz);
    u_xlat10.y = (-u_xlat16_7.x);
    u_xlat10.x = u_xlat16_8;
    u_xlat16_1.xy = vs_TEXCOORD1.zw + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat10.xy, u_xlat16_1.xy);
    u_xlat16_7.y = u_xlat10.x;
    u_xlat11.y = dot(u_xlat16_7.xy, u_xlat16_1.xy);
    u_xlat28.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat28.xy = u_xlat28.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xz = u_xlat24.xy + u_xlat28.xy;
    u_xlat0.xz = u_xlat16_2.xy + u_xlat0.xz;
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xz).x;
    u_xlat16_1.x = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat16_1.x = u_xlat10_0.x * u_xlat16_1.x + 0.0125228781;
    u_xlat16_13.x = vs_TEXCOORD3.w + _SoftSize;
    u_xlat16_25 = vs_TEXCOORD2.w + _DissolveStep;
    u_xlat24.x = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat16_25;
    u_xlat36 = u_xlat10_0.x * u_xlat16_1.x + (-u_xlat16_25);
    u_xlat24.x = u_xlat24.x + 0.5;
    u_xlat28.x = (-u_xlat16_13.x) + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + (-u_xlat28.x);
    u_xlat0.x = u_xlat10_0.x * u_xlat16_1.x + (-u_xlat28.x);
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat0.x = u_xlat24.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = u_xlat0.x * u_xlat24.x;
    u_xlat16_1.x = (-u_xlat10_4.y) + 1.0;
    u_xlat0.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat0.x = u_xlat0.x * u_xlat36;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.y = u_xlat0.x * u_xlat24.x;
    u_xlat0.xz = max(u_xlat16_1.xx, u_xlat10.xy);
    u_xlatb36 = 0.0<_MaskedDissolve;
    u_xlat0.xz = (bool(u_xlatb36)) ? u_xlat0.xz : u_xlat10.xy;
    u_xlat16.xyz = u_xlat0.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_13.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_13.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_2.xyz = vs_TEXCOORD4.xyz * vs_TEXCOORD4.xyz;
    SV_Target0.xyz = u_xlat16.xyz * u_xlat16_2.xyz + u_xlat16_13.xyz;
    u_xlatb24 = _MaskNotEffectDiff>=0.5;
    u_xlat16_13.xy = (bool(u_xlatb24)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = u_xlat10_4.x * u_xlat16_13.y + u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat0.x * vs_TEXCOORD4.w;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_13.x;
    SV_Target0.w = (u_xlatb0.y) ? u_xlat16_1.x : u_xlat16_13.x;
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
}
}
}
}