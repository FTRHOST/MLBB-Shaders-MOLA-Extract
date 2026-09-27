//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/VertexMotion_Show_Fresnel" {
Properties {

[Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("CullMode", Float) = 0.0

[Enum(On,1,Off,0)] _ZWriteMode ("ZWriteMode", Float) = 0.0

[Toggle] _UseCustomData ("UseCustomData，2.x主纹理2.y顶点高2.zw顶点偏移|3.x溶解值3.y溶解范围3.zw溶解速度", Float) = 0.0

_MainColor ("MainColor", Color) = (1,1,1,1)

_MainIntensity ("MainIntensity", Float) = 1.0

_MainTex ("MainTex", 2D) = "white" { }

_MainTexSpeed ("MainTexSpeed", Vector) = (0,0,0,0)

_Mask ("Mask(R:顶点偏移通道)(G:溶解通道)", 2D) = "white" { }

_GChannel ("xy控制Mask的G通道Tiling", Vector) = (1,1,0,0)

[Enum(Normal,0,Vertex,1)] _MotionDir ("运动方向", Float) = 0.0

_VertexDir ("VertexDir", Vector) = (0,0,0,0)

_VertexScale ("VertexScale", Float) = 0.0

_VertexPower ("VertexPower", Float) = 1.0

_VertexScaleHeight ("VertexScaleHeight", Float) = 1.0

_VertexMotionSpeed ("VertexMotionSpeed", Vector) = (0,0,0,0)

_RampTex ("RampTex", 2D) = "white" { }

_RampUVOffset ("RampUVOffset", Range(-1, 1)) = 0.0

_LightColor ("高光颜色LightColor", Color) = (1,1,1,1)

_LightRange ("高亮范围LightRange", Float) = 0.0

_FireColor ("火焰颜色FireColor", Color) = (1,1,1,1)

_FireRange ("火焰范围FireRange", Float) = 0.0

_SmokeColor ("烟雾颜色SmokeColor", Color) = (0,0,0,0)

_SmokeRange ("烟雾范围SmokeRange", Float) = 0.0

_DissSoft ("溶解软硬值DissSoft", Float) = 0.49900001287460327

_DissOffset ("溶解值DissOffset", Float) = 1.0

_DissUspeed ("溶解U速度DissUspeed", Float) = 0.0

_DissVspeed ("溶解V速度DissVspeed", Float) = 0.0

[Space(20)] [Toggle] _UseFresnal ("UseFresnal", Float) = 1.0

_FresnalColor ("FresnalColor", Color) = (1,1,1,1)

_FresnalScale ("FresnalScale", Range(0, 20)) = 1.0

_FresnalWidth ("FresnalWidth", Range(-0.1, 0.5)) = 0.0

[Toggle] _UseMatCap ("UseMatCap", Float) = 0.0

_MatCapTex ("MatCapTex", 2D) = "white" { }

_MatCapColor ("MatCapColor", Color) = (1,1,1,1)

_MatCapIntensity ("MatCapIntensity", Range(0, 10)) = 1.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 47441
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _UseCustomData;
uniform 	vec4 _VertexDir;
uniform 	float _VertexScale;
uniform 	float _VertexPower;
uniform 	float _VertexScaleHeight;
uniform 	vec4 _Mask_ST;
uniform 	vec2 _VertexMotionSpeed;
uniform 	mediump float _MotionDir;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat6;
bool u_xlatb6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat2.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy;
    u_xlat2.x = textureLod(_Mask, u_xlat2.xy, 0.0).x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _VertexPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_MotionDir==0.0);
#else
    u_xlatb2 = _MotionDir==0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(in_TEXCOORD0.y>=_VertexScaleHeight);
#else
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat6) * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _UseCustomData;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _GChannel;
uniform 	vec4 _MainTex_ST;
uniform 	vec2 _MainTexSpeed;
uniform 	float _MainIntensity;
uniform 	mediump vec4 _MainColor;
uniform 	float _RampUVOffset;
uniform 	mediump vec4 _LightColor;
uniform 	float _LightRange;
uniform 	mediump vec4 _FireColor;
uniform 	float _FireRange;
uniform 	mediump vec4 _SmokeColor;
uniform 	float _DissSoft;
uniform 	float _DissOffset;
uniform 	float _DissUspeed;
uniform 	float _DissVspeed;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	float _FresnalScale;
uniform 	float _FresnalWidth;
uniform 	mediump float _UseMatCap;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump float _MatCapIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MatCapTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
vec3 u_xlat6;
float u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat1.x = vs_TEXCOORD1.x * u_xlat0.x + vs_TEXCOORD0.x;
    u_xlat1.y = vs_TEXCOORD0.y;
    u_xlat6.xy = _Time.yy * _MainTexSpeed.xy + u_xlat1.xy;
    u_xlat6.xy = u_xlat6.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat6.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.x = texture(_Mask, u_xlat1.xy).x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vec2(_RampUVOffset);
    u_xlat16_1.xyz = texture(_RampTex, u_xlat1.xy).xyz;
    u_xlat3.xy = u_xlat0.xx * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat4.x = _Time.y * _DissUspeed;
    u_xlat4.y = _Time.y * _DissVspeed;
    u_xlat3.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat4.xy;
    u_xlat3.x = texture(_Mask, u_xlat3.xy).y;
    u_xlat9.x = u_xlat0.x * vs_TEXCOORD2.y + _FireRange;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat3.x>=u_xlat9.x);
#else
    u_xlatb9 = u_xlat3.x>=u_xlat9.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.xyz = _FireColor.xyz + (-_SmokeColor.xyz);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat4.xyz + _SmokeColor.xyz;
    u_xlat4.x = u_xlat0.x * vs_TEXCOORD2.y + _LightRange;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat3.x>=u_xlat4.x);
#else
    u_xlatb4 = u_xlat3.x>=u_xlat4.x;
#endif
    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat9.xyz = _LightColor.xyz * u_xlat4.xxx + u_xlat9.xyz;
    u_xlat4.x = (-_DissSoft) + 1.0;
    u_xlat16_2.x = u_xlat3.x + 1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD2.x + _DissOffset;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + u_xlat16_2.x;
    u_xlat3.x = (-u_xlat4.x) + _DissSoft;
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.yzw = u_xlat6.xyz * u_xlat16_1.xyz;
    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
    u_xlat6.xyz = u_xlat9.xyz * u_xlat0.yzw;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_UseFresnal);
#else
    u_xlatb1 = 0.0<_UseFresnal;
#endif
    u_xlat7 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat3.xyz = vec3(u_xlat7) * vs_TEXCOORD3.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat4.xyz = vec3(u_xlat7) * u_xlat4.xyz;
    u_xlat16_8.x = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<u_xlat16_8.x);
#else
    u_xlatb7 = 0.0<u_xlat16_8.x;
#endif
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat13 = _FresnalWidth * 8.0 + 1.0;
    u_xlat3.x = log2(u_xlat16_8.x);
    u_xlat13 = u_xlat13 * u_xlat3.x;
    u_xlat13 = exp2(u_xlat13);
    u_xlat16_8.xyz = vec3(u_xlat13) * _FresnalColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_FresnalScale) + u_xlat6.xyz;
    u_xlat16_5 = u_xlat16_1.w * u_xlat0.x + u_xlat13;
    u_xlat16_8.xyz = (bool(u_xlatb7)) ? u_xlat16_8.xyz : u_xlat6.xyz;
    u_xlat16_5 = (u_xlatb7) ? u_xlat16_5 : u_xlat16_2.x;
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xyz : u_xlat6.xyz;
    u_xlat16_0.w = (u_xlatb1) ? u_xlat16_5 : u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_UseMatCap);
#else
    u_xlatb1 = 0.0<_UseMatCap;
#endif
    if(u_xlatb1){
        u_xlat16_2.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
        u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
        u_xlat16_2.xy = u_xlat16_2.xx * vs_TEXCOORD5.xy;
        u_xlat1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat16_1.xyz = texture(_MatCapTex, u_xlat1.xy).xyz;
        u_xlat16_2.xyz = u_xlat16_1.xyz * _MatCapColor.xyz;
        u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(_MatCapIntensity) + u_xlat16_0.xyz;
    }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _UseCustomData;
uniform 	vec4 _VertexDir;
uniform 	float _VertexScale;
uniform 	float _VertexPower;
uniform 	float _VertexScaleHeight;
uniform 	vec4 _Mask_ST;
uniform 	vec2 _VertexMotionSpeed;
uniform 	mediump float _MotionDir;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat6;
bool u_xlatb6;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat2.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy;
    u_xlat2.x = textureLod(_Mask, u_xlat2.xy, 0.0).x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _VertexPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_MotionDir==0.0);
#else
    u_xlatb2 = _MotionDir==0.0;
#endif
    u_xlat2.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(in_TEXCOORD0.y>=_VertexScaleHeight);
#else
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat6) * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _UseCustomData;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _GChannel;
uniform 	vec4 _MainTex_ST;
uniform 	vec2 _MainTexSpeed;
uniform 	float _MainIntensity;
uniform 	mediump vec4 _MainColor;
uniform 	float _RampUVOffset;
uniform 	mediump vec4 _LightColor;
uniform 	float _LightRange;
uniform 	mediump vec4 _FireColor;
uniform 	float _FireRange;
uniform 	mediump vec4 _SmokeColor;
uniform 	float _DissSoft;
uniform 	float _DissOffset;
uniform 	float _DissUspeed;
uniform 	float _DissVspeed;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	float _FresnalScale;
uniform 	float _FresnalWidth;
uniform 	mediump float _UseMatCap;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump float _MatCapIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MatCapTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
vec3 u_xlat6;
float u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat13;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat1.x = vs_TEXCOORD1.x * u_xlat0.x + vs_TEXCOORD0.x;
    u_xlat1.y = vs_TEXCOORD0.y;
    u_xlat6.xy = _Time.yy * _MainTexSpeed.xy + u_xlat1.xy;
    u_xlat6.xy = u_xlat6.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat6.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.x = texture(_Mask, u_xlat1.xy).x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vec2(_RampUVOffset);
    u_xlat16_1.xyz = texture(_RampTex, u_xlat1.xy).xyz;
    u_xlat3.xy = u_xlat0.xx * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat4.x = _Time.y * _DissUspeed;
    u_xlat4.y = _Time.y * _DissVspeed;
    u_xlat3.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat4.xy;
    u_xlat3.x = texture(_Mask, u_xlat3.xy).y;
    u_xlat9.x = u_xlat0.x * vs_TEXCOORD2.y + _FireRange;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat3.x>=u_xlat9.x);
#else
    u_xlatb9 = u_xlat3.x>=u_xlat9.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.xyz = _FireColor.xyz + (-_SmokeColor.xyz);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat4.xyz + _SmokeColor.xyz;
    u_xlat4.x = u_xlat0.x * vs_TEXCOORD2.y + _LightRange;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat3.x>=u_xlat4.x);
#else
    u_xlatb4 = u_xlat3.x>=u_xlat4.x;
#endif
    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat9.xyz = _LightColor.xyz * u_xlat4.xxx + u_xlat9.xyz;
    u_xlat4.x = (-_DissSoft) + 1.0;
    u_xlat16_2.x = u_xlat3.x + 1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD2.x + _DissOffset;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + u_xlat16_2.x;
    u_xlat3.x = (-u_xlat4.x) + _DissSoft;
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.yzw = u_xlat6.xyz * u_xlat16_1.xyz;
    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
    u_xlat6.xyz = u_xlat9.xyz * u_xlat0.yzw;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_UseFresnal);
#else
    u_xlatb1 = 0.0<_UseFresnal;
#endif
    u_xlat7 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat3.xyz = vec3(u_xlat7) * vs_TEXCOORD3.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat4.xyz = vec3(u_xlat7) * u_xlat4.xyz;
    u_xlat16_8.x = dot(u_xlat3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<u_xlat16_8.x);
#else
    u_xlatb7 = 0.0<u_xlat16_8.x;
#endif
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat13 = _FresnalWidth * 8.0 + 1.0;
    u_xlat3.x = log2(u_xlat16_8.x);
    u_xlat13 = u_xlat13 * u_xlat3.x;
    u_xlat13 = exp2(u_xlat13);
    u_xlat16_8.xyz = vec3(u_xlat13) * _FresnalColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_FresnalScale) + u_xlat6.xyz;
    u_xlat16_5 = u_xlat16_1.w * u_xlat0.x + u_xlat13;
    u_xlat16_8.xyz = (bool(u_xlatb7)) ? u_xlat16_8.xyz : u_xlat6.xyz;
    u_xlat16_5 = (u_xlatb7) ? u_xlat16_5 : u_xlat16_2.x;
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xyz : u_xlat6.xyz;
    u_xlat16_0.w = (u_xlatb1) ? u_xlat16_5 : u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_UseMatCap);
#else
    u_xlatb1 = 0.0<_UseMatCap;
#endif
    if(u_xlatb1){
        u_xlat16_2.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
        u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
        u_xlat16_2.xy = u_xlat16_2.xx * vs_TEXCOORD5.xy;
        u_xlat1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat16_1.xyz = texture(_MatCapTex, u_xlat1.xy).xyz;
        u_xlat16_2.xyz = u_xlat16_1.xyz * _MatCapColor.xyz;
        u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(_MatCapIntensity) + u_xlat16_0.xyz;
    }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _UseCustomData;
uniform 	vec4 _VertexDir;
uniform 	float _VertexScale;
uniform 	float _VertexPower;
uniform 	float _VertexScaleHeight;
uniform 	vec4 _Mask_ST;
uniform 	vec2 _VertexMotionSpeed;
uniform 	mediump float _MotionDir;
uniform lowp sampler2D _Mask;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat2.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy;
    u_xlat2.x = texture2DLod(_Mask, u_xlat2.xy, 0.0).x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _VertexPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlatb2 = _MotionDir==0.0;
    u_xlat2.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat6) * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _UseCustomData;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _GChannel;
uniform 	vec4 _MainTex_ST;
uniform 	vec2 _MainTexSpeed;
uniform 	float _MainIntensity;
uniform 	mediump vec4 _MainColor;
uniform 	float _RampUVOffset;
uniform 	mediump vec4 _LightColor;
uniform 	float _LightRange;
uniform 	mediump vec4 _FireColor;
uniform 	float _FireRange;
uniform 	mediump vec4 _SmokeColor;
uniform 	float _DissSoft;
uniform 	float _DissOffset;
uniform 	float _DissUspeed;
uniform 	float _DissVspeed;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	float _FresnalScale;
uniform 	float _FresnalWidth;
uniform 	mediump float _UseMatCap;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump float _MatCapIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _MatCapTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
vec3 u_xlat6;
float u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat1.x = vs_TEXCOORD1.x * u_xlat0.x + vs_TEXCOORD0.x;
    u_xlat1.y = vs_TEXCOORD0.y;
    u_xlat6.xy = _Time.yy * _MainTexSpeed.xy + u_xlat1.xy;
    u_xlat6.xy = u_xlat6.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.x = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vec2(_RampUVOffset);
    u_xlat10_1.xyz = texture2D(_RampTex, u_xlat1.xy).xyz;
    u_xlat3.xy = u_xlat0.xx * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat4.x = _Time.y * _DissUspeed;
    u_xlat4.y = _Time.y * _DissVspeed;
    u_xlat3.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat4.xy;
    u_xlat3.x = texture2D(_Mask, u_xlat3.xy).y;
    u_xlat9.x = u_xlat0.x * vs_TEXCOORD2.y + _FireRange;
    u_xlatb9 = u_xlat3.x>=u_xlat9.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.xyz = _FireColor.xyz + (-_SmokeColor.xyz);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat4.xyz + _SmokeColor.xyz;
    u_xlat4.x = u_xlat0.x * vs_TEXCOORD2.y + _LightRange;
    u_xlatb4 = u_xlat3.x>=u_xlat4.x;
    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat9.xyz = _LightColor.xyz * u_xlat4.xxx + u_xlat9.xyz;
    u_xlat4.x = (-_DissSoft) + 1.0;
    u_xlat16_2.x = u_xlat3.x + 1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD2.x + _DissOffset;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + u_xlat16_2.x;
    u_xlat3.x = (-u_xlat4.x) + _DissSoft;
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.yzw = u_xlat6.xyz * u_xlat10_1.xyz;
    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
    u_xlat6.xyz = u_xlat9.xyz * u_xlat0.yzw;
    u_xlat16_2.x = u_xlat0.x * u_xlat10_1.w;
    u_xlatb1 = 0.0<_UseFresnal;
    u_xlat7 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat3.xyz = vec3(u_xlat7) * vs_TEXCOORD3.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat4.xyz = vec3(u_xlat7) * u_xlat4.xyz;
    u_xlat16_8.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlatb7 = 0.0<u_xlat16_8.x;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat13 = _FresnalWidth * 8.0 + 1.0;
    u_xlat3.x = log2(u_xlat16_8.x);
    u_xlat13 = u_xlat13 * u_xlat3.x;
    u_xlat13 = exp2(u_xlat13);
    u_xlat16_8.xyz = vec3(u_xlat13) * _FresnalColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_FresnalScale) + u_xlat6.xyz;
    u_xlat16_5 = u_xlat10_1.w * u_xlat0.x + u_xlat13;
    u_xlat16_8.xyz = (bool(u_xlatb7)) ? u_xlat16_8.xyz : u_xlat6.xyz;
    u_xlat16_5 = (u_xlatb7) ? u_xlat16_5 : u_xlat16_2.x;
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xyz : u_xlat6.xyz;
    u_xlat16_0.w = (u_xlatb1) ? u_xlat16_5 : u_xlat16_2.x;
    u_xlatb1 = 0.0<_UseMatCap;
    if(u_xlatb1){
        u_xlat16_2.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
        u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
        u_xlat16_2.xy = u_xlat16_2.xx * vs_TEXCOORD5.xy;
        u_xlat1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat10_1.xyz = texture2D(_MatCapTex, u_xlat1.xy).xyz;
        u_xlat16_2.xyz = u_xlat10_1.xyz * _MatCapColor.xyz;
        u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(_MatCapIntensity) + u_xlat16_0.xyz;
    }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _UseCustomData;
uniform 	vec4 _VertexDir;
uniform 	float _VertexScale;
uniform 	float _VertexPower;
uniform 	float _VertexScaleHeight;
uniform 	vec4 _Mask_ST;
uniform 	vec2 _VertexMotionSpeed;
uniform 	mediump float _MotionDir;
uniform lowp sampler2D _Mask;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat0.x = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat2.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy;
    u_xlat2.x = texture2DLod(_Mask, u_xlat2.xy, 0.0).x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _VertexPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlatb2 = _MotionDir==0.0;
    u_xlat2.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat6) * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump float _UseCustomData;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _GChannel;
uniform 	vec4 _MainTex_ST;
uniform 	vec2 _MainTexSpeed;
uniform 	float _MainIntensity;
uniform 	mediump vec4 _MainColor;
uniform 	float _RampUVOffset;
uniform 	mediump vec4 _LightColor;
uniform 	float _LightRange;
uniform 	mediump vec4 _FireColor;
uniform 	float _FireRange;
uniform 	mediump vec4 _SmokeColor;
uniform 	float _DissSoft;
uniform 	float _DissOffset;
uniform 	float _DissUspeed;
uniform 	float _DissVspeed;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	float _FresnalScale;
uniform 	float _FresnalWidth;
uniform 	mediump float _UseMatCap;
uniform 	mediump vec4 _MatCapColor;
uniform 	mediump float _MatCapIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _MatCapTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
vec3 u_xlat6;
float u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat13;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat1.x = vs_TEXCOORD1.x * u_xlat0.x + vs_TEXCOORD0.x;
    u_xlat1.y = vs_TEXCOORD0.y;
    u_xlat6.xy = _Time.yy * _MainTexSpeed.xy + u_xlat1.xy;
    u_xlat6.xy = u_xlat6.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * _MainColor.xyz;
    u_xlat6.xyz = u_xlat16_2.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat1.x = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat1.y = 0.0;
    u_xlat1.xy = u_xlat1.xy + vec2(_RampUVOffset);
    u_xlat10_1.xyz = texture2D(_RampTex, u_xlat1.xy).xyz;
    u_xlat3.xy = u_xlat0.xx * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat4.x = _Time.y * _DissUspeed;
    u_xlat4.y = _Time.y * _DissVspeed;
    u_xlat3.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy + u_xlat4.xy;
    u_xlat3.x = texture2D(_Mask, u_xlat3.xy).y;
    u_xlat9.x = u_xlat0.x * vs_TEXCOORD2.y + _FireRange;
    u_xlatb9 = u_xlat3.x>=u_xlat9.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.xyz = _FireColor.xyz + (-_SmokeColor.xyz);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat4.xyz + _SmokeColor.xyz;
    u_xlat4.x = u_xlat0.x * vs_TEXCOORD2.y + _LightRange;
    u_xlatb4 = u_xlat3.x>=u_xlat4.x;
    u_xlat4.x = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat9.xyz = _LightColor.xyz * u_xlat4.xxx + u_xlat9.xyz;
    u_xlat4.x = (-_DissSoft) + 1.0;
    u_xlat16_2.x = u_xlat3.x + 1.0;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD2.x + _DissOffset;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + u_xlat16_2.x;
    u_xlat3.x = (-u_xlat4.x) + _DissSoft;
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.yzw = u_xlat6.xyz * u_xlat10_1.xyz;
    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
    u_xlat6.xyz = u_xlat9.xyz * u_xlat0.yzw;
    u_xlat16_2.x = u_xlat0.x * u_xlat10_1.w;
    u_xlatb1 = 0.0<_UseFresnal;
    u_xlat7 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat3.xyz = vec3(u_xlat7) * vs_TEXCOORD3.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat4.xyz = vec3(u_xlat7) * u_xlat4.xyz;
    u_xlat16_8.x = dot(u_xlat3.xyz, u_xlat4.xyz);
    u_xlatb7 = 0.0<u_xlat16_8.x;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat13 = _FresnalWidth * 8.0 + 1.0;
    u_xlat3.x = log2(u_xlat16_8.x);
    u_xlat13 = u_xlat13 * u_xlat3.x;
    u_xlat13 = exp2(u_xlat13);
    u_xlat16_8.xyz = vec3(u_xlat13) * _FresnalColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_FresnalScale) + u_xlat6.xyz;
    u_xlat16_5 = u_xlat10_1.w * u_xlat0.x + u_xlat13;
    u_xlat16_8.xyz = (bool(u_xlatb7)) ? u_xlat16_8.xyz : u_xlat6.xyz;
    u_xlat16_5 = (u_xlatb7) ? u_xlat16_5 : u_xlat16_2.x;
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xyz : u_xlat6.xyz;
    u_xlat16_0.w = (u_xlatb1) ? u_xlat16_5 : u_xlat16_2.x;
    u_xlatb1 = 0.0<_UseMatCap;
    if(u_xlatb1){
        u_xlat16_2.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
        u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
        u_xlat16_2.xy = u_xlat16_2.xx * vs_TEXCOORD5.xy;
        u_xlat1.xy = u_xlat16_2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat10_1.xyz = texture2D(_MatCapTex, u_xlat1.xy).xyz;
        u_xlat16_2.xyz = u_xlat10_1.xyz * _MatCapColor.xyz;
        u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(_MatCapIntensity) + u_xlat16_0.xyz;
    }
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