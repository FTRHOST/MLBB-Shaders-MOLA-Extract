//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UISpecial_FireNoise" {
Properties {

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2.0

[Enum(Off,0,On,1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(UnityEngine.Rendering.BlendMode)] _BlendSrc ("BlendSrc", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _BlendDst ("BlendDst", Float) = 10.0

_MainTex ("MainTex", 2D) = "white" { }

_MainMask ("MainMask", 2D) = "white" { }

_MainColor ("MainColor", Color) = (1,1,1,1)

_ColorIntensity ("ColorIntensity", Float) = 1.0

_NoiseTex ("NoiseTex", 2D) = "white" { }

_Noise_Scale ("Noise_Scale", Float) = 1.0

_NoiseTexUV_XYVxVy ("NoiseTexUV_XYVxVy", Vector) = (0,0,0.2,0.1)

_NoiseTexUV_AnchorAndTiling ("NoiseTexUV_AnchorAndTiling", Vector) = (0.5,0.5,1,1)

_NoiseTexUV_AnchorAndRotator ("NoiseTexUV_AnchorAndRotator", Vector) = (0.5,0.5,0,0)

_MaskNoiseTerxture ("MaskNoiseTerxture", 2D) = "white" { }

_MainTexNoisePower ("MainTexNoisePower", Range(0, 2)) = 0.3966968059539795

_PrefabSize ("PrefabSize", Float) = 1024.0

_Offset_Size ("Offset_Size", Vector) = (0,0,1024,1024)

_PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

_Float0 ("色相", Range(-0.5, 0.5)) = 0.0

_Float1 ("饱和度", Range(-1, 1)) = 0.0

_Float3 ("对比度", Range(0, 2)) = 1.0

[Enum()] _Stencil_Ref ("Stencil_Ref", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _Stencil_Comp ("Stencil_Comp", Float) = 8.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "Unlit"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 3801
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	float _Noise_Scale;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	vec4 _MaskNoiseTerxture_ST;
uniform 	float _MainTexNoisePower;
uniform 	vec4 _MainColor;
uniform 	float _ColorIntensity;
uniform 	float _Float0;
uniform 	float _Float1;
uniform 	float _Float3;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskNoiseTerxture;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainMask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
bool u_xlatb5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
vec2 u_xlat12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat12.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(_Noise_Scale);
    u_xlat1.xy = u_xlat12.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat12.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb18 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb18) ? u_xlat12.x : (-u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 1000.0;
    u_xlat18 = _NoiseTexUV_AnchorAndRotator.w * u_xlat12.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 6.28318548;
    u_xlat1.x = sin(u_xlat18);
    u_xlat2.x = cos(u_xlat18);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat12.xx + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD1.zw * _MaskNoiseTerxture_ST.xy + _MaskNoiseTerxture_ST.zw;
    u_xlat16_6 = texture(_MaskNoiseTerxture, u_xlat6.xy).x;
    u_xlat0.x = u_xlat16_0.x * u_xlat16_6 + -0.5;
    u_xlat1.xy = vs_TEXCOORD1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = (-u_xlat6.xy) * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MainTexNoisePower) + u_xlat1.xy;
    u_xlat0.xy = vec2(_MainTexNoisePower) * vec2(0.25, 0.25) + u_xlat0.xy;
    u_xlat12.x = _MainTexNoisePower + 2.0;
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
    u_xlat16_2 = texture(_MainMask, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    u_xlat0 = u_xlat16_2 * u_xlat0;
    u_xlat18 = u_xlat16_2.x * u_xlat0.w;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat7.xz = _Offset_Size.xy / vec2(_PrefabSize);
    u_xlat1.xy = (-u_xlat7.xz) + u_xlat1.xz;
    u_xlat13.xy = vec2(_PrefabSize) / _Offset_Size.zw;
    u_xlat1.xy = u_xlat13.xy * u_xlat1.xy;
    u_xlatb1.zw = greaterThanEqual(u_xlat1.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).zw;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat13.x = u_xlat1.w * u_xlat1.z;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat1.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat18 * u_xlat16_4.x;
    u_xlat2.xyw = u_xlat0.yzx * vec3(_ColorIntensity);
    u_xlat3.xy = u_xlat2.yx;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorIntensity) + (-u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.y>=u_xlat2.y);
#else
    u_xlatb5 = u_xlat3.y>=u_xlat2.y;
#endif
    u_xlat16_10 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = vec4(u_xlat16_10) * u_xlat0 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat2.w>=u_xlat0.x);
#else
    u_xlatb3 = u_xlat2.w>=u_xlat0.x;
#endif
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat2.wyx;
    u_xlat0 = (-u_xlat2) + u_xlat0;
    u_xlat0 = u_xlat3.xxxx * u_xlat0 + u_xlat2;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat8 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat6.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat6.x = u_xlat6.x / u_xlat8;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat6.x = abs(u_xlat6.x) + _Float0;
    u_xlat6.xyz = u_xlat6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat8;
    u_xlat2.x = u_xlat2.x + _Float1;
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Float3, _Float3, _Float3)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	float _Noise_Scale;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	vec4 _MaskNoiseTerxture_ST;
uniform 	float _MainTexNoisePower;
uniform 	vec4 _MainColor;
uniform 	float _ColorIntensity;
uniform 	float _Float0;
uniform 	float _Float1;
uniform 	float _Float3;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskNoiseTerxture;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainMask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
bool u_xlatb5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
vec2 u_xlat12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat12.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(_Noise_Scale);
    u_xlat1.xy = u_xlat12.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat12.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb18 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb18) ? u_xlat12.x : (-u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 1000.0;
    u_xlat18 = _NoiseTexUV_AnchorAndRotator.w * u_xlat12.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 6.28318548;
    u_xlat1.x = sin(u_xlat18);
    u_xlat2.x = cos(u_xlat18);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat12.xx + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD1.zw * _MaskNoiseTerxture_ST.xy + _MaskNoiseTerxture_ST.zw;
    u_xlat16_6 = texture(_MaskNoiseTerxture, u_xlat6.xy).x;
    u_xlat0.x = u_xlat16_0.x * u_xlat16_6 + -0.5;
    u_xlat1.xy = vs_TEXCOORD1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = (-u_xlat6.xy) * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MainTexNoisePower) + u_xlat1.xy;
    u_xlat0.xy = vec2(_MainTexNoisePower) * vec2(0.25, 0.25) + u_xlat0.xy;
    u_xlat12.x = _MainTexNoisePower + 2.0;
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
    u_xlat16_2 = texture(_MainMask, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    u_xlat0 = u_xlat16_2 * u_xlat0;
    u_xlat18 = u_xlat16_2.x * u_xlat0.w;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat7.xz = _Offset_Size.xy / vec2(_PrefabSize);
    u_xlat1.xy = (-u_xlat7.xz) + u_xlat1.xz;
    u_xlat13.xy = vec2(_PrefabSize) / _Offset_Size.zw;
    u_xlat1.xy = u_xlat13.xy * u_xlat1.xy;
    u_xlatb1.zw = greaterThanEqual(u_xlat1.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).zw;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat13.x = u_xlat1.w * u_xlat1.z;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat1.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat18 * u_xlat16_4.x;
    u_xlat2.xyw = u_xlat0.yzx * vec3(_ColorIntensity);
    u_xlat3.xy = u_xlat2.yx;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorIntensity) + (-u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.y>=u_xlat2.y);
#else
    u_xlatb5 = u_xlat3.y>=u_xlat2.y;
#endif
    u_xlat16_10 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = vec4(u_xlat16_10) * u_xlat0 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat2.w>=u_xlat0.x);
#else
    u_xlatb3 = u_xlat2.w>=u_xlat0.x;
#endif
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat2.wyx;
    u_xlat0 = (-u_xlat2) + u_xlat0;
    u_xlat0 = u_xlat3.xxxx * u_xlat0 + u_xlat2;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat8 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat6.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat6.x = u_xlat6.x / u_xlat8;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat6.x = abs(u_xlat6.x) + _Float0;
    u_xlat6.xyz = u_xlat6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat8;
    u_xlat2.x = u_xlat2.x + _Float1;
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Float3, _Float3, _Float3)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	float _Noise_Scale;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	vec4 _MaskNoiseTerxture_ST;
uniform 	float _MainTexNoisePower;
uniform 	vec4 _MainColor;
uniform 	float _ColorIntensity;
uniform 	float _Float0;
uniform 	float _Float1;
uniform 	float _Float3;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskNoiseTerxture;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
bool u_xlatb5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
vec2 u_xlat12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat12.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(_Noise_Scale);
    u_xlat1.xy = u_xlat12.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat12.x = _Time.y * 0.00100000005;
    u_xlatb18 = u_xlat12.x>=(-u_xlat12.x);
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb18) ? u_xlat12.x : (-u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 1000.0;
    u_xlat18 = _NoiseTexUV_AnchorAndRotator.w * u_xlat12.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 6.28318548;
    u_xlat1.x = sin(u_xlat18);
    u_xlat2.x = cos(u_xlat18);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat12.xx + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD1.zw * _MaskNoiseTerxture_ST.xy + _MaskNoiseTerxture_ST.zw;
    u_xlat10_6 = texture2D(_MaskNoiseTerxture, u_xlat6.xy).x;
    u_xlat0.x = u_xlat10_0.x * u_xlat10_6 + -0.5;
    u_xlat1.xy = vs_TEXCOORD1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = (-u_xlat6.xy) * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MainTexNoisePower) + u_xlat1.xy;
    u_xlat0.xy = vec2(_MainTexNoisePower) * vec2(0.25, 0.25) + u_xlat0.xy;
    u_xlat12.x = _MainTexNoisePower + 2.0;
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
    u_xlat10_2 = texture2D(_MainMask, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    u_xlat0 = u_xlat10_2 * u_xlat0;
    u_xlat18 = u_xlat10_2.x * u_xlat0.w;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat7.xz = _Offset_Size.xy / vec2(_PrefabSize);
    u_xlat1.xy = (-u_xlat7.xz) + u_xlat1.xz;
    u_xlat13.xy = vec2(_PrefabSize) / _Offset_Size.zw;
    u_xlat1.xy = u_xlat13.xy * u_xlat1.xy;
    u_xlatb1.zw = greaterThanEqual(u_xlat1.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).zw;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat13.x = u_xlat1.w * u_xlat1.z;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat1.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat18 * u_xlat16_4.x;
    u_xlat2.xyw = u_xlat0.yzx * vec3(_ColorIntensity);
    u_xlat3.xy = u_xlat2.yx;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorIntensity) + (-u_xlat3.xy);
    u_xlatb5 = u_xlat3.y>=u_xlat2.y;
    u_xlat16_10 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = vec4(u_xlat16_10) * u_xlat0 + u_xlat3;
    u_xlatb3 = u_xlat2.w>=u_xlat0.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat2.wyx;
    u_xlat0 = (-u_xlat2) + u_xlat0;
    u_xlat0 = u_xlat3.xxxx * u_xlat0 + u_xlat2;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat8 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat6.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat6.x = u_xlat6.x / u_xlat8;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat6.x = abs(u_xlat6.x) + _Float0;
    u_xlat6.xyz = u_xlat6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat8;
    u_xlat2.x = u_xlat2.x + _Float1;
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Float3, _Float3, _Float3)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD2.xy = u_xlat0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	float _Noise_Scale;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	vec4 _MaskNoiseTerxture_ST;
uniform 	float _MainTexNoisePower;
uniform 	vec4 _MainColor;
uniform 	float _ColorIntensity;
uniform 	float _Float0;
uniform 	float _Float1;
uniform 	float _Float3;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskNoiseTerxture;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
bool u_xlatb5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
vec2 u_xlat12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat12.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(_Noise_Scale);
    u_xlat1.xy = u_xlat12.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat12.x = _Time.y * 0.00100000005;
    u_xlatb18 = u_xlat12.x>=(-u_xlat12.x);
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb18) ? u_xlat12.x : (-u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 1000.0;
    u_xlat18 = _NoiseTexUV_AnchorAndRotator.w * u_xlat12.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 6.28318548;
    u_xlat1.x = sin(u_xlat18);
    u_xlat2.x = cos(u_xlat18);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat12.xx + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD1.zw * _MaskNoiseTerxture_ST.xy + _MaskNoiseTerxture_ST.zw;
    u_xlat10_6 = texture2D(_MaskNoiseTerxture, u_xlat6.xy).x;
    u_xlat0.x = u_xlat10_0.x * u_xlat10_6 + -0.5;
    u_xlat1.xy = vs_TEXCOORD1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = (-u_xlat6.xy) * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MainTexNoisePower) + u_xlat1.xy;
    u_xlat0.xy = vec2(_MainTexNoisePower) * vec2(0.25, 0.25) + u_xlat0.xy;
    u_xlat12.x = _MainTexNoisePower + 2.0;
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
    u_xlat10_2 = texture2D(_MainMask, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    u_xlat0 = u_xlat10_2 * u_xlat0;
    u_xlat18 = u_xlat10_2.x * u_xlat0.w;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat7.xz = _Offset_Size.xy / vec2(_PrefabSize);
    u_xlat1.xy = (-u_xlat7.xz) + u_xlat1.xz;
    u_xlat13.xy = vec2(_PrefabSize) / _Offset_Size.zw;
    u_xlat1.xy = u_xlat13.xy * u_xlat1.xy;
    u_xlatb1.zw = greaterThanEqual(u_xlat1.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).zw;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat13.x = u_xlat1.w * u_xlat1.z;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat1.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat18 * u_xlat16_4.x;
    u_xlat2.xyw = u_xlat0.yzx * vec3(_ColorIntensity);
    u_xlat3.xy = u_xlat2.yx;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorIntensity) + (-u_xlat3.xy);
    u_xlatb5 = u_xlat3.y>=u_xlat2.y;
    u_xlat16_10 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = vec4(u_xlat16_10) * u_xlat0 + u_xlat3;
    u_xlatb3 = u_xlat2.w>=u_xlat0.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat2.wyx;
    u_xlat0 = (-u_xlat2) + u_xlat0;
    u_xlat0 = u_xlat3.xxxx * u_xlat0 + u_xlat2;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat8 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat6.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat6.x = u_xlat6.x / u_xlat8;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat6.x = abs(u_xlat6.x) + _Float0;
    u_xlat6.xyz = u_xlat6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat8;
    u_xlat2.x = u_xlat2.x + _Float1;
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Float3, _Float3, _Float3)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	float _Noise_Scale;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	vec4 _MaskNoiseTerxture_ST;
uniform 	float _MainTexNoisePower;
uniform 	vec4 _MainColor;
uniform 	float _ColorIntensity;
uniform 	float _Float0;
uniform 	float _Float1;
uniform 	float _Float3;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskNoiseTerxture;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainMask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
bool u_xlatb5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
vec2 u_xlat12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat12.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(_Noise_Scale);
    u_xlat1.xy = u_xlat12.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat12.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb18 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb18) ? u_xlat12.x : (-u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 1000.0;
    u_xlat18 = _NoiseTexUV_AnchorAndRotator.w * u_xlat12.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 6.28318548;
    u_xlat1.x = sin(u_xlat18);
    u_xlat2.x = cos(u_xlat18);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat12.xx + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD1.zw * _MaskNoiseTerxture_ST.xy + _MaskNoiseTerxture_ST.zw;
    u_xlat16_6 = texture(_MaskNoiseTerxture, u_xlat6.xy).x;
    u_xlat0.x = u_xlat16_0.x * u_xlat16_6 + -0.5;
    u_xlat1.xy = vs_TEXCOORD1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = (-u_xlat6.xy) * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MainTexNoisePower) + u_xlat1.xy;
    u_xlat0.xy = vec2(_MainTexNoisePower) * vec2(0.25, 0.25) + u_xlat0.xy;
    u_xlat12.x = _MainTexNoisePower + 2.0;
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
    u_xlat16_2 = texture(_MainMask, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    u_xlat0 = u_xlat16_2 * u_xlat0;
    u_xlat18 = u_xlat16_2.x * u_xlat0.w;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat7.xz = _Offset_Size.xy / vec2(_PrefabSize);
    u_xlat1.xy = (-u_xlat7.xz) + u_xlat1.xz;
    u_xlat13.xy = vec2(_PrefabSize) / _Offset_Size.zw;
    u_xlat1.xy = u_xlat13.xy * u_xlat1.xy;
    u_xlatb1.zw = greaterThanEqual(u_xlat1.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).zw;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat13.x = u_xlat1.w * u_xlat1.z;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat18 * u_xlat16_4.x;
    u_xlat2.xyw = u_xlat0.yzx * vec3(_ColorIntensity);
    u_xlat3.xy = u_xlat2.yx;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorIntensity) + (-u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.y>=u_xlat2.y);
#else
    u_xlatb5 = u_xlat3.y>=u_xlat2.y;
#endif
    u_xlat16_10 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = vec4(u_xlat16_10) * u_xlat0 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat2.w>=u_xlat0.x);
#else
    u_xlatb3 = u_xlat2.w>=u_xlat0.x;
#endif
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat2.wyx;
    u_xlat0 = (-u_xlat2) + u_xlat0;
    u_xlat0 = u_xlat3.xxxx * u_xlat0 + u_xlat2;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat8 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat6.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat6.x = u_xlat6.x / u_xlat8;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat6.x = abs(u_xlat6.x) + _Float0;
    u_xlat6.xyz = u_xlat6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat8;
    u_xlat2.x = u_xlat2.x + _Float1;
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Float3, _Float3, _Float3)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	float _Noise_Scale;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	vec4 _MaskNoiseTerxture_ST;
uniform 	float _MainTexNoisePower;
uniform 	vec4 _MainColor;
uniform 	float _ColorIntensity;
uniform 	float _Float0;
uniform 	float _Float1;
uniform 	float _Float3;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskNoiseTerxture;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainMask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
bool u_xlatb5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
vec2 u_xlat12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat12.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(_Noise_Scale);
    u_xlat1.xy = u_xlat12.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat12.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb18 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb18) ? u_xlat12.x : (-u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 1000.0;
    u_xlat18 = _NoiseTexUV_AnchorAndRotator.w * u_xlat12.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 6.28318548;
    u_xlat1.x = sin(u_xlat18);
    u_xlat2.x = cos(u_xlat18);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat12.xx + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD1.zw * _MaskNoiseTerxture_ST.xy + _MaskNoiseTerxture_ST.zw;
    u_xlat16_6 = texture(_MaskNoiseTerxture, u_xlat6.xy).x;
    u_xlat0.x = u_xlat16_0.x * u_xlat16_6 + -0.5;
    u_xlat1.xy = vs_TEXCOORD1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = (-u_xlat6.xy) * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MainTexNoisePower) + u_xlat1.xy;
    u_xlat0.xy = vec2(_MainTexNoisePower) * vec2(0.25, 0.25) + u_xlat0.xy;
    u_xlat12.x = _MainTexNoisePower + 2.0;
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
    u_xlat16_2 = texture(_MainMask, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    u_xlat0 = u_xlat16_2 * u_xlat0;
    u_xlat18 = u_xlat16_2.x * u_xlat0.w;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat7.xz = _Offset_Size.xy / vec2(_PrefabSize);
    u_xlat1.xy = (-u_xlat7.xz) + u_xlat1.xz;
    u_xlat13.xy = vec2(_PrefabSize) / _Offset_Size.zw;
    u_xlat1.xy = u_xlat13.xy * u_xlat1.xy;
    u_xlatb1.zw = greaterThanEqual(u_xlat1.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).zw;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat13.x = u_xlat1.w * u_xlat1.z;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat18 * u_xlat16_4.x;
    u_xlat2.xyw = u_xlat0.yzx * vec3(_ColorIntensity);
    u_xlat3.xy = u_xlat2.yx;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorIntensity) + (-u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat3.y>=u_xlat2.y);
#else
    u_xlatb5 = u_xlat3.y>=u_xlat2.y;
#endif
    u_xlat16_10 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = vec4(u_xlat16_10) * u_xlat0 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat2.w>=u_xlat0.x);
#else
    u_xlatb3 = u_xlat2.w>=u_xlat0.x;
#endif
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat2.wyx;
    u_xlat0 = (-u_xlat2) + u_xlat0;
    u_xlat0 = u_xlat3.xxxx * u_xlat0 + u_xlat2;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat8 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat6.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat6.x = u_xlat6.x / u_xlat8;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat6.x = abs(u_xlat6.x) + _Float0;
    u_xlat6.xyz = u_xlat6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat8;
    u_xlat2.x = u_xlat2.x + _Float1;
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Float3, _Float3, _Float3)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	float _Noise_Scale;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	vec4 _MaskNoiseTerxture_ST;
uniform 	float _MainTexNoisePower;
uniform 	vec4 _MainColor;
uniform 	float _ColorIntensity;
uniform 	float _Float0;
uniform 	float _Float1;
uniform 	float _Float3;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskNoiseTerxture;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
bool u_xlatb5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
vec2 u_xlat12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat12.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(_Noise_Scale);
    u_xlat1.xy = u_xlat12.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat12.x = _Time.y * 0.00100000005;
    u_xlatb18 = u_xlat12.x>=(-u_xlat12.x);
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb18) ? u_xlat12.x : (-u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 1000.0;
    u_xlat18 = _NoiseTexUV_AnchorAndRotator.w * u_xlat12.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 6.28318548;
    u_xlat1.x = sin(u_xlat18);
    u_xlat2.x = cos(u_xlat18);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat12.xx + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD1.zw * _MaskNoiseTerxture_ST.xy + _MaskNoiseTerxture_ST.zw;
    u_xlat10_6 = texture2D(_MaskNoiseTerxture, u_xlat6.xy).x;
    u_xlat0.x = u_xlat10_0.x * u_xlat10_6 + -0.5;
    u_xlat1.xy = vs_TEXCOORD1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = (-u_xlat6.xy) * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MainTexNoisePower) + u_xlat1.xy;
    u_xlat0.xy = vec2(_MainTexNoisePower) * vec2(0.25, 0.25) + u_xlat0.xy;
    u_xlat12.x = _MainTexNoisePower + 2.0;
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
    u_xlat10_2 = texture2D(_MainMask, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    u_xlat0 = u_xlat10_2 * u_xlat0;
    u_xlat18 = u_xlat10_2.x * u_xlat0.w;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat7.xz = _Offset_Size.xy / vec2(_PrefabSize);
    u_xlat1.xy = (-u_xlat7.xz) + u_xlat1.xz;
    u_xlat13.xy = vec2(_PrefabSize) / _Offset_Size.zw;
    u_xlat1.xy = u_xlat13.xy * u_xlat1.xy;
    u_xlatb1.zw = greaterThanEqual(u_xlat1.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).zw;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat13.x = u_xlat1.w * u_xlat1.z;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat18 * u_xlat16_4.x;
    u_xlat2.xyw = u_xlat0.yzx * vec3(_ColorIntensity);
    u_xlat3.xy = u_xlat2.yx;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorIntensity) + (-u_xlat3.xy);
    u_xlatb5 = u_xlat3.y>=u_xlat2.y;
    u_xlat16_10 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = vec4(u_xlat16_10) * u_xlat0 + u_xlat3;
    u_xlatb3 = u_xlat2.w>=u_xlat0.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat2.wyx;
    u_xlat0 = (-u_xlat2) + u_xlat0;
    u_xlat0 = u_xlat3.xxxx * u_xlat0 + u_xlat2;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat8 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat6.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat6.x = u_xlat6.x / u_xlat8;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat6.x = abs(u_xlat6.x) + _Float0;
    u_xlat6.xyz = u_xlat6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat8;
    u_xlat2.x = u_xlat2.x + _Float1;
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Float3, _Float3, _Float3)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV_XYVxVy;
uniform 	vec4 _NoiseTexUV_AnchorAndTiling;
uniform 	float _Noise_Scale;
uniform 	vec4 _NoiseTexUV_AnchorAndRotator;
uniform 	vec4 _MaskNoiseTerxture_ST;
uniform 	float _MainTexNoisePower;
uniform 	vec4 _MainColor;
uniform 	float _ColorIntensity;
uniform 	float _Float0;
uniform 	float _Float1;
uniform 	float _Float3;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _MaskNoiseTerxture;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
bool u_xlatb5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
float u_xlat8;
mediump float u_xlat16_10;
vec2 u_xlat12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_XYVxVy.xy);
    u_xlat12.xy = _NoiseTexUV_AnchorAndTiling.zw / vec2(_Noise_Scale);
    u_xlat1.xy = u_xlat12.xy + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xy * _NoiseTexUV_AnchorAndTiling.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy + (-u_xlat1.xy);
    u_xlat0.xy = u_xlat0.xy + (-_NoiseTexUV_AnchorAndRotator.xy);
    u_xlat12.x = _Time.y * 0.00100000005;
    u_xlatb18 = u_xlat12.x>=(-u_xlat12.x);
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb18) ? u_xlat12.x : (-u_xlat12.x);
    u_xlat12.x = u_xlat12.x * 1000.0;
    u_xlat18 = _NoiseTexUV_AnchorAndRotator.w * u_xlat12.x + _NoiseTexUV_AnchorAndRotator.z;
    u_xlat18 = u_xlat18 * 6.28318548;
    u_xlat1.x = sin(u_xlat18);
    u_xlat2.x = cos(u_xlat18);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _NoiseTexUV_AnchorAndRotator.xy;
    u_xlat0.xy = (-_NoiseTexUV_XYVxVy.zw) * u_xlat12.xx + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD1.zw * _MaskNoiseTerxture_ST.xy + _MaskNoiseTerxture_ST.zw;
    u_xlat10_6 = texture2D(_MaskNoiseTerxture, u_xlat6.xy).x;
    u_xlat0.x = u_xlat10_0.x * u_xlat10_6 + -0.5;
    u_xlat1.xy = vs_TEXCOORD1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat6.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat0.xy = (-u_xlat6.xy) * u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MainTexNoisePower) + u_xlat1.xy;
    u_xlat0.xy = vec2(_MainTexNoisePower) * vec2(0.25, 0.25) + u_xlat0.xy;
    u_xlat12.x = _MainTexNoisePower + 2.0;
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
    u_xlat10_2 = texture2D(_MainMask, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    u_xlat0 = u_xlat10_2 * u_xlat0;
    u_xlat18 = u_xlat10_2.x * u_xlat0.w;
    u_xlat1.z = (-u_xlat1.y) + 1.0;
    u_xlat7.xz = _Offset_Size.xy / vec2(_PrefabSize);
    u_xlat1.xy = (-u_xlat7.xz) + u_xlat1.xz;
    u_xlat13.xy = vec2(_PrefabSize) / _Offset_Size.zw;
    u_xlat1.xy = u_xlat13.xy * u_xlat1.xy;
    u_xlatb1.zw = greaterThanEqual(u_xlat1.xxxy, vec4(0.0, 0.0, 0.0, 0.0)).zw;
    u_xlatb1.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
    u_xlat1.w = u_xlatb1.w ? float(1.0) : 0.0;
;
    u_xlat13.x = u_xlat1.w * u_xlat1.z;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = u_xlat1.y * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat1.w = u_xlat18 * u_xlat16_4.x;
    u_xlat2.xyw = u_xlat0.yzx * vec3(_ColorIntensity);
    u_xlat3.xy = u_xlat2.yx;
    u_xlat0.xy = u_xlat0.yz * vec2(_ColorIntensity) + (-u_xlat3.xy);
    u_xlatb5 = u_xlat3.y>=u_xlat2.y;
    u_xlat16_10 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = vec4(u_xlat16_10) * u_xlat0 + u_xlat3;
    u_xlatb3 = u_xlat2.w>=u_xlat0.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat2.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat2.wyx;
    u_xlat0 = (-u_xlat2) + u_xlat0;
    u_xlat0 = u_xlat3.xxxx * u_xlat0 + u_xlat2;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat8 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat6.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat6.x = u_xlat6.x / u_xlat8;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat6.x = abs(u_xlat6.x) + _Float0;
    u_xlat6.xyz = u_xlat6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat8;
    u_xlat2.x = u_xlat2.x + _Float1;
    u_xlat6.xyz = u_xlat2.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Float3, _Float3, _Float3)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
}
}
}
}