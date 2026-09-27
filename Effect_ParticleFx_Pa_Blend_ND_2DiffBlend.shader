//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/ParticleFx_Pa_Blend_ND_2DiffBlend" {
Properties {

[Space(15)] [Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

[Space(15)] [Header(First Texture(2D)________________________________________________________________________)] [Space(10)] [Toggle(OpenCustom)] _OpenCustom ("开启CustomData", Float) = 0.0

[Toggle(UnMult)] _UnMult ("UnMult去黑", Float) = 0.0

[Space(10)] _DiffuseColor ("TextureColor_1", Color) = (1,1,1,1)

_Diffuse ("Texture2D_1", 2D) = "white" { }

_DiffusePower ("TexturePower_1", Float) = 1.0

_DiffuseAdd ("TextureAdd_1", Float) = 0.0

_DiffAngle ("Texture旋转_1", Float) = 0.0

_DiffXSpeed ("TexSpeedU_1", Float) = 0.0

_DiffYSpeed ("TexSpeedV_1", Float) = 0.0

[Header(Second Texture(2D)________________________________________________________________________)] [Space(10)] _DiffuseColor1 ("TextureColor_2", Color) = (1,1,1,1)

_Diffuse1 ("Texture2D_2", 2D) = "white" { }

_DiffusePower1 ("TexturePower_2", Float) = 1.0

_DiffuseAdd1 ("TextureAdd_2", Float) = 0.0

_DiffAngle1 ("Texture旋转_2", Float) = 0.0

_DiffXSpeed1 ("TexSpeedU_2", Float) = 0.0

_DiffYSpeed1 ("TexSpeedV_2", Float) = 0.0

[Header(Three Texture(2D)________________________________________________________________________)] [Space(10)] _DiffuseColor2 ("TextureColor_3", Color) = (1,1,1,1)

_Diffuse2 ("Texture2D_3", 2D) = "white" { }

_DiffusePower2 ("TexturePower_3", Float) = 1.0

_DiffuseAdd2 ("TextureAdd_3", Float) = 0.0

_DiffAngle2 ("Texture旋转_3", Float) = 0.0

_DiffXSpeed2 ("TexSpeedU_3", Float) = 0.0

_DiffYSpeed2 ("TexSpeedV_3", Float) = 0.0

[Enum(Soft,0,Hard,1)] _EdgeModel ("边缘模式", Float) = 0.0

[Enum(UV0,0,UV1,1)] _UVSec ("UV通道", Float) = 0.0

_BlendInten ("混合强度", Range(0, 1)) = 0.0

_GNTex ("渐变方向", 2D) = "white" { }

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
  GpuProgramID 11259
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
out highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse1;
UNITY_LOCATION(4) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(5) uniform mediump sampler2D _GNTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat20;
vec2 u_xlat21;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat20.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat20.xy = u_xlat20.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat20.x = texture(_Mask, u_xlat20.xy).x;
    u_xlat1.xy = u_xlat20.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat30 = _DiffAngle2 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat2.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat21.xy;
    u_xlat16_2.xzw = texture(_Diffuse2, u_xlat21.xy).xyz;
    u_xlat2.xzw = u_xlat16_2.xzw * vec3(_DiffusePower2);
    u_xlat30 = _DiffAngle1 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat4.x = sin(u_xlat30);
    u_xlat5.x = cos(u_xlat30);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat21.xy;
    u_xlat16_3.xyz = texture(_Diffuse1, u_xlat21.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(_DiffusePower1);
    u_xlat16_6.xyz = u_xlat3.xyz * _DiffuseColor1.xyz;
    u_xlat2.xzw = u_xlat2.xzw * _DiffuseColor2.xyz + (-u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_UVSec==0.0);
#else
    u_xlatb30 = _UVSec==0.0;
#endif
    u_xlat21.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat30 = texture(_GNTex, u_xlat21.xy).x;
    u_xlat21.x = float(1.0) / u_xlat30;
    u_xlat16_36 = _BlendInten + -0.5;
    u_xlat16_36 = u_xlat16_36 + u_xlat16_36;
    u_xlat31 = u_xlat21.x * u_xlat16_36;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat33;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(u_xlat16_36>=u_xlat30);
#else
    u_xlatb33 = u_xlat16_36>=u_xlat30;
#endif
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_EdgeModel==0.0);
#else
    u_xlatb4 = _EdgeModel==0.0;
#endif
    u_xlat31 = (u_xlatb4) ? u_xlat31 : u_xlat33;
    u_xlat31 = u_xlat16_36 * u_xlat31;
    u_xlat2.xzw = vec3(u_xlat31) * u_xlat2.xzw + u_xlat16_6.xyz;
    u_xlat16_6.x = _BlendInten + _BlendInten;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16_6.x>=u_xlat30);
#else
    u_xlatb30 = u_xlat16_6.x>=u_xlat30;
#endif
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat21.x = u_xlat21.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat30 = (u_xlatb4) ? u_xlat21.x : u_xlat30;
    u_xlat30 = u_xlat16_6.x * u_xlat30;
    u_xlat16_6.x = _DiffAngle * 0.0174532924;
    u_xlat4.x = sin((-u_xlat16_6.x));
    u_xlat5.x = sin(u_xlat16_6.x);
    u_xlat7 = cos(u_xlat16_6.x);
    u_xlat4.y = u_xlat7;
    u_xlat4.z = u_xlat5.x;
    u_xlat5.y = dot(u_xlat4.zy, u_xlat1.xy);
    u_xlat5.x = dot(u_xlat4.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat3.xyz = u_xlat3.xyz * _DiffuseColor1.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5>=_BlendInten);
#else
    u_xlatb30 = 0.5>=_BlendInten;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb30)) ? u_xlat3.xyz : u_xlat2.xzw;
    u_xlat16_36 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_36);
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_8.xyz);
    u_xlat11.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat16_9.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat10.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat10.xz = max(u_xlat10.xz, vec2(0.0, 0.0));
    u_xlat30 = u_xlat10.z + _DissolveStep;
    u_xlat10.x = u_xlat10.x + _SoftSize;
    u_xlat16_36 = (-u_xlat30) + u_xlat16_0.x;
    u_xlat16_38 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat30;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36 = min(max(u_xlat16_36, 0.0), 1.0);
#else
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_36 * -2.0 + 3.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_36 = dot(u_xlat16_6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb11.x) ? vec3(u_xlat16_36) : u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat30 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat30 = (u_xlatb2.y) ? u_xlat30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat20.x = (u_xlatb1) ? 1.0 : u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat30;
    u_xlat10.x = (-u_xlat10.x) + u_xlat16_38;
    u_xlat30 = (-u_xlat10.x) + u_xlat16_38;
    u_xlat0.x = (-u_xlat10.x) + u_xlat16_0.x;
    u_xlat10.x = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat0.x * u_xlat20.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb11.y) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
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
out highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse1;
UNITY_LOCATION(4) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(5) uniform mediump sampler2D _GNTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat20;
vec2 u_xlat21;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat20.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat20.xy = u_xlat20.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat20.x = texture(_Mask, u_xlat20.xy).x;
    u_xlat1.xy = u_xlat20.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat30 = _DiffAngle2 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat2.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat21.xy;
    u_xlat16_2.xzw = texture(_Diffuse2, u_xlat21.xy).xyz;
    u_xlat2.xzw = u_xlat16_2.xzw * vec3(_DiffusePower2);
    u_xlat30 = _DiffAngle1 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat4.x = sin(u_xlat30);
    u_xlat5.x = cos(u_xlat30);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat21.xy;
    u_xlat16_3.xyz = texture(_Diffuse1, u_xlat21.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(_DiffusePower1);
    u_xlat16_6.xyz = u_xlat3.xyz * _DiffuseColor1.xyz;
    u_xlat2.xzw = u_xlat2.xzw * _DiffuseColor2.xyz + (-u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_UVSec==0.0);
#else
    u_xlatb30 = _UVSec==0.0;
#endif
    u_xlat21.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat30 = texture(_GNTex, u_xlat21.xy).x;
    u_xlat21.x = float(1.0) / u_xlat30;
    u_xlat16_36 = _BlendInten + -0.5;
    u_xlat16_36 = u_xlat16_36 + u_xlat16_36;
    u_xlat31 = u_xlat21.x * u_xlat16_36;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat33;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(u_xlat16_36>=u_xlat30);
#else
    u_xlatb33 = u_xlat16_36>=u_xlat30;
#endif
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_EdgeModel==0.0);
#else
    u_xlatb4 = _EdgeModel==0.0;
#endif
    u_xlat31 = (u_xlatb4) ? u_xlat31 : u_xlat33;
    u_xlat31 = u_xlat16_36 * u_xlat31;
    u_xlat2.xzw = vec3(u_xlat31) * u_xlat2.xzw + u_xlat16_6.xyz;
    u_xlat16_6.x = _BlendInten + _BlendInten;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16_6.x>=u_xlat30);
#else
    u_xlatb30 = u_xlat16_6.x>=u_xlat30;
#endif
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat21.x = u_xlat21.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat30 = (u_xlatb4) ? u_xlat21.x : u_xlat30;
    u_xlat30 = u_xlat16_6.x * u_xlat30;
    u_xlat16_6.x = _DiffAngle * 0.0174532924;
    u_xlat4.x = sin((-u_xlat16_6.x));
    u_xlat5.x = sin(u_xlat16_6.x);
    u_xlat7 = cos(u_xlat16_6.x);
    u_xlat4.y = u_xlat7;
    u_xlat4.z = u_xlat5.x;
    u_xlat5.y = dot(u_xlat4.zy, u_xlat1.xy);
    u_xlat5.x = dot(u_xlat4.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat3.xyz = u_xlat3.xyz * _DiffuseColor1.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5>=_BlendInten);
#else
    u_xlatb30 = 0.5>=_BlendInten;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb30)) ? u_xlat3.xyz : u_xlat2.xzw;
    u_xlat16_36 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_36);
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_8.xyz);
    u_xlat11.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat16_9.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat10.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat10.xz = max(u_xlat10.xz, vec2(0.0, 0.0));
    u_xlat30 = u_xlat10.z + _DissolveStep;
    u_xlat10.x = u_xlat10.x + _SoftSize;
    u_xlat16_36 = (-u_xlat30) + u_xlat16_0.x;
    u_xlat16_38 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat30;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36 = min(max(u_xlat16_36, 0.0), 1.0);
#else
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_36 * -2.0 + 3.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_36 = dot(u_xlat16_6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb11.x) ? vec3(u_xlat16_36) : u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat30 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat30 = (u_xlatb2.y) ? u_xlat30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat20.x = (u_xlatb1) ? 1.0 : u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat30;
    u_xlat10.x = (-u_xlat10.x) + u_xlat16_38;
    u_xlat30 = (-u_xlat10.x) + u_xlat16_38;
    u_xlat0.x = (-u_xlat10.x) + u_xlat16_0.x;
    u_xlat10.x = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat0.x * u_xlat20.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb11.y) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
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
varying highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Diffuse1;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _GNTex;
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
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat20;
vec2 u_xlat21;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat20.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat20.xy = u_xlat20.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat20.x = texture2D(_Mask, u_xlat20.xy).x;
    u_xlat1.xy = u_xlat20.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat30 = _DiffAngle2 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat2.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat21.xy;
    u_xlat10_2.xzw = texture2D(_Diffuse2, u_xlat21.xy).xyz;
    u_xlat2.xzw = u_xlat10_2.xzw * vec3(_DiffusePower2);
    u_xlat30 = _DiffAngle1 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat4.x = sin(u_xlat30);
    u_xlat5.x = cos(u_xlat30);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat21.xy;
    u_xlat10_3.xyz = texture2D(_Diffuse1, u_xlat21.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(_DiffusePower1);
    u_xlat16_6.xyz = u_xlat3.xyz * _DiffuseColor1.xyz;
    u_xlat2.xzw = u_xlat2.xzw * _DiffuseColor2.xyz + (-u_xlat16_6.xyz);
    u_xlatb30 = _UVSec==0.0;
    u_xlat21.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat30 = texture2D(_GNTex, u_xlat21.xy).x;
    u_xlat21.x = float(1.0) / u_xlat30;
    u_xlat16_36 = _BlendInten + -0.5;
    u_xlat16_36 = u_xlat16_36 + u_xlat16_36;
    u_xlat31 = u_xlat21.x * u_xlat16_36;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat33 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat33;
    u_xlatb33 = u_xlat16_36>=u_xlat30;
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
    u_xlatb4 = _EdgeModel==0.0;
    u_xlat31 = (u_xlatb4) ? u_xlat31 : u_xlat33;
    u_xlat31 = u_xlat16_36 * u_xlat31;
    u_xlat2.xzw = vec3(u_xlat31) * u_xlat2.xzw + u_xlat16_6.xyz;
    u_xlat16_6.x = _BlendInten + _BlendInten;
    u_xlatb30 = u_xlat16_6.x>=u_xlat30;
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat21.x = u_xlat21.x * u_xlat16_6.x;
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
    u_xlat31 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat30 = (u_xlatb4) ? u_xlat21.x : u_xlat30;
    u_xlat30 = u_xlat16_6.x * u_xlat30;
    u_xlat16_6.x = _DiffAngle * 0.0174532924;
    u_xlat4.x = sin((-u_xlat16_6.x));
    u_xlat5.x = sin(u_xlat16_6.x);
    u_xlat7 = cos(u_xlat16_6.x);
    u_xlat4.y = u_xlat7;
    u_xlat4.z = u_xlat5.x;
    u_xlat5.y = dot(u_xlat4.zy, u_xlat1.xy);
    u_xlat5.x = dot(u_xlat4.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat3.xyz = u_xlat3.xyz * _DiffuseColor1.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat4.xyz;
    u_xlatb30 = 0.5>=_BlendInten;
    u_xlat16_6.xyz = (bool(u_xlatb30)) ? u_xlat3.xyz : u_xlat2.xzw;
    u_xlat16_36 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_36);
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_8.xyz);
    u_xlat11.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat16_9.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat10.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat10.xz = max(u_xlat10.xz, vec2(0.0, 0.0));
    u_xlat30 = u_xlat10.z + _DissolveStep;
    u_xlat10.x = u_xlat10.x + _SoftSize;
    u_xlat16_36 = (-u_xlat30) + u_xlat10_0;
    u_xlat16_38 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat30;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_36 * -2.0 + 3.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_36 = dot(u_xlat16_6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb11.x) ? vec3(u_xlat16_36) : u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat30 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat30 = (u_xlatb2.y) ? u_xlat30 : u_xlat10_1.w;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat20.x = (u_xlatb1) ? 1.0 : u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat30;
    u_xlat10.x = (-u_xlat10.x) + u_xlat16_38;
    u_xlat30 = (-u_xlat10.x) + u_xlat16_38;
    u_xlat0.x = (-u_xlat10.x) + u_xlat10_0;
    u_xlat10.x = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat0.x * u_xlat20.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb11.y) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
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
varying highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Diffuse1;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _GNTex;
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
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat20;
vec2 u_xlat21;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat20.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat20.xy = u_xlat20.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat20.x = texture2D(_Mask, u_xlat20.xy).x;
    u_xlat1.xy = u_xlat20.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat30 = _DiffAngle2 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat2.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat21.xy;
    u_xlat10_2.xzw = texture2D(_Diffuse2, u_xlat21.xy).xyz;
    u_xlat2.xzw = u_xlat10_2.xzw * vec3(_DiffusePower2);
    u_xlat30 = _DiffAngle1 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat4.x = sin(u_xlat30);
    u_xlat5.x = cos(u_xlat30);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat21.xy;
    u_xlat10_3.xyz = texture2D(_Diffuse1, u_xlat21.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(_DiffusePower1);
    u_xlat16_6.xyz = u_xlat3.xyz * _DiffuseColor1.xyz;
    u_xlat2.xzw = u_xlat2.xzw * _DiffuseColor2.xyz + (-u_xlat16_6.xyz);
    u_xlatb30 = _UVSec==0.0;
    u_xlat21.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat30 = texture2D(_GNTex, u_xlat21.xy).x;
    u_xlat21.x = float(1.0) / u_xlat30;
    u_xlat16_36 = _BlendInten + -0.5;
    u_xlat16_36 = u_xlat16_36 + u_xlat16_36;
    u_xlat31 = u_xlat21.x * u_xlat16_36;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat33 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat33;
    u_xlatb33 = u_xlat16_36>=u_xlat30;
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
    u_xlatb4 = _EdgeModel==0.0;
    u_xlat31 = (u_xlatb4) ? u_xlat31 : u_xlat33;
    u_xlat31 = u_xlat16_36 * u_xlat31;
    u_xlat2.xzw = vec3(u_xlat31) * u_xlat2.xzw + u_xlat16_6.xyz;
    u_xlat16_6.x = _BlendInten + _BlendInten;
    u_xlatb30 = u_xlat16_6.x>=u_xlat30;
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat21.x = u_xlat21.x * u_xlat16_6.x;
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
    u_xlat31 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat30 = (u_xlatb4) ? u_xlat21.x : u_xlat30;
    u_xlat30 = u_xlat16_6.x * u_xlat30;
    u_xlat16_6.x = _DiffAngle * 0.0174532924;
    u_xlat4.x = sin((-u_xlat16_6.x));
    u_xlat5.x = sin(u_xlat16_6.x);
    u_xlat7 = cos(u_xlat16_6.x);
    u_xlat4.y = u_xlat7;
    u_xlat4.z = u_xlat5.x;
    u_xlat5.y = dot(u_xlat4.zy, u_xlat1.xy);
    u_xlat5.x = dot(u_xlat4.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat3.xyz = u_xlat3.xyz * _DiffuseColor1.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat4.xyz;
    u_xlatb30 = 0.5>=_BlendInten;
    u_xlat16_6.xyz = (bool(u_xlatb30)) ? u_xlat3.xyz : u_xlat2.xzw;
    u_xlat16_36 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_36);
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_8.xyz);
    u_xlat11.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat16_9.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat10.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat10.xz = max(u_xlat10.xz, vec2(0.0, 0.0));
    u_xlat30 = u_xlat10.z + _DissolveStep;
    u_xlat10.x = u_xlat10.x + _SoftSize;
    u_xlat16_36 = (-u_xlat30) + u_xlat10_0;
    u_xlat16_38 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat30;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_36 * -2.0 + 3.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_36 = dot(u_xlat16_6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb11.x) ? vec3(u_xlat16_36) : u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat30 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat30 = (u_xlatb2.y) ? u_xlat30 : u_xlat10_1.w;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat20.x = (u_xlatb1) ? 1.0 : u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat30;
    u_xlat10.x = (-u_xlat10.x) + u_xlat16_38;
    u_xlat30 = (-u_xlat10.x) + u_xlat16_38;
    u_xlat0.x = (-u_xlat10.x) + u_xlat10_0;
    u_xlat10.x = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat0.x * u_xlat20.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb11.y) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
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
out highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse1;
UNITY_LOCATION(4) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(5) uniform mediump sampler2D _GNTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat20;
vec2 u_xlat21;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat20.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat20.xy = u_xlat20.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat20.x = texture(_Mask, u_xlat20.xy).x;
    u_xlat1.xy = u_xlat20.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat30 = _DiffAngle2 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat2.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat21.xy;
    u_xlat16_2.xzw = texture(_Diffuse2, u_xlat21.xy).xyz;
    u_xlat2.xzw = u_xlat16_2.xzw * vec3(_DiffusePower2);
    u_xlat30 = _DiffAngle1 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat4.x = sin(u_xlat30);
    u_xlat5.x = cos(u_xlat30);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat21.xy;
    u_xlat16_3.xyz = texture(_Diffuse1, u_xlat21.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(_DiffusePower1);
    u_xlat16_6.xyz = u_xlat3.xyz * _DiffuseColor1.xyz;
    u_xlat2.xzw = u_xlat2.xzw * _DiffuseColor2.xyz + (-u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_UVSec==0.0);
#else
    u_xlatb30 = _UVSec==0.0;
#endif
    u_xlat21.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat30 = texture(_GNTex, u_xlat21.xy).x;
    u_xlat21.x = float(1.0) / u_xlat30;
    u_xlat16_36 = _BlendInten + -0.5;
    u_xlat16_36 = u_xlat16_36 + u_xlat16_36;
    u_xlat31 = u_xlat21.x * u_xlat16_36;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat33;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(u_xlat16_36>=u_xlat30);
#else
    u_xlatb33 = u_xlat16_36>=u_xlat30;
#endif
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_EdgeModel==0.0);
#else
    u_xlatb4 = _EdgeModel==0.0;
#endif
    u_xlat31 = (u_xlatb4) ? u_xlat31 : u_xlat33;
    u_xlat31 = u_xlat16_36 * u_xlat31;
    u_xlat2.xzw = vec3(u_xlat31) * u_xlat2.xzw + u_xlat16_6.xyz;
    u_xlat16_6.x = _BlendInten + _BlendInten;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16_6.x>=u_xlat30);
#else
    u_xlatb30 = u_xlat16_6.x>=u_xlat30;
#endif
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat21.x = u_xlat21.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat30 = (u_xlatb4) ? u_xlat21.x : u_xlat30;
    u_xlat30 = u_xlat16_6.x * u_xlat30;
    u_xlat16_6.x = _DiffAngle * 0.0174532924;
    u_xlat4.x = sin((-u_xlat16_6.x));
    u_xlat5.x = sin(u_xlat16_6.x);
    u_xlat7 = cos(u_xlat16_6.x);
    u_xlat4.y = u_xlat7;
    u_xlat4.z = u_xlat5.x;
    u_xlat5.y = dot(u_xlat4.zy, u_xlat1.xy);
    u_xlat5.x = dot(u_xlat4.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat3.xyz = u_xlat3.xyz * _DiffuseColor1.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5>=_BlendInten);
#else
    u_xlatb30 = 0.5>=_BlendInten;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb30)) ? u_xlat3.xyz : u_xlat2.xzw;
    u_xlat16_36 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_36);
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_8.xyz);
    u_xlat11.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat16_9.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat10.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat10.xz = max(u_xlat10.xz, vec2(0.0, 0.0));
    u_xlat30 = u_xlat10.z + _DissolveStep;
    u_xlat10.x = u_xlat10.x + _SoftSize;
    u_xlat16_36 = (-u_xlat30) + u_xlat16_0.x;
    u_xlat16_38 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat30;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36 = min(max(u_xlat16_36, 0.0), 1.0);
#else
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_36 * -2.0 + 3.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_36 = dot(u_xlat16_6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb11.x) ? vec3(u_xlat16_36) : u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat30 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat30 = (u_xlatb2.y) ? u_xlat30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat20.x = (u_xlatb1) ? 1.0 : u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat30;
    u_xlat10.x = (-u_xlat10.x) + u_xlat16_38;
    u_xlat30 = (-u_xlat10.x) + u_xlat16_38;
    u_xlat0.x = (-u_xlat10.x) + u_xlat16_0.x;
    u_xlat10.x = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat0.x * u_xlat20.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb11.y) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
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
out highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse1;
UNITY_LOCATION(4) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(5) uniform mediump sampler2D _GNTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat20;
vec2 u_xlat21;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat20.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat20.xy = u_xlat20.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat20.x = texture(_Mask, u_xlat20.xy).x;
    u_xlat1.xy = u_xlat20.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat30 = _DiffAngle2 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat2.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat21.xy;
    u_xlat16_2.xzw = texture(_Diffuse2, u_xlat21.xy).xyz;
    u_xlat2.xzw = u_xlat16_2.xzw * vec3(_DiffusePower2);
    u_xlat30 = _DiffAngle1 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat4.x = sin(u_xlat30);
    u_xlat5.x = cos(u_xlat30);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat21.xy;
    u_xlat16_3.xyz = texture(_Diffuse1, u_xlat21.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(_DiffusePower1);
    u_xlat16_6.xyz = u_xlat3.xyz * _DiffuseColor1.xyz;
    u_xlat2.xzw = u_xlat2.xzw * _DiffuseColor2.xyz + (-u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_UVSec==0.0);
#else
    u_xlatb30 = _UVSec==0.0;
#endif
    u_xlat21.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat30 = texture(_GNTex, u_xlat21.xy).x;
    u_xlat21.x = float(1.0) / u_xlat30;
    u_xlat16_36 = _BlendInten + -0.5;
    u_xlat16_36 = u_xlat16_36 + u_xlat16_36;
    u_xlat31 = u_xlat21.x * u_xlat16_36;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat33;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(u_xlat16_36>=u_xlat30);
#else
    u_xlatb33 = u_xlat16_36>=u_xlat30;
#endif
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_EdgeModel==0.0);
#else
    u_xlatb4 = _EdgeModel==0.0;
#endif
    u_xlat31 = (u_xlatb4) ? u_xlat31 : u_xlat33;
    u_xlat31 = u_xlat16_36 * u_xlat31;
    u_xlat2.xzw = vec3(u_xlat31) * u_xlat2.xzw + u_xlat16_6.xyz;
    u_xlat16_6.x = _BlendInten + _BlendInten;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16_6.x>=u_xlat30);
#else
    u_xlatb30 = u_xlat16_6.x>=u_xlat30;
#endif
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat21.x = u_xlat21.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat30 = (u_xlatb4) ? u_xlat21.x : u_xlat30;
    u_xlat30 = u_xlat16_6.x * u_xlat30;
    u_xlat16_6.x = _DiffAngle * 0.0174532924;
    u_xlat4.x = sin((-u_xlat16_6.x));
    u_xlat5.x = sin(u_xlat16_6.x);
    u_xlat7 = cos(u_xlat16_6.x);
    u_xlat4.y = u_xlat7;
    u_xlat4.z = u_xlat5.x;
    u_xlat5.y = dot(u_xlat4.zy, u_xlat1.xy);
    u_xlat5.x = dot(u_xlat4.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat3.xyz = u_xlat3.xyz * _DiffuseColor1.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5>=_BlendInten);
#else
    u_xlatb30 = 0.5>=_BlendInten;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb30)) ? u_xlat3.xyz : u_xlat2.xzw;
    u_xlat16_36 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_36);
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_8.xyz);
    u_xlat11.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat16_9.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat10.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat10.xz = max(u_xlat10.xz, vec2(0.0, 0.0));
    u_xlat30 = u_xlat10.z + _DissolveStep;
    u_xlat10.x = u_xlat10.x + _SoftSize;
    u_xlat16_36 = (-u_xlat30) + u_xlat16_0.x;
    u_xlat16_38 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat30;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36 = min(max(u_xlat16_36, 0.0), 1.0);
#else
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_36 * -2.0 + 3.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_36 = dot(u_xlat16_6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb11.x) ? vec3(u_xlat16_36) : u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat30 = u_xlat16_1.w * u_xlat16_1.x;
    u_xlat30 = (u_xlatb2.y) ? u_xlat30 : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat20.x = (u_xlatb1) ? 1.0 : u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat30;
    u_xlat10.x = (-u_xlat10.x) + u_xlat16_38;
    u_xlat30 = (-u_xlat10.x) + u_xlat16_38;
    u_xlat0.x = (-u_xlat10.x) + u_xlat16_0.x;
    u_xlat10.x = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat0.x * u_xlat20.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb11.y) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(_IsGray<1.0);
#else
    u_xlatb2.x = _IsGray<1.0;
#endif
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
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
varying highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Diffuse1;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _GNTex;
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
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat20;
vec2 u_xlat21;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat20.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat20.xy = u_xlat20.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat20.x = texture2D(_Mask, u_xlat20.xy).x;
    u_xlat1.xy = u_xlat20.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat30 = _DiffAngle2 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat2.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat21.xy;
    u_xlat10_2.xzw = texture2D(_Diffuse2, u_xlat21.xy).xyz;
    u_xlat2.xzw = u_xlat10_2.xzw * vec3(_DiffusePower2);
    u_xlat30 = _DiffAngle1 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat4.x = sin(u_xlat30);
    u_xlat5.x = cos(u_xlat30);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat21.xy;
    u_xlat10_3.xyz = texture2D(_Diffuse1, u_xlat21.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(_DiffusePower1);
    u_xlat16_6.xyz = u_xlat3.xyz * _DiffuseColor1.xyz;
    u_xlat2.xzw = u_xlat2.xzw * _DiffuseColor2.xyz + (-u_xlat16_6.xyz);
    u_xlatb30 = _UVSec==0.0;
    u_xlat21.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat30 = texture2D(_GNTex, u_xlat21.xy).x;
    u_xlat21.x = float(1.0) / u_xlat30;
    u_xlat16_36 = _BlendInten + -0.5;
    u_xlat16_36 = u_xlat16_36 + u_xlat16_36;
    u_xlat31 = u_xlat21.x * u_xlat16_36;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat33 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat33;
    u_xlatb33 = u_xlat16_36>=u_xlat30;
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
    u_xlatb4 = _EdgeModel==0.0;
    u_xlat31 = (u_xlatb4) ? u_xlat31 : u_xlat33;
    u_xlat31 = u_xlat16_36 * u_xlat31;
    u_xlat2.xzw = vec3(u_xlat31) * u_xlat2.xzw + u_xlat16_6.xyz;
    u_xlat16_6.x = _BlendInten + _BlendInten;
    u_xlatb30 = u_xlat16_6.x>=u_xlat30;
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat21.x = u_xlat21.x * u_xlat16_6.x;
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
    u_xlat31 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat30 = (u_xlatb4) ? u_xlat21.x : u_xlat30;
    u_xlat30 = u_xlat16_6.x * u_xlat30;
    u_xlat16_6.x = _DiffAngle * 0.0174532924;
    u_xlat4.x = sin((-u_xlat16_6.x));
    u_xlat5.x = sin(u_xlat16_6.x);
    u_xlat7 = cos(u_xlat16_6.x);
    u_xlat4.y = u_xlat7;
    u_xlat4.z = u_xlat5.x;
    u_xlat5.y = dot(u_xlat4.zy, u_xlat1.xy);
    u_xlat5.x = dot(u_xlat4.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat3.xyz = u_xlat3.xyz * _DiffuseColor1.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat4.xyz;
    u_xlatb30 = 0.5>=_BlendInten;
    u_xlat16_6.xyz = (bool(u_xlatb30)) ? u_xlat3.xyz : u_xlat2.xzw;
    u_xlat16_36 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_36);
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_8.xyz);
    u_xlat11.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat16_9.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat10.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat10.xz = max(u_xlat10.xz, vec2(0.0, 0.0));
    u_xlat30 = u_xlat10.z + _DissolveStep;
    u_xlat10.x = u_xlat10.x + _SoftSize;
    u_xlat16_36 = (-u_xlat30) + u_xlat10_0;
    u_xlat16_38 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat30;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_36 * -2.0 + 3.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_36 = dot(u_xlat16_6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb11.x) ? vec3(u_xlat16_36) : u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat30 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat30 = (u_xlatb2.y) ? u_xlat30 : u_xlat10_1.w;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat20.x = (u_xlatb1) ? 1.0 : u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat30;
    u_xlat10.x = (-u_xlat10.x) + u_xlat16_38;
    u_xlat30 = (-u_xlat10.x) + u_xlat16_38;
    u_xlat0.x = (-u_xlat10.x) + u_xlat10_0;
    u_xlat10.x = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat0.x * u_xlat20.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb11.y) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
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
varying highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Diffuse1;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _GNTex;
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
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
bool u_xlatb4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat11;
bvec2 u_xlatb11;
vec2 u_xlat20;
vec2 u_xlat21;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
float u_xlat33;
bool u_xlatb33;
mediump float u_xlat16_36;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat1 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat20.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat1.xy;
    u_xlat20.xy = u_xlat20.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat20.x = texture2D(_Mask, u_xlat20.xy).x;
    u_xlat1.xy = u_xlat20.xx * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlatb2.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _EffectByMask)).xy;
    u_xlat0.xy = (u_xlatb2.x) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat1.xy = u_xlat0.xy + u_xlat1.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat30 = _DiffAngle2 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat2.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat3.y = u_xlat4.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat21.xy;
    u_xlat10_2.xzw = texture2D(_Diffuse2, u_xlat21.xy).xyz;
    u_xlat2.xzw = u_xlat10_2.xzw * vec3(_DiffusePower2);
    u_xlat30 = _DiffAngle1 * 0.0174532924;
    u_xlat3.x = sin((-u_xlat30));
    u_xlat4.x = sin(u_xlat30);
    u_xlat5.x = cos(u_xlat30);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat21.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat21.xy = u_xlat21.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat21.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat21.xy;
    u_xlat10_3.xyz = texture2D(_Diffuse1, u_xlat21.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(_DiffusePower1);
    u_xlat16_6.xyz = u_xlat3.xyz * _DiffuseColor1.xyz;
    u_xlat2.xzw = u_xlat2.xzw * _DiffuseColor2.xyz + (-u_xlat16_6.xyz);
    u_xlatb30 = _UVSec==0.0;
    u_xlat21.xy = (bool(u_xlatb30)) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat30 = texture2D(_GNTex, u_xlat21.xy).x;
    u_xlat21.x = float(1.0) / u_xlat30;
    u_xlat16_36 = _BlendInten + -0.5;
    u_xlat16_36 = u_xlat16_36 + u_xlat16_36;
    u_xlat31 = u_xlat21.x * u_xlat16_36;
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
    u_xlat33 = u_xlat31 * -2.0 + 3.0;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat33;
    u_xlatb33 = u_xlat16_36>=u_xlat30;
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
    u_xlatb4 = _EdgeModel==0.0;
    u_xlat31 = (u_xlatb4) ? u_xlat31 : u_xlat33;
    u_xlat31 = u_xlat16_36 * u_xlat31;
    u_xlat2.xzw = vec3(u_xlat31) * u_xlat2.xzw + u_xlat16_6.xyz;
    u_xlat16_6.x = _BlendInten + _BlendInten;
    u_xlatb30 = u_xlat16_6.x>=u_xlat30;
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat21.x = u_xlat21.x * u_xlat16_6.x;
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
    u_xlat31 = u_xlat21.x * -2.0 + 3.0;
    u_xlat21.x = u_xlat21.x * u_xlat21.x;
    u_xlat21.x = u_xlat21.x * u_xlat31;
    u_xlat30 = (u_xlatb4) ? u_xlat21.x : u_xlat30;
    u_xlat30 = u_xlat16_6.x * u_xlat30;
    u_xlat16_6.x = _DiffAngle * 0.0174532924;
    u_xlat4.x = sin((-u_xlat16_6.x));
    u_xlat5.x = sin(u_xlat16_6.x);
    u_xlat7 = cos(u_xlat16_6.x);
    u_xlat4.y = u_xlat7;
    u_xlat4.z = u_xlat5.x;
    u_xlat5.y = dot(u_xlat4.zy, u_xlat1.xy);
    u_xlat5.x = dot(u_xlat4.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat3.xyz = u_xlat3.xyz * _DiffuseColor1.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz + u_xlat4.xyz;
    u_xlatb30 = 0.5>=_BlendInten;
    u_xlat16_6.xyz = (bool(u_xlatb30)) ? u_xlat3.xyz : u_xlat2.xzw;
    u_xlat16_36 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_36);
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_8.xyz);
    u_xlat11.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat16_9.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat10.xz = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat10.xz = max(u_xlat10.xz, vec2(0.0, 0.0));
    u_xlat30 = u_xlat10.z + _DissolveStep;
    u_xlat10.x = u_xlat10.x + _SoftSize;
    u_xlat16_36 = (-u_xlat30) + u_xlat10_0;
    u_xlat16_38 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat30;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_36 = clamp(u_xlat16_36, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_36 * -2.0 + 3.0;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_36;
    u_xlat16_36 = u_xlat16_36 * u_xlat16_9.x;
    u_xlat16_6.xyz = vec3(u_xlat16_36) * u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_36 = dot(u_xlat16_6.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_6.xyz = (u_xlatb11.x) ? vec3(u_xlat16_36) : u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat30 = u_xlat10_1.w * u_xlat10_1.x;
    u_xlat30 = (u_xlatb2.y) ? u_xlat30 : u_xlat10_1.w;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat20.x = (u_xlatb1) ? 1.0 : u_xlat20.x;
    u_xlat20.x = u_xlat20.x * u_xlat30;
    u_xlat10.x = (-u_xlat10.x) + u_xlat16_38;
    u_xlat30 = (-u_xlat10.x) + u_xlat16_38;
    u_xlat0.x = (-u_xlat10.x) + u_xlat10_0;
    u_xlat10.x = float(1.0) / u_xlat30;
    u_xlat0.x = u_xlat10.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat0.x = u_xlat0.x * u_xlat20.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat16_0.w = u_xlat0.x * _TransparentStrong;
    u_xlat16_0.xyz = (u_xlatb11.y) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_6.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_1.w = u_xlat16_0.w * vs_COLOR0.w;
    u_xlatb2.x = _IsGray<1.0;
    u_xlat16_0 = (u_xlatb2.x) ? u_xlat16_1 : u_xlat16_0;
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
out highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse1;
UNITY_LOCATION(4) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(5) uniform mediump sampler2D _GNTex;
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
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
mediump float u_xlat16_11;
bvec2 u_xlatb11;
float u_xlat12;
vec3 u_xlat13;
float u_xlat22;
bool u_xlatb22;
vec2 u_xlat23;
bvec2 u_xlatb23;
float u_xlat26;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_11 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_11) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb23.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb23.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat11.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin(u_xlat16_3.x);
    u_xlat4.x = cos(u_xlat16_3.x);
    u_xlat5.x = sin((-u_xlat16_3.x));
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat5.y = u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.yx, u_xlat11.xy);
    u_xlat5.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat5.zy, u_xlat11.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat2.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat13.xy);
    u_xlat33 = u_xlat16_3.w * u_xlat16_3.x;
    u_xlat33 = (u_xlatb23.y) ? u_xlat33 : u_xlat16_3.w;
    u_xlat13.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat23.x = _DiffAngle1 * 0.0174532924;
    u_xlat4.x = sin(u_xlat23.x);
    u_xlat5.x = cos(u_xlat23.x);
    u_xlat6.x = sin((-u_xlat23.x));
    u_xlat6.y = u_xlat5.x;
    u_xlat5.x = dot(u_xlat6.yx, u_xlat11.xy);
    u_xlat6.z = u_xlat4.x;
    u_xlat5.y = dot(u_xlat6.zy, u_xlat11.xy);
    u_xlat23.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat23.xy = u_xlat23.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat23.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat23.xy;
    u_xlat16_4.xyz = texture(_Diffuse1, u_xlat23.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_DiffusePower1);
    u_xlat16_7.xyz = u_xlat4.xyz * _DiffuseColor1.xyz;
    u_xlat23.x = _DiffAngle2 * 0.0174532924;
    u_xlat5.x = sin(u_xlat23.x);
    u_xlat6.x = cos(u_xlat23.x);
    u_xlat8.x = sin((-u_xlat23.x));
    u_xlat8.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat8.yx, u_xlat11.xy);
    u_xlat8.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat8.zy, u_xlat11.xy);
    u_xlat11.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat11.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat11.xy;
    u_xlat16_5.xyz = texture(_Diffuse2, u_xlat11.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_DiffusePower2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(_UVSec==0.0);
#else
    u_xlatb11.x = _UVSec==0.0;
#endif
    u_xlat11.xy = (u_xlatb11.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat11.x = texture(_GNTex, u_xlat11.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.5>=_BlendInten);
#else
    u_xlatb22 = 0.5>=_BlendInten;
#endif
    u_xlat16_40 = _BlendInten + _BlendInten;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23.x = !!(_EdgeModel==0.0);
#else
    u_xlatb23.x = _EdgeModel==0.0;
#endif
    u_xlat34 = float(1.0) / u_xlat11.x;
    u_xlat37 = u_xlat34 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(u_xlat16_40>=u_xlat11.x);
#else
    u_xlatb38 = u_xlat16_40>=u_xlat11.x;
#endif
    u_xlat38 = u_xlatb38 ? 1.0 : float(0.0);
    u_xlat37 = (u_xlatb23.x) ? u_xlat37 : u_xlat38;
    u_xlat37 = u_xlat16_40 * u_xlat37;
    u_xlat4.xyz = u_xlat4.xyz * _DiffuseColor1.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat13.xyz;
    u_xlat16_40 = _BlendInten + -0.5;
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat34 = u_xlat34 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(u_xlat16_40>=u_xlat11.x);
#else
    u_xlatb11.x = u_xlat16_40>=u_xlat11.x;
#endif
    u_xlat11.x = u_xlatb11.x ? 1.0 : float(0.0);
    u_xlat11.x = (u_xlatb23.x) ? u_xlat34 : u_xlat11.x;
    u_xlat11.x = u_xlat16_40 * u_xlat11.x;
    u_xlat4.xyz = u_xlat5.xyz * _DiffuseColor2.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb22)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat23.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat23.xy;
    u_xlat16_9.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = u_xlat11.x + _SoftSize;
    u_xlat22 = u_xlat11.y + _DissolveStep;
    u_xlat16_40 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat22;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_40;
    u_xlat12 = (-u_xlat11.x) + u_xlat16_40;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_1.x;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat16_40 = (-u_xlat22) + u_xlat16_1.x;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_42 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(u_xlat16_42);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_9.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_40) * u_xlat16_7.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb22) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat33;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_40 = dot(u_xlat16_7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_7.xyz = (u_xlatb11.x) ? vec3(u_xlat16_40) : u_xlat16_7.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat16_1.xyz = (u_xlatb11.y) ? u_xlat16_9.xyz : u_xlat16_7.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
#endif
    u_xlat0.x = (u_xlatb0) ? u_xlat2.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(_MidPosLeft>=u_xlat0.x);
#else
    u_xlatb11.x = _MidPosLeft>=u_xlat0.x;
#endif
    if(u_xlatb11.x){
        u_xlatb11.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat11.x = (u_xlatb11.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat11.x = u_xlat0.x / u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(0.0<_MidPosLeftSharp);
#else
        u_xlatb33 = 0.0<_MidPosLeftSharp;
#endif
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat13.x = log2(u_xlat11.x);
        u_xlat2.x = u_xlat13.x * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat22 = (u_xlatb11.y) ? 0.0 : u_xlat2.x;
        u_xlat11.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat11.xxxx * u_xlat2 + _LeftColor;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb11.x = !!(_MidPosLeft<u_xlat0.x);
#else
        u_xlatb11.x = _MidPosLeft<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.x<_MidPosRight);
#else
        u_xlatb22 = u_xlat0.x<_MidPosRight;
#endif
        u_xlatb11.x = u_xlatb22 && u_xlatb11.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.x>=_MidPosRight);
#else
        u_xlatb22 = u_xlat0.x>=_MidPosRight;
#endif
        u_xlatb4.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat33 = (-_MidPosRight) + 1.0;
        u_xlat33 = (u_xlatb4.x) ? 0.000100016594 : u_xlat33;
        u_xlat0.x = u_xlat0.x / u_xlat33;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(0.0<_MidPosRightSharp);
#else
        u_xlatb33 = 0.0<_MidPosRightSharp;
#endif
        u_xlat4.x = _MidPosRightSharp * 50.0;
        u_xlat26 = log2(u_xlat0.x);
        u_xlat4.x = u_xlat26 * u_xlat4.x;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = (u_xlatb4.y) ? 0.0 : u_xlat4.x;
        u_xlat0.x = (u_xlatb33) ? u_xlat4.x : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb22) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb11.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_7.xyz;
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
out highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse1;
UNITY_LOCATION(4) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(5) uniform mediump sampler2D _GNTex;
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
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
mediump float u_xlat16_11;
bvec2 u_xlatb11;
float u_xlat12;
vec3 u_xlat13;
float u_xlat22;
bool u_xlatb22;
vec2 u_xlat23;
bvec2 u_xlatb23;
float u_xlat26;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_11 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_11) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb23.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb23.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat11.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin(u_xlat16_3.x);
    u_xlat4.x = cos(u_xlat16_3.x);
    u_xlat5.x = sin((-u_xlat16_3.x));
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat5.y = u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.yx, u_xlat11.xy);
    u_xlat5.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat5.zy, u_xlat11.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat2.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat13.xy);
    u_xlat33 = u_xlat16_3.w * u_xlat16_3.x;
    u_xlat33 = (u_xlatb23.y) ? u_xlat33 : u_xlat16_3.w;
    u_xlat13.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat23.x = _DiffAngle1 * 0.0174532924;
    u_xlat4.x = sin(u_xlat23.x);
    u_xlat5.x = cos(u_xlat23.x);
    u_xlat6.x = sin((-u_xlat23.x));
    u_xlat6.y = u_xlat5.x;
    u_xlat5.x = dot(u_xlat6.yx, u_xlat11.xy);
    u_xlat6.z = u_xlat4.x;
    u_xlat5.y = dot(u_xlat6.zy, u_xlat11.xy);
    u_xlat23.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat23.xy = u_xlat23.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat23.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat23.xy;
    u_xlat16_4.xyz = texture(_Diffuse1, u_xlat23.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_DiffusePower1);
    u_xlat16_7.xyz = u_xlat4.xyz * _DiffuseColor1.xyz;
    u_xlat23.x = _DiffAngle2 * 0.0174532924;
    u_xlat5.x = sin(u_xlat23.x);
    u_xlat6.x = cos(u_xlat23.x);
    u_xlat8.x = sin((-u_xlat23.x));
    u_xlat8.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat8.yx, u_xlat11.xy);
    u_xlat8.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat8.zy, u_xlat11.xy);
    u_xlat11.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat11.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat11.xy;
    u_xlat16_5.xyz = texture(_Diffuse2, u_xlat11.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_DiffusePower2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(_UVSec==0.0);
#else
    u_xlatb11.x = _UVSec==0.0;
#endif
    u_xlat11.xy = (u_xlatb11.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat11.x = texture(_GNTex, u_xlat11.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.5>=_BlendInten);
#else
    u_xlatb22 = 0.5>=_BlendInten;
#endif
    u_xlat16_40 = _BlendInten + _BlendInten;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23.x = !!(_EdgeModel==0.0);
#else
    u_xlatb23.x = _EdgeModel==0.0;
#endif
    u_xlat34 = float(1.0) / u_xlat11.x;
    u_xlat37 = u_xlat34 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(u_xlat16_40>=u_xlat11.x);
#else
    u_xlatb38 = u_xlat16_40>=u_xlat11.x;
#endif
    u_xlat38 = u_xlatb38 ? 1.0 : float(0.0);
    u_xlat37 = (u_xlatb23.x) ? u_xlat37 : u_xlat38;
    u_xlat37 = u_xlat16_40 * u_xlat37;
    u_xlat4.xyz = u_xlat4.xyz * _DiffuseColor1.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat13.xyz;
    u_xlat16_40 = _BlendInten + -0.5;
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat34 = u_xlat34 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(u_xlat16_40>=u_xlat11.x);
#else
    u_xlatb11.x = u_xlat16_40>=u_xlat11.x;
#endif
    u_xlat11.x = u_xlatb11.x ? 1.0 : float(0.0);
    u_xlat11.x = (u_xlatb23.x) ? u_xlat34 : u_xlat11.x;
    u_xlat11.x = u_xlat16_40 * u_xlat11.x;
    u_xlat4.xyz = u_xlat5.xyz * _DiffuseColor2.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb22)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat23.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat23.xy;
    u_xlat16_9.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = u_xlat11.x + _SoftSize;
    u_xlat22 = u_xlat11.y + _DissolveStep;
    u_xlat16_40 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat22;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_40;
    u_xlat12 = (-u_xlat11.x) + u_xlat16_40;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_1.x;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat16_40 = (-u_xlat22) + u_xlat16_1.x;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_42 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(u_xlat16_42);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_9.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_40) * u_xlat16_7.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb22) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat33;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_40 = dot(u_xlat16_7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_7.xyz = (u_xlatb11.x) ? vec3(u_xlat16_40) : u_xlat16_7.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat16_1.xyz = (u_xlatb11.y) ? u_xlat16_9.xyz : u_xlat16_7.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
#endif
    u_xlat0.x = (u_xlatb0) ? u_xlat2.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(_MidPosLeft>=u_xlat0.x);
#else
    u_xlatb11.x = _MidPosLeft>=u_xlat0.x;
#endif
    if(u_xlatb11.x){
        u_xlatb11.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat11.x = (u_xlatb11.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat11.x = u_xlat0.x / u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(0.0<_MidPosLeftSharp);
#else
        u_xlatb33 = 0.0<_MidPosLeftSharp;
#endif
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat13.x = log2(u_xlat11.x);
        u_xlat2.x = u_xlat13.x * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat22 = (u_xlatb11.y) ? 0.0 : u_xlat2.x;
        u_xlat11.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat11.xxxx * u_xlat2 + _LeftColor;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb11.x = !!(_MidPosLeft<u_xlat0.x);
#else
        u_xlatb11.x = _MidPosLeft<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.x<_MidPosRight);
#else
        u_xlatb22 = u_xlat0.x<_MidPosRight;
#endif
        u_xlatb11.x = u_xlatb22 && u_xlatb11.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.x>=_MidPosRight);
#else
        u_xlatb22 = u_xlat0.x>=_MidPosRight;
#endif
        u_xlatb4.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat33 = (-_MidPosRight) + 1.0;
        u_xlat33 = (u_xlatb4.x) ? 0.000100016594 : u_xlat33;
        u_xlat0.x = u_xlat0.x / u_xlat33;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(0.0<_MidPosRightSharp);
#else
        u_xlatb33 = 0.0<_MidPosRightSharp;
#endif
        u_xlat4.x = _MidPosRightSharp * 50.0;
        u_xlat26 = log2(u_xlat0.x);
        u_xlat4.x = u_xlat26 * u_xlat4.x;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = (u_xlatb4.y) ? 0.0 : u_xlat4.x;
        u_xlat0.x = (u_xlatb33) ? u_xlat4.x : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb22) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb11.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_7.xyz;
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
varying highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Diffuse1;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _GNTex;
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
lowp float u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
lowp float u_xlat10_11;
bvec2 u_xlatb11;
float u_xlat12;
vec3 u_xlat13;
float u_xlat22;
bool u_xlatb22;
vec2 u_xlat23;
bvec2 u_xlatb23;
float u_xlat26;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_11 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_11) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb23.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb23.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat11.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin(u_xlat16_3);
    u_xlat4.x = cos(u_xlat16_3);
    u_xlat5.x = sin((-u_xlat16_3));
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat5.y = u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.yx, u_xlat11.xy);
    u_xlat5.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat5.zy, u_xlat11.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat2.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat13.xy);
    u_xlat33 = u_xlat10_3.w * u_xlat10_3.x;
    u_xlat33 = (u_xlatb23.y) ? u_xlat33 : u_xlat10_3.w;
    u_xlat13.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat23.x = _DiffAngle1 * 0.0174532924;
    u_xlat4.x = sin(u_xlat23.x);
    u_xlat5.x = cos(u_xlat23.x);
    u_xlat6.x = sin((-u_xlat23.x));
    u_xlat6.y = u_xlat5.x;
    u_xlat5.x = dot(u_xlat6.yx, u_xlat11.xy);
    u_xlat6.z = u_xlat4.x;
    u_xlat5.y = dot(u_xlat6.zy, u_xlat11.xy);
    u_xlat23.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat23.xy = u_xlat23.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat23.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat23.xy;
    u_xlat10_4.xyz = texture2D(_Diffuse1, u_xlat23.xy).xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_DiffusePower1);
    u_xlat16_7.xyz = u_xlat4.xyz * _DiffuseColor1.xyz;
    u_xlat23.x = _DiffAngle2 * 0.0174532924;
    u_xlat5.x = sin(u_xlat23.x);
    u_xlat6.x = cos(u_xlat23.x);
    u_xlat8.x = sin((-u_xlat23.x));
    u_xlat8.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat8.yx, u_xlat11.xy);
    u_xlat8.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat8.zy, u_xlat11.xy);
    u_xlat11.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat11.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat11.xy;
    u_xlat10_5.xyz = texture2D(_Diffuse2, u_xlat11.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_DiffusePower2);
    u_xlatb11.x = _UVSec==0.0;
    u_xlat11.xy = (u_xlatb11.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat11.x = texture2D(_GNTex, u_xlat11.xy).x;
    u_xlatb22 = 0.5>=_BlendInten;
    u_xlat16_40 = _BlendInten + _BlendInten;
    u_xlatb23.x = _EdgeModel==0.0;
    u_xlat34 = float(1.0) / u_xlat11.x;
    u_xlat37 = u_xlat34 * u_xlat16_40;
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlatb38 = u_xlat16_40>=u_xlat11.x;
    u_xlat38 = u_xlatb38 ? 1.0 : float(0.0);
    u_xlat37 = (u_xlatb23.x) ? u_xlat37 : u_xlat38;
    u_xlat37 = u_xlat16_40 * u_xlat37;
    u_xlat4.xyz = u_xlat4.xyz * _DiffuseColor1.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat13.xyz;
    u_xlat16_40 = _BlendInten + -0.5;
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat34 = u_xlat34 * u_xlat16_40;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat4.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat4.x;
    u_xlatb11.x = u_xlat16_40>=u_xlat11.x;
    u_xlat11.x = u_xlatb11.x ? 1.0 : float(0.0);
    u_xlat11.x = (u_xlatb23.x) ? u_xlat34 : u_xlat11.x;
    u_xlat11.x = u_xlat16_40 * u_xlat11.x;
    u_xlat4.xyz = u_xlat5.xyz * _DiffuseColor2.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb22)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat23.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat23.xy;
    u_xlat16_9.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_1 = texture2D(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = u_xlat11.x + _SoftSize;
    u_xlat22 = u_xlat11.y + _DissolveStep;
    u_xlat16_40 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat22;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_40;
    u_xlat12 = (-u_xlat11.x) + u_xlat16_40;
    u_xlat11.x = (-u_xlat11.x) + u_xlat10_1;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat12 = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat16_40 = (-u_xlat22) + u_xlat10_1;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_42 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(u_xlat16_42);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_9.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_40) * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb22) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat33;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_40 = dot(u_xlat16_7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_7.xyz = (u_xlatb11.x) ? vec3(u_xlat16_40) : u_xlat16_7.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat16_1.xyz = (u_xlatb11.y) ? u_xlat16_9.xyz : u_xlat16_7.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
    u_xlat0.x = (u_xlatb0) ? u_xlat2.x : vs_TEXCOORD0.x;
    u_xlatb11.x = _MidPosLeft>=u_xlat0.x;
    if(u_xlatb11.x){
        u_xlatb11.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat11.x = (u_xlatb11.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat11.x = u_xlat0.x / u_xlat11.x;
        u_xlatb33 = 0.0<_MidPosLeftSharp;
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat13.x = log2(u_xlat11.x);
        u_xlat2.x = u_xlat13.x * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat22 = (u_xlatb11.y) ? 0.0 : u_xlat2.x;
        u_xlat11.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat11.xxxx * u_xlat2 + _LeftColor;
    } else {
        u_xlatb11.x = _MidPosLeft<u_xlat0.x;
        u_xlatb22 = u_xlat0.x<_MidPosRight;
        u_xlatb11.x = u_xlatb22 && u_xlatb11.x;
        u_xlatb22 = u_xlat0.x>=_MidPosRight;
        u_xlatb4.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat33 = (-_MidPosRight) + 1.0;
        u_xlat33 = (u_xlatb4.x) ? 0.000100016594 : u_xlat33;
        u_xlat0.x = u_xlat0.x / u_xlat33;
        u_xlatb33 = 0.0<_MidPosRightSharp;
        u_xlat4.x = _MidPosRightSharp * 50.0;
        u_xlat26 = log2(u_xlat0.x);
        u_xlat4.x = u_xlat26 * u_xlat4.x;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = (u_xlatb4.y) ? 0.0 : u_xlat4.x;
        u_xlat0.x = (u_xlatb33) ? u_xlat4.x : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb22) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb11.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_7.xyz;
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
varying highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Diffuse1;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _GNTex;
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
lowp float u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
lowp float u_xlat10_11;
bvec2 u_xlatb11;
float u_xlat12;
vec3 u_xlat13;
float u_xlat22;
bool u_xlatb22;
vec2 u_xlat23;
bvec2 u_xlatb23;
float u_xlat26;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_11 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_11) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb23.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb23.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat11.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin(u_xlat16_3);
    u_xlat4.x = cos(u_xlat16_3);
    u_xlat5.x = sin((-u_xlat16_3));
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat5.y = u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.yx, u_xlat11.xy);
    u_xlat5.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat5.zy, u_xlat11.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat2.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat13.xy);
    u_xlat33 = u_xlat10_3.w * u_xlat10_3.x;
    u_xlat33 = (u_xlatb23.y) ? u_xlat33 : u_xlat10_3.w;
    u_xlat13.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat23.x = _DiffAngle1 * 0.0174532924;
    u_xlat4.x = sin(u_xlat23.x);
    u_xlat5.x = cos(u_xlat23.x);
    u_xlat6.x = sin((-u_xlat23.x));
    u_xlat6.y = u_xlat5.x;
    u_xlat5.x = dot(u_xlat6.yx, u_xlat11.xy);
    u_xlat6.z = u_xlat4.x;
    u_xlat5.y = dot(u_xlat6.zy, u_xlat11.xy);
    u_xlat23.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat23.xy = u_xlat23.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat23.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat23.xy;
    u_xlat10_4.xyz = texture2D(_Diffuse1, u_xlat23.xy).xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_DiffusePower1);
    u_xlat16_7.xyz = u_xlat4.xyz * _DiffuseColor1.xyz;
    u_xlat23.x = _DiffAngle2 * 0.0174532924;
    u_xlat5.x = sin(u_xlat23.x);
    u_xlat6.x = cos(u_xlat23.x);
    u_xlat8.x = sin((-u_xlat23.x));
    u_xlat8.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat8.yx, u_xlat11.xy);
    u_xlat8.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat8.zy, u_xlat11.xy);
    u_xlat11.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat11.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat11.xy;
    u_xlat10_5.xyz = texture2D(_Diffuse2, u_xlat11.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_DiffusePower2);
    u_xlatb11.x = _UVSec==0.0;
    u_xlat11.xy = (u_xlatb11.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat11.x = texture2D(_GNTex, u_xlat11.xy).x;
    u_xlatb22 = 0.5>=_BlendInten;
    u_xlat16_40 = _BlendInten + _BlendInten;
    u_xlatb23.x = _EdgeModel==0.0;
    u_xlat34 = float(1.0) / u_xlat11.x;
    u_xlat37 = u_xlat34 * u_xlat16_40;
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlatb38 = u_xlat16_40>=u_xlat11.x;
    u_xlat38 = u_xlatb38 ? 1.0 : float(0.0);
    u_xlat37 = (u_xlatb23.x) ? u_xlat37 : u_xlat38;
    u_xlat37 = u_xlat16_40 * u_xlat37;
    u_xlat4.xyz = u_xlat4.xyz * _DiffuseColor1.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat13.xyz;
    u_xlat16_40 = _BlendInten + -0.5;
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat34 = u_xlat34 * u_xlat16_40;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat4.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat4.x;
    u_xlatb11.x = u_xlat16_40>=u_xlat11.x;
    u_xlat11.x = u_xlatb11.x ? 1.0 : float(0.0);
    u_xlat11.x = (u_xlatb23.x) ? u_xlat34 : u_xlat11.x;
    u_xlat11.x = u_xlat16_40 * u_xlat11.x;
    u_xlat4.xyz = u_xlat5.xyz * _DiffuseColor2.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb22)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat23.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat23.xy;
    u_xlat16_9.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_1 = texture2D(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = u_xlat11.x + _SoftSize;
    u_xlat22 = u_xlat11.y + _DissolveStep;
    u_xlat16_40 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat22;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_40;
    u_xlat12 = (-u_xlat11.x) + u_xlat16_40;
    u_xlat11.x = (-u_xlat11.x) + u_xlat10_1;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat12 = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat16_40 = (-u_xlat22) + u_xlat10_1;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_42 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(u_xlat16_42);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_9.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_40) * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb22) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat33;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_40 = dot(u_xlat16_7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_7.xyz = (u_xlatb11.x) ? vec3(u_xlat16_40) : u_xlat16_7.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat16_1.xyz = (u_xlatb11.y) ? u_xlat16_9.xyz : u_xlat16_7.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
    u_xlat0.x = (u_xlatb0) ? u_xlat2.x : vs_TEXCOORD0.x;
    u_xlatb11.x = _MidPosLeft>=u_xlat0.x;
    if(u_xlatb11.x){
        u_xlatb11.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat11.x = (u_xlatb11.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat11.x = u_xlat0.x / u_xlat11.x;
        u_xlatb33 = 0.0<_MidPosLeftSharp;
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat13.x = log2(u_xlat11.x);
        u_xlat2.x = u_xlat13.x * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat22 = (u_xlatb11.y) ? 0.0 : u_xlat2.x;
        u_xlat11.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat11.xxxx * u_xlat2 + _LeftColor;
    } else {
        u_xlatb11.x = _MidPosLeft<u_xlat0.x;
        u_xlatb22 = u_xlat0.x<_MidPosRight;
        u_xlatb11.x = u_xlatb22 && u_xlatb11.x;
        u_xlatb22 = u_xlat0.x>=_MidPosRight;
        u_xlatb4.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat33 = (-_MidPosRight) + 1.0;
        u_xlat33 = (u_xlatb4.x) ? 0.000100016594 : u_xlat33;
        u_xlat0.x = u_xlat0.x / u_xlat33;
        u_xlatb33 = 0.0<_MidPosRightSharp;
        u_xlat4.x = _MidPosRightSharp * 50.0;
        u_xlat26 = log2(u_xlat0.x);
        u_xlat4.x = u_xlat26 * u_xlat4.x;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = (u_xlatb4.y) ? 0.0 : u_xlat4.x;
        u_xlat0.x = (u_xlatb33) ? u_xlat4.x : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb22) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb11.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_7.xyz;
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
out highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse1;
UNITY_LOCATION(4) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(5) uniform mediump sampler2D _GNTex;
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
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
mediump float u_xlat16_11;
bvec2 u_xlatb11;
float u_xlat12;
vec3 u_xlat13;
float u_xlat22;
bool u_xlatb22;
vec2 u_xlat23;
bvec2 u_xlatb23;
float u_xlat26;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_11 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_11) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb23.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb23.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat11.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin(u_xlat16_3.x);
    u_xlat4.x = cos(u_xlat16_3.x);
    u_xlat5.x = sin((-u_xlat16_3.x));
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat5.y = u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.yx, u_xlat11.xy);
    u_xlat5.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat5.zy, u_xlat11.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat2.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat13.xy);
    u_xlat33 = u_xlat16_3.w * u_xlat16_3.x;
    u_xlat33 = (u_xlatb23.y) ? u_xlat33 : u_xlat16_3.w;
    u_xlat13.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat23.x = _DiffAngle1 * 0.0174532924;
    u_xlat4.x = sin(u_xlat23.x);
    u_xlat5.x = cos(u_xlat23.x);
    u_xlat6.x = sin((-u_xlat23.x));
    u_xlat6.y = u_xlat5.x;
    u_xlat5.x = dot(u_xlat6.yx, u_xlat11.xy);
    u_xlat6.z = u_xlat4.x;
    u_xlat5.y = dot(u_xlat6.zy, u_xlat11.xy);
    u_xlat23.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat23.xy = u_xlat23.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat23.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat23.xy;
    u_xlat16_4.xyz = texture(_Diffuse1, u_xlat23.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_DiffusePower1);
    u_xlat16_7.xyz = u_xlat4.xyz * _DiffuseColor1.xyz;
    u_xlat23.x = _DiffAngle2 * 0.0174532924;
    u_xlat5.x = sin(u_xlat23.x);
    u_xlat6.x = cos(u_xlat23.x);
    u_xlat8.x = sin((-u_xlat23.x));
    u_xlat8.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat8.yx, u_xlat11.xy);
    u_xlat8.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat8.zy, u_xlat11.xy);
    u_xlat11.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat11.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat11.xy;
    u_xlat16_5.xyz = texture(_Diffuse2, u_xlat11.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_DiffusePower2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(_UVSec==0.0);
#else
    u_xlatb11.x = _UVSec==0.0;
#endif
    u_xlat11.xy = (u_xlatb11.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat11.x = texture(_GNTex, u_xlat11.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.5>=_BlendInten);
#else
    u_xlatb22 = 0.5>=_BlendInten;
#endif
    u_xlat16_40 = _BlendInten + _BlendInten;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23.x = !!(_EdgeModel==0.0);
#else
    u_xlatb23.x = _EdgeModel==0.0;
#endif
    u_xlat34 = float(1.0) / u_xlat11.x;
    u_xlat37 = u_xlat34 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(u_xlat16_40>=u_xlat11.x);
#else
    u_xlatb38 = u_xlat16_40>=u_xlat11.x;
#endif
    u_xlat38 = u_xlatb38 ? 1.0 : float(0.0);
    u_xlat37 = (u_xlatb23.x) ? u_xlat37 : u_xlat38;
    u_xlat37 = u_xlat16_40 * u_xlat37;
    u_xlat4.xyz = u_xlat4.xyz * _DiffuseColor1.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat13.xyz;
    u_xlat16_40 = _BlendInten + -0.5;
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat34 = u_xlat34 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(u_xlat16_40>=u_xlat11.x);
#else
    u_xlatb11.x = u_xlat16_40>=u_xlat11.x;
#endif
    u_xlat11.x = u_xlatb11.x ? 1.0 : float(0.0);
    u_xlat11.x = (u_xlatb23.x) ? u_xlat34 : u_xlat11.x;
    u_xlat11.x = u_xlat16_40 * u_xlat11.x;
    u_xlat4.xyz = u_xlat5.xyz * _DiffuseColor2.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb22)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat23.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat23.xy;
    u_xlat16_9.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = u_xlat11.x + _SoftSize;
    u_xlat22 = u_xlat11.y + _DissolveStep;
    u_xlat16_40 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat22;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_40;
    u_xlat12 = (-u_xlat11.x) + u_xlat16_40;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_1.x;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat16_40 = (-u_xlat22) + u_xlat16_1.x;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_42 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(u_xlat16_42);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_9.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_40) * u_xlat16_7.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb22) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat33;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_40 = dot(u_xlat16_7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_7.xyz = (u_xlatb11.x) ? vec3(u_xlat16_40) : u_xlat16_7.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat16_1.xyz = (u_xlatb11.y) ? u_xlat16_9.xyz : u_xlat16_7.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
#endif
    u_xlat0.x = (u_xlatb0) ? u_xlat2.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(_MidPosLeft>=u_xlat0.x);
#else
    u_xlatb11.x = _MidPosLeft>=u_xlat0.x;
#endif
    if(u_xlatb11.x){
        u_xlatb11.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat11.x = (u_xlatb11.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat11.x = u_xlat0.x / u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(0.0<_MidPosLeftSharp);
#else
        u_xlatb33 = 0.0<_MidPosLeftSharp;
#endif
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat13.x = log2(u_xlat11.x);
        u_xlat2.x = u_xlat13.x * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat22 = (u_xlatb11.y) ? 0.0 : u_xlat2.x;
        u_xlat11.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat11.xxxx * u_xlat2 + _LeftColor;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb11.x = !!(_MidPosLeft<u_xlat0.x);
#else
        u_xlatb11.x = _MidPosLeft<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.x<_MidPosRight);
#else
        u_xlatb22 = u_xlat0.x<_MidPosRight;
#endif
        u_xlatb11.x = u_xlatb22 && u_xlatb11.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.x>=_MidPosRight);
#else
        u_xlatb22 = u_xlat0.x>=_MidPosRight;
#endif
        u_xlatb4.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat33 = (-_MidPosRight) + 1.0;
        u_xlat33 = (u_xlatb4.x) ? 0.000100016594 : u_xlat33;
        u_xlat0.x = u_xlat0.x / u_xlat33;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(0.0<_MidPosRightSharp);
#else
        u_xlatb33 = 0.0<_MidPosRightSharp;
#endif
        u_xlat4.x = _MidPosRightSharp * 50.0;
        u_xlat26 = log2(u_xlat0.x);
        u_xlat4.x = u_xlat26 * u_xlat4.x;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = (u_xlatb4.y) ? 0.0 : u_xlat4.x;
        u_xlat0.x = (u_xlatb33) ? u_xlat4.x : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb22) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb11.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_7.xyz;
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
out highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(3) uniform mediump sampler2D _Diffuse1;
UNITY_LOCATION(4) uniform mediump sampler2D _Diffuse2;
UNITY_LOCATION(5) uniform mediump sampler2D _GNTex;
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
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
mediump float u_xlat16_11;
bvec2 u_xlatb11;
float u_xlat12;
vec3 u_xlat13;
float u_xlat22;
bool u_xlatb22;
vec2 u_xlat23;
bvec2 u_xlatb23;
float u_xlat26;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_11 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_11) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb23.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb23.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat11.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3.x = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin(u_xlat16_3.x);
    u_xlat4.x = cos(u_xlat16_3.x);
    u_xlat5.x = sin((-u_xlat16_3.x));
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat5.y = u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.yx, u_xlat11.xy);
    u_xlat5.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat5.zy, u_xlat11.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat2.xy;
    u_xlat16_3 = texture(_Diffuse, u_xlat13.xy);
    u_xlat33 = u_xlat16_3.w * u_xlat16_3.x;
    u_xlat33 = (u_xlatb23.y) ? u_xlat33 : u_xlat16_3.w;
    u_xlat13.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat23.x = _DiffAngle1 * 0.0174532924;
    u_xlat4.x = sin(u_xlat23.x);
    u_xlat5.x = cos(u_xlat23.x);
    u_xlat6.x = sin((-u_xlat23.x));
    u_xlat6.y = u_xlat5.x;
    u_xlat5.x = dot(u_xlat6.yx, u_xlat11.xy);
    u_xlat6.z = u_xlat4.x;
    u_xlat5.y = dot(u_xlat6.zy, u_xlat11.xy);
    u_xlat23.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat23.xy = u_xlat23.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat23.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat23.xy;
    u_xlat16_4.xyz = texture(_Diffuse1, u_xlat23.xy).xyz;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_DiffusePower1);
    u_xlat16_7.xyz = u_xlat4.xyz * _DiffuseColor1.xyz;
    u_xlat23.x = _DiffAngle2 * 0.0174532924;
    u_xlat5.x = sin(u_xlat23.x);
    u_xlat6.x = cos(u_xlat23.x);
    u_xlat8.x = sin((-u_xlat23.x));
    u_xlat8.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat8.yx, u_xlat11.xy);
    u_xlat8.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat8.zy, u_xlat11.xy);
    u_xlat11.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat11.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat11.xy;
    u_xlat16_5.xyz = texture(_Diffuse2, u_xlat11.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_DiffusePower2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(_UVSec==0.0);
#else
    u_xlatb11.x = _UVSec==0.0;
#endif
    u_xlat11.xy = (u_xlatb11.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat11.x = texture(_GNTex, u_xlat11.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.5>=_BlendInten);
#else
    u_xlatb22 = 0.5>=_BlendInten;
#endif
    u_xlat16_40 = _BlendInten + _BlendInten;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23.x = !!(_EdgeModel==0.0);
#else
    u_xlatb23.x = _EdgeModel==0.0;
#endif
    u_xlat34 = float(1.0) / u_xlat11.x;
    u_xlat37 = u_xlat34 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
#ifdef UNITY_ADRENO_ES3
    u_xlatb38 = !!(u_xlat16_40>=u_xlat11.x);
#else
    u_xlatb38 = u_xlat16_40>=u_xlat11.x;
#endif
    u_xlat38 = u_xlatb38 ? 1.0 : float(0.0);
    u_xlat37 = (u_xlatb23.x) ? u_xlat37 : u_xlat38;
    u_xlat37 = u_xlat16_40 * u_xlat37;
    u_xlat4.xyz = u_xlat4.xyz * _DiffuseColor1.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat13.xyz;
    u_xlat16_40 = _BlendInten + -0.5;
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat34 = u_xlat34 * u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(u_xlat16_40>=u_xlat11.x);
#else
    u_xlatb11.x = u_xlat16_40>=u_xlat11.x;
#endif
    u_xlat11.x = u_xlatb11.x ? 1.0 : float(0.0);
    u_xlat11.x = (u_xlatb23.x) ? u_xlat34 : u_xlat11.x;
    u_xlat11.x = u_xlat16_40 * u_xlat11.x;
    u_xlat4.xyz = u_xlat5.xyz * _DiffuseColor2.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb22)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat23.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat23.xy;
    u_xlat16_9.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = u_xlat11.x + _SoftSize;
    u_xlat22 = u_xlat11.y + _DissolveStep;
    u_xlat16_40 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat22;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_40;
    u_xlat12 = (-u_xlat11.x) + u_xlat16_40;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_1.x;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat16_40 = (-u_xlat22) + u_xlat16_1.x;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_40 = min(max(u_xlat16_40, 0.0), 1.0);
#else
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_42 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(u_xlat16_42);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_9.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_40) * u_xlat16_7.xyz + u_xlat16_9.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
#endif
    u_xlat0.x = (u_xlatb22) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat33;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_40 = dot(u_xlat16_7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_7.xyz = (u_xlatb11.x) ? vec3(u_xlat16_40) : u_xlat16_7.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat16_1.xyz = (u_xlatb11.y) ? u_xlat16_9.xyz : u_xlat16_7.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
#endif
    u_xlat0.x = (u_xlatb0) ? u_xlat2.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11.x = !!(_MidPosLeft>=u_xlat0.x);
#else
    u_xlatb11.x = _MidPosLeft>=u_xlat0.x;
#endif
    if(u_xlatb11.x){
        u_xlatb11.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat11.x = (u_xlatb11.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat11.x = u_xlat0.x / u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(0.0<_MidPosLeftSharp);
#else
        u_xlatb33 = 0.0<_MidPosLeftSharp;
#endif
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat13.x = log2(u_xlat11.x);
        u_xlat2.x = u_xlat13.x * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat22 = (u_xlatb11.y) ? 0.0 : u_xlat2.x;
        u_xlat11.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat11.xxxx * u_xlat2 + _LeftColor;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb11.x = !!(_MidPosLeft<u_xlat0.x);
#else
        u_xlatb11.x = _MidPosLeft<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.x<_MidPosRight);
#else
        u_xlatb22 = u_xlat0.x<_MidPosRight;
#endif
        u_xlatb11.x = u_xlatb22 && u_xlatb11.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(u_xlat0.x>=_MidPosRight);
#else
        u_xlatb22 = u_xlat0.x>=_MidPosRight;
#endif
        u_xlatb4.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat33 = (-_MidPosRight) + 1.0;
        u_xlat33 = (u_xlatb4.x) ? 0.000100016594 : u_xlat33;
        u_xlat0.x = u_xlat0.x / u_xlat33;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(0.0<_MidPosRightSharp);
#else
        u_xlatb33 = 0.0<_MidPosRightSharp;
#endif
        u_xlat4.x = _MidPosRightSharp * 50.0;
        u_xlat26 = log2(u_xlat0.x);
        u_xlat4.x = u_xlat26 * u_xlat4.x;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = (u_xlatb4.y) ? 0.0 : u_xlat4.x;
        u_xlat0.x = (u_xlatb33) ? u_xlat4.x : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb22) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb11.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_IsGray<1.0);
#else
    u_xlatb2 = _IsGray<1.0;
#endif
    u_xlat16_7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_7.xyz;
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
varying highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Diffuse1;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _GNTex;
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
lowp float u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
lowp float u_xlat10_11;
bvec2 u_xlatb11;
float u_xlat12;
vec3 u_xlat13;
float u_xlat22;
bool u_xlatb22;
vec2 u_xlat23;
bvec2 u_xlatb23;
float u_xlat26;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_11 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_11) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb23.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb23.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat11.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin(u_xlat16_3);
    u_xlat4.x = cos(u_xlat16_3);
    u_xlat5.x = sin((-u_xlat16_3));
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat5.y = u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.yx, u_xlat11.xy);
    u_xlat5.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat5.zy, u_xlat11.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat2.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat13.xy);
    u_xlat33 = u_xlat10_3.w * u_xlat10_3.x;
    u_xlat33 = (u_xlatb23.y) ? u_xlat33 : u_xlat10_3.w;
    u_xlat13.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat23.x = _DiffAngle1 * 0.0174532924;
    u_xlat4.x = sin(u_xlat23.x);
    u_xlat5.x = cos(u_xlat23.x);
    u_xlat6.x = sin((-u_xlat23.x));
    u_xlat6.y = u_xlat5.x;
    u_xlat5.x = dot(u_xlat6.yx, u_xlat11.xy);
    u_xlat6.z = u_xlat4.x;
    u_xlat5.y = dot(u_xlat6.zy, u_xlat11.xy);
    u_xlat23.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat23.xy = u_xlat23.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat23.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat23.xy;
    u_xlat10_4.xyz = texture2D(_Diffuse1, u_xlat23.xy).xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_DiffusePower1);
    u_xlat16_7.xyz = u_xlat4.xyz * _DiffuseColor1.xyz;
    u_xlat23.x = _DiffAngle2 * 0.0174532924;
    u_xlat5.x = sin(u_xlat23.x);
    u_xlat6.x = cos(u_xlat23.x);
    u_xlat8.x = sin((-u_xlat23.x));
    u_xlat8.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat8.yx, u_xlat11.xy);
    u_xlat8.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat8.zy, u_xlat11.xy);
    u_xlat11.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat11.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat11.xy;
    u_xlat10_5.xyz = texture2D(_Diffuse2, u_xlat11.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_DiffusePower2);
    u_xlatb11.x = _UVSec==0.0;
    u_xlat11.xy = (u_xlatb11.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat11.x = texture2D(_GNTex, u_xlat11.xy).x;
    u_xlatb22 = 0.5>=_BlendInten;
    u_xlat16_40 = _BlendInten + _BlendInten;
    u_xlatb23.x = _EdgeModel==0.0;
    u_xlat34 = float(1.0) / u_xlat11.x;
    u_xlat37 = u_xlat34 * u_xlat16_40;
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlatb38 = u_xlat16_40>=u_xlat11.x;
    u_xlat38 = u_xlatb38 ? 1.0 : float(0.0);
    u_xlat37 = (u_xlatb23.x) ? u_xlat37 : u_xlat38;
    u_xlat37 = u_xlat16_40 * u_xlat37;
    u_xlat4.xyz = u_xlat4.xyz * _DiffuseColor1.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat13.xyz;
    u_xlat16_40 = _BlendInten + -0.5;
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat34 = u_xlat34 * u_xlat16_40;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat4.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat4.x;
    u_xlatb11.x = u_xlat16_40>=u_xlat11.x;
    u_xlat11.x = u_xlatb11.x ? 1.0 : float(0.0);
    u_xlat11.x = (u_xlatb23.x) ? u_xlat34 : u_xlat11.x;
    u_xlat11.x = u_xlat16_40 * u_xlat11.x;
    u_xlat4.xyz = u_xlat5.xyz * _DiffuseColor2.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb22)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat23.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat23.xy;
    u_xlat16_9.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_1 = texture2D(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = u_xlat11.x + _SoftSize;
    u_xlat22 = u_xlat11.y + _DissolveStep;
    u_xlat16_40 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat22;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_40;
    u_xlat12 = (-u_xlat11.x) + u_xlat16_40;
    u_xlat11.x = (-u_xlat11.x) + u_xlat10_1;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat12 = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat16_40 = (-u_xlat22) + u_xlat10_1;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_42 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(u_xlat16_42);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_9.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_40) * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb22) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat33;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_40 = dot(u_xlat16_7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_7.xyz = (u_xlatb11.x) ? vec3(u_xlat16_40) : u_xlat16_7.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat16_1.xyz = (u_xlatb11.y) ? u_xlat16_9.xyz : u_xlat16_7.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
    u_xlat0.x = (u_xlatb0) ? u_xlat2.x : vs_TEXCOORD0.x;
    u_xlatb11.x = _MidPosLeft>=u_xlat0.x;
    if(u_xlatb11.x){
        u_xlatb11.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat11.x = (u_xlatb11.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat11.x = u_xlat0.x / u_xlat11.x;
        u_xlatb33 = 0.0<_MidPosLeftSharp;
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat13.x = log2(u_xlat11.x);
        u_xlat2.x = u_xlat13.x * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat22 = (u_xlatb11.y) ? 0.0 : u_xlat2.x;
        u_xlat11.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat11.xxxx * u_xlat2 + _LeftColor;
    } else {
        u_xlatb11.x = _MidPosLeft<u_xlat0.x;
        u_xlatb22 = u_xlat0.x<_MidPosRight;
        u_xlatb11.x = u_xlatb22 && u_xlatb11.x;
        u_xlatb22 = u_xlat0.x>=_MidPosRight;
        u_xlatb4.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat33 = (-_MidPosRight) + 1.0;
        u_xlat33 = (u_xlatb4.x) ? 0.000100016594 : u_xlat33;
        u_xlat0.x = u_xlat0.x / u_xlat33;
        u_xlatb33 = 0.0<_MidPosRightSharp;
        u_xlat4.x = _MidPosRightSharp * 50.0;
        u_xlat26 = log2(u_xlat0.x);
        u_xlat4.x = u_xlat26 * u_xlat4.x;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = (u_xlatb4.y) ? 0.0 : u_xlat4.x;
        u_xlat0.x = (u_xlatb33) ? u_xlat4.x : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb22) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb11.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_7.xyz;
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
varying highp vec3 vs_TEXCOORD4;
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
    vs_TEXCOORD4.xyz = in_POSITION0.xyz;
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
uniform 	float _OpenCustom;
uniform 	mediump float _Gradient_Rotate;
uniform 	float _UVSec;
uniform 	mediump float _DissolveOutlineSoft;
uniform 	mediump float _DissolveOutlineWidth;
uniform 	mediump float _UnMult;
uniform 	mediump float _EffectByMask;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	float _MaskXSpeed;
uniform 	float _MaskYSpeed;
uniform 	mediump float _MaskNotEffectDiff;
uniform 	mediump vec4 _DiffuseColor1;
uniform 	mediump vec4 _Diffuse1_ST;
uniform 	mediump float _DiffusePower1;
uniform 	float _DiffAngle1;
uniform 	float _DiffXSpeed1;
uniform 	float _DiffYSpeed1;
uniform 	mediump vec4 _DiffuseColor2;
uniform 	mediump vec4 _Diffuse2_ST;
uniform 	mediump float _DiffusePower2;
uniform 	float _DiffAngle2;
uniform 	float _DiffXSpeed2;
uniform 	float _DiffYSpeed2;
uniform 	float _BlendInten;
uniform 	float _EdgeModel;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Diffuse1;
uniform lowp sampler2D _Diffuse2;
uniform lowp sampler2D _GNTex;
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
lowp float u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat11;
lowp float u_xlat10_11;
bvec2 u_xlatb11;
float u_xlat12;
vec3 u_xlat13;
float u_xlat22;
bool u_xlatb22;
vec2 u_xlat23;
bvec2 u_xlatb23;
float u_xlat26;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat37;
float u_xlat38;
bool u_xlatb38;
mediump float u_xlat16_40;
mediump float u_xlat16_42;
void main()
{
    u_xlat0 = vs_TEXCOORD1.zwxy * vec4(vec4(_OpenCustom, _OpenCustom, _OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = _Time.yy * vec2(_MaskXSpeed, _MaskYSpeed) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_11 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_11) * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlatb23.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_EffectByMask, _UnMult, _EffectByMask, _UnMult)).xy;
    u_xlat2.xy = u_xlat0.xx * (-u_xlat1.xy) + u_xlat1.xy;
    u_xlat1.xy = (u_xlatb23.x) ? u_xlat2.xy : u_xlat1.xy;
    u_xlat11.xy = u_xlat0.zw + u_xlat1.xy;
    u_xlat16_3 = _DiffAngle * 0.0174532924;
    u_xlat2.x = sin(u_xlat16_3);
    u_xlat4.x = cos(u_xlat16_3);
    u_xlat5.x = sin((-u_xlat16_3));
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat5.y = u_xlat4.x;
    u_xlat4.x = dot(u_xlat5.yx, u_xlat11.xy);
    u_xlat5.z = u_xlat2.x;
    u_xlat4.y = dot(u_xlat5.zy, u_xlat11.xy);
    u_xlat2.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat2.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat2.xy;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat13.xy);
    u_xlat33 = u_xlat10_3.w * u_xlat10_3.x;
    u_xlat33 = (u_xlatb23.y) ? u_xlat33 : u_xlat10_3.w;
    u_xlat13.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat23.x = _DiffAngle1 * 0.0174532924;
    u_xlat4.x = sin(u_xlat23.x);
    u_xlat5.x = cos(u_xlat23.x);
    u_xlat6.x = sin((-u_xlat23.x));
    u_xlat6.y = u_xlat5.x;
    u_xlat5.x = dot(u_xlat6.yx, u_xlat11.xy);
    u_xlat6.z = u_xlat4.x;
    u_xlat5.y = dot(u_xlat6.zy, u_xlat11.xy);
    u_xlat23.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat23.xy = u_xlat23.xy * _Diffuse1_ST.xy + _Diffuse1_ST.zw;
    u_xlat23.xy = _Time.yy * vec2(_DiffXSpeed1, _DiffYSpeed1) + u_xlat23.xy;
    u_xlat10_4.xyz = texture2D(_Diffuse1, u_xlat23.xy).xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_DiffusePower1);
    u_xlat16_7.xyz = u_xlat4.xyz * _DiffuseColor1.xyz;
    u_xlat23.x = _DiffAngle2 * 0.0174532924;
    u_xlat5.x = sin(u_xlat23.x);
    u_xlat6.x = cos(u_xlat23.x);
    u_xlat8.x = sin((-u_xlat23.x));
    u_xlat8.y = u_xlat6.x;
    u_xlat6.x = dot(u_xlat8.yx, u_xlat11.xy);
    u_xlat8.z = u_xlat5.x;
    u_xlat6.y = dot(u_xlat8.zy, u_xlat11.xy);
    u_xlat11.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat11.xy = u_xlat11.xy * _Diffuse2_ST.xy + _Diffuse2_ST.zw;
    u_xlat11.xy = _Time.yy * vec2(_DiffXSpeed2, _DiffYSpeed2) + u_xlat11.xy;
    u_xlat10_5.xyz = texture2D(_Diffuse2, u_xlat11.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_DiffusePower2);
    u_xlatb11.x = _UVSec==0.0;
    u_xlat11.xy = (u_xlatb11.x) ? vs_TEXCOORD0.xy : vs_TEXCOORD1.xy;
    u_xlat11.x = texture2D(_GNTex, u_xlat11.xy).x;
    u_xlatb22 = 0.5>=_BlendInten;
    u_xlat16_40 = _BlendInten + _BlendInten;
    u_xlatb23.x = _EdgeModel==0.0;
    u_xlat34 = float(1.0) / u_xlat11.x;
    u_xlat37 = u_xlat34 * u_xlat16_40;
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
    u_xlat38 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat38;
    u_xlatb38 = u_xlat16_40>=u_xlat11.x;
    u_xlat38 = u_xlatb38 ? 1.0 : float(0.0);
    u_xlat37 = (u_xlatb23.x) ? u_xlat37 : u_xlat38;
    u_xlat37 = u_xlat16_40 * u_xlat37;
    u_xlat4.xyz = u_xlat4.xyz * _DiffuseColor1.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat37) * u_xlat4.xyz + u_xlat13.xyz;
    u_xlat16_40 = _BlendInten + -0.5;
    u_xlat16_40 = u_xlat16_40 + u_xlat16_40;
    u_xlat34 = u_xlat34 * u_xlat16_40;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat4.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat4.x;
    u_xlatb11.x = u_xlat16_40>=u_xlat11.x;
    u_xlat11.x = u_xlatb11.x ? 1.0 : float(0.0);
    u_xlat11.x = (u_xlatb23.x) ? u_xlat34 : u_xlat11.x;
    u_xlat11.x = u_xlat16_40 * u_xlat11.x;
    u_xlat4.xyz = u_xlat5.xyz * _DiffuseColor2.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat11.xxx * u_xlat4.xyz + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (bool(u_xlatb22)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat11.xy = vs_TEXCOORD2.xy * vec2(vec2(_OpenCustom, _OpenCustom));
    u_xlat23.xy = vs_TEXCOORD2.zw * vec2(vec2(_OpenCustom, _OpenCustom)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat23.xy;
    u_xlat16_9.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_1 = texture2D(_DissolveTex, u_xlat16_9.xy).x;
    u_xlat11.xy = max(u_xlat11.xy, vec2(0.0, 0.0));
    u_xlat11.x = u_xlat11.x + _SoftSize;
    u_xlat22 = u_xlat11.y + _DissolveStep;
    u_xlat16_40 = (-_DissolveOutlineWidth) * _DissolveOutline_On + u_xlat22;
    u_xlat11.x = (-u_xlat11.x) + u_xlat16_40;
    u_xlat12 = (-u_xlat11.x) + u_xlat16_40;
    u_xlat11.x = (-u_xlat11.x) + u_xlat10_1;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat12 = u_xlat11.x * -2.0 + 3.0;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat12;
    u_xlat16_40 = (-u_xlat22) + u_xlat10_1;
    u_xlat16_9.x = float(1.0) / _DissolveOutlineSoft;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_40 = clamp(u_xlat16_40, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_40 * -2.0 + 3.0;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_9.x;
    u_xlat16_9.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat16_42 = (-_DissolveOutline_On) + 1.0;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(u_xlat16_42);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(vec3(_DissolveOutline_On, _DissolveOutline_On, _DissolveOutline_On)) + u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_9.xyz);
    u_xlat16_7.xyz = vec3(u_xlat16_40) * u_xlat16_7.xyz + u_xlat16_9.xyz;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_MaskNotEffectDiff);
    u_xlat0.x = (u_xlatb22) ? 1.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat33;
    u_xlat0.x = u_xlat11.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _DiffuseColor.w;
    u_xlat16_40 = dot(u_xlat16_7.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb11.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat16_7.xyz = (u_xlatb11.x) ? vec3(u_xlat16_40) : u_xlat16_7.xyz;
    u_xlat16_9.xyz = (-u_xlat16_7.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat0.xxx * u_xlat16_9.xyz;
    u_xlat16_1.xyz = (u_xlatb11.y) ? u_xlat16_9.xyz : u_xlat16_7.xyz;
    u_xlat16_1.w = u_xlat0.x * _TransparentStrong;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Gradient_Rotate);
    u_xlat0.x = (u_xlatb0) ? u_xlat2.x : vs_TEXCOORD0.x;
    u_xlatb11.x = _MidPosLeft>=u_xlat0.x;
    if(u_xlatb11.x){
        u_xlatb11.xy = equal(vec4(_MidPosLeft, _MidPosLeftSharp, _MidPosLeft, _MidPosLeft), vec4(0.0, 1.0, 0.0, 0.0)).xy;
        u_xlat11.x = (u_xlatb11.x) ? 9.99999975e-05 : _MidPosLeft;
        u_xlat11.x = u_xlat0.x / u_xlat11.x;
        u_xlatb33 = 0.0<_MidPosLeftSharp;
        u_xlat2.x = _MidPosLeftSharp * 50.0;
        u_xlat13.x = log2(u_xlat11.x);
        u_xlat2.x = u_xlat13.x * u_xlat2.x;
        u_xlat2.x = exp2(u_xlat2.x);
        u_xlat22 = (u_xlatb11.y) ? 0.0 : u_xlat2.x;
        u_xlat11.x = (u_xlatb33) ? u_xlat22 : u_xlat11.x;
        u_xlat2 = (-_LeftColor) + _MidColor;
        u_xlat2 = u_xlat11.xxxx * u_xlat2 + _LeftColor;
    } else {
        u_xlatb11.x = _MidPosLeft<u_xlat0.x;
        u_xlatb22 = u_xlat0.x<_MidPosRight;
        u_xlatb11.x = u_xlatb22 && u_xlatb11.x;
        u_xlatb22 = u_xlat0.x>=_MidPosRight;
        u_xlatb4.xy = equal(vec4(_MidPosRight, _MidPosRightSharp, _MidPosRight, _MidPosRight), vec4(1.0, 1.0, 0.0, 0.0)).xy;
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat33 = (-_MidPosRight) + 1.0;
        u_xlat33 = (u_xlatb4.x) ? 0.000100016594 : u_xlat33;
        u_xlat0.x = u_xlat0.x / u_xlat33;
        u_xlatb33 = 0.0<_MidPosRightSharp;
        u_xlat4.x = _MidPosRightSharp * 50.0;
        u_xlat26 = log2(u_xlat0.x);
        u_xlat4.x = u_xlat26 * u_xlat4.x;
        u_xlat4.x = exp2(u_xlat4.x);
        u_xlat4.x = (u_xlatb4.y) ? 0.0 : u_xlat4.x;
        u_xlat0.x = (u_xlatb33) ? u_xlat4.x : u_xlat0.x;
        u_xlat3 = (-_RightColor) + _MidColor;
        u_xlat3 = u_xlat0.xxxx * u_xlat3 + _RightColor;
        u_xlat3 = bool(u_xlatb22) ? u_xlat3 : vec4(0.0, 0.0, 0.0, 0.0);
        u_xlat2 = (u_xlatb11.x) ? _MidColor : u_xlat3;
    }
    u_xlat0 = u_xlat16_1 * u_xlat2;
    u_xlatb2 = _IsGray<1.0;
    u_xlat16_7.xyz = vs_COLOR0.xyz * _DiffuseColor.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_7.xyz;
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