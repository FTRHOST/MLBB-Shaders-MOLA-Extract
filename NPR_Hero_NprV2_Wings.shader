//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NPR/Hero_NprV2_Wings" {
Properties {

[Header(Base)] [Space(5)] [Toggle(_LOW_QUALITY)] _LowQuality ("低配模式 仅主贴图", Float) = 0.0

_MainTex ("主贴图 RGB 颜色 A 半透明", 2D) = "white" { }

_MainColor ("主贴图颜色叠加", Color) = (1,1,1,1)

_AlphaCutoffSoft ("透明度倍率", Range(0, 2)) = 1.0

_Cutoff ("Alpha 半透明强度", Range(0, 1)) = 1.0

[Space(15)] [Header(Parallax)] [Space(5)] _DepthTex ("深度贴图 R", 2D) = "gray" { }

[Toggle] _depthSign ("反转视差方向", Float) = 0.0

_ParallaxScale ("视差强度", Range(0, 0.2)) = 0.11900000274181366

_DepthOffset ("深度偏移", Range(-1, 1)) = 0.0

_ParallaxMaxOffset ("视差最大 UV 偏移", Range(0, 0.2)) = 0.05000000074505806

_ParallaxFadeAngle ("视差掠射角衰减", Range(0, 1)) = 0.2800000011920929

[Space(15)] [Header(Flow Map)] [Space(5)] [Toggle] _FlowEnable ("启用流动", Float) = 0.0

_FlowMap ("流向贴图 RG 为方向", 2D) = "gray" { }

_FlowSpeed ("流动速度", Float) = 0.20000000298023224

_FlowStrength ("流动强度", Range(0, 0.5)) = 0.05000000074505806

[Space(15)] [Header(Dissolve Distort)] [Space(5)] [Toggle] _DissolveEnable ("启用溶解", Float) = 0.0

_DissolveMask ("溶解遮罩 R 白色区域溶解", 2D) = "black" { }

_DistortNoiseTex ("扰动噪声贴图 G", 2D) = "gray" { }

_GChannel ("扭动噪声平铺 XY 与速度 ZW", Vector) = (1,1,0.1,0.1)

_NoiseXStreng ("扭动噪声 X 方向强度", Range(-1, 1)) = 0.05000000074505806

_NoiseYStreng ("扭动噪声 Y 方向强度", Range(-1, 1)) = 0.05000000074505806

_DissolveNoiseTex ("溶解噪声贴图 R", 2D) = "gray" { }

_DissolveNoiseChannel ("溶解噪声平铺 XY 与速度 ZW", Vector) = (1,1,0.1,0.1)

_DissolveStep ("溶解阈值", Range(0, 1)) = 0.5

_DissolveNoiseStrength ("溶解噪声强度", Range(0, 1)) = 0.30000001192092896

[Space(15)] [Header(Black Hole Swirl Ring)] [Space(5)] _NoiseTex ("环流噪声贴图 R", 2D) = "gray" { }

_SwirlTilingCenter ("环流平铺 XY / 圆心 UV ZW", Vector) = (2,6,0.34,0.34)

_RingRadius ("圆环半径", Range(0, 0.75)) = 0.10999999940395355

_RingWidth ("圆环宽度", Range(0, 0.5)) = 0.0

_RingSoftness ("圆环羽化", Range(0.0001, 0.25)) = 0.054999999701976776

_SwirlSpeed ("环流速度", Float) = 4.429999828338623

_SwirlMaxAngle ("最大旋转角度 弧度", Range(0, 1)) = 0.4569999873638153

_SwirlNoiseStrength ("径向噪声强度", Range(0, 0.2)) = 0.08609999716281891

}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
  GpuProgramID 53971
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat3 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat3;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat2.z = dot(u_xlat4.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    u_xlat0 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat0;
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
uniform 	float _ParallaxScale;
uniform 	mediump float _DepthOffset;
uniform 	float _ParallaxMaxOffset;
uniform 	mediump float _ParallaxFadeAngle;
uniform 	mediump float _AlphaCutoffSoft;
uniform 	mediump float _Cutoff;
uniform 	mediump float _FlowEnable;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	mediump float _FlowStrength;
uniform 	mediump float _DissolveEnable;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _DissolveNoiseChannel;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveNoiseStrength;
uniform 	vec4 _SwirlTilingCenter;
uniform 	float _RingRadius;
uniform 	float _RingWidth;
uniform 	float _RingSoftness;
uniform 	float _SwirlSpeed;
uniform 	mediump float _SwirlMaxAngle;
uniform 	mediump float _SwirlNoiseStrength;
uniform 	mediump float _depthSign;
uniform 	mediump vec4 _MainColor;
UNITY_LOCATION(0) uniform mediump sampler2D _DepthTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DistortNoiseTex;
UNITY_LOCATION(4) uniform mediump sampler2D _DissolveNoiseTex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
int u_xlati1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec2 u_xlat5;
vec2 u_xlat7;
mediump float u_xlat16_7;
int u_xlati7;
mediump float u_xlat16_8;
float u_xlat9;
bool u_xlatb10;
mediump float u_xlat16_12;
vec2 u_xlat13;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_15;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = int((gl_FrontFacing ? 0xffffffffu : uint(0)))==0; u_xlati1 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati1 = int((int((gl_FrontFacing ? 0xffffffffu : uint(0)))==0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati7 = int(uint((gl_FrontFacing ? 0xffffffffu : uint(0)) & 1u));
    u_xlati1 = u_xlati7 + u_xlati1;
    u_xlat16_18 = float(u_xlati1);
    u_xlat16_12 = u_xlat16_18 * u_xlat16_0.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_depthSign);
#else
    u_xlatb1 = 0.5<_depthSign;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat16_7 = texture(_DepthTex, vs_TEXCOORD0.xy).x;
    u_xlat7.x = u_xlat16_7 + _DepthOffset;
    u_xlat16_18 = max(_ParallaxFadeAngle, 9.99999975e-05);
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * abs(u_xlat16_12);
    u_xlat16_18 = min(u_xlat16_18, 1.0);
    u_xlat16_2.x = u_xlat16_18 * -2.0 + 3.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_2.x;
    u_xlat16_12 = abs(u_xlat16_12) + 0.419999987;
    u_xlat16_0.xy = u_xlat16_0.xy / vec2(u_xlat16_12);
    u_xlat16_12 = u_xlat7.x + -0.5;
    u_xlat16_0.xy = vec2(u_xlat16_12) * u_xlat16_0.xy;
    u_xlat7.xy = u_xlat16_0.xy * vec2(_ParallaxScale);
    u_xlat7.xy = vec2(u_xlat16_18) * u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xx * u_xlat7.xy;
    u_xlat13.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat13.x = sqrt(u_xlat13.x);
    u_xlat19 = min(u_xlat13.x, _ParallaxMaxOffset);
    u_xlat13.x = max(u_xlat13.x, 9.99999975e-06);
    u_xlat13.x = u_xlat19 / u_xlat13.x;
    u_xlat1.xy = u_xlat1.xy * u_xlat13.xx + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + (-_SwirlTilingCenter.zw);
    u_xlat3.x = dot(u_xlat13.xy, u_xlat13.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat9 = (-_RingWidth) * 0.5 + _RingRadius;
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat15.x = _RingWidth * 0.5 + _RingRadius;
    u_xlat21 = max(_RingSoftness, 9.99999975e-05);
    u_xlat4.x = (-u_xlat21) + u_xlat9;
    u_xlat9 = u_xlat21 + u_xlat9;
    u_xlat9 = (-u_xlat4.x) + u_xlat9;
    u_xlat4.x = u_xlat3.x + (-u_xlat4.x);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat4.x;
    u_xlat4.x = (-u_xlat21) + u_xlat15.x;
    u_xlat3.z = u_xlat21 + u_xlat15.x;
    u_xlat15.xy = u_xlat3.zx + (-u_xlat4.xx);
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = u_xlat15.x * u_xlat15.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat15.x * -2.0 + 3.0;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat15.x = (-u_xlat21) * u_xlat15.x + 1.0;
    u_xlat9 = u_xlat15.x * u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat15.x = min(abs(u_xlat13.x), abs(u_xlat13.y));
    u_xlat21 = max(abs(u_xlat13.x), abs(u_xlat13.y));
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat15.x = u_xlat21 * u_xlat15.x;
    u_xlat21 = u_xlat15.x * u_xlat15.x;
    u_xlat4.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat4.x = u_xlat21 * u_xlat4.x + 0.180141002;
    u_xlat4.x = u_xlat21 * u_xlat4.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat4.x + 0.999866009;
    u_xlat4.x = u_xlat21 * u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(abs(u_xlat13.x)<abs(u_xlat13.y));
#else
    u_xlatb10 = abs(u_xlat13.x)<abs(u_xlat13.y);
#endif
    u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
    u_xlat4.x = u_xlatb10 ? u_xlat4.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat21 + u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat13.x<(-u_xlat13.x));
#else
    u_xlatb21 = u_xlat13.x<(-u_xlat13.x);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat21 + u_xlat15.x;
    u_xlat21 = min(u_xlat13.x, u_xlat13.y);
    u_xlat4.x = max(u_xlat13.x, u_xlat13.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4.x>=(-u_xlat4.x));
#else
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
#endif
    u_xlatb21 = u_xlatb21 && u_xlatb4;
    u_xlat15.x = (u_xlatb21) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _SwirlTilingCenter.x;
    u_xlat21 = u_xlat15.x * 0.318309873;
    u_xlat4.x = _Time.y * _SwirlSpeed;
    u_xlat5.x = u_xlat15.x * 0.159154937 + (-u_xlat4.x);
    u_xlat15.x = u_xlat3.x * _SwirlTilingCenter.y;
    u_xlat5.y = u_xlat15.x + u_xlat15.x;
    u_xlat4.x = (-u_xlat4.x) * 1.29999995 + u_xlat21;
    u_xlat4.y = u_xlat15.x * 3.0 + 0.370000005;
    u_xlat16_15 = texture(_NoiseTex, u_xlat5.xy).x;
    u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat16_0.x = u_xlat16_21 + u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x + -1.0;
    u_xlat15.x = max(u_xlat3.x, 9.99999975e-06);
    u_xlat4.xy = u_xlat13.xy / u_xlat15.xx;
    u_xlat4.z = (-u_xlat4.y);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat4.zxxy;
    u_xlat0 = u_xlat0 * vec4(_SwirlMaxAngle, _SwirlMaxAngle, _SwirlNoiseStrength, _SwirlNoiseStrength);
    u_xlat13.xy = u_xlat0.xy * u_xlat3.xx + u_xlat0.zw;
    u_xlat1.xy = u_xlat13.xy * vec2(u_xlat9) + u_xlat1.xy;
    u_xlat16_13 = texture(_DissolveMask, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.5<_DissolveEnable);
#else
    u_xlatb19 = 0.5<_DissolveEnable;
#endif
    if(u_xlatb19){
        u_xlat3.xy = _Time.yy * _GChannel.zw;
        u_xlat3.xy = fract(u_xlat3.xy);
        u_xlat15.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + vec2(0.370000005, 0.610000014);
        u_xlat3.xy = (-u_xlat3.xy) + u_xlat4.xy;
        u_xlat16_15 = texture(_DistortNoiseTex, u_xlat15.xy).y;
        u_xlat3.z = u_xlat16_15 + -0.5;
        u_xlat16_3.x = texture(_DistortNoiseTex, u_xlat3.xy).y;
        u_xlat3.x = u_xlat16_3.x + -0.5;
        u_xlat16_2.xy = u_xlat3.zx * vec2(_NoiseXStreng, _NoiseYStreng);
        u_xlat1.xy = u_xlat16_2.xy * vec2(u_xlat16_13) + u_xlat1.xy;
        u_xlat3.xy = _Time.yy * _DissolveNoiseChannel.zw;
        u_xlat3.xy = fract(u_xlat3.xy);
        u_xlat15.xy = u_xlat16_2.xy * vec2(u_xlat16_13) + vs_TEXCOORD0.xy;
        u_xlat3.xy = u_xlat15.xy * _DissolveNoiseChannel.xy + u_xlat3.xy;
        u_xlat16_3.x = texture(_DissolveNoiseTex, u_xlat3.xy).x;
        u_xlat16_2.x = u_xlat16_3.x;
    } else {
        u_xlat16_2.x = 0.5;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_FlowEnable);
#else
    u_xlatb3 = 0.5<_FlowEnable;
#endif
    if(u_xlatb3){
        u_xlat3.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat16_3.xy = texture(_FlowMap, u_xlat3.xy).xy;
        u_xlat3.xy = u_xlat16_3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat15.x = _Time.x * _FlowSpeed;
        u_xlat15.x = fract(u_xlat15.x);
        u_xlat21 = u_xlat15.x * 20.0;
        u_xlat16_8 = fract(u_xlat21);
        u_xlat15.x = u_xlat15.x * 20.0 + 0.5;
        u_xlat15.x = fract(u_xlat15.x);
        u_xlat16_14.xy = vec2(u_xlat16_8) * u_xlat3.xy;
        u_xlat4.xy = (-u_xlat16_14.xy) * vec2(_FlowStrength) + u_xlat1.xy;
        u_xlat16_14.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat3.xy = (-u_xlat16_14.xy) * vec2(_FlowStrength) + u_xlat1.xy;
        u_xlat15.x = u_xlat16_8 + -0.5;
        u_xlat15.x = abs(u_xlat15.x) + abs(u_xlat15.x);
        u_xlat16_0 = texture(_MainTex, u_xlat4.xy);
        u_xlat16_4 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4 = (-u_xlat16_0) + u_xlat16_4;
        u_xlat16_0 = u_xlat15.xxxx * u_xlat16_4 + u_xlat16_0;
    } else {
        u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
        u_xlat16_0 = u_xlat16_3;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat16_8 = u_xlat16_0.w * _Cutoff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x + -0.5;
    u_xlat16_2.x = u_xlat16_2.x * _DissolveNoiseStrength + u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_2.x>=_DissolveStep);
#else
    u_xlatb1 = u_xlat16_2.x>=_DissolveStep;
#endif
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-u_xlat16_8) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_13 * u_xlat16_2.x + u_xlat16_8;
    u_xlat16_2.x = (u_xlatb19) ? u_xlat16_2.x : u_xlat16_8;
    SV_Target0.w = u_xlat16_2.x * _AlphaCutoffSoft;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat3 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat3;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat2.z = dot(u_xlat4.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    u_xlat0 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat0;
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
uniform 	float _ParallaxScale;
uniform 	mediump float _DepthOffset;
uniform 	float _ParallaxMaxOffset;
uniform 	mediump float _ParallaxFadeAngle;
uniform 	mediump float _AlphaCutoffSoft;
uniform 	mediump float _Cutoff;
uniform 	mediump float _FlowEnable;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	mediump float _FlowStrength;
uniform 	mediump float _DissolveEnable;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _DissolveNoiseChannel;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveNoiseStrength;
uniform 	vec4 _SwirlTilingCenter;
uniform 	float _RingRadius;
uniform 	float _RingWidth;
uniform 	float _RingSoftness;
uniform 	float _SwirlSpeed;
uniform 	mediump float _SwirlMaxAngle;
uniform 	mediump float _SwirlNoiseStrength;
uniform 	mediump float _depthSign;
uniform 	mediump vec4 _MainColor;
UNITY_LOCATION(0) uniform mediump sampler2D _DepthTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DistortNoiseTex;
UNITY_LOCATION(4) uniform mediump sampler2D _DissolveNoiseTex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(6) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
int u_xlati1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec2 u_xlat5;
vec2 u_xlat7;
mediump float u_xlat16_7;
int u_xlati7;
mediump float u_xlat16_8;
float u_xlat9;
bool u_xlatb10;
mediump float u_xlat16_12;
vec2 u_xlat13;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_15;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
#ifdef UNITY_ADRENO_ES3
    { bool cond = int((gl_FrontFacing ? 0xffffffffu : uint(0)))==0; u_xlati1 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati1 = int((int((gl_FrontFacing ? 0xffffffffu : uint(0)))==0) ? 0xFFFFFFFFu : uint(0));
#endif
    u_xlati7 = int(uint((gl_FrontFacing ? 0xffffffffu : uint(0)) & 1u));
    u_xlati1 = u_xlati7 + u_xlati1;
    u_xlat16_18 = float(u_xlati1);
    u_xlat16_12 = u_xlat16_18 * u_xlat16_0.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_depthSign);
#else
    u_xlatb1 = 0.5<_depthSign;
#endif
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat16_7 = texture(_DepthTex, vs_TEXCOORD0.xy).x;
    u_xlat7.x = u_xlat16_7 + _DepthOffset;
    u_xlat16_18 = max(_ParallaxFadeAngle, 9.99999975e-05);
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * abs(u_xlat16_12);
    u_xlat16_18 = min(u_xlat16_18, 1.0);
    u_xlat16_2.x = u_xlat16_18 * -2.0 + 3.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_2.x;
    u_xlat16_12 = abs(u_xlat16_12) + 0.419999987;
    u_xlat16_0.xy = u_xlat16_0.xy / vec2(u_xlat16_12);
    u_xlat16_12 = u_xlat7.x + -0.5;
    u_xlat16_0.xy = vec2(u_xlat16_12) * u_xlat16_0.xy;
    u_xlat7.xy = u_xlat16_0.xy * vec2(_ParallaxScale);
    u_xlat7.xy = vec2(u_xlat16_18) * u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xx * u_xlat7.xy;
    u_xlat13.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat13.x = sqrt(u_xlat13.x);
    u_xlat19 = min(u_xlat13.x, _ParallaxMaxOffset);
    u_xlat13.x = max(u_xlat13.x, 9.99999975e-06);
    u_xlat13.x = u_xlat19 / u_xlat13.x;
    u_xlat1.xy = u_xlat1.xy * u_xlat13.xx + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + (-_SwirlTilingCenter.zw);
    u_xlat3.x = dot(u_xlat13.xy, u_xlat13.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat9 = (-_RingWidth) * 0.5 + _RingRadius;
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat15.x = _RingWidth * 0.5 + _RingRadius;
    u_xlat21 = max(_RingSoftness, 9.99999975e-05);
    u_xlat4.x = (-u_xlat21) + u_xlat9;
    u_xlat9 = u_xlat21 + u_xlat9;
    u_xlat9 = (-u_xlat4.x) + u_xlat9;
    u_xlat4.x = u_xlat3.x + (-u_xlat4.x);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat4.x;
    u_xlat4.x = (-u_xlat21) + u_xlat15.x;
    u_xlat3.z = u_xlat21 + u_xlat15.x;
    u_xlat15.xy = u_xlat3.zx + (-u_xlat4.xx);
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = u_xlat15.x * u_xlat15.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat15.x * -2.0 + 3.0;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat15.x = (-u_xlat21) * u_xlat15.x + 1.0;
    u_xlat9 = u_xlat15.x * u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat15.x = min(abs(u_xlat13.x), abs(u_xlat13.y));
    u_xlat21 = max(abs(u_xlat13.x), abs(u_xlat13.y));
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat15.x = u_xlat21 * u_xlat15.x;
    u_xlat21 = u_xlat15.x * u_xlat15.x;
    u_xlat4.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat4.x = u_xlat21 * u_xlat4.x + 0.180141002;
    u_xlat4.x = u_xlat21 * u_xlat4.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat4.x + 0.999866009;
    u_xlat4.x = u_xlat21 * u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(abs(u_xlat13.x)<abs(u_xlat13.y));
#else
    u_xlatb10 = abs(u_xlat13.x)<abs(u_xlat13.y);
#endif
    u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
    u_xlat4.x = u_xlatb10 ? u_xlat4.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat21 + u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat13.x<(-u_xlat13.x));
#else
    u_xlatb21 = u_xlat13.x<(-u_xlat13.x);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat21 + u_xlat15.x;
    u_xlat21 = min(u_xlat13.x, u_xlat13.y);
    u_xlat4.x = max(u_xlat13.x, u_xlat13.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4.x>=(-u_xlat4.x));
#else
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
#endif
    u_xlatb21 = u_xlatb21 && u_xlatb4;
    u_xlat15.x = (u_xlatb21) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _SwirlTilingCenter.x;
    u_xlat21 = u_xlat15.x * 0.318309873;
    u_xlat4.x = _Time.y * _SwirlSpeed;
    u_xlat5.x = u_xlat15.x * 0.159154937 + (-u_xlat4.x);
    u_xlat15.x = u_xlat3.x * _SwirlTilingCenter.y;
    u_xlat5.y = u_xlat15.x + u_xlat15.x;
    u_xlat4.x = (-u_xlat4.x) * 1.29999995 + u_xlat21;
    u_xlat4.y = u_xlat15.x * 3.0 + 0.370000005;
    u_xlat16_15 = texture(_NoiseTex, u_xlat5.xy).x;
    u_xlat16_21 = texture(_NoiseTex, u_xlat4.xy).x;
    u_xlat16_0.x = u_xlat16_21 + u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x + -1.0;
    u_xlat15.x = max(u_xlat3.x, 9.99999975e-06);
    u_xlat4.xy = u_xlat13.xy / u_xlat15.xx;
    u_xlat4.z = (-u_xlat4.y);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat4.zxxy;
    u_xlat0 = u_xlat0 * vec4(_SwirlMaxAngle, _SwirlMaxAngle, _SwirlNoiseStrength, _SwirlNoiseStrength);
    u_xlat13.xy = u_xlat0.xy * u_xlat3.xx + u_xlat0.zw;
    u_xlat1.xy = u_xlat13.xy * vec2(u_xlat9) + u_xlat1.xy;
    u_xlat16_13 = texture(_DissolveMask, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.5<_DissolveEnable);
#else
    u_xlatb19 = 0.5<_DissolveEnable;
#endif
    if(u_xlatb19){
        u_xlat3.xy = _Time.yy * _GChannel.zw;
        u_xlat3.xy = fract(u_xlat3.xy);
        u_xlat15.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + vec2(0.370000005, 0.610000014);
        u_xlat3.xy = (-u_xlat3.xy) + u_xlat4.xy;
        u_xlat16_15 = texture(_DistortNoiseTex, u_xlat15.xy).y;
        u_xlat3.z = u_xlat16_15 + -0.5;
        u_xlat16_3.x = texture(_DistortNoiseTex, u_xlat3.xy).y;
        u_xlat3.x = u_xlat16_3.x + -0.5;
        u_xlat16_2.xy = u_xlat3.zx * vec2(_NoiseXStreng, _NoiseYStreng);
        u_xlat1.xy = u_xlat16_2.xy * vec2(u_xlat16_13) + u_xlat1.xy;
        u_xlat3.xy = _Time.yy * _DissolveNoiseChannel.zw;
        u_xlat3.xy = fract(u_xlat3.xy);
        u_xlat15.xy = u_xlat16_2.xy * vec2(u_xlat16_13) + vs_TEXCOORD0.xy;
        u_xlat3.xy = u_xlat15.xy * _DissolveNoiseChannel.xy + u_xlat3.xy;
        u_xlat16_3.x = texture(_DissolveNoiseTex, u_xlat3.xy).x;
        u_xlat16_2.x = u_xlat16_3.x;
    } else {
        u_xlat16_2.x = 0.5;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_FlowEnable);
#else
    u_xlatb3 = 0.5<_FlowEnable;
#endif
    if(u_xlatb3){
        u_xlat3.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat16_3.xy = texture(_FlowMap, u_xlat3.xy).xy;
        u_xlat3.xy = u_xlat16_3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat15.x = _Time.x * _FlowSpeed;
        u_xlat15.x = fract(u_xlat15.x);
        u_xlat21 = u_xlat15.x * 20.0;
        u_xlat16_8 = fract(u_xlat21);
        u_xlat15.x = u_xlat15.x * 20.0 + 0.5;
        u_xlat15.x = fract(u_xlat15.x);
        u_xlat16_14.xy = vec2(u_xlat16_8) * u_xlat3.xy;
        u_xlat4.xy = (-u_xlat16_14.xy) * vec2(_FlowStrength) + u_xlat1.xy;
        u_xlat16_14.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat3.xy = (-u_xlat16_14.xy) * vec2(_FlowStrength) + u_xlat1.xy;
        u_xlat15.x = u_xlat16_8 + -0.5;
        u_xlat15.x = abs(u_xlat15.x) + abs(u_xlat15.x);
        u_xlat16_0 = texture(_MainTex, u_xlat4.xy);
        u_xlat16_4 = texture(_MainTex, u_xlat3.xy);
        u_xlat16_4 = (-u_xlat16_0) + u_xlat16_4;
        u_xlat16_0 = u_xlat15.xxxx * u_xlat16_4 + u_xlat16_0;
    } else {
        u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
        u_xlat16_0 = u_xlat16_3;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat16_8 = u_xlat16_0.w * _Cutoff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x + -0.5;
    u_xlat16_2.x = u_xlat16_2.x * _DissolveNoiseStrength + u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_2.x>=_DissolveStep);
#else
    u_xlatb1 = u_xlat16_2.x>=_DissolveStep;
#endif
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-u_xlat16_8) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_13 * u_xlat16_2.x + u_xlat16_8;
    u_xlat16_2.x = (u_xlatb19) ? u_xlat16_2.x : u_xlat16_8;
    SV_Target0.w = u_xlat16_2.x * _AlphaCutoffSoft;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat3 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat3;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat2.z = dot(u_xlat4.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    u_xlat0 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat0;
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
uniform 	float _ParallaxScale;
uniform 	mediump float _DepthOffset;
uniform 	float _ParallaxMaxOffset;
uniform 	mediump float _ParallaxFadeAngle;
uniform 	mediump float _AlphaCutoffSoft;
uniform 	mediump float _Cutoff;
uniform 	mediump float _FlowEnable;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	mediump float _FlowStrength;
uniform 	mediump float _DissolveEnable;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _DissolveNoiseChannel;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveNoiseStrength;
uniform 	vec4 _SwirlTilingCenter;
uniform 	float _RingRadius;
uniform 	float _RingWidth;
uniform 	float _RingSoftness;
uniform 	float _SwirlSpeed;
uniform 	mediump float _SwirlMaxAngle;
uniform 	mediump float _SwirlNoiseStrength;
uniform 	mediump float _depthSign;
uniform 	mediump vec4 _MainColor;
uniform lowp sampler2D _DepthTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveMask;
uniform lowp sampler2D _DistortNoiseTex;
uniform lowp sampler2D _DissolveNoiseTex;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
int u_xlati1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
bool u_xlatb4;
vec2 u_xlat5;
vec2 u_xlat7;
lowp float u_xlat10_7;
int u_xlati7;
mediump float u_xlat16_8;
float u_xlat9;
bool u_xlatb10;
mediump float u_xlat16_12;
vec2 u_xlat13;
lowp float u_xlat10_13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlati1 = int((int((gl_FrontFacing ? 1 : 0))==0) ? -1 : 0);
    u_xlati7 = op_and(int((gl_FrontFacing ? 1 : 0)), 1);
    u_xlati1 = u_xlati7 + u_xlati1;
    u_xlat16_18 = float(u_xlati1);
    u_xlat16_12 = u_xlat16_18 * u_xlat16_0.z;
    u_xlatb1 = 0.5<_depthSign;
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat10_7 = texture2D(_DepthTex, vs_TEXCOORD0.xy).x;
    u_xlat7.x = u_xlat10_7 + _DepthOffset;
    u_xlat16_18 = max(_ParallaxFadeAngle, 9.99999975e-05);
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * abs(u_xlat16_12);
    u_xlat16_18 = min(u_xlat16_18, 1.0);
    u_xlat16_2.x = u_xlat16_18 * -2.0 + 3.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_2.x;
    u_xlat16_12 = abs(u_xlat16_12) + 0.419999987;
    u_xlat16_0.xy = u_xlat16_0.xy / vec2(u_xlat16_12);
    u_xlat16_12 = u_xlat7.x + -0.5;
    u_xlat16_0.xy = vec2(u_xlat16_12) * u_xlat16_0.xy;
    u_xlat7.xy = u_xlat16_0.xy * vec2(_ParallaxScale);
    u_xlat7.xy = vec2(u_xlat16_18) * u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xx * u_xlat7.xy;
    u_xlat13.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat13.x = sqrt(u_xlat13.x);
    u_xlat19 = min(u_xlat13.x, _ParallaxMaxOffset);
    u_xlat13.x = max(u_xlat13.x, 9.99999975e-06);
    u_xlat13.x = u_xlat19 / u_xlat13.x;
    u_xlat1.xy = u_xlat1.xy * u_xlat13.xx + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + (-_SwirlTilingCenter.zw);
    u_xlat3.x = dot(u_xlat13.xy, u_xlat13.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat9 = (-_RingWidth) * 0.5 + _RingRadius;
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat15.x = _RingWidth * 0.5 + _RingRadius;
    u_xlat21 = max(_RingSoftness, 9.99999975e-05);
    u_xlat4.x = (-u_xlat21) + u_xlat9;
    u_xlat9 = u_xlat21 + u_xlat9;
    u_xlat9 = (-u_xlat4.x) + u_xlat9;
    u_xlat4.x = u_xlat3.x + (-u_xlat4.x);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat4.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat4.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat4.x;
    u_xlat4.x = (-u_xlat21) + u_xlat15.x;
    u_xlat3.z = u_xlat21 + u_xlat15.x;
    u_xlat15.xy = u_xlat3.zx + (-u_xlat4.xx);
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = u_xlat15.x * u_xlat15.y;
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat21 = u_xlat15.x * -2.0 + 3.0;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat15.x = (-u_xlat21) * u_xlat15.x + 1.0;
    u_xlat9 = u_xlat15.x * u_xlat9;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat15.x = min(abs(u_xlat13.x), abs(u_xlat13.y));
    u_xlat21 = max(abs(u_xlat13.x), abs(u_xlat13.y));
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat15.x = u_xlat21 * u_xlat15.x;
    u_xlat21 = u_xlat15.x * u_xlat15.x;
    u_xlat4.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat4.x = u_xlat21 * u_xlat4.x + 0.180141002;
    u_xlat4.x = u_xlat21 * u_xlat4.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat4.x + 0.999866009;
    u_xlat4.x = u_xlat21 * u_xlat15.x;
    u_xlatb10 = abs(u_xlat13.x)<abs(u_xlat13.y);
    u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
    u_xlat4.x = u_xlatb10 ? u_xlat4.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat21 + u_xlat4.x;
    u_xlatb21 = u_xlat13.x<(-u_xlat13.x);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat21 + u_xlat15.x;
    u_xlat21 = min(u_xlat13.x, u_xlat13.y);
    u_xlat4.x = max(u_xlat13.x, u_xlat13.y);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
    u_xlatb21 = u_xlatb21 && u_xlatb4;
    u_xlat15.x = (u_xlatb21) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _SwirlTilingCenter.x;
    u_xlat21 = u_xlat15.x * 0.318309873;
    u_xlat4.x = _Time.y * _SwirlSpeed;
    u_xlat5.x = u_xlat15.x * 0.159154937 + (-u_xlat4.x);
    u_xlat15.x = u_xlat3.x * _SwirlTilingCenter.y;
    u_xlat5.y = u_xlat15.x + u_xlat15.x;
    u_xlat4.x = (-u_xlat4.x) * 1.29999995 + u_xlat21;
    u_xlat4.y = u_xlat15.x * 3.0 + 0.370000005;
    u_xlat10_15 = texture2D(_NoiseTex, u_xlat5.xy).x;
    u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat16_0.x = u_xlat10_21 + u_xlat10_15;
    u_xlat16_0.x = u_xlat16_0.x + -1.0;
    u_xlat15.x = max(u_xlat3.x, 9.99999975e-06);
    u_xlat4.xy = u_xlat13.xy / u_xlat15.xx;
    u_xlat4.z = (-u_xlat4.y);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat4.zxxy;
    u_xlat0 = u_xlat0 * vec4(_SwirlMaxAngle, _SwirlMaxAngle, _SwirlNoiseStrength, _SwirlNoiseStrength);
    u_xlat13.xy = u_xlat0.xy * u_xlat3.xx + u_xlat0.zw;
    u_xlat1.xy = u_xlat13.xy * vec2(u_xlat9) + u_xlat1.xy;
    u_xlat10_13 = texture2D(_DissolveMask, vs_TEXCOORD0.xy).x;
    u_xlatb19 = 0.5<_DissolveEnable;
    if(u_xlatb19){
        u_xlat3.xy = _Time.yy * _GChannel.zw;
        u_xlat3.xy = fract(u_xlat3.xy);
        u_xlat15.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + vec2(0.370000005, 0.610000014);
        u_xlat3.xy = (-u_xlat3.xy) + u_xlat4.xy;
        u_xlat10_15 = texture2D(_DistortNoiseTex, u_xlat15.xy).y;
        u_xlat3.z = u_xlat10_15 + -0.5;
        u_xlat10_3.x = texture2D(_DistortNoiseTex, u_xlat3.xy).y;
        u_xlat3.x = u_xlat10_3.x + -0.5;
        u_xlat16_2.xy = u_xlat3.zx * vec2(_NoiseXStreng, _NoiseYStreng);
        u_xlat1.xy = u_xlat16_2.xy * vec2(u_xlat10_13) + u_xlat1.xy;
        u_xlat3.xy = _Time.yy * _DissolveNoiseChannel.zw;
        u_xlat3.xy = fract(u_xlat3.xy);
        u_xlat15.xy = u_xlat16_2.xy * vec2(u_xlat10_13) + vs_TEXCOORD0.xy;
        u_xlat3.xy = u_xlat15.xy * _DissolveNoiseChannel.xy + u_xlat3.xy;
        u_xlat10_3.x = texture2D(_DissolveNoiseTex, u_xlat3.xy).x;
        u_xlat16_2.x = u_xlat10_3.x;
    } else {
        u_xlat16_2.x = 0.5;
    }
    u_xlatb3 = 0.5<_FlowEnable;
    if(u_xlatb3){
        u_xlat3.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat10_3.xy = texture2D(_FlowMap, u_xlat3.xy).xy;
        u_xlat3.xy = u_xlat10_3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat15.x = _Time.x * _FlowSpeed;
        u_xlat15.x = fract(u_xlat15.x);
        u_xlat21 = u_xlat15.x * 20.0;
        u_xlat16_8 = fract(u_xlat21);
        u_xlat15.x = u_xlat15.x * 20.0 + 0.5;
        u_xlat15.x = fract(u_xlat15.x);
        u_xlat16_14.xy = vec2(u_xlat16_8) * u_xlat3.xy;
        u_xlat4.xy = (-u_xlat16_14.xy) * vec2(_FlowStrength) + u_xlat1.xy;
        u_xlat16_14.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat3.xy = (-u_xlat16_14.xy) * vec2(_FlowStrength) + u_xlat1.xy;
        u_xlat15.x = u_xlat16_8 + -0.5;
        u_xlat15.x = abs(u_xlat15.x) + abs(u_xlat15.x);
        u_xlat10_0 = texture2D(_MainTex, u_xlat4.xy);
        u_xlat10_4 = texture2D(_MainTex, u_xlat3.xy);
        u_xlat16_4 = (-u_xlat10_0) + u_xlat10_4;
        u_xlat16_0 = u_xlat15.xxxx * u_xlat16_4 + u_xlat10_0;
    } else {
        u_xlat10_3 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat16_0 = u_xlat10_3;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat16_8 = u_xlat16_0.w * _Cutoff;
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + -0.5;
    u_xlat16_2.x = u_xlat16_2.x * _DissolveNoiseStrength + u_xlat16_8;
    u_xlatb1 = u_xlat16_2.x>=_DissolveStep;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-u_xlat16_8) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_13 * u_xlat16_2.x + u_xlat16_8;
    u_xlat16_2.x = (u_xlatb19) ? u_xlat16_2.x : u_xlat16_8;
    SV_Target0.w = u_xlat16_2.x * _AlphaCutoffSoft;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat2.xyz = u_xlat2.xyz * unity_WorldTransformParams.www;
    u_xlat3 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat3;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4.xyz = (-u_xlat4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat2.z = dot(u_xlat4.xyz, u_xlat0.xyz);
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    u_xlat0 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat0;
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
uniform 	float _ParallaxScale;
uniform 	mediump float _DepthOffset;
uniform 	float _ParallaxMaxOffset;
uniform 	mediump float _ParallaxFadeAngle;
uniform 	mediump float _AlphaCutoffSoft;
uniform 	mediump float _Cutoff;
uniform 	mediump float _FlowEnable;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	mediump float _FlowStrength;
uniform 	mediump float _DissolveEnable;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _DissolveNoiseChannel;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveNoiseStrength;
uniform 	vec4 _SwirlTilingCenter;
uniform 	float _RingRadius;
uniform 	float _RingWidth;
uniform 	float _RingSoftness;
uniform 	float _SwirlSpeed;
uniform 	mediump float _SwirlMaxAngle;
uniform 	mediump float _SwirlNoiseStrength;
uniform 	mediump float _depthSign;
uniform 	mediump vec4 _MainColor;
uniform lowp sampler2D _DepthTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveMask;
uniform lowp sampler2D _DistortNoiseTex;
uniform lowp sampler2D _DissolveNoiseTex;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
int u_xlati1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
bool u_xlatb4;
vec2 u_xlat5;
vec2 u_xlat7;
lowp float u_xlat10_7;
int u_xlati7;
mediump float u_xlat16_8;
float u_xlat9;
bool u_xlatb10;
mediump float u_xlat16_12;
vec2 u_xlat13;
lowp float u_xlat10_13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlati1 = int((int((gl_FrontFacing ? 1 : 0))==0) ? -1 : 0);
    u_xlati7 = op_and(int((gl_FrontFacing ? 1 : 0)), 1);
    u_xlati1 = u_xlati7 + u_xlati1;
    u_xlat16_18 = float(u_xlati1);
    u_xlat16_12 = u_xlat16_18 * u_xlat16_0.z;
    u_xlatb1 = 0.5<_depthSign;
    u_xlat1.x = (u_xlatb1) ? 1.0 : -1.0;
    u_xlat10_7 = texture2D(_DepthTex, vs_TEXCOORD0.xy).x;
    u_xlat7.x = u_xlat10_7 + _DepthOffset;
    u_xlat16_18 = max(_ParallaxFadeAngle, 9.99999975e-05);
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * abs(u_xlat16_12);
    u_xlat16_18 = min(u_xlat16_18, 1.0);
    u_xlat16_2.x = u_xlat16_18 * -2.0 + 3.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_2.x;
    u_xlat16_12 = abs(u_xlat16_12) + 0.419999987;
    u_xlat16_0.xy = u_xlat16_0.xy / vec2(u_xlat16_12);
    u_xlat16_12 = u_xlat7.x + -0.5;
    u_xlat16_0.xy = vec2(u_xlat16_12) * u_xlat16_0.xy;
    u_xlat7.xy = u_xlat16_0.xy * vec2(_ParallaxScale);
    u_xlat7.xy = vec2(u_xlat16_18) * u_xlat7.xy;
    u_xlat1.xy = u_xlat1.xx * u_xlat7.xy;
    u_xlat13.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat13.x = sqrt(u_xlat13.x);
    u_xlat19 = min(u_xlat13.x, _ParallaxMaxOffset);
    u_xlat13.x = max(u_xlat13.x, 9.99999975e-06);
    u_xlat13.x = u_xlat19 / u_xlat13.x;
    u_xlat1.xy = u_xlat1.xy * u_xlat13.xx + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + (-_SwirlTilingCenter.zw);
    u_xlat3.x = dot(u_xlat13.xy, u_xlat13.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat9 = (-_RingWidth) * 0.5 + _RingRadius;
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat15.x = _RingWidth * 0.5 + _RingRadius;
    u_xlat21 = max(_RingSoftness, 9.99999975e-05);
    u_xlat4.x = (-u_xlat21) + u_xlat9;
    u_xlat9 = u_xlat21 + u_xlat9;
    u_xlat9 = (-u_xlat4.x) + u_xlat9;
    u_xlat4.x = u_xlat3.x + (-u_xlat4.x);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat4.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat4.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat4.x;
    u_xlat4.x = (-u_xlat21) + u_xlat15.x;
    u_xlat3.z = u_xlat21 + u_xlat15.x;
    u_xlat15.xy = u_xlat3.zx + (-u_xlat4.xx);
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = u_xlat15.x * u_xlat15.y;
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
    u_xlat21 = u_xlat15.x * -2.0 + 3.0;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat15.x = (-u_xlat21) * u_xlat15.x + 1.0;
    u_xlat9 = u_xlat15.x * u_xlat9;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat15.x = min(abs(u_xlat13.x), abs(u_xlat13.y));
    u_xlat21 = max(abs(u_xlat13.x), abs(u_xlat13.y));
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat15.x = u_xlat21 * u_xlat15.x;
    u_xlat21 = u_xlat15.x * u_xlat15.x;
    u_xlat4.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat4.x = u_xlat21 * u_xlat4.x + 0.180141002;
    u_xlat4.x = u_xlat21 * u_xlat4.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat4.x + 0.999866009;
    u_xlat4.x = u_xlat21 * u_xlat15.x;
    u_xlatb10 = abs(u_xlat13.x)<abs(u_xlat13.y);
    u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
    u_xlat4.x = u_xlatb10 ? u_xlat4.x : float(0.0);
    u_xlat15.x = u_xlat15.x * u_xlat21 + u_xlat4.x;
    u_xlatb21 = u_xlat13.x<(-u_xlat13.x);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat15.x = u_xlat21 + u_xlat15.x;
    u_xlat21 = min(u_xlat13.x, u_xlat13.y);
    u_xlat4.x = max(u_xlat13.x, u_xlat13.y);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
    u_xlatb21 = u_xlatb21 && u_xlatb4;
    u_xlat15.x = (u_xlatb21) ? (-u_xlat15.x) : u_xlat15.x;
    u_xlat15.x = u_xlat15.x * _SwirlTilingCenter.x;
    u_xlat21 = u_xlat15.x * 0.318309873;
    u_xlat4.x = _Time.y * _SwirlSpeed;
    u_xlat5.x = u_xlat15.x * 0.159154937 + (-u_xlat4.x);
    u_xlat15.x = u_xlat3.x * _SwirlTilingCenter.y;
    u_xlat5.y = u_xlat15.x + u_xlat15.x;
    u_xlat4.x = (-u_xlat4.x) * 1.29999995 + u_xlat21;
    u_xlat4.y = u_xlat15.x * 3.0 + 0.370000005;
    u_xlat10_15 = texture2D(_NoiseTex, u_xlat5.xy).x;
    u_xlat10_21 = texture2D(_NoiseTex, u_xlat4.xy).x;
    u_xlat16_0.x = u_xlat10_21 + u_xlat10_15;
    u_xlat16_0.x = u_xlat16_0.x + -1.0;
    u_xlat15.x = max(u_xlat3.x, 9.99999975e-06);
    u_xlat4.xy = u_xlat13.xy / u_xlat15.xx;
    u_xlat4.z = (-u_xlat4.y);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat4.zxxy;
    u_xlat0 = u_xlat0 * vec4(_SwirlMaxAngle, _SwirlMaxAngle, _SwirlNoiseStrength, _SwirlNoiseStrength);
    u_xlat13.xy = u_xlat0.xy * u_xlat3.xx + u_xlat0.zw;
    u_xlat1.xy = u_xlat13.xy * vec2(u_xlat9) + u_xlat1.xy;
    u_xlat10_13 = texture2D(_DissolveMask, vs_TEXCOORD0.xy).x;
    u_xlatb19 = 0.5<_DissolveEnable;
    if(u_xlatb19){
        u_xlat3.xy = _Time.yy * _GChannel.zw;
        u_xlat3.xy = fract(u_xlat3.xy);
        u_xlat15.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat3.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy * _GChannel.xy + vec2(0.370000005, 0.610000014);
        u_xlat3.xy = (-u_xlat3.xy) + u_xlat4.xy;
        u_xlat10_15 = texture2D(_DistortNoiseTex, u_xlat15.xy).y;
        u_xlat3.z = u_xlat10_15 + -0.5;
        u_xlat10_3.x = texture2D(_DistortNoiseTex, u_xlat3.xy).y;
        u_xlat3.x = u_xlat10_3.x + -0.5;
        u_xlat16_2.xy = u_xlat3.zx * vec2(_NoiseXStreng, _NoiseYStreng);
        u_xlat1.xy = u_xlat16_2.xy * vec2(u_xlat10_13) + u_xlat1.xy;
        u_xlat3.xy = _Time.yy * _DissolveNoiseChannel.zw;
        u_xlat3.xy = fract(u_xlat3.xy);
        u_xlat15.xy = u_xlat16_2.xy * vec2(u_xlat10_13) + vs_TEXCOORD0.xy;
        u_xlat3.xy = u_xlat15.xy * _DissolveNoiseChannel.xy + u_xlat3.xy;
        u_xlat10_3.x = texture2D(_DissolveNoiseTex, u_xlat3.xy).x;
        u_xlat16_2.x = u_xlat10_3.x;
    } else {
        u_xlat16_2.x = 0.5;
    }
    u_xlatb3 = 0.5<_FlowEnable;
    if(u_xlatb3){
        u_xlat3.xy = vs_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat10_3.xy = texture2D(_FlowMap, u_xlat3.xy).xy;
        u_xlat3.xy = u_xlat10_3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat15.x = _Time.x * _FlowSpeed;
        u_xlat15.x = fract(u_xlat15.x);
        u_xlat21 = u_xlat15.x * 20.0;
        u_xlat16_8 = fract(u_xlat21);
        u_xlat15.x = u_xlat15.x * 20.0 + 0.5;
        u_xlat15.x = fract(u_xlat15.x);
        u_xlat16_14.xy = vec2(u_xlat16_8) * u_xlat3.xy;
        u_xlat4.xy = (-u_xlat16_14.xy) * vec2(_FlowStrength) + u_xlat1.xy;
        u_xlat16_14.xy = u_xlat15.xx * u_xlat3.xy;
        u_xlat3.xy = (-u_xlat16_14.xy) * vec2(_FlowStrength) + u_xlat1.xy;
        u_xlat15.x = u_xlat16_8 + -0.5;
        u_xlat15.x = abs(u_xlat15.x) + abs(u_xlat15.x);
        u_xlat10_0 = texture2D(_MainTex, u_xlat4.xy);
        u_xlat10_4 = texture2D(_MainTex, u_xlat3.xy);
        u_xlat16_4 = (-u_xlat10_0) + u_xlat10_4;
        u_xlat16_0 = u_xlat15.xxxx * u_xlat16_4 + u_xlat10_0;
    } else {
        u_xlat10_3 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat16_0 = u_xlat10_3;
    }
    SV_Target0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat16_8 = u_xlat16_0.w * _Cutoff;
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_2.x + -0.5;
    u_xlat16_2.x = u_xlat16_2.x * _DissolveNoiseStrength + u_xlat16_8;
    u_xlatb1 = u_xlat16_2.x>=_DissolveStep;
    u_xlat16_2.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-u_xlat16_8) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat10_13 * u_xlat16_2.x + u_xlat16_8;
    u_xlat16_2.x = (u_xlatb19) ? u_xlat16_2.x : u_xlat16_8;
    SV_Target0.w = u_xlat16_2.x * _AlphaCutoffSoft;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
}
}
}
}