//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UISpecial_SmokeNoise" {
Properties {

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2.0

[Enum(Off,0,On,1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(UnityEngine.Rendering.BlendMode)] _BlendSrc ("BlendSrc", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _BlendDst ("BlendDst", Float) = 10.0

[Toggle] _Custom ("Custom", Float) = 0.0

_MainTexture ("MainTexture", 2D) = "white" { }

_MainColor ("MainColor", Color) = (1,1,1,1)

_ColorIntensity ("ColorIntensity", Float) = 1.0

_NoiseTex ("NoiseTex", 2D) = "white" { }

_Noise_Scale ("Noise_Scale", Float) = 1.0

_NoiseTexUV_XYVxVy ("NoiseTexUV_XYVxVy", Vector) = (0,0,0,0.5)

_NoiseTexUV_AnchorAndTiling ("NoiseTexUV_AnchorAndTiling", Vector) = (0.5,0.5,1,1)

_NoiseTexUV_AnchorAndRotator ("NoiseTexUV_AnchorAndRotator", Vector) = (0.5,0.5,0,0)

_NoiseTexMixedPower ("NoiseTexMixedPower", Range(0, 2)) = 0.4000000059604645

_NGonUVNoisePower ("NGonUVNoisePower", Range(0, 4)) = 0.800000011920929

_NGon_SidesScaleWH ("NGon_SidesScaleWH", Vector) = (7,1,0.5,0.5)

_NGon_RoaRovSfRdn ("NGon_RoaRovSfRdn", Vector) = (17,0.2,0.23,-0.6)

_NGonUV_XYVxVy ("NGonUV_XYVxVy", Vector) = (0,0,0,0)

_NGonUV_AnchorAndTiling ("NGonUV_AnchorAndTiling", Vector) = (0.5,0.5,1,1)

_NGonUV_AnchorAndRoaRov ("NGonUV_AnchorAndRoaRov", Vector) = (0.5,0.5,0,0)

_Soft ("Soft", Range(0, 1)) = 0.0

[Toggle(_RAMPCOLORON_ON)] _RampColorON ("RampColorON", Float) = 0.0

_ColorRamp ("ColorRamp", Range(0, 10)) = 1.6521739959716797

_Color1 ("Color1", Color) = (1,1,1,1)

_Color1Ramp ("Color1Ramp", Range(0, 5)) = 0.3701252043247223

_Color2 ("Color2", Color) = (0.877358,0.779651,0.715958,1)

_Color3 ("Color3", Color) = (0.54717,0.478446,0.384567,1)

[Toggle] [Enum(Mask_Main,0,Mask_NoisePower,1)] _MaskType ("MaskType", Float) = 1.0

_UV_BallFace_Power ("UV_BallFace_Power", Range(0, 2)) = 0.5

_UV_BallFace_TileScale ("UV_BallFace_TileScale", Float) = 1.0

_UV_BallFace_OffsetXYZ ("UV_BallFace_OffsetXYZ", Vector) = (0.5,0.5,0,0)

[Toggle(_USEDISSOLVE_ON)] _UseDissolve ("UseDissolve", Float) = 0.0

_DissolveTex ("DissolveTex", 2D) = "white" { }

_Dissolve ("Dissolve", Range(-1, 1)) = -1.0

_Dissolve_Soft ("Dissolve_Soft", Range(0.5, 1)) = 0.5

_Dissolve_EdgeColor ("Dissolve_EdgeColor", Color) = (1,1,1,1)

_Dissolve_EdgeColPower ("Dissolve_EdgeColPower", Float) = 1.0

[Enum()] _Stencil_Ref ("Stencil_Ref", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _Stencil_Comp ("Stencil_Comp", Float) = 0.0

_Hue ("色相", Range(-0.5, 0.5)) = 0.0

_Saturation ("饱和度", Range(0, 2)) = 1.0

_Contrast ("对比度", Range(0, 2)) = 1.0

_PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

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
  GpuProgramID 15278
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
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD3.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
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
uniform 	mediump float _Hue;
uniform 	mediump vec3 _UV_BallFace_OffsetXYZ;
uniform 	mediump float _UV_BallFace_TileScale;
uniform 	mediump float _UV_BallFace_Power;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	mediump float _Noise_Scale;
uniform 	mediump float _Custom;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	mediump float _NoiseTexMixedPower;
uniform 	vec4 _NGonUV_XYVxVy;
uniform 	vec4 _NGonUV_AnchorAndTiling;
uniform 	vec4 _NGonUV_AnchorAndRoaRov;
uniform 	float _NGonUVNoisePower;
uniform 	mediump float _Soft;
uniform 	mediump vec4 _NGon_RoaRovSfRdn;
uniform 	mediump vec4 _NGon_SidesScaleWH;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _ColorIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTexture;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD3.xyz + (-_UV_BallFace_OffsetXYZ.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + _UV_BallFace_TileScale;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) * 0.100000001 + 1.0;
    u_xlat16_1.xy = (-u_xlat0.xy) * u_xlat16_1.xx;
    u_xlat0.xy = vs_TEXCOORD3.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat16_17 = _Custom * vs_TEXCOORD4.w + _Noise_Scale;
    u_xlat16.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(u_xlat16_17);
    u_xlat2.xy = u_xlat16.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16.xy + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat16.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16.x>=(-u_xlat16.x));
#else
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
#endif
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 1000.0;
    u_xlat16_17 = _NoiseTexUV_AnchorAndRotator.w * u_xlat16.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_UV_BallFace_Power) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = (-u_xlat16_0.x) + 0.5;
    u_xlat16_1.x = _NoiseTexMixedPower * u_xlat16_1.x + u_xlat16_0.x;
    u_xlat16_9.x = u_xlat16_1.x + -0.400000006;
    u_xlat0.xy = vec2(vec2(_Custom, _Custom)) * vs_TEXCOORD4.xy + _NGonUV_XYVxVy.xy;
    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD3.xy;
    u_xlat2.xy = _NGonUV_AnchorAndTiling.zw + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NGonUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * _NGonUV_AnchorAndTiling.zw + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NGonUV_AnchorAndRoaRov.xy);
    u_xlat16_17 = _NGonUV_AnchorAndRoaRov.w * u_xlat16.x + _NGonUV_AnchorAndRoaRov.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NGonUV_AnchorAndRoaRov.xy;
    u_xlat0.xy = (-_NGonUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_9.xx;
    u_xlat0.xy = u_xlat16.xy * vec2(_NGonUVNoisePower) + u_xlat0.xy;
    u_xlat16.xy = fract(u_xlat0.xy);
    u_xlat16_2 = texture(_MainTexture, u_xlat0.xy);
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_2 = u_xlat16_2 * _MainColor;
    u_xlat16_9.x = _Custom * vs_TEXCOORD4.z + _NGon_SidesScaleWH.y;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_9.x * -0.5;
    u_xlat0.xy = u_xlat16.xy * u_xlat16_9.xx + vec2(u_xlat16_17);
    u_xlat16.x = 3.14159274 / _NGon_SidesScaleWH.x;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat16_9.xy = u_xlat16.xx * _NGon_SidesScaleWH.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_9.xy;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.x * 0.00555555569;
    u_xlat16.x = _NGon_RoaRovSfRdn.y * _Time.y + u_xlat16_9.x;
    u_xlat16.x = u_xlat16.x * 3.14159274;
    u_xlat5.x = sin(u_xlat16.x);
    u_xlat6 = cos(u_xlat16.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat16.x = dot(u_xlat0.xy, u_xlat7.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat7.yz);
    u_xlat16_9.x = max(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = min(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_17 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat0.x = u_xlat16_17 * 0.0208350997 + -0.0851330012;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.180141002;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + -0.330299497;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.999866009;
    u_xlat8 = u_xlat0.x * u_xlat16_9.x;
    u_xlat8 = u_xlat8 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat16.x)<abs(u_xlat3.x));
#else
    u_xlatb24 = abs(u_xlat16.x)<abs(u_xlat3.x);
#endif
    u_xlat8 = u_xlatb24 ? u_xlat8 : float(0.0);
    u_xlat0.x = u_xlat16_9.x * u_xlat0.x + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!((-u_xlat16.x)<u_xlat16.x);
#else
    u_xlatb8 = (-u_xlat16.x)<u_xlat16.x;
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = min((-u_xlat16.x), u_xlat3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_9.x<(-u_xlat16_9.x));
#else
    u_xlatb8 = u_xlat16_9.x<(-u_xlat16_9.x);
#endif
    u_xlat16_9.x = max((-u_xlat16.x), u_xlat3.x);
    u_xlat3.yw = (-u_xlat16.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_9.x>=(-u_xlat16_9.x));
#else
    u_xlatb16 = u_xlat16_9.x>=(-u_xlat16_9.x);
#endif
    u_xlatb8 = u_xlatb16 && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat16_9.x = 6.28318548 / _NGon_SidesScaleWH.x;
    u_xlat16_17 = u_xlat0.x / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_17 + 0.5;
    u_xlat16_17 = floor(u_xlat16_17);
    u_xlat16_9.x = u_xlat16_17 * u_xlat16_9.x + (-u_xlat0.x);
    u_xlat16_9.x = cos(u_xlat16_9.x);
    u_xlat3.z = u_xlat3.x;
    u_xlat16_17 = dot(u_xlat3.xy, u_xlat3.zw);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_25 = _NGon_SidesScaleWH.x + _NGon_SidesScaleWH.x;
    u_xlat16_25 = 360.0 / u_xlat16_25;
    u_xlat0.x = u_xlat16_25 * 0.0174532942;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17;
    u_xlat8 = u_xlat16_9.x * u_xlat16_17 + (-u_xlat0.x);
    u_xlat0.x = _NGon_RoaRovSfRdn.w * u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.z * 0.499900013 + 0.500100017;
    u_xlat16_17 = u_xlat0.x + (-u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * -2.0 + 1.0;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_17 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
    u_xlat16_9.x = (-u_xlat16_1.x) + u_xlat16_9.x;
    u_xlat16_1.x = u_xlat16_9.x * 1.5 + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = float(1.0) / _Soft;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_2.w;
    u_xlat16_1.xyw = u_xlat16_2.yzx * vec3(_ColorIntensity);
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_ColorIntensity) + (-u_xlat16_3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_3.y>=u_xlat16_1.y);
#else
    u_xlatb5 = u_xlat16_3.y>=u_xlat16_1.y;
#endif
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.w>=u_xlat16_2.x);
#else
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
#endif
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_4.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_1.x + (-u_xlat16_4.x);
    u_xlat16_12 = u_xlat16_4.x * 6.0 + 1.00000001e-10;
    u_xlat16_9.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_12;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_1.z;
    u_xlat16_9.x = abs(u_xlat16_9.x) + _Hue;
    u_xlat16_9.xyz = u_xlat16_9.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_9.xyz = fract(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_9.xyz = abs(u_xlat16_9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = u_xlat16_1.x + 1.00000001e-10;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12;
    u_xlat16_4.x = u_xlat16_4.x * _Saturation;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat16_1.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_1.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelRect.zw;
    u_xlat16_1.xy = u_xlat16_1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_1.xxxx;
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
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD3.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
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
uniform 	mediump float _Hue;
uniform 	mediump vec3 _UV_BallFace_OffsetXYZ;
uniform 	mediump float _UV_BallFace_TileScale;
uniform 	mediump float _UV_BallFace_Power;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	mediump float _Noise_Scale;
uniform 	mediump float _Custom;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	mediump float _NoiseTexMixedPower;
uniform 	vec4 _NGonUV_XYVxVy;
uniform 	vec4 _NGonUV_AnchorAndTiling;
uniform 	vec4 _NGonUV_AnchorAndRoaRov;
uniform 	float _NGonUVNoisePower;
uniform 	mediump float _Soft;
uniform 	mediump vec4 _NGon_RoaRovSfRdn;
uniform 	mediump vec4 _NGon_SidesScaleWH;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _ColorIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTexture;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD3.xyz + (-_UV_BallFace_OffsetXYZ.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + _UV_BallFace_TileScale;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) * 0.100000001 + 1.0;
    u_xlat16_1.xy = (-u_xlat0.xy) * u_xlat16_1.xx;
    u_xlat0.xy = vs_TEXCOORD3.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat16_17 = _Custom * vs_TEXCOORD4.w + _Noise_Scale;
    u_xlat16.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(u_xlat16_17);
    u_xlat2.xy = u_xlat16.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16.xy + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat16.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16.x>=(-u_xlat16.x));
#else
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
#endif
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 1000.0;
    u_xlat16_17 = _NoiseTexUV_AnchorAndRotator.w * u_xlat16.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_UV_BallFace_Power) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = (-u_xlat16_0.x) + 0.5;
    u_xlat16_1.x = _NoiseTexMixedPower * u_xlat16_1.x + u_xlat16_0.x;
    u_xlat16_9.x = u_xlat16_1.x + -0.400000006;
    u_xlat0.xy = vec2(vec2(_Custom, _Custom)) * vs_TEXCOORD4.xy + _NGonUV_XYVxVy.xy;
    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD3.xy;
    u_xlat2.xy = _NGonUV_AnchorAndTiling.zw + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NGonUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * _NGonUV_AnchorAndTiling.zw + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NGonUV_AnchorAndRoaRov.xy);
    u_xlat16_17 = _NGonUV_AnchorAndRoaRov.w * u_xlat16.x + _NGonUV_AnchorAndRoaRov.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NGonUV_AnchorAndRoaRov.xy;
    u_xlat0.xy = (-_NGonUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_9.xx;
    u_xlat0.xy = u_xlat16.xy * vec2(_NGonUVNoisePower) + u_xlat0.xy;
    u_xlat16.xy = fract(u_xlat0.xy);
    u_xlat16_2 = texture(_MainTexture, u_xlat0.xy);
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_2 = u_xlat16_2 * _MainColor;
    u_xlat16_9.x = _Custom * vs_TEXCOORD4.z + _NGon_SidesScaleWH.y;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_9.x * -0.5;
    u_xlat0.xy = u_xlat16.xy * u_xlat16_9.xx + vec2(u_xlat16_17);
    u_xlat16.x = 3.14159274 / _NGon_SidesScaleWH.x;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat16_9.xy = u_xlat16.xx * _NGon_SidesScaleWH.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_9.xy;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.x * 0.00555555569;
    u_xlat16.x = _NGon_RoaRovSfRdn.y * _Time.y + u_xlat16_9.x;
    u_xlat16.x = u_xlat16.x * 3.14159274;
    u_xlat5.x = sin(u_xlat16.x);
    u_xlat6 = cos(u_xlat16.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat16.x = dot(u_xlat0.xy, u_xlat7.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat7.yz);
    u_xlat16_9.x = max(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = min(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_17 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat0.x = u_xlat16_17 * 0.0208350997 + -0.0851330012;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.180141002;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + -0.330299497;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.999866009;
    u_xlat8 = u_xlat0.x * u_xlat16_9.x;
    u_xlat8 = u_xlat8 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat16.x)<abs(u_xlat3.x));
#else
    u_xlatb24 = abs(u_xlat16.x)<abs(u_xlat3.x);
#endif
    u_xlat8 = u_xlatb24 ? u_xlat8 : float(0.0);
    u_xlat0.x = u_xlat16_9.x * u_xlat0.x + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!((-u_xlat16.x)<u_xlat16.x);
#else
    u_xlatb8 = (-u_xlat16.x)<u_xlat16.x;
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = min((-u_xlat16.x), u_xlat3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_9.x<(-u_xlat16_9.x));
#else
    u_xlatb8 = u_xlat16_9.x<(-u_xlat16_9.x);
#endif
    u_xlat16_9.x = max((-u_xlat16.x), u_xlat3.x);
    u_xlat3.yw = (-u_xlat16.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_9.x>=(-u_xlat16_9.x));
#else
    u_xlatb16 = u_xlat16_9.x>=(-u_xlat16_9.x);
#endif
    u_xlatb8 = u_xlatb16 && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat16_9.x = 6.28318548 / _NGon_SidesScaleWH.x;
    u_xlat16_17 = u_xlat0.x / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_17 + 0.5;
    u_xlat16_17 = floor(u_xlat16_17);
    u_xlat16_9.x = u_xlat16_17 * u_xlat16_9.x + (-u_xlat0.x);
    u_xlat16_9.x = cos(u_xlat16_9.x);
    u_xlat3.z = u_xlat3.x;
    u_xlat16_17 = dot(u_xlat3.xy, u_xlat3.zw);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_25 = _NGon_SidesScaleWH.x + _NGon_SidesScaleWH.x;
    u_xlat16_25 = 360.0 / u_xlat16_25;
    u_xlat0.x = u_xlat16_25 * 0.0174532942;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17;
    u_xlat8 = u_xlat16_9.x * u_xlat16_17 + (-u_xlat0.x);
    u_xlat0.x = _NGon_RoaRovSfRdn.w * u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.z * 0.499900013 + 0.500100017;
    u_xlat16_17 = u_xlat0.x + (-u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * -2.0 + 1.0;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_17 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
    u_xlat16_9.x = (-u_xlat16_1.x) + u_xlat16_9.x;
    u_xlat16_1.x = u_xlat16_9.x * 1.5 + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = float(1.0) / _Soft;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_2.w;
    u_xlat16_1.xyw = u_xlat16_2.yzx * vec3(_ColorIntensity);
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_ColorIntensity) + (-u_xlat16_3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_3.y>=u_xlat16_1.y);
#else
    u_xlatb5 = u_xlat16_3.y>=u_xlat16_1.y;
#endif
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.w>=u_xlat16_2.x);
#else
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
#endif
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_4.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_1.x + (-u_xlat16_4.x);
    u_xlat16_12 = u_xlat16_4.x * 6.0 + 1.00000001e-10;
    u_xlat16_9.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_12;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_1.z;
    u_xlat16_9.x = abs(u_xlat16_9.x) + _Hue;
    u_xlat16_9.xyz = u_xlat16_9.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_9.xyz = fract(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_9.xyz = abs(u_xlat16_9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = u_xlat16_1.x + 1.00000001e-10;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12;
    u_xlat16_4.x = u_xlat16_4.x * _Saturation;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat16_1.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_1.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelRect.zw;
    u_xlat16_1.xy = u_xlat16_1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_1.xxxx;
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
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD3.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
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
uniform 	mediump float _Hue;
uniform 	mediump vec3 _UV_BallFace_OffsetXYZ;
uniform 	mediump float _UV_BallFace_TileScale;
uniform 	mediump float _UV_BallFace_Power;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	mediump float _Noise_Scale;
uniform 	mediump float _Custom;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	mediump float _NoiseTexMixedPower;
uniform 	vec4 _NGonUV_XYVxVy;
uniform 	vec4 _NGonUV_AnchorAndTiling;
uniform 	vec4 _NGonUV_AnchorAndRoaRov;
uniform 	float _NGonUVNoisePower;
uniform 	mediump float _Soft;
uniform 	mediump vec4 _NGon_RoaRovSfRdn;
uniform 	mediump vec4 _NGon_SidesScaleWH;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _ColorIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTexture;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD3.xyz + (-_UV_BallFace_OffsetXYZ.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + _UV_BallFace_TileScale;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) * 0.100000001 + 1.0;
    u_xlat16_1.xy = (-u_xlat0.xy) * u_xlat16_1.xx;
    u_xlat0.xy = vs_TEXCOORD3.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat16_17 = _Custom * vs_TEXCOORD4.w + _Noise_Scale;
    u_xlat16.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(u_xlat16_17);
    u_xlat2.xy = u_xlat16.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16.xy + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat16.x = _Time.y * 0.00100000005;
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 1000.0;
    u_xlat16_17 = _NoiseTexUV_AnchorAndRotator.w * u_xlat16.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_UV_BallFace_Power) + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = (-u_xlat10_0) + 0.5;
    u_xlat16_1.x = _NoiseTexMixedPower * u_xlat16_1.x + u_xlat10_0;
    u_xlat16_9.x = u_xlat16_1.x + -0.400000006;
    u_xlat0.xy = vec2(vec2(_Custom, _Custom)) * vs_TEXCOORD4.xy + _NGonUV_XYVxVy.xy;
    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD3.xy;
    u_xlat2.xy = _NGonUV_AnchorAndTiling.zw + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NGonUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * _NGonUV_AnchorAndTiling.zw + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NGonUV_AnchorAndRoaRov.xy);
    u_xlat16_17 = _NGonUV_AnchorAndRoaRov.w * u_xlat16.x + _NGonUV_AnchorAndRoaRov.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NGonUV_AnchorAndRoaRov.xy;
    u_xlat0.xy = (-_NGonUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_9.xx;
    u_xlat0.xy = u_xlat16.xy * vec2(_NGonUVNoisePower) + u_xlat0.xy;
    u_xlat16.xy = fract(u_xlat0.xy);
    u_xlat10_2 = texture2D(_MainTexture, u_xlat0.xy);
    u_xlat16_2 = u_xlat10_2 * vs_COLOR0;
    u_xlat16_2 = u_xlat16_2 * _MainColor;
    u_xlat16_9.x = _Custom * vs_TEXCOORD4.z + _NGon_SidesScaleWH.y;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_9.x * -0.5;
    u_xlat0.xy = u_xlat16.xy * u_xlat16_9.xx + vec2(u_xlat16_17);
    u_xlat16.x = 3.14159274 / _NGon_SidesScaleWH.x;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat16_9.xy = u_xlat16.xx * _NGon_SidesScaleWH.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_9.xy;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.x * 0.00555555569;
    u_xlat16.x = _NGon_RoaRovSfRdn.y * _Time.y + u_xlat16_9.x;
    u_xlat16.x = u_xlat16.x * 3.14159274;
    u_xlat5.x = sin(u_xlat16.x);
    u_xlat6 = cos(u_xlat16.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat16.x = dot(u_xlat0.xy, u_xlat7.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat7.yz);
    u_xlat16_9.x = max(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = min(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_17 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat0.x = u_xlat16_17 * 0.0208350997 + -0.0851330012;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.180141002;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + -0.330299497;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.999866009;
    u_xlat8 = u_xlat0.x * u_xlat16_9.x;
    u_xlat8 = u_xlat8 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat16.x)<abs(u_xlat3.x);
    u_xlat8 = u_xlatb24 ? u_xlat8 : float(0.0);
    u_xlat0.x = u_xlat16_9.x * u_xlat0.x + u_xlat8;
    u_xlatb8 = (-u_xlat16.x)<u_xlat16.x;
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = min((-u_xlat16.x), u_xlat3.x);
    u_xlatb8 = u_xlat16_9.x<(-u_xlat16_9.x);
    u_xlat16_9.x = max((-u_xlat16.x), u_xlat3.x);
    u_xlat3.yw = (-u_xlat16.xx);
    u_xlatb16 = u_xlat16_9.x>=(-u_xlat16_9.x);
    u_xlatb8 = u_xlatb16 && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat16_9.x = 6.28318548 / _NGon_SidesScaleWH.x;
    u_xlat16_17 = u_xlat0.x / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_17 + 0.5;
    u_xlat16_17 = floor(u_xlat16_17);
    u_xlat16_9.x = u_xlat16_17 * u_xlat16_9.x + (-u_xlat0.x);
    u_xlat16_9.x = cos(u_xlat16_9.x);
    u_xlat3.z = u_xlat3.x;
    u_xlat16_17 = dot(u_xlat3.xy, u_xlat3.zw);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_25 = _NGon_SidesScaleWH.x + _NGon_SidesScaleWH.x;
    u_xlat16_25 = 360.0 / u_xlat16_25;
    u_xlat0.x = u_xlat16_25 * 0.0174532942;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17;
    u_xlat8 = u_xlat16_9.x * u_xlat16_17 + (-u_xlat0.x);
    u_xlat0.x = _NGon_RoaRovSfRdn.w * u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.z * 0.499900013 + 0.500100017;
    u_xlat16_17 = u_xlat0.x + (-u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * -2.0 + 1.0;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_17 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
    u_xlat16_9.x = (-u_xlat16_1.x) + u_xlat16_9.x;
    u_xlat16_1.x = u_xlat16_9.x * 1.5 + u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_9.x = float(1.0) / _Soft;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_2.w;
    u_xlat16_1.xyw = u_xlat16_2.yzx * vec3(_ColorIntensity);
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_ColorIntensity) + (-u_xlat16_3.xy);
    u_xlatb5 = u_xlat16_3.y>=u_xlat16_1.y;
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_3;
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_4.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_1.x + (-u_xlat16_4.x);
    u_xlat16_12 = u_xlat16_4.x * 6.0 + 1.00000001e-10;
    u_xlat16_9.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_12;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_1.z;
    u_xlat16_9.x = abs(u_xlat16_9.x) + _Hue;
    u_xlat16_9.xyz = u_xlat16_9.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_9.xyz = fract(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_9.xyz = abs(u_xlat16_9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = u_xlat16_1.x + 1.00000001e-10;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12;
    u_xlat16_4.x = u_xlat16_4.x * _Saturation;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat16_1.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_1.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelRect.zw;
    u_xlat16_1.xy = u_xlat16_1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_1.xxxx;
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
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD3.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
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
uniform 	mediump float _Hue;
uniform 	mediump vec3 _UV_BallFace_OffsetXYZ;
uniform 	mediump float _UV_BallFace_TileScale;
uniform 	mediump float _UV_BallFace_Power;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	mediump float _Noise_Scale;
uniform 	mediump float _Custom;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	mediump float _NoiseTexMixedPower;
uniform 	vec4 _NGonUV_XYVxVy;
uniform 	vec4 _NGonUV_AnchorAndTiling;
uniform 	vec4 _NGonUV_AnchorAndRoaRov;
uniform 	float _NGonUVNoisePower;
uniform 	mediump float _Soft;
uniform 	mediump vec4 _NGon_RoaRovSfRdn;
uniform 	mediump vec4 _NGon_SidesScaleWH;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _ColorIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTexture;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD3.xyz + (-_UV_BallFace_OffsetXYZ.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + _UV_BallFace_TileScale;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) * 0.100000001 + 1.0;
    u_xlat16_1.xy = (-u_xlat0.xy) * u_xlat16_1.xx;
    u_xlat0.xy = vs_TEXCOORD3.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat16_17 = _Custom * vs_TEXCOORD4.w + _Noise_Scale;
    u_xlat16.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(u_xlat16_17);
    u_xlat2.xy = u_xlat16.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16.xy + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat16.x = _Time.y * 0.00100000005;
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 1000.0;
    u_xlat16_17 = _NoiseTexUV_AnchorAndRotator.w * u_xlat16.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_UV_BallFace_Power) + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = (-u_xlat10_0) + 0.5;
    u_xlat16_1.x = _NoiseTexMixedPower * u_xlat16_1.x + u_xlat10_0;
    u_xlat16_9.x = u_xlat16_1.x + -0.400000006;
    u_xlat0.xy = vec2(vec2(_Custom, _Custom)) * vs_TEXCOORD4.xy + _NGonUV_XYVxVy.xy;
    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD3.xy;
    u_xlat2.xy = _NGonUV_AnchorAndTiling.zw + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NGonUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * _NGonUV_AnchorAndTiling.zw + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NGonUV_AnchorAndRoaRov.xy);
    u_xlat16_17 = _NGonUV_AnchorAndRoaRov.w * u_xlat16.x + _NGonUV_AnchorAndRoaRov.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NGonUV_AnchorAndRoaRov.xy;
    u_xlat0.xy = (-_NGonUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_9.xx;
    u_xlat0.xy = u_xlat16.xy * vec2(_NGonUVNoisePower) + u_xlat0.xy;
    u_xlat16.xy = fract(u_xlat0.xy);
    u_xlat10_2 = texture2D(_MainTexture, u_xlat0.xy);
    u_xlat16_2 = u_xlat10_2 * vs_COLOR0;
    u_xlat16_2 = u_xlat16_2 * _MainColor;
    u_xlat16_9.x = _Custom * vs_TEXCOORD4.z + _NGon_SidesScaleWH.y;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_9.x * -0.5;
    u_xlat0.xy = u_xlat16.xy * u_xlat16_9.xx + vec2(u_xlat16_17);
    u_xlat16.x = 3.14159274 / _NGon_SidesScaleWH.x;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat16_9.xy = u_xlat16.xx * _NGon_SidesScaleWH.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_9.xy;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.x * 0.00555555569;
    u_xlat16.x = _NGon_RoaRovSfRdn.y * _Time.y + u_xlat16_9.x;
    u_xlat16.x = u_xlat16.x * 3.14159274;
    u_xlat5.x = sin(u_xlat16.x);
    u_xlat6 = cos(u_xlat16.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat16.x = dot(u_xlat0.xy, u_xlat7.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat7.yz);
    u_xlat16_9.x = max(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = min(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_17 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat0.x = u_xlat16_17 * 0.0208350997 + -0.0851330012;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.180141002;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + -0.330299497;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.999866009;
    u_xlat8 = u_xlat0.x * u_xlat16_9.x;
    u_xlat8 = u_xlat8 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat16.x)<abs(u_xlat3.x);
    u_xlat8 = u_xlatb24 ? u_xlat8 : float(0.0);
    u_xlat0.x = u_xlat16_9.x * u_xlat0.x + u_xlat8;
    u_xlatb8 = (-u_xlat16.x)<u_xlat16.x;
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = min((-u_xlat16.x), u_xlat3.x);
    u_xlatb8 = u_xlat16_9.x<(-u_xlat16_9.x);
    u_xlat16_9.x = max((-u_xlat16.x), u_xlat3.x);
    u_xlat3.yw = (-u_xlat16.xx);
    u_xlatb16 = u_xlat16_9.x>=(-u_xlat16_9.x);
    u_xlatb8 = u_xlatb16 && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat16_9.x = 6.28318548 / _NGon_SidesScaleWH.x;
    u_xlat16_17 = u_xlat0.x / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_17 + 0.5;
    u_xlat16_17 = floor(u_xlat16_17);
    u_xlat16_9.x = u_xlat16_17 * u_xlat16_9.x + (-u_xlat0.x);
    u_xlat16_9.x = cos(u_xlat16_9.x);
    u_xlat3.z = u_xlat3.x;
    u_xlat16_17 = dot(u_xlat3.xy, u_xlat3.zw);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_25 = _NGon_SidesScaleWH.x + _NGon_SidesScaleWH.x;
    u_xlat16_25 = 360.0 / u_xlat16_25;
    u_xlat0.x = u_xlat16_25 * 0.0174532942;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17;
    u_xlat8 = u_xlat16_9.x * u_xlat16_17 + (-u_xlat0.x);
    u_xlat0.x = _NGon_RoaRovSfRdn.w * u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.z * 0.499900013 + 0.500100017;
    u_xlat16_17 = u_xlat0.x + (-u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * -2.0 + 1.0;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_17 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
    u_xlat16_9.x = (-u_xlat16_1.x) + u_xlat16_9.x;
    u_xlat16_1.x = u_xlat16_9.x * 1.5 + u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_9.x = float(1.0) / _Soft;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_2.w;
    u_xlat16_1.xyw = u_xlat16_2.yzx * vec3(_ColorIntensity);
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_ColorIntensity) + (-u_xlat16_3.xy);
    u_xlatb5 = u_xlat16_3.y>=u_xlat16_1.y;
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_3;
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_4.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_1.x + (-u_xlat16_4.x);
    u_xlat16_12 = u_xlat16_4.x * 6.0 + 1.00000001e-10;
    u_xlat16_9.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_12;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_1.z;
    u_xlat16_9.x = abs(u_xlat16_9.x) + _Hue;
    u_xlat16_9.xyz = u_xlat16_9.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_9.xyz = fract(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_9.xyz = abs(u_xlat16_9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = u_xlat16_1.x + 1.00000001e-10;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12;
    u_xlat16_4.x = u_xlat16_4.x * _Saturation;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat16_1.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_1.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelRect.zw;
    u_xlat16_1.xy = u_xlat16_1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_1.xxxx;
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
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD3.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
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
uniform 	mediump float _Hue;
uniform 	mediump vec3 _UV_BallFace_OffsetXYZ;
uniform 	mediump float _UV_BallFace_TileScale;
uniform 	mediump float _UV_BallFace_Power;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	mediump float _Noise_Scale;
uniform 	mediump float _Custom;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	mediump float _NoiseTexMixedPower;
uniform 	vec4 _NGonUV_XYVxVy;
uniform 	vec4 _NGonUV_AnchorAndTiling;
uniform 	vec4 _NGonUV_AnchorAndRoaRov;
uniform 	float _NGonUVNoisePower;
uniform 	mediump float _Soft;
uniform 	mediump vec4 _NGon_RoaRovSfRdn;
uniform 	mediump vec4 _NGon_SidesScaleWH;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _ColorIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTexture;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD3.xyz + (-_UV_BallFace_OffsetXYZ.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + _UV_BallFace_TileScale;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) * 0.100000001 + 1.0;
    u_xlat16_1.xy = (-u_xlat0.xy) * u_xlat16_1.xx;
    u_xlat0.xy = vs_TEXCOORD3.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat16_17 = _Custom * vs_TEXCOORD4.w + _Noise_Scale;
    u_xlat16.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(u_xlat16_17);
    u_xlat2.xy = u_xlat16.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16.xy + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat16.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16.x>=(-u_xlat16.x));
#else
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
#endif
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 1000.0;
    u_xlat16_17 = _NoiseTexUV_AnchorAndRotator.w * u_xlat16.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_UV_BallFace_Power) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = (-u_xlat16_0.x) + 0.5;
    u_xlat16_1.x = _NoiseTexMixedPower * u_xlat16_1.x + u_xlat16_0.x;
    u_xlat16_9.x = u_xlat16_1.x + -0.400000006;
    u_xlat0.xy = vec2(vec2(_Custom, _Custom)) * vs_TEXCOORD4.xy + _NGonUV_XYVxVy.xy;
    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD3.xy;
    u_xlat2.xy = _NGonUV_AnchorAndTiling.zw + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NGonUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * _NGonUV_AnchorAndTiling.zw + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NGonUV_AnchorAndRoaRov.xy);
    u_xlat16_17 = _NGonUV_AnchorAndRoaRov.w * u_xlat16.x + _NGonUV_AnchorAndRoaRov.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NGonUV_AnchorAndRoaRov.xy;
    u_xlat0.xy = (-_NGonUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_9.xx;
    u_xlat0.xy = u_xlat16.xy * vec2(_NGonUVNoisePower) + u_xlat0.xy;
    u_xlat16.xy = fract(u_xlat0.xy);
    u_xlat16_2 = texture(_MainTexture, u_xlat0.xy);
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_2 = u_xlat16_2 * _MainColor;
    u_xlat16_9.x = _Custom * vs_TEXCOORD4.z + _NGon_SidesScaleWH.y;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_9.x * -0.5;
    u_xlat0.xy = u_xlat16.xy * u_xlat16_9.xx + vec2(u_xlat16_17);
    u_xlat16.x = 3.14159274 / _NGon_SidesScaleWH.x;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat16_9.xy = u_xlat16.xx * _NGon_SidesScaleWH.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_9.xy;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.x * 0.00555555569;
    u_xlat16.x = _NGon_RoaRovSfRdn.y * _Time.y + u_xlat16_9.x;
    u_xlat16.x = u_xlat16.x * 3.14159274;
    u_xlat5.x = sin(u_xlat16.x);
    u_xlat6 = cos(u_xlat16.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat16.x = dot(u_xlat0.xy, u_xlat7.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat7.yz);
    u_xlat16_9.x = max(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = min(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_17 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat0.x = u_xlat16_17 * 0.0208350997 + -0.0851330012;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.180141002;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + -0.330299497;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.999866009;
    u_xlat8 = u_xlat0.x * u_xlat16_9.x;
    u_xlat8 = u_xlat8 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat16.x)<abs(u_xlat3.x));
#else
    u_xlatb24 = abs(u_xlat16.x)<abs(u_xlat3.x);
#endif
    u_xlat8 = u_xlatb24 ? u_xlat8 : float(0.0);
    u_xlat0.x = u_xlat16_9.x * u_xlat0.x + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!((-u_xlat16.x)<u_xlat16.x);
#else
    u_xlatb8 = (-u_xlat16.x)<u_xlat16.x;
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = min((-u_xlat16.x), u_xlat3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_9.x<(-u_xlat16_9.x));
#else
    u_xlatb8 = u_xlat16_9.x<(-u_xlat16_9.x);
#endif
    u_xlat16_9.x = max((-u_xlat16.x), u_xlat3.x);
    u_xlat3.yw = (-u_xlat16.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_9.x>=(-u_xlat16_9.x));
#else
    u_xlatb16 = u_xlat16_9.x>=(-u_xlat16_9.x);
#endif
    u_xlatb8 = u_xlatb16 && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat16_9.x = 6.28318548 / _NGon_SidesScaleWH.x;
    u_xlat16_17 = u_xlat0.x / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_17 + 0.5;
    u_xlat16_17 = floor(u_xlat16_17);
    u_xlat16_9.x = u_xlat16_17 * u_xlat16_9.x + (-u_xlat0.x);
    u_xlat16_9.x = cos(u_xlat16_9.x);
    u_xlat3.z = u_xlat3.x;
    u_xlat16_17 = dot(u_xlat3.xy, u_xlat3.zw);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_25 = _NGon_SidesScaleWH.x + _NGon_SidesScaleWH.x;
    u_xlat16_25 = 360.0 / u_xlat16_25;
    u_xlat0.x = u_xlat16_25 * 0.0174532942;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17;
    u_xlat8 = u_xlat16_9.x * u_xlat16_17 + (-u_xlat0.x);
    u_xlat0.x = _NGon_RoaRovSfRdn.w * u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.z * 0.499900013 + 0.500100017;
    u_xlat16_17 = u_xlat0.x + (-u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * -2.0 + 1.0;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_17 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
    u_xlat16_9.x = (-u_xlat16_1.x) + u_xlat16_9.x;
    u_xlat16_1.x = u_xlat16_9.x * 1.5 + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = float(1.0) / _Soft;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_2.w;
    u_xlat16_1.xyw = u_xlat16_2.yzx * vec3(_ColorIntensity);
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_ColorIntensity) + (-u_xlat16_3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_3.y>=u_xlat16_1.y);
#else
    u_xlatb5 = u_xlat16_3.y>=u_xlat16_1.y;
#endif
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.w>=u_xlat16_2.x);
#else
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
#endif
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_4.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_1.x + (-u_xlat16_4.x);
    u_xlat16_12 = u_xlat16_4.x * 6.0 + 1.00000001e-10;
    u_xlat16_9.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_12;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_1.z;
    u_xlat16_9.x = abs(u_xlat16_9.x) + _Hue;
    u_xlat16_9.xyz = u_xlat16_9.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_9.xyz = fract(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_9.xyz = abs(u_xlat16_9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = u_xlat16_1.x + 1.00000001e-10;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12;
    u_xlat16_4.x = u_xlat16_4.x * _Saturation;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat16_1.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_1.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_1.xxxx;
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
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD3.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
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
uniform 	mediump float _Hue;
uniform 	mediump vec3 _UV_BallFace_OffsetXYZ;
uniform 	mediump float _UV_BallFace_TileScale;
uniform 	mediump float _UV_BallFace_Power;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	mediump float _Noise_Scale;
uniform 	mediump float _Custom;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	mediump float _NoiseTexMixedPower;
uniform 	vec4 _NGonUV_XYVxVy;
uniform 	vec4 _NGonUV_AnchorAndTiling;
uniform 	vec4 _NGonUV_AnchorAndRoaRov;
uniform 	float _NGonUVNoisePower;
uniform 	mediump float _Soft;
uniform 	mediump vec4 _NGon_RoaRovSfRdn;
uniform 	mediump vec4 _NGon_SidesScaleWH;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _ColorIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTexture;
in mediump vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD3.xyz + (-_UV_BallFace_OffsetXYZ.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + _UV_BallFace_TileScale;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) * 0.100000001 + 1.0;
    u_xlat16_1.xy = (-u_xlat0.xy) * u_xlat16_1.xx;
    u_xlat0.xy = vs_TEXCOORD3.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat16_17 = _Custom * vs_TEXCOORD4.w + _Noise_Scale;
    u_xlat16.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(u_xlat16_17);
    u_xlat2.xy = u_xlat16.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16.xy + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat16.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16.x>=(-u_xlat16.x));
#else
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
#endif
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 1000.0;
    u_xlat16_17 = _NoiseTexUV_AnchorAndRotator.w * u_xlat16.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_UV_BallFace_Power) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = (-u_xlat16_0.x) + 0.5;
    u_xlat16_1.x = _NoiseTexMixedPower * u_xlat16_1.x + u_xlat16_0.x;
    u_xlat16_9.x = u_xlat16_1.x + -0.400000006;
    u_xlat0.xy = vec2(vec2(_Custom, _Custom)) * vs_TEXCOORD4.xy + _NGonUV_XYVxVy.xy;
    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD3.xy;
    u_xlat2.xy = _NGonUV_AnchorAndTiling.zw + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NGonUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * _NGonUV_AnchorAndTiling.zw + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NGonUV_AnchorAndRoaRov.xy);
    u_xlat16_17 = _NGonUV_AnchorAndRoaRov.w * u_xlat16.x + _NGonUV_AnchorAndRoaRov.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NGonUV_AnchorAndRoaRov.xy;
    u_xlat0.xy = (-_NGonUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_9.xx;
    u_xlat0.xy = u_xlat16.xy * vec2(_NGonUVNoisePower) + u_xlat0.xy;
    u_xlat16.xy = fract(u_xlat0.xy);
    u_xlat16_2 = texture(_MainTexture, u_xlat0.xy);
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_2 = u_xlat16_2 * _MainColor;
    u_xlat16_9.x = _Custom * vs_TEXCOORD4.z + _NGon_SidesScaleWH.y;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_9.x * -0.5;
    u_xlat0.xy = u_xlat16.xy * u_xlat16_9.xx + vec2(u_xlat16_17);
    u_xlat16.x = 3.14159274 / _NGon_SidesScaleWH.x;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat16_9.xy = u_xlat16.xx * _NGon_SidesScaleWH.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_9.xy;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.x * 0.00555555569;
    u_xlat16.x = _NGon_RoaRovSfRdn.y * _Time.y + u_xlat16_9.x;
    u_xlat16.x = u_xlat16.x * 3.14159274;
    u_xlat5.x = sin(u_xlat16.x);
    u_xlat6 = cos(u_xlat16.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat16.x = dot(u_xlat0.xy, u_xlat7.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat7.yz);
    u_xlat16_9.x = max(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = min(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_17 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat0.x = u_xlat16_17 * 0.0208350997 + -0.0851330012;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.180141002;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + -0.330299497;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.999866009;
    u_xlat8 = u_xlat0.x * u_xlat16_9.x;
    u_xlat8 = u_xlat8 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(abs(u_xlat16.x)<abs(u_xlat3.x));
#else
    u_xlatb24 = abs(u_xlat16.x)<abs(u_xlat3.x);
#endif
    u_xlat8 = u_xlatb24 ? u_xlat8 : float(0.0);
    u_xlat0.x = u_xlat16_9.x * u_xlat0.x + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!((-u_xlat16.x)<u_xlat16.x);
#else
    u_xlatb8 = (-u_xlat16.x)<u_xlat16.x;
#endif
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = min((-u_xlat16.x), u_xlat3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_9.x<(-u_xlat16_9.x));
#else
    u_xlatb8 = u_xlat16_9.x<(-u_xlat16_9.x);
#endif
    u_xlat16_9.x = max((-u_xlat16.x), u_xlat3.x);
    u_xlat3.yw = (-u_xlat16.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_9.x>=(-u_xlat16_9.x));
#else
    u_xlatb16 = u_xlat16_9.x>=(-u_xlat16_9.x);
#endif
    u_xlatb8 = u_xlatb16 && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat16_9.x = 6.28318548 / _NGon_SidesScaleWH.x;
    u_xlat16_17 = u_xlat0.x / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_17 + 0.5;
    u_xlat16_17 = floor(u_xlat16_17);
    u_xlat16_9.x = u_xlat16_17 * u_xlat16_9.x + (-u_xlat0.x);
    u_xlat16_9.x = cos(u_xlat16_9.x);
    u_xlat3.z = u_xlat3.x;
    u_xlat16_17 = dot(u_xlat3.xy, u_xlat3.zw);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_25 = _NGon_SidesScaleWH.x + _NGon_SidesScaleWH.x;
    u_xlat16_25 = 360.0 / u_xlat16_25;
    u_xlat0.x = u_xlat16_25 * 0.0174532942;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17;
    u_xlat8 = u_xlat16_9.x * u_xlat16_17 + (-u_xlat0.x);
    u_xlat0.x = _NGon_RoaRovSfRdn.w * u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.z * 0.499900013 + 0.500100017;
    u_xlat16_17 = u_xlat0.x + (-u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * -2.0 + 1.0;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_17 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
    u_xlat16_9.x = (-u_xlat16_1.x) + u_xlat16_9.x;
    u_xlat16_1.x = u_xlat16_9.x * 1.5 + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = float(1.0) / _Soft;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_2.w;
    u_xlat16_1.xyw = u_xlat16_2.yzx * vec3(_ColorIntensity);
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_ColorIntensity) + (-u_xlat16_3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_3.y>=u_xlat16_1.y);
#else
    u_xlatb5 = u_xlat16_3.y>=u_xlat16_1.y;
#endif
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_1.w>=u_xlat16_2.x);
#else
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
#endif
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_4.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_1.x + (-u_xlat16_4.x);
    u_xlat16_12 = u_xlat16_4.x * 6.0 + 1.00000001e-10;
    u_xlat16_9.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_12;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_1.z;
    u_xlat16_9.x = abs(u_xlat16_9.x) + _Hue;
    u_xlat16_9.xyz = u_xlat16_9.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_9.xyz = fract(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_9.xyz = abs(u_xlat16_9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyz = min(max(u_xlat16_9.xyz, 0.0), 1.0);
#else
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = u_xlat16_1.x + 1.00000001e-10;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12;
    u_xlat16_4.x = u_xlat16_4.x * _Saturation;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat16_1.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_1.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_1.xxxx;
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
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD3.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
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
uniform 	mediump float _Hue;
uniform 	mediump vec3 _UV_BallFace_OffsetXYZ;
uniform 	mediump float _UV_BallFace_TileScale;
uniform 	mediump float _UV_BallFace_Power;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	mediump float _Noise_Scale;
uniform 	mediump float _Custom;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	mediump float _NoiseTexMixedPower;
uniform 	vec4 _NGonUV_XYVxVy;
uniform 	vec4 _NGonUV_AnchorAndTiling;
uniform 	vec4 _NGonUV_AnchorAndRoaRov;
uniform 	float _NGonUVNoisePower;
uniform 	mediump float _Soft;
uniform 	mediump vec4 _NGon_RoaRovSfRdn;
uniform 	mediump vec4 _NGon_SidesScaleWH;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _ColorIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTexture;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD3.xyz + (-_UV_BallFace_OffsetXYZ.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + _UV_BallFace_TileScale;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) * 0.100000001 + 1.0;
    u_xlat16_1.xy = (-u_xlat0.xy) * u_xlat16_1.xx;
    u_xlat0.xy = vs_TEXCOORD3.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat16_17 = _Custom * vs_TEXCOORD4.w + _Noise_Scale;
    u_xlat16.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(u_xlat16_17);
    u_xlat2.xy = u_xlat16.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16.xy + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat16.x = _Time.y * 0.00100000005;
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 1000.0;
    u_xlat16_17 = _NoiseTexUV_AnchorAndRotator.w * u_xlat16.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_UV_BallFace_Power) + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = (-u_xlat10_0) + 0.5;
    u_xlat16_1.x = _NoiseTexMixedPower * u_xlat16_1.x + u_xlat10_0;
    u_xlat16_9.x = u_xlat16_1.x + -0.400000006;
    u_xlat0.xy = vec2(vec2(_Custom, _Custom)) * vs_TEXCOORD4.xy + _NGonUV_XYVxVy.xy;
    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD3.xy;
    u_xlat2.xy = _NGonUV_AnchorAndTiling.zw + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NGonUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * _NGonUV_AnchorAndTiling.zw + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NGonUV_AnchorAndRoaRov.xy);
    u_xlat16_17 = _NGonUV_AnchorAndRoaRov.w * u_xlat16.x + _NGonUV_AnchorAndRoaRov.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NGonUV_AnchorAndRoaRov.xy;
    u_xlat0.xy = (-_NGonUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_9.xx;
    u_xlat0.xy = u_xlat16.xy * vec2(_NGonUVNoisePower) + u_xlat0.xy;
    u_xlat16.xy = fract(u_xlat0.xy);
    u_xlat10_2 = texture2D(_MainTexture, u_xlat0.xy);
    u_xlat16_2 = u_xlat10_2 * vs_COLOR0;
    u_xlat16_2 = u_xlat16_2 * _MainColor;
    u_xlat16_9.x = _Custom * vs_TEXCOORD4.z + _NGon_SidesScaleWH.y;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_9.x * -0.5;
    u_xlat0.xy = u_xlat16.xy * u_xlat16_9.xx + vec2(u_xlat16_17);
    u_xlat16.x = 3.14159274 / _NGon_SidesScaleWH.x;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat16_9.xy = u_xlat16.xx * _NGon_SidesScaleWH.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_9.xy;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.x * 0.00555555569;
    u_xlat16.x = _NGon_RoaRovSfRdn.y * _Time.y + u_xlat16_9.x;
    u_xlat16.x = u_xlat16.x * 3.14159274;
    u_xlat5.x = sin(u_xlat16.x);
    u_xlat6 = cos(u_xlat16.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat16.x = dot(u_xlat0.xy, u_xlat7.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat7.yz);
    u_xlat16_9.x = max(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = min(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_17 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat0.x = u_xlat16_17 * 0.0208350997 + -0.0851330012;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.180141002;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + -0.330299497;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.999866009;
    u_xlat8 = u_xlat0.x * u_xlat16_9.x;
    u_xlat8 = u_xlat8 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat16.x)<abs(u_xlat3.x);
    u_xlat8 = u_xlatb24 ? u_xlat8 : float(0.0);
    u_xlat0.x = u_xlat16_9.x * u_xlat0.x + u_xlat8;
    u_xlatb8 = (-u_xlat16.x)<u_xlat16.x;
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = min((-u_xlat16.x), u_xlat3.x);
    u_xlatb8 = u_xlat16_9.x<(-u_xlat16_9.x);
    u_xlat16_9.x = max((-u_xlat16.x), u_xlat3.x);
    u_xlat3.yw = (-u_xlat16.xx);
    u_xlatb16 = u_xlat16_9.x>=(-u_xlat16_9.x);
    u_xlatb8 = u_xlatb16 && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat16_9.x = 6.28318548 / _NGon_SidesScaleWH.x;
    u_xlat16_17 = u_xlat0.x / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_17 + 0.5;
    u_xlat16_17 = floor(u_xlat16_17);
    u_xlat16_9.x = u_xlat16_17 * u_xlat16_9.x + (-u_xlat0.x);
    u_xlat16_9.x = cos(u_xlat16_9.x);
    u_xlat3.z = u_xlat3.x;
    u_xlat16_17 = dot(u_xlat3.xy, u_xlat3.zw);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_25 = _NGon_SidesScaleWH.x + _NGon_SidesScaleWH.x;
    u_xlat16_25 = 360.0 / u_xlat16_25;
    u_xlat0.x = u_xlat16_25 * 0.0174532942;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17;
    u_xlat8 = u_xlat16_9.x * u_xlat16_17 + (-u_xlat0.x);
    u_xlat0.x = _NGon_RoaRovSfRdn.w * u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.z * 0.499900013 + 0.500100017;
    u_xlat16_17 = u_xlat0.x + (-u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * -2.0 + 1.0;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_17 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
    u_xlat16_9.x = (-u_xlat16_1.x) + u_xlat16_9.x;
    u_xlat16_1.x = u_xlat16_9.x * 1.5 + u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_9.x = float(1.0) / _Soft;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_2.w;
    u_xlat16_1.xyw = u_xlat16_2.yzx * vec3(_ColorIntensity);
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_ColorIntensity) + (-u_xlat16_3.xy);
    u_xlatb5 = u_xlat16_3.y>=u_xlat16_1.y;
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_3;
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_4.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_1.x + (-u_xlat16_4.x);
    u_xlat16_12 = u_xlat16_4.x * 6.0 + 1.00000001e-10;
    u_xlat16_9.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_12;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_1.z;
    u_xlat16_9.x = abs(u_xlat16_9.x) + _Hue;
    u_xlat16_9.xyz = u_xlat16_9.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_9.xyz = fract(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_9.xyz = abs(u_xlat16_9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = u_xlat16_1.x + 1.00000001e-10;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12;
    u_xlat16_4.x = u_xlat16_4.x * _Saturation;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat16_1.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_1.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_1.xxxx;
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
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD3.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD3.w = 0.0;
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
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
uniform 	mediump float _Hue;
uniform 	mediump vec3 _UV_BallFace_OffsetXYZ;
uniform 	mediump float _UV_BallFace_TileScale;
uniform 	mediump float _UV_BallFace_Power;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	mediump float _Noise_Scale;
uniform 	mediump float _Custom;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	mediump float _NoiseTexMixedPower;
uniform 	vec4 _NGonUV_XYVxVy;
uniform 	vec4 _NGonUV_AnchorAndTiling;
uniform 	vec4 _NGonUV_AnchorAndRoaRov;
uniform 	float _NGonUVNoisePower;
uniform 	mediump float _Soft;
uniform 	mediump vec4 _NGon_RoaRovSfRdn;
uniform 	mediump vec4 _NGon_SidesScaleWH;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _ColorIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTexture;
varying mediump vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_12;
vec2 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb24;
mediump float u_xlat16_25;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD3.xyz + (-_UV_BallFace_OffsetXYZ.xyz);
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + _UV_BallFace_TileScale;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) * 0.100000001 + 1.0;
    u_xlat16_1.xy = (-u_xlat0.xy) * u_xlat16_1.xx;
    u_xlat0.xy = vs_TEXCOORD3.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat16_17 = _Custom * vs_TEXCOORD4.w + _Noise_Scale;
    u_xlat16.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(u_xlat16_17);
    u_xlat2.xy = u_xlat16.xy + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat16.xy + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat16.x = _Time.y * 0.00100000005;
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
    u_xlat16.x = u_xlat16.x * 1000.0;
    u_xlat16_17 = _NoiseTexUV_AnchorAndRotator.w * u_xlat16.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_UV_BallFace_Power) + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = (-u_xlat10_0) + 0.5;
    u_xlat16_1.x = _NoiseTexMixedPower * u_xlat16_1.x + u_xlat10_0;
    u_xlat16_9.x = u_xlat16_1.x + -0.400000006;
    u_xlat0.xy = vec2(vec2(_Custom, _Custom)) * vs_TEXCOORD4.xy + _NGonUV_XYVxVy.xy;
    u_xlat0.xy = (-u_xlat0.xy) + vs_TEXCOORD3.xy;
    u_xlat2.xy = _NGonUV_AnchorAndTiling.zw + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * _NGonUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * _NGonUV_AnchorAndTiling.zw + (-u_xlat2.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NGonUV_AnchorAndRoaRov.xy);
    u_xlat16_17 = _NGonUV_AnchorAndRoaRov.w * u_xlat16.x + _NGonUV_AnchorAndRoaRov.z;
    u_xlat16_17 = u_xlat16_17 * 6.28318548;
    u_xlat16_3.x = sin(u_xlat16_17);
    u_xlat16_4.x = cos(u_xlat16_17);
    u_xlat2.x = (-u_xlat16_3.x);
    u_xlat16_4.y = u_xlat16_3.x;
    u_xlat5.x = dot(u_xlat0.xy, u_xlat16_4.xy);
    u_xlat2.y = u_xlat16_4.x;
    u_xlat5.y = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.xy = u_xlat5.xy + _NGonUV_AnchorAndRoaRov.xy;
    u_xlat0.xy = (-_NGonUV_XYVxVy.zw) * u_xlat16.xx + u_xlat0.xy;
    u_xlat16.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_9.xx;
    u_xlat0.xy = u_xlat16.xy * vec2(_NGonUVNoisePower) + u_xlat0.xy;
    u_xlat16.xy = fract(u_xlat0.xy);
    u_xlat10_2 = texture2D(_MainTexture, u_xlat0.xy);
    u_xlat16_2 = u_xlat10_2 * vs_COLOR0;
    u_xlat16_2 = u_xlat16_2 * _MainColor;
    u_xlat16_9.x = _Custom * vs_TEXCOORD4.z + _NGon_SidesScaleWH.y;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_9.x * -0.5;
    u_xlat0.xy = u_xlat16.xy * u_xlat16_9.xx + vec2(u_xlat16_17);
    u_xlat16.x = 3.14159274 / _NGon_SidesScaleWH.x;
    u_xlat16.x = cos(u_xlat16.x);
    u_xlat16_9.xy = u_xlat16.xx * _NGon_SidesScaleWH.zw;
    u_xlat0.xy = u_xlat0.xy / u_xlat16_9.xy;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.x * 0.00555555569;
    u_xlat16.x = _NGon_RoaRovSfRdn.y * _Time.y + u_xlat16_9.x;
    u_xlat16.x = u_xlat16.x * 3.14159274;
    u_xlat5.x = sin(u_xlat16.x);
    u_xlat6 = cos(u_xlat16.x);
    u_xlat7.z = u_xlat5.x;
    u_xlat7.y = u_xlat6;
    u_xlat7.x = (-u_xlat5.x);
    u_xlat16.x = dot(u_xlat0.xy, u_xlat7.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat7.yz);
    u_xlat16_9.x = max(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_17 = min(abs(u_xlat16.x), abs(u_xlat3.x));
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_17 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat0.x = u_xlat16_17 * 0.0208350997 + -0.0851330012;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.180141002;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + -0.330299497;
    u_xlat0.x = u_xlat16_17 * u_xlat0.x + 0.999866009;
    u_xlat8 = u_xlat0.x * u_xlat16_9.x;
    u_xlat8 = u_xlat8 * -2.0 + 1.57079637;
    u_xlatb24 = abs(u_xlat16.x)<abs(u_xlat3.x);
    u_xlat8 = u_xlatb24 ? u_xlat8 : float(0.0);
    u_xlat0.x = u_xlat16_9.x * u_xlat0.x + u_xlat8;
    u_xlatb8 = (-u_xlat16.x)<u_xlat16.x;
    u_xlat8 = u_xlatb8 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = min((-u_xlat16.x), u_xlat3.x);
    u_xlatb8 = u_xlat16_9.x<(-u_xlat16_9.x);
    u_xlat16_9.x = max((-u_xlat16.x), u_xlat3.x);
    u_xlat3.yw = (-u_xlat16.xx);
    u_xlatb16 = u_xlat16_9.x>=(-u_xlat16_9.x);
    u_xlatb8 = u_xlatb16 && u_xlatb8;
    u_xlat0.x = (u_xlatb8) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat16_9.x = 6.28318548 / _NGon_SidesScaleWH.x;
    u_xlat16_17 = u_xlat0.x / u_xlat16_9.x;
    u_xlat16_17 = u_xlat16_17 + 0.5;
    u_xlat16_17 = floor(u_xlat16_17);
    u_xlat16_9.x = u_xlat16_17 * u_xlat16_9.x + (-u_xlat0.x);
    u_xlat16_9.x = cos(u_xlat16_9.x);
    u_xlat3.z = u_xlat3.x;
    u_xlat16_17 = dot(u_xlat3.xy, u_xlat3.zw);
    u_xlat16_17 = sqrt(u_xlat16_17);
    u_xlat16_25 = _NGon_SidesScaleWH.x + _NGon_SidesScaleWH.x;
    u_xlat16_25 = 360.0 / u_xlat16_25;
    u_xlat0.x = u_xlat16_25 * 0.0174532942;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_17;
    u_xlat8 = u_xlat16_9.x * u_xlat16_17 + (-u_xlat0.x);
    u_xlat0.x = _NGon_RoaRovSfRdn.w * u_xlat8 + u_xlat0.x;
    u_xlat16_9.x = _NGon_RoaRovSfRdn.z * 0.499900013 + 0.500100017;
    u_xlat16_17 = u_xlat0.x + (-u_xlat16_9.x);
    u_xlat16_9.x = u_xlat16_9.x * -2.0 + 1.0;
    u_xlat16_9.x = float(1.0) / u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
    u_xlat16_17 = u_xlat16_9.x * -2.0 + 3.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_17;
    u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
    u_xlat16_9.x = (-u_xlat16_1.x) + u_xlat16_9.x;
    u_xlat16_1.x = u_xlat16_9.x * 1.5 + u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_9.x = float(1.0) / _Soft;
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9.x;
    u_xlat16_0.w = u_xlat16_1.x * u_xlat16_2.w;
    u_xlat16_1.xyw = u_xlat16_2.yzx * vec3(_ColorIntensity);
    u_xlat16_3.xy = u_xlat16_1.yx;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_ColorIntensity) + (-u_xlat16_3.xy);
    u_xlatb5 = u_xlat16_3.y>=u_xlat16_1.y;
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_3.z = float(-1.0);
    u_xlat16_3.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_3;
    u_xlatb5 = u_xlat16_1.w>=u_xlat16_2.x;
    u_xlat16_4.x = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_1.xyz = u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_1.wyx;
    u_xlat16_2 = (-u_xlat16_1) + u_xlat16_2;
    u_xlat16_1 = u_xlat16_4.xxxx * u_xlat16_2 + u_xlat16_1;
    u_xlat16_4.x = min(u_xlat16_1.y, u_xlat16_1.w);
    u_xlat16_4.x = u_xlat16_1.x + (-u_xlat16_4.x);
    u_xlat16_12 = u_xlat16_4.x * 6.0 + 1.00000001e-10;
    u_xlat16_9.x = (-u_xlat16_1.y) + u_xlat16_1.w;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_12;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_1.z;
    u_xlat16_9.x = abs(u_xlat16_9.x) + _Hue;
    u_xlat16_9.xyz = u_xlat16_9.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_9.xyz = fract(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_9.xyz = abs(u_xlat16_9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.xyz = clamp(u_xlat16_9.xyz, 0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = u_xlat16_1.x + 1.00000001e-10;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12;
    u_xlat16_4.x = u_xlat16_4.x * _Saturation;
    u_xlat16_9.xyz = u_xlat16_4.xxx * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat16_1.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_1.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_1.xxxx;
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
Local Keywords { "_USEDISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USEDISSOLVE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USEDISSOLVE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USEDISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_RAMPCOLORON_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_RAMPCOLORON_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_RAMPCOLORON_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_RAMPCOLORON_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_RAMPCOLORON_ON" "_USEDISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_RAMPCOLORON_ON" "_USEDISSOLVE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_RAMPCOLORON_ON" "_USEDISSOLVE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_RAMPCOLORON_ON" "_USEDISSOLVE_ON" }
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
Local Keywords { "_USEDISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USEDISSOLVE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USEDISSOLVE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USEDISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_RAMPCOLORON_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_RAMPCOLORON_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_RAMPCOLORON_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_RAMPCOLORON_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_RAMPCOLORON_ON" "_USEDISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_RAMPCOLORON_ON" "_USEDISSOLVE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_RAMPCOLORON_ON" "_USEDISSOLVE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_RAMPCOLORON_ON" "_USEDISSOLVE_ON" }
""
}
}
}
}
CustomEditor "AmplifyShaderEditor.MaterialInspector"
}