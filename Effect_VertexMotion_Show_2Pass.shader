//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/VertexMotion_Show_2Pass" {
Properties {

[Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("CullMode", Float) = 0.0

[Toggle] _UseCustomData ("UseCustomData，2.x主纹理2.y顶点高2.zw顶点偏移|3.x溶解值3.y溶解范围3.zw溶解速度", Float) = 0.0

_MainColor ("MainColor", Color) = (1,1,1,1)

_MainIntensity ("MainIntensity", Float) = 1.0

_MainTex ("MainTex", 2D) = "white" { }

_MainTexSpeed ("MainTexSpeed", Vector) = (0,0,0,0)

_Mask ("R:顶点偏移通道", 2D) = "white" { }

[Enum(Normal,0,Vertex,1)] _MotionDir ("运动方向", Float) = 0.0

_VertexDir ("VertexDir", Vector) = (0,0,0,0)

_VertexScale ("VertexScale", Float) = 0.0

_VertexPower ("VertexPower", Float) = 1.0

_VertexScaleHeight ("VertexScaleHeight", Float) = 1.0

_VertexMotionSpeed ("VertexMotionSpeed", Vector) = (0,0,0,0)

_DissTex ("R:溶解通道", 2D) = "white" { }

_DissSoft ("溶解软硬值DissSoft", Float) = 0.5

_DissOffset ("溶解值DissOffset", Float) = 0.0

_DissUspeed ("溶解U速度DissUspeed", Float) = 0.0

_DissVspeed ("溶解V速度DissVspeed", Float) = 0.0

[Header(Noise)] _DisNoise ("扰动纹理", 2D) = "black" { }

_DisNoise_Intensity ("溶解扰动强度", Float) = 0.20000000298023224

_MainNoise_Intensity ("MainTex扰动强度", Float) = 0.20000000298023224

_DisNoise_Uspeed ("扰动U速度", Float) = 0.0

_DisNoise_Vspeed ("扰动V速度", Float) = 0.0

[Space(20)] [Toggle] _UseFresnal ("UseFresnal", Float) = 0.0

[Toggle] _ClearMainRGB ("主贴图透明时保留RGB信息", Float) = 0.0

[Enum(Add,0,Blend,1)] _FresBlendMode ("混合模式", Float) = 0.0

_FresnalColor ("FresnalColor", Color) = (1,1,1,1)

_FresnalScale ("FresnalScale", Range(0, 20)) = 1.0

_FresnalWidth ("FresnalWidth", Range(-0.1, 0.5)) = 0.0

[Toggle] _Fres_Dis ("受溶解/透明度影响", Float) = 0.0

[Space(20)] [Toggle] _FresAlpha ("FresAlpha", Float) = 0.0

_FresAlpha_Intensity ("菲涅尔半透强度", Float) = 1.0

_FresAlpha_Power ("菲涅尔半透范围", Range(0.01, 10)) = 1.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 15645
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _UseCustomData;
uniform 	vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	vec4 _Mask_ST;
uniform 	vec2 _VertexMotionSpeed;
uniform 	mediump float _MotionDir;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in mediump vec3 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_1.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat16_5 = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = textureLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_MotionDir==0.0);
#else
    u_xlatb0 = _MotionDir==0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(in_TEXCOORD0.y>=_VertexScaleHeight);
#else
    u_xlatb0 = in_TEXCOORD0.y>=_VertexScaleHeight;
#endif
    u_xlat16_7 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = vec3(u_xlat16_7) * (-u_xlat16_1.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD4 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _Dst;
uniform 	mediump float _UseCustomData;
uniform 	vec4 _DissTex_ST;
uniform 	vec4 _DisNoise_ST;
uniform 	vec4 _MainTex_ST;
uniform 	vec2 _MainTexSpeed;
uniform 	mediump float _MainIntensity;
uniform 	vec4 _MainColor;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	float _DissUspeed;
uniform 	float _DissVspeed;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _MainNoise_Intensity;
uniform 	float _DisNoise_Uspeed;
uniform 	float _DisNoise_Vspeed;
uniform 	mediump float _UseFresnal;
uniform 	mediump float _ClearMainRGB;
uniform 	mediump float _FresBlendMode;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalWidth;
uniform 	mediump float _Fres_Dis;
uniform 	mediump float _FresAlpha;
uniform 	mediump float _FresAlpha_Power;
uniform 	mediump float _FresAlpha_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _DisNoise;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb6;
vec2 u_xlat7;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_DisNoise_Uspeed, _DisNoise_Vspeed) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _DisNoise_ST.xy + _DisNoise_ST.zw;
    u_xlat16_0.x = texture(_DisNoise, u_xlat0.xy).x;
    u_xlat7.xy = vec2(_DissUspeed, _DissVspeed) * _Time.yy + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat7.xy = vec2(u_xlat21) * vs_TEXCOORD2.zw + u_xlat7.xy;
    u_xlat7.xy = u_xlat16_0.xx * vec2(_DisNoise_Intensity) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissTex_ST.xy + _DissTex_ST.zw;
    u_xlat16_7 = texture(_DissTex, u_xlat7.xy).x;
    u_xlat16_1.x = u_xlat16_7 + 1.0;
    u_xlat7.x = u_xlat21 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat2.x = vs_TEXCOORD1.x * u_xlat21 + vs_TEXCOORD0.x;
    u_xlat7.x = (-u_xlat7.x) * 2.0 + u_xlat16_1.x;
    u_xlat16_1.x = (-_DissSoft) + 1.0;
    u_xlat7.x = u_xlat7.x + (-u_xlat16_1.x);
    u_xlat14.x = (-u_xlat16_1.x) + _DissSoft;
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
    u_xlat7.x = u_xlat7.x * vs_COLOR0.w;
    u_xlat2.y = vs_TEXCOORD0.y;
    u_xlat14.xy = _Time.yy * _MainTexSpeed.xy + u_xlat2.xy;
    u_xlat0.xz = u_xlat16_0.xx * vec2(vec2(_MainNoise_Intensity, _MainNoise_Intensity)) + u_xlat14.xy;
    u_xlat0.xz = u_xlat0.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xz);
    u_xlat1 = u_xlat16_1 * _MainColor;
    u_xlat16_2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xzw = u_xlat1.xyz * vec3(_MainIntensity);
    u_xlat16_3.xyz = _FresnalColor.xyz * vec3(_FresnalScale);
    u_xlat16_4.xyz = u_xlat0.xzw * vs_COLOR0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = u_xlat0.xzw * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlatb0.xzw = equal(vec4(_ClearMainRGB, _ClearMainRGB, _FresBlendMode, _FresBlendMode), vec4(0.0, 0.0, 0.0, 1.0)).xzw;
    u_xlat16_3.xyz = (u_xlatb0.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_24 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_TEXCOORD3.xyz;
    u_xlat16_24 = dot(u_xlat16_4.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_24) + 1.0;
    u_xlat16_24 = log2(u_xlat16_24);
    u_xlat16_4.x = log2(u_xlat16_4.x);
    u_xlat16_11.x = _FresnalWidth * 8.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_11.x;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_11.xyz = u_xlat16_4.xxx * _FresnalColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_FresnalScale) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (u_xlatb0.z) ? u_xlat16_11.xyz : u_xlat16_3.xyz;
    u_xlat16_11.xyz = _FresnalColor.xyz * vec3(_FresnalScale) + (-u_xlat16_3.xyz);
    u_xlat16_11.xyz = u_xlat16_4.xxx * u_xlat16_11.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = (u_xlatb0.w) ? u_xlat16_11.xyz : u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat1.w * u_xlat7.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Fres_Dis==0.0);
#else
    u_xlatb0.x = _Fres_Dis==0.0;
#endif
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_UseFresnal);
#else
    u_xlatb0.x = 0.0<_UseFresnal;
#endif
    u_xlat16_0 = (u_xlatb0.x) ? u_xlat16_5 : u_xlat16_2;
    u_xlat16_3.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat16_3.x = u_xlat16_24 * u_xlat16_3.x;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _FresAlpha_Intensity;
    u_xlat16_3.x = u_xlat16_3.x * _FresAlpha;
    u_xlat16_3.x = u_xlat16_0.w * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresAlpha));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresAlpha);
#endif
    u_xlat16_3.x = (u_xlatb6) ? u_xlat16_3.x : u_xlat16_0.w;
    u_xlat16_10 = u_xlat16_3.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(_Dst>=1.5);
#else
    u_xlatb6 = _Dst>=1.5;
#endif
    u_xlat16_17 = (u_xlatb6) ? 0.0 : 1.0;
    u_xlat16_10 = u_xlat16_17 * u_xlat16_10 + 1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10);
    u_xlat16_10 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_0.w = u_xlat16_17 * u_xlat16_10 + u_xlat16_3.x;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _UseCustomData;
uniform 	vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	vec4 _Mask_ST;
uniform 	vec2 _VertexMotionSpeed;
uniform 	mediump float _MotionDir;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in mediump vec3 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_1.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat16_5 = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = textureLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_MotionDir==0.0);
#else
    u_xlatb0 = _MotionDir==0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb0)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(in_TEXCOORD0.y>=_VertexScaleHeight);
#else
    u_xlatb0 = in_TEXCOORD0.y>=_VertexScaleHeight;
#endif
    u_xlat16_7 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = vec3(u_xlat16_7) * (-u_xlat16_1.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD4 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _Dst;
uniform 	mediump float _UseCustomData;
uniform 	vec4 _DissTex_ST;
uniform 	vec4 _DisNoise_ST;
uniform 	vec4 _MainTex_ST;
uniform 	vec2 _MainTexSpeed;
uniform 	mediump float _MainIntensity;
uniform 	vec4 _MainColor;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	float _DissUspeed;
uniform 	float _DissVspeed;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _MainNoise_Intensity;
uniform 	float _DisNoise_Uspeed;
uniform 	float _DisNoise_Vspeed;
uniform 	mediump float _UseFresnal;
uniform 	mediump float _ClearMainRGB;
uniform 	mediump float _FresBlendMode;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalWidth;
uniform 	mediump float _Fres_Dis;
uniform 	mediump float _FresAlpha;
uniform 	mediump float _FresAlpha_Power;
uniform 	mediump float _FresAlpha_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _DisNoise;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb6;
vec2 u_xlat7;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_DisNoise_Uspeed, _DisNoise_Vspeed) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _DisNoise_ST.xy + _DisNoise_ST.zw;
    u_xlat16_0.x = texture(_DisNoise, u_xlat0.xy).x;
    u_xlat7.xy = vec2(_DissUspeed, _DissVspeed) * _Time.yy + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat7.xy = vec2(u_xlat21) * vs_TEXCOORD2.zw + u_xlat7.xy;
    u_xlat7.xy = u_xlat16_0.xx * vec2(_DisNoise_Intensity) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissTex_ST.xy + _DissTex_ST.zw;
    u_xlat16_7 = texture(_DissTex, u_xlat7.xy).x;
    u_xlat16_1.x = u_xlat16_7 + 1.0;
    u_xlat7.x = u_xlat21 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat2.x = vs_TEXCOORD1.x * u_xlat21 + vs_TEXCOORD0.x;
    u_xlat7.x = (-u_xlat7.x) * 2.0 + u_xlat16_1.x;
    u_xlat16_1.x = (-_DissSoft) + 1.0;
    u_xlat7.x = u_xlat7.x + (-u_xlat16_1.x);
    u_xlat14.x = (-u_xlat16_1.x) + _DissSoft;
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
    u_xlat7.x = u_xlat7.x * vs_COLOR0.w;
    u_xlat2.y = vs_TEXCOORD0.y;
    u_xlat14.xy = _Time.yy * _MainTexSpeed.xy + u_xlat2.xy;
    u_xlat0.xz = u_xlat16_0.xx * vec2(vec2(_MainNoise_Intensity, _MainNoise_Intensity)) + u_xlat14.xy;
    u_xlat0.xz = u_xlat0.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xz);
    u_xlat1 = u_xlat16_1 * _MainColor;
    u_xlat16_2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xzw = u_xlat1.xyz * vec3(_MainIntensity);
    u_xlat16_3.xyz = _FresnalColor.xyz * vec3(_FresnalScale);
    u_xlat16_4.xyz = u_xlat0.xzw * vs_COLOR0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = u_xlat0.xzw * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlatb0.xzw = equal(vec4(_ClearMainRGB, _ClearMainRGB, _FresBlendMode, _FresBlendMode), vec4(0.0, 0.0, 0.0, 1.0)).xzw;
    u_xlat16_3.xyz = (u_xlatb0.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_24 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_TEXCOORD3.xyz;
    u_xlat16_24 = dot(u_xlat16_4.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_24) + 1.0;
    u_xlat16_24 = log2(u_xlat16_24);
    u_xlat16_4.x = log2(u_xlat16_4.x);
    u_xlat16_11.x = _FresnalWidth * 8.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_11.x;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_11.xyz = u_xlat16_4.xxx * _FresnalColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_FresnalScale) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (u_xlatb0.z) ? u_xlat16_11.xyz : u_xlat16_3.xyz;
    u_xlat16_11.xyz = _FresnalColor.xyz * vec3(_FresnalScale) + (-u_xlat16_3.xyz);
    u_xlat16_11.xyz = u_xlat16_4.xxx * u_xlat16_11.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = (u_xlatb0.w) ? u_xlat16_11.xyz : u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat1.w * u_xlat7.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_Fres_Dis==0.0);
#else
    u_xlatb0.x = _Fres_Dis==0.0;
#endif
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_UseFresnal);
#else
    u_xlatb0.x = 0.0<_UseFresnal;
#endif
    u_xlat16_0 = (u_xlatb0.x) ? u_xlat16_5 : u_xlat16_2;
    u_xlat16_3.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat16_3.x = u_xlat16_24 * u_xlat16_3.x;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _FresAlpha_Intensity;
    u_xlat16_3.x = u_xlat16_3.x * _FresAlpha;
    u_xlat16_3.x = u_xlat16_0.w * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresAlpha));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresAlpha);
#endif
    u_xlat16_3.x = (u_xlatb6) ? u_xlat16_3.x : u_xlat16_0.w;
    u_xlat16_10 = u_xlat16_3.x + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(_Dst>=1.5);
#else
    u_xlatb6 = _Dst>=1.5;
#endif
    u_xlat16_17 = (u_xlatb6) ? 0.0 : 1.0;
    u_xlat16_10 = u_xlat16_17 * u_xlat16_10 + 1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10);
    u_xlat16_10 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_0.w = u_xlat16_17 * u_xlat16_10 + u_xlat16_3.x;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _UseCustomData;
uniform 	vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	vec4 _Mask_ST;
uniform 	vec2 _VertexMotionSpeed;
uniform 	mediump float _MotionDir;
uniform lowp sampler2D _Mask;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_1.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat16_5 = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2DLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlatb0 = _MotionDir==0.0;
    u_xlat0.xyz = (bool(u_xlatb0)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlatb0 = in_TEXCOORD0.y>=_VertexScaleHeight;
    u_xlat16_7 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = vec3(u_xlat16_7) * (-u_xlat16_1.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD4 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _Dst;
uniform 	mediump float _UseCustomData;
uniform 	vec4 _DissTex_ST;
uniform 	vec4 _DisNoise_ST;
uniform 	vec4 _MainTex_ST;
uniform 	vec2 _MainTexSpeed;
uniform 	mediump float _MainIntensity;
uniform 	vec4 _MainColor;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	float _DissUspeed;
uniform 	float _DissVspeed;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _MainNoise_Intensity;
uniform 	float _DisNoise_Uspeed;
uniform 	float _DisNoise_Vspeed;
uniform 	mediump float _UseFresnal;
uniform 	mediump float _ClearMainRGB;
uniform 	mediump float _FresBlendMode;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalWidth;
uniform 	mediump float _Fres_Dis;
uniform 	mediump float _FresAlpha;
uniform 	mediump float _FresAlpha_Power;
uniform 	mediump float _FresAlpha_Intensity;
uniform lowp sampler2D _DisNoise;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb6;
vec2 u_xlat7;
lowp float u_xlat10_7;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_DisNoise_Uspeed, _DisNoise_Vspeed) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _DisNoise_ST.xy + _DisNoise_ST.zw;
    u_xlat10_0 = texture2D(_DisNoise, u_xlat0.xy).x;
    u_xlat7.xy = vec2(_DissUspeed, _DissVspeed) * _Time.yy + vs_TEXCOORD0.xy;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat7.xy = vec2(u_xlat21) * vs_TEXCOORD2.zw + u_xlat7.xy;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_DisNoise_Intensity) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissTex_ST.xy + _DissTex_ST.zw;
    u_xlat10_7 = texture2D(_DissTex, u_xlat7.xy).x;
    u_xlat16_1 = u_xlat10_7 + 1.0;
    u_xlat7.x = u_xlat21 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat2.x = vs_TEXCOORD1.x * u_xlat21 + vs_TEXCOORD0.x;
    u_xlat7.x = (-u_xlat7.x) * 2.0 + u_xlat16_1;
    u_xlat16_1 = (-_DissSoft) + 1.0;
    u_xlat7.x = u_xlat7.x + (-u_xlat16_1);
    u_xlat14.x = (-u_xlat16_1) + _DissSoft;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * vs_COLOR0.w;
    u_xlat2.y = vs_TEXCOORD0.y;
    u_xlat14.xy = _Time.yy * _MainTexSpeed.xy + u_xlat2.xy;
    u_xlat0.xz = vec2(u_xlat10_0) * vec2(vec2(_MainNoise_Intensity, _MainNoise_Intensity)) + u_xlat14.xy;
    u_xlat0.xz = u_xlat0.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xz);
    u_xlat1 = u_xlat10_1 * _MainColor;
    u_xlat16_2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xzw = u_xlat1.xyz * vec3(_MainIntensity);
    u_xlat16_3.xyz = _FresnalColor.xyz * vec3(_FresnalScale);
    u_xlat16_4.xyz = u_xlat0.xzw * vs_COLOR0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = u_xlat0.xzw * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlatb0.xzw = equal(vec4(_ClearMainRGB, _ClearMainRGB, _FresBlendMode, _FresBlendMode), vec4(0.0, 0.0, 0.0, 1.0)).xzw;
    u_xlat16_3.xyz = (u_xlatb0.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_24 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_TEXCOORD3.xyz;
    u_xlat16_24 = dot(u_xlat16_4.xyz, u_xlat5.xyz);
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_24) + 1.0;
    u_xlat16_24 = log2(u_xlat16_24);
    u_xlat16_4.x = log2(u_xlat16_4.x);
    u_xlat16_11.x = _FresnalWidth * 8.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_11.x;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_11.xyz = u_xlat16_4.xxx * _FresnalColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_FresnalScale) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (u_xlatb0.z) ? u_xlat16_11.xyz : u_xlat16_3.xyz;
    u_xlat16_11.xyz = _FresnalColor.xyz * vec3(_FresnalScale) + (-u_xlat16_3.xyz);
    u_xlat16_11.xyz = u_xlat16_4.xxx * u_xlat16_11.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = (u_xlatb0.w) ? u_xlat16_11.xyz : u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat1.w * u_xlat7.x + u_xlat16_4.x;
    u_xlatb0.x = _Fres_Dis==0.0;
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.w;
    u_xlatb0.x = 0.0<_UseFresnal;
    u_xlat16_0 = (u_xlatb0.x) ? u_xlat16_5 : u_xlat16_2;
    u_xlat16_3.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat16_3.x = u_xlat16_24 * u_xlat16_3.x;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _FresAlpha_Intensity;
    u_xlat16_3.x = u_xlat16_3.x * _FresAlpha;
    u_xlat16_3.x = u_xlat16_0.w * u_xlat16_3.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresAlpha);
    u_xlat16_3.x = (u_xlatb6) ? u_xlat16_3.x : u_xlat16_0.w;
    u_xlat16_10 = u_xlat16_3.x + -1.0;
    u_xlatb6 = _Dst>=1.5;
    u_xlat16_17 = (u_xlatb6) ? 0.0 : 1.0;
    u_xlat16_10 = u_xlat16_17 * u_xlat16_10 + 1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10);
    u_xlat16_10 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_0.w = u_xlat16_17 * u_xlat16_10 + u_xlat16_3.x;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _UseCustomData;
uniform 	vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	vec4 _Mask_ST;
uniform 	vec2 _VertexMotionSpeed;
uniform 	mediump float _MotionDir;
uniform lowp sampler2D _Mask;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_1.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat16_5 = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = texture2DLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5;
    u_xlatb0 = _MotionDir==0.0;
    u_xlat0.xyz = (bool(u_xlatb0)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat0.xyz;
    u_xlatb0 = in_TEXCOORD0.y>=_VertexScaleHeight;
    u_xlat16_7 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = vec3(u_xlat16_7) * (-u_xlat16_1.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD4 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _Dst;
uniform 	mediump float _UseCustomData;
uniform 	vec4 _DissTex_ST;
uniform 	vec4 _DisNoise_ST;
uniform 	vec4 _MainTex_ST;
uniform 	vec2 _MainTexSpeed;
uniform 	mediump float _MainIntensity;
uniform 	vec4 _MainColor;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	float _DissUspeed;
uniform 	float _DissVspeed;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _MainNoise_Intensity;
uniform 	float _DisNoise_Uspeed;
uniform 	float _DisNoise_Vspeed;
uniform 	mediump float _UseFresnal;
uniform 	mediump float _ClearMainRGB;
uniform 	mediump float _FresBlendMode;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalWidth;
uniform 	mediump float _Fres_Dis;
uniform 	mediump float _FresAlpha;
uniform 	mediump float _FresAlpha_Power;
uniform 	mediump float _FresAlpha_Intensity;
uniform lowp sampler2D _DisNoise;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD3;
varying mediump vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb6;
vec2 u_xlat7;
lowp float u_xlat10_7;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_11;
vec2 u_xlat14;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(_DisNoise_Uspeed, _DisNoise_Vspeed) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _DisNoise_ST.xy + _DisNoise_ST.zw;
    u_xlat10_0 = texture2D(_DisNoise, u_xlat0.xy).x;
    u_xlat7.xy = vec2(_DissUspeed, _DissVspeed) * _Time.yy + vs_TEXCOORD0.xy;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat7.xy = vec2(u_xlat21) * vs_TEXCOORD2.zw + u_xlat7.xy;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_DisNoise_Intensity) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissTex_ST.xy + _DissTex_ST.zw;
    u_xlat10_7 = texture2D(_DissTex, u_xlat7.xy).x;
    u_xlat16_1 = u_xlat10_7 + 1.0;
    u_xlat7.x = u_xlat21 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat2.x = vs_TEXCOORD1.x * u_xlat21 + vs_TEXCOORD0.x;
    u_xlat7.x = (-u_xlat7.x) * 2.0 + u_xlat16_1;
    u_xlat16_1 = (-_DissSoft) + 1.0;
    u_xlat7.x = u_xlat7.x + (-u_xlat16_1);
    u_xlat14.x = (-u_xlat16_1) + _DissSoft;
    u_xlat14.x = float(1.0) / u_xlat14.x;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat7.x = u_xlat7.x * vs_COLOR0.w;
    u_xlat2.y = vs_TEXCOORD0.y;
    u_xlat14.xy = _Time.yy * _MainTexSpeed.xy + u_xlat2.xy;
    u_xlat0.xz = vec2(u_xlat10_0) * vec2(vec2(_MainNoise_Intensity, _MainNoise_Intensity)) + u_xlat14.xy;
    u_xlat0.xz = u_xlat0.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xz);
    u_xlat1 = u_xlat10_1 * _MainColor;
    u_xlat16_2.w = u_xlat7.x * u_xlat1.w;
    u_xlat0.xzw = u_xlat1.xyz * vec3(_MainIntensity);
    u_xlat16_3.xyz = _FresnalColor.xyz * vec3(_FresnalScale);
    u_xlat16_4.xyz = u_xlat0.xzw * vs_COLOR0.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = u_xlat0.xzw * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlatb0.xzw = equal(vec4(_ClearMainRGB, _ClearMainRGB, _FresBlendMode, _FresBlendMode), vec4(0.0, 0.0, 0.0, 1.0)).xzw;
    u_xlat16_3.xyz = (u_xlatb0.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_24 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_4.xyz = vec3(u_xlat16_24) * vs_TEXCOORD3.xyz;
    u_xlat16_24 = dot(u_xlat16_4.xyz, u_xlat5.xyz);
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat16_24) + 1.0;
    u_xlat16_24 = log2(u_xlat16_24);
    u_xlat16_4.x = log2(u_xlat16_4.x);
    u_xlat16_11.x = _FresnalWidth * 8.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_11.x;
    u_xlat16_4.x = exp2(u_xlat16_4.x);
    u_xlat16_11.xyz = u_xlat16_4.xxx * _FresnalColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(_FresnalScale) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (u_xlatb0.z) ? u_xlat16_11.xyz : u_xlat16_3.xyz;
    u_xlat16_11.xyz = _FresnalColor.xyz * vec3(_FresnalScale) + (-u_xlat16_3.xyz);
    u_xlat16_11.xyz = u_xlat16_4.xxx * u_xlat16_11.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = (u_xlatb0.w) ? u_xlat16_11.xyz : u_xlat16_3.xyz;
    u_xlat16_3.x = u_xlat1.w * u_xlat7.x + u_xlat16_4.x;
    u_xlatb0.x = _Fres_Dis==0.0;
    u_xlat16_5.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_2.w;
    u_xlatb0.x = 0.0<_UseFresnal;
    u_xlat16_0 = (u_xlatb0.x) ? u_xlat16_5 : u_xlat16_2;
    u_xlat16_3.x = _FresAlpha_Power * 8.0 + 1.0;
    u_xlat16_3.x = u_xlat16_24 * u_xlat16_3.x;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _FresAlpha_Intensity;
    u_xlat16_3.x = u_xlat16_3.x * _FresAlpha;
    u_xlat16_3.x = u_xlat16_0.w * u_xlat16_3.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_FresAlpha);
    u_xlat16_3.x = (u_xlatb6) ? u_xlat16_3.x : u_xlat16_0.w;
    u_xlat16_10 = u_xlat16_3.x + -1.0;
    u_xlatb6 = _Dst>=1.5;
    u_xlat16_17 = (u_xlatb6) ? 0.0 : 1.0;
    u_xlat16_10 = u_xlat16_17 * u_xlat16_10 + 1.0;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(u_xlat16_10);
    u_xlat16_10 = (-u_xlat16_3.x) + 1.0;
    u_xlat16_0.w = u_xlat16_17 * u_xlat16_10 + u_xlat16_3.x;
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
}
}
}
}