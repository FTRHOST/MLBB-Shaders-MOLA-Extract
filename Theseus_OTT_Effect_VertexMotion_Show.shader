//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/VertexMotion_Show" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

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

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 50965
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump vec2 _VertexMotionSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	mediump float _MotionDir;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_5;
bool u_xlatb6;
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
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy;
    u_xlat0.x = textureLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat0.x = u_xlat16_1.x * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_MotionDir==0.0);
#else
    u_xlatb2 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(in_TEXCOORD0.y>=_VertexScaleHeight);
#else
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
#endif
    u_xlat16_1.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat0.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SmokeColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _FireColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec2 _MainTexSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _MainIntensity;
uniform 	mediump float _RampUVOffset;
uniform 	mediump float _LightRange;
uniform 	mediump float _FireRange;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	mediump float _DissUspeed;
uniform 	mediump float _DissVspeed;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _RampTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_1.x = texture(_Mask, u_xlat16_0.xy).x;
    u_xlat16_0.x = u_xlat16_1.x + _RampUVOffset;
    u_xlat16_0.y = _RampUVOffset;
    u_xlat16_1.xyz = texture(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat1.xy = vec2(_MainTexSpeed.x, _MainTexSpeed.y) * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat2.y = u_xlat1.y + vs_TEXCOORD0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat11 = vs_TEXCOORD1.x * u_xlat6 + vs_TEXCOORD0.x;
    u_xlat2.x = u_xlat11 + u_xlat1.x;
    u_xlat1.xz = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xz);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat1.xz = vec2(_DissUspeed, _DissVspeed) * _Time.yy;
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat2.xy = vec2(u_xlat6) * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat2.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat2.xy;
    u_xlat1.xz = u_xlat1.xz + u_xlat2.xy;
    u_xlat16_1.x = texture(_Mask, u_xlat1.xz).y;
    u_xlat16_15 = u_xlat16_1.x * 0.305306017 + 0.682171106;
    u_xlat16_15 = u_xlat16_1.x * u_xlat16_15 + 0.0125228781;
    u_xlat16_3.x = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_15 = u_xlat16_1.x * u_xlat16_15 + 1.0;
    u_xlat1.xz = vec2(u_xlat6) * vs_TEXCOORD2.yy + vec2(_FireRange, _LightRange);
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat16_15;
    u_xlatb1.xz = greaterThanEqual(u_xlat16_3.xxxx, u_xlat1.xxzx).xz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat16_3.xyz = _SmokeColor.xyz * _SmokeColor.xyz;
    u_xlat2.xyz = _FireColor.xyz * _FireColor.xyz + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * _LightColor.xyz;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat1.xzw;
    u_xlat1.xzw = log2(abs(u_xlat16_0.xyz));
    u_xlat1.xzw = u_xlat1.xzw * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xzw = exp2(u_xlat1.xzw);
    u_xlat1.xzw = u_xlat1.xzw * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xzw;
    u_xlat16_0.x = (-_DissSoft) + 1.0;
    u_xlat1.x = (-u_xlat16_0.x) + u_xlat6;
    u_xlat6 = (-u_xlat16_0.x) + _DissSoft;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = u_xlat6 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat1.x * u_xlat16_2.w;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump vec2 _VertexMotionSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	mediump float _MotionDir;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_5;
bool u_xlatb6;
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
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy;
    u_xlat0.x = textureLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat0.x = u_xlat16_1.x * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_MotionDir==0.0);
#else
    u_xlatb2 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(in_TEXCOORD0.y>=_VertexScaleHeight);
#else
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
#endif
    u_xlat16_1.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat0.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SmokeColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _FireColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec2 _MainTexSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _MainIntensity;
uniform 	mediump float _RampUVOffset;
uniform 	mediump float _LightRange;
uniform 	mediump float _FireRange;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	mediump float _DissUspeed;
uniform 	mediump float _DissVspeed;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _RampTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_1.x = texture(_Mask, u_xlat16_0.xy).x;
    u_xlat16_0.x = u_xlat16_1.x + _RampUVOffset;
    u_xlat16_0.y = _RampUVOffset;
    u_xlat16_1.xyz = texture(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat1.xy = vec2(_MainTexSpeed.x, _MainTexSpeed.y) * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat2.y = u_xlat1.y + vs_TEXCOORD0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat11 = vs_TEXCOORD1.x * u_xlat6 + vs_TEXCOORD0.x;
    u_xlat2.x = u_xlat11 + u_xlat1.x;
    u_xlat1.xz = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xz);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat1.xz = vec2(_DissUspeed, _DissVspeed) * _Time.yy;
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat2.xy = vec2(u_xlat6) * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat2.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat2.xy;
    u_xlat1.xz = u_xlat1.xz + u_xlat2.xy;
    u_xlat16_1.x = texture(_Mask, u_xlat1.xz).y;
    u_xlat16_15 = u_xlat16_1.x * 0.305306017 + 0.682171106;
    u_xlat16_15 = u_xlat16_1.x * u_xlat16_15 + 0.0125228781;
    u_xlat16_3.x = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_15 = u_xlat16_1.x * u_xlat16_15 + 1.0;
    u_xlat1.xz = vec2(u_xlat6) * vs_TEXCOORD2.yy + vec2(_FireRange, _LightRange);
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat16_15;
    u_xlatb1.xz = greaterThanEqual(u_xlat16_3.xxxx, u_xlat1.xxzx).xz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat16_3.xyz = _SmokeColor.xyz * _SmokeColor.xyz;
    u_xlat2.xyz = _FireColor.xyz * _FireColor.xyz + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * _LightColor.xyz;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat1.xzw;
    u_xlat1.xzw = log2(abs(u_xlat16_0.xyz));
    u_xlat1.xzw = u_xlat1.xzw * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xzw = exp2(u_xlat1.xzw);
    u_xlat1.xzw = u_xlat1.xzw * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xzw = min(max(u_xlat1.xzw, 0.0), 1.0);
#else
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xzw;
    u_xlat16_0.x = (-_DissSoft) + 1.0;
    u_xlat1.x = (-u_xlat16_0.x) + u_xlat6;
    u_xlat6 = (-u_xlat16_0.x) + _DissSoft;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = u_xlat6 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat1.x * u_xlat16_2.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump vec2 _VertexMotionSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	mediump float _MotionDir;
uniform lowp sampler2D _Mask;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_5;
bool u_xlatb6;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_1.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat16_5 = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy;
    u_xlat0.x = texture2DLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat0.x = u_xlat16_1.x * u_xlat16_5;
    u_xlatb2 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
    u_xlat16_1.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat0.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SmokeColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _FireColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec2 _MainTexSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _MainIntensity;
uniform 	mediump float _RampUVOffset;
uniform 	mediump float _LightRange;
uniform 	mediump float _FireRange;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	mediump float _DissUspeed;
uniform 	mediump float _DissVspeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _RampTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bvec3 u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_1.x = texture2D(_Mask, u_xlat16_0.xy).x;
    u_xlat16_0.x = u_xlat10_1.x + _RampUVOffset;
    u_xlat16_0.y = _RampUVOffset;
    u_xlat10_1.xyz = texture2D(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = u_xlat10_1.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_1.xyz;
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeed.x, _MainTexSpeed.y);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat2.y = u_xlat1.y + vs_TEXCOORD0.y;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat11 = vs_TEXCOORD1.x * u_xlat6 + vs_TEXCOORD0.x;
    u_xlat2.x = u_xlat11 + u_xlat1.x;
    u_xlat1.xz = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xz);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat1.xz = _Time.yy * vec2(_DissUspeed, _DissVspeed);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat2.xy = vec2(u_xlat6) * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat2.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat2.xy;
    u_xlat1.xz = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.x = texture2D(_Mask, u_xlat1.xz).y;
    u_xlat16_15 = u_xlat10_1.x * 0.305306017 + 0.682171106;
    u_xlat16_15 = u_xlat10_1.x * u_xlat16_15 + 0.0125228781;
    u_xlat16_3.x = u_xlat16_15 * u_xlat10_1.x;
    u_xlat16_15 = u_xlat10_1.x * u_xlat16_15 + 1.0;
    u_xlat1.xz = vec2(u_xlat6) * vs_TEXCOORD2.yy + vec2(_FireRange, _LightRange);
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat16_15;
    u_xlatb1.xz = greaterThanEqual(u_xlat16_3.xxxx, u_xlat1.xxzx).xz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat16_3.xyz = _SmokeColor.xyz * _SmokeColor.xyz;
    u_xlat2.xyz = _FireColor.xyz * _FireColor.xyz + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * _LightColor.xyz;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat1.xzw;
    u_xlat1.xzw = log2(abs(u_xlat16_0.xyz));
    u_xlat1.xzw = u_xlat1.xzw * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xzw = exp2(u_xlat1.xzw);
    u_xlat1.xzw = u_xlat1.xzw * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xzw;
    u_xlat16_0.x = (-_DissSoft) + 1.0;
    u_xlat1.x = (-u_xlat16_0.x) + u_xlat6;
    u_xlat6 = (-u_xlat16_0.x) + _DissSoft;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat1.x * u_xlat10_2.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump vec2 _VertexMotionSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	mediump float _MotionDir;
uniform lowp sampler2D _Mask;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_5;
bool u_xlatb6;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_1.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat16_5 = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy;
    u_xlat0.x = texture2DLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat0.x = u_xlat16_1.x * u_xlat16_5;
    u_xlatb2 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
    u_xlat16_1.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat0.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SmokeColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _FireColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec2 _MainTexSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _MainIntensity;
uniform 	mediump float _RampUVOffset;
uniform 	mediump float _LightRange;
uniform 	mediump float _FireRange;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	mediump float _DissUspeed;
uniform 	mediump float _DissVspeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _RampTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bvec3 u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_1.x = texture2D(_Mask, u_xlat16_0.xy).x;
    u_xlat16_0.x = u_xlat10_1.x + _RampUVOffset;
    u_xlat16_0.y = _RampUVOffset;
    u_xlat10_1.xyz = texture2D(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = u_xlat10_1.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_1.xyz;
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeed.x, _MainTexSpeed.y);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat2.y = u_xlat1.y + vs_TEXCOORD0.y;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat11 = vs_TEXCOORD1.x * u_xlat6 + vs_TEXCOORD0.x;
    u_xlat2.x = u_xlat11 + u_xlat1.x;
    u_xlat1.xz = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xz);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat1.xz = _Time.yy * vec2(_DissUspeed, _DissVspeed);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat2.xy = vec2(u_xlat6) * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat2.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat2.xy;
    u_xlat1.xz = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.x = texture2D(_Mask, u_xlat1.xz).y;
    u_xlat16_15 = u_xlat10_1.x * 0.305306017 + 0.682171106;
    u_xlat16_15 = u_xlat10_1.x * u_xlat16_15 + 0.0125228781;
    u_xlat16_3.x = u_xlat16_15 * u_xlat10_1.x;
    u_xlat16_15 = u_xlat10_1.x * u_xlat16_15 + 1.0;
    u_xlat1.xz = vec2(u_xlat6) * vs_TEXCOORD2.yy + vec2(_FireRange, _LightRange);
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat16_15;
    u_xlatb1.xz = greaterThanEqual(u_xlat16_3.xxxx, u_xlat1.xxzx).xz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat16_3.xyz = _SmokeColor.xyz * _SmokeColor.xyz;
    u_xlat2.xyz = _FireColor.xyz * _FireColor.xyz + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * _LightColor.xyz;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat1.xzw;
    u_xlat1.xzw = log2(abs(u_xlat16_0.xyz));
    u_xlat1.xzw = u_xlat1.xzw * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xzw = exp2(u_xlat1.xzw);
    u_xlat1.xzw = u_xlat1.xzw * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xzw = clamp(u_xlat1.xzw, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xzw;
    u_xlat16_0.x = (-_DissSoft) + 1.0;
    u_xlat1.x = (-u_xlat16_0.x) + u_xlat6;
    u_xlat6 = (-u_xlat16_0.x) + _DissSoft;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat1.x * u_xlat10_2.w;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump vec2 _VertexMotionSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	mediump float _MotionDir;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_5;
bool u_xlatb6;
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
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy;
    u_xlat0.x = textureLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat0.x = u_xlat16_1.x * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_MotionDir==0.0);
#else
    u_xlatb2 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(in_TEXCOORD0.y>=_VertexScaleHeight);
#else
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
#endif
    u_xlat16_1.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat0.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SmokeColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _FireColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec2 _MainTexSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _MainIntensity;
uniform 	mediump float _RampUVOffset;
uniform 	mediump float _LightRange;
uniform 	mediump float _FireRange;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	mediump float _DissUspeed;
uniform 	mediump float _DissVspeed;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _RampTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_1.x = texture(_Mask, u_xlat16_0.xy).x;
    u_xlat16_0.x = u_xlat16_1.x + _RampUVOffset;
    u_xlat16_0.y = _RampUVOffset;
    u_xlat16_1.xyz = texture(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat1.xy = vec2(_MainTexSpeed.x, _MainTexSpeed.y) * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat2.y = u_xlat1.y + vs_TEXCOORD0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat11 = vs_TEXCOORD1.x * u_xlat6 + vs_TEXCOORD0.x;
    u_xlat2.x = u_xlat11 + u_xlat1.x;
    u_xlat1.xz = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xz);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat1.xz = vec2(_DissUspeed, _DissVspeed) * _Time.yy;
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat2.xy = vec2(u_xlat6) * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat2.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat2.xy;
    u_xlat1.xz = u_xlat1.xz + u_xlat2.xy;
    u_xlat16_1.x = texture(_Mask, u_xlat1.xz).y;
    u_xlat16_15 = u_xlat16_1.x * 0.305306017 + 0.682171106;
    u_xlat16_15 = u_xlat16_1.x * u_xlat16_15 + 0.0125228781;
    u_xlat16_3.x = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_15 = u_xlat16_1.x * u_xlat16_15 + 1.0;
    u_xlat1.xz = vec2(u_xlat6) * vs_TEXCOORD2.yy + vec2(_FireRange, _LightRange);
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat16_15;
    u_xlatb1.xz = greaterThanEqual(u_xlat16_3.xxxx, u_xlat1.xxzx).xz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat16_3.xyz = _SmokeColor.xyz * _SmokeColor.xyz;
    u_xlat2.xyz = _FireColor.xyz * _FireColor.xyz + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * _LightColor.xyz;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.zzz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat1.xzw;
    u_xlat16_0.x = (-_DissSoft) + 1.0;
    u_xlat1.x = (-u_xlat16_0.x) + u_xlat6;
    u_xlat6 = (-u_xlat16_0.x) + _DissSoft;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = u_xlat6 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat1.x * u_xlat16_2.w;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump vec2 _VertexMotionSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	mediump float _MotionDir;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_5;
bool u_xlatb6;
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
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy;
    u_xlat0.x = textureLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat0.x = u_xlat16_1.x * u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_MotionDir==0.0);
#else
    u_xlatb2 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(in_TEXCOORD0.y>=_VertexScaleHeight);
#else
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
#endif
    u_xlat16_1.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat0.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SmokeColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _FireColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec2 _MainTexSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _MainIntensity;
uniform 	mediump float _RampUVOffset;
uniform 	mediump float _LightRange;
uniform 	mediump float _FireRange;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	mediump float _DissUspeed;
uniform 	mediump float _DissVspeed;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _RampTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec3 u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_1.x = texture(_Mask, u_xlat16_0.xy).x;
    u_xlat16_0.x = u_xlat16_1.x + _RampUVOffset;
    u_xlat16_0.y = _RampUVOffset;
    u_xlat16_1.xyz = texture(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat1.xy = vec2(_MainTexSpeed.x, _MainTexSpeed.y) * _Time.yy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat2.y = u_xlat1.y + vs_TEXCOORD0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
#endif
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat11 = vs_TEXCOORD1.x * u_xlat6 + vs_TEXCOORD0.x;
    u_xlat2.x = u_xlat11 + u_xlat1.x;
    u_xlat1.xz = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xz);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat1.xz = vec2(_DissUspeed, _DissVspeed) * _Time.yy;
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat2.xy = vec2(u_xlat6) * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat2.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat2.xy;
    u_xlat1.xz = u_xlat1.xz + u_xlat2.xy;
    u_xlat16_1.x = texture(_Mask, u_xlat1.xz).y;
    u_xlat16_15 = u_xlat16_1.x * 0.305306017 + 0.682171106;
    u_xlat16_15 = u_xlat16_1.x * u_xlat16_15 + 0.0125228781;
    u_xlat16_3.x = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_15 = u_xlat16_1.x * u_xlat16_15 + 1.0;
    u_xlat1.xz = vec2(u_xlat6) * vs_TEXCOORD2.yy + vec2(_FireRange, _LightRange);
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat16_15;
    u_xlatb1.xz = greaterThanEqual(u_xlat16_3.xxxx, u_xlat1.xxzx).xz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat16_3.xyz = _SmokeColor.xyz * _SmokeColor.xyz;
    u_xlat2.xyz = _FireColor.xyz * _FireColor.xyz + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * _LightColor.xyz;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.zzz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat1.xzw;
    u_xlat16_0.x = (-_DissSoft) + 1.0;
    u_xlat1.x = (-u_xlat16_0.x) + u_xlat6;
    u_xlat6 = (-u_xlat16_0.x) + _DissSoft;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = u_xlat6 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat1.x * u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump vec2 _VertexMotionSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	mediump float _MotionDir;
uniform lowp sampler2D _Mask;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_5;
bool u_xlatb6;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_1.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat16_5 = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy;
    u_xlat0.x = texture2DLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat0.x = u_xlat16_1.x * u_xlat16_5;
    u_xlatb2 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
    u_xlat16_1.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat0.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SmokeColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _FireColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec2 _MainTexSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _MainIntensity;
uniform 	mediump float _RampUVOffset;
uniform 	mediump float _LightRange;
uniform 	mediump float _FireRange;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	mediump float _DissUspeed;
uniform 	mediump float _DissVspeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _RampTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bvec3 u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_1.x = texture2D(_Mask, u_xlat16_0.xy).x;
    u_xlat16_0.x = u_xlat10_1.x + _RampUVOffset;
    u_xlat16_0.y = _RampUVOffset;
    u_xlat10_1.xyz = texture2D(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = u_xlat10_1.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_1.xyz;
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeed.x, _MainTexSpeed.y);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat2.y = u_xlat1.y + vs_TEXCOORD0.y;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat11 = vs_TEXCOORD1.x * u_xlat6 + vs_TEXCOORD0.x;
    u_xlat2.x = u_xlat11 + u_xlat1.x;
    u_xlat1.xz = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xz);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat1.xz = _Time.yy * vec2(_DissUspeed, _DissVspeed);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat2.xy = vec2(u_xlat6) * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat2.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat2.xy;
    u_xlat1.xz = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.x = texture2D(_Mask, u_xlat1.xz).y;
    u_xlat16_15 = u_xlat10_1.x * 0.305306017 + 0.682171106;
    u_xlat16_15 = u_xlat10_1.x * u_xlat16_15 + 0.0125228781;
    u_xlat16_3.x = u_xlat16_15 * u_xlat10_1.x;
    u_xlat16_15 = u_xlat10_1.x * u_xlat16_15 + 1.0;
    u_xlat1.xz = vec2(u_xlat6) * vs_TEXCOORD2.yy + vec2(_FireRange, _LightRange);
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat16_15;
    u_xlatb1.xz = greaterThanEqual(u_xlat16_3.xxxx, u_xlat1.xxzx).xz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat16_3.xyz = _SmokeColor.xyz * _SmokeColor.xyz;
    u_xlat2.xyz = _FireColor.xyz * _FireColor.xyz + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * _LightColor.xyz;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.zzz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat1.xzw;
    u_xlat16_0.x = (-_DissSoft) + 1.0;
    u_xlat1.x = (-u_xlat16_0.x) + u_xlat6;
    u_xlat6 = (-u_xlat16_0.x) + _DissSoft;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat1.x * u_xlat10_2.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump vec2 _VertexMotionSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeight;
uniform 	mediump float _MotionDir;
uniform lowp sampler2D _Mask;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_5;
bool u_xlatb6;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_1.xy = u_xlat0.xx * in_TEXCOORD1.zw + in_TEXCOORD0.xy;
    u_xlat16_5 = u_xlat0.x * in_TEXCOORD1.y + _VertexScale;
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy;
    u_xlat0.x = texture2DLod(_Mask, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = log2(u_xlat0.x);
    u_xlat16_1.x = u_xlat16_1.x * _VertexPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat0.x = u_xlat16_1.x * u_xlat16_5;
    u_xlatb2 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb2)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb6 = in_TEXCOORD0.y>=_VertexScaleHeight;
    u_xlat16_1.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat0.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SmokeColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _FireColor;
uniform 	mediump vec4 _GChannel;
uniform 	mediump vec2 _MainTexSpeed;
uniform 	mediump float _UseCustomData;
uniform 	mediump float _MainIntensity;
uniform 	mediump float _RampUVOffset;
uniform 	mediump float _LightRange;
uniform 	mediump float _FireRange;
uniform 	mediump float _DissSoft;
uniform 	mediump float _DissOffset;
uniform 	mediump float _DissUspeed;
uniform 	mediump float _DissVspeed;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _RampTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bvec3 u_xlatb1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_1.x = texture2D(_Mask, u_xlat16_0.xy).x;
    u_xlat16_0.x = u_xlat10_1.x + _RampUVOffset;
    u_xlat16_0.y = _RampUVOffset;
    u_xlat10_1.xyz = texture2D(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = u_xlat10_1.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat10_1.xyz;
    u_xlat1.xy = _Time.yy * vec2(_MainTexSpeed.x, _MainTexSpeed.y);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat2.y = u_xlat1.y + vs_TEXCOORD0.y;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomData);
    u_xlat6 = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat11 = vs_TEXCOORD1.x * u_xlat6 + vs_TEXCOORD0.x;
    u_xlat2.x = u_xlat11 + u_xlat1.x;
    u_xlat1.xz = u_xlat2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xz);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_MainIntensity, _MainIntensity, _MainIntensity));
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat1.xz = _Time.yy * vec2(_DissUspeed, _DissVspeed);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat2.xy = vec2(u_xlat6) * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
    u_xlat2.xy = _GChannel.xy * vs_TEXCOORD0.xy + u_xlat2.xy;
    u_xlat1.xz = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.x = texture2D(_Mask, u_xlat1.xz).y;
    u_xlat16_15 = u_xlat10_1.x * 0.305306017 + 0.682171106;
    u_xlat16_15 = u_xlat10_1.x * u_xlat16_15 + 0.0125228781;
    u_xlat16_3.x = u_xlat16_15 * u_xlat10_1.x;
    u_xlat16_15 = u_xlat10_1.x * u_xlat16_15 + 1.0;
    u_xlat1.xz = vec2(u_xlat6) * vs_TEXCOORD2.yy + vec2(_FireRange, _LightRange);
    u_xlat6 = u_xlat6 * vs_TEXCOORD2.x + _DissOffset;
    u_xlat6 = (-u_xlat6) * 2.0 + u_xlat16_15;
    u_xlatb1.xz = greaterThanEqual(u_xlat16_3.xxxx, u_xlat1.xxzx).xz;
    u_xlat1.x = u_xlatb1.x ? float(1.0) : 0.0;
    u_xlat1.z = u_xlatb1.z ? float(1.0) : 0.0;
;
    u_xlat16_3.xyz = _SmokeColor.xyz * _SmokeColor.xyz;
    u_xlat2.xyz = _FireColor.xyz * _FireColor.xyz + (-u_xlat16_3.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * _LightColor.xyz;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.zzz + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat1.xzw;
    u_xlat16_0.x = (-_DissSoft) + 1.0;
    u_xlat1.x = (-u_xlat16_0.x) + u_xlat6;
    u_xlat6 = (-u_xlat16_0.x) + _DissSoft;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1.x = u_xlat6 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat1.x * u_xlat10_2.w;
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